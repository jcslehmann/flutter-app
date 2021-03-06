class Bet < ApplicationRecord
  belongs_to :proposer, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :stake, presence: true
  validates :odds, presence: true
  validates :proposition, presence: true
  validates :deadline, presence: true
end
