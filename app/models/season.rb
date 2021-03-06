class Season < ActiveRecord::Base
  has_many :matches
  has_many :bets

  validates_numericality_of :number, :only_integer => true

  accepts_nested_attributes_for :matches

  def self.current
    order(:number).last
  end
end
