class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :forwards
      t.string :defenders
      t.string :goalies
      t.integer :games_played

      t.timestamps
    end
  end
end
