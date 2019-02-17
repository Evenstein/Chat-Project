# frozen_string_literal:true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chat_rooms
  has_many :messages, through: :chat_rooms

  def name
    email.split("@")[0]
  end
end
