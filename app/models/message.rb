class Message < ApplicationRecord
  broadcasts_to ->(message) { "messages" }, inserts_by: :append
  
  validates :user, presence: true
  validates :content, presence: true
end
