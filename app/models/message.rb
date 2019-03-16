# frozen_string_literal:true

class Message < ApplicationRecord
  paginates_per 5

  belongs_to :user
  belongs_to :chat_room

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
