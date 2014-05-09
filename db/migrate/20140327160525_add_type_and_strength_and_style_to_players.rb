class AddTypeAndStrengthAndStyleToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :type, :string
    add_column :players, :strength, :string
    add_column :players, :style, :string
  end
end
