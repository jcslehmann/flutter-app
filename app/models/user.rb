class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :proposed_bets, foreign_key: :proposer_id, class_name: 'Bet'
  has_many :receivers, through: :proposed_bets
end
