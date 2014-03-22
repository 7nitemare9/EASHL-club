class AddHeightToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :height, :float
  end
end
