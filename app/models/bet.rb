class Bet < ApplicationRecord
  belongs_to :proposer, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
end
