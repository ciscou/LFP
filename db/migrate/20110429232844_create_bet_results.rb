class CreateBetResults < ActiveRecord::Migration
  def self.up
    create_table :bet_results do |t|
      t.references :bet
      t.references :match
      t.string :result

      t.timestamps
    end
  end

  def self.down
    drop_table :bet_results
  end
end
