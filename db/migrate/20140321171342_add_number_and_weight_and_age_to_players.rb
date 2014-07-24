class AddNumberAndWeightAndAgeToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :number, :integer
    add_column :players, :weight, :integer
    add_column :players, :age, :integer
  end
end
