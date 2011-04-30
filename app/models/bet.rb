class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :season

  has_many :bet_results

  accepts_nested_attributes_for :bet_results
end
