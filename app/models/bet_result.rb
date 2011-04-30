class BetResult < ActiveRecord::Base
  belongs_to :bet
  belongs_to :match
end
