class Match < ActiveRecord::Base
  belongs_to :team_1, :class_name => "Team"
  belongs_to :team_2, :class_name => "Team"

  validate :different_teams?
  validates_presence_of :team_1
  validates_presence_of :team_2

  private

  def different_teams?
    if team_1 == team_2
      self.errors.add(:teams, "No puede jugar contra si mismo")
    end
  end
end
