class CreatePlayerSeasonStat < ActiveRecord::Migration
  def up
    create_table :player_season_stats do |t|
      t.belongs_to :player
      t.string :skwins
      t.string :sklosses
      t.string :skgp
      t.string :skgoals
      t.string :skassists
      t.string :skpoints
      t.string :skgwg
      t.string :skplusmin
      t.string :skpim
      t.string :skppg
      t.string :skshg
      t.string :skoffsides
      t.string :skfights
      t.string :skfightswon
      t.string :skfo
      t.string :skfow
      t.string :skfol
      t.string :skfop
      t.string :skhits
      t.string :skbs
      t.string :skshots
      t.string :skshotpct
      t.string :skdekes
      t.string :skdekesmade
      t.string :skgiveaways
      t.string :sktakeaways
      t.string :skscrnchances
      t.string :skscrngoals
      t.string :glwins
      t.string :gllosses
      t.string :glot
      t.string :glshots
      t.string :glgaa
      t.string :glga
      t.string :glmin
      t.string :glbrkshots
      t.string :glbrksaves
      t.string :glbrksavepct
      t.string :glpenshots
      t.string :glpensaves
      t.string :glpensavepct
      t.string :glsaves
      t.string :glsavepct
      t.string :glso
      t.string :glsoperiods
      t.string :glwins
      t.string :glgp
      t.string :lwgp
      t.string :rwgp
      t.string :cgp
      t.string :dgp

      t.timestamps
    end
  end

  def down
    drop_table :player_team_stats
  end

end
