class AddBlazeIdToGamePlayers < ActiveRecord::Migration
  def change
    add_column :game_players, :blazeId, :string
  end
end
