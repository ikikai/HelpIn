class Conversation < ActiveRecord::Base
  belongs_to :client
  belongs_to :expert
  has_many :messages
end
