class CreateGamePlayers < ActiveRecord::Migration
  def up
    create_table :game_players do |t|
      t.belongs_to :match
      t.string :glga
      t.string :glsavepct
      t.string :glsaves
      t.string :glshots
      t.string :position
      t.string :skassists
      t.string :skfow
      t.string :skgiveaways
      t.string :skgoals
      t.string :skhits
      t.string :skpim
      t.string :skplusmin
      t.string :skpoints
      t.string :skshots
      t.string :sktakeaways
      t.string :personaName
      t.string :team
    end
  end

  def down
   drop_table :game_players 
  end
end
