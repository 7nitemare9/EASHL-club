class CreateGameTeams < ActiveRecord::Migration
  def up
    create_table :game_teams do |t|
      t.belongs_to :match
      t.string :teamId
      t.string :memberstring
      t.string :score
      t.string :winnerByDnf
      t.string :goals
      t.string :goalsAgainst
      t.string :name
      t.string :clubId
    end
  end

  def down
    drop_table :game_teams
  end
end
