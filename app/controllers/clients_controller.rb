require 'redis'
class ClientsController < ApplicationController
  include Tubesock::Hijack

  def chat
    hijack do |tubesock|
      # Listen on its own thread
      redis_thread = Thread.new do
        # Needs its own redis connection to pub
        # and sub at the same time
        Redis.new.subscribe "chat" do |on|
          puts "on_message: #{on.message}"
          on.message do |channel, message|
            puts 'baba'
            tubesock.send_data message
          end
        end
      end

      puts "alabala: #{m}"
      tubesock.onmessage do |m|
        # pub the message when we get one
        # note: this echoes through the sub above
        puts "alabala: #{m}"
        Redis.new.publish "chat", m
      end
      
      tubesock.onclose do
        # stop listening when client leaves
        redis_thread.kill
      end
    end
  end
end
