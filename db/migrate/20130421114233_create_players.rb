class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :matches
      t.integer :goals
      t.integer :assists
      t.integer :points
      t.integer :hits

      t.timestamps
    end
  end
end
