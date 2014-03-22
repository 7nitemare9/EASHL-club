class AddRealNameAndCityToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :RealName, :string
    add_column :players, :City, :string
  end
end
