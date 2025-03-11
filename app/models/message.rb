class Message < ApplicationRecord
  broadcasts_to ->(message) { "messages" }, inserts_by: :append
end
