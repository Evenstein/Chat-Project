# frozen_string_literal:true

class ChatRoom < ApplicationRecord
  paginates_per 10

  belongs_to :user
  has_many :messages, dependent: :destroy
end
