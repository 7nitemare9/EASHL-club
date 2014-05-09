class RedefineMatches < ActiveRecord::Migration
  def up
    drop_table  :matches
    create_table :matches
    add_column :matches, :matchId, :string   
    add_column :matches, :timestamp, :integer
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
