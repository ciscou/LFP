class CreateBets < ActiveRecord::Migration
  def self.up
    create_table :bets do |t|
      t.references :user
      t.references :season
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :bets
  end
end
