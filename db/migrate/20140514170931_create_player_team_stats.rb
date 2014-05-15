class CreatePlayerTeamStats < ActiveRecord::Migration
  def up
    create_table :player_team_stats do |t|
      t.belongs_to :player
      t.string :playername
      t.string :totalgp
      t.string :skgoals
      t.string :skassists
      t.string :skpoints
      t.string :skplusmin
      t.string :skpim
      t.string :skppg
      t.string :skshg
      t.string :skhits
      t.string :skbs
      t.string :skshots
      t.string :skshotpct
      t.string :glgaa
      t.string :glga
      t.string :glsaves
      t.string :glsavepct
      t.string :glso
      t.string :glsoperiods
      t.string :glwins
      t.string :glgp
      t.integer :memberId

      t.timestamps
    end
  end

  def down
    drop_table :player_team_stats
  end

end

