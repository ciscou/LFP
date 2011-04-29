class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.references :season
      t.references :team_1
      t.references :team_2
      t.string :result

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
