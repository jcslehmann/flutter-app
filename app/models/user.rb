class User < ApplicationRecord
  include PgSearch
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :proposed_bets, foreign_key: :proposer_id, class_name: 'Bet'
  has_many :received_bets, foreign_key: :receiver_id, class_name: 'Bet'
  has_many :receivers, through: :proposed_bets
  has_many :comments
  has_many :likes, dependent: :destroy

  mount_uploader :photo, PhotoUploader
  validates :username, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :balance, presence: true

  pg_search_scope :search_by_username_and_email,
    against: [ :username, :email ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
