class RenameMediaTable < ActiveRecord::Migration
  def up
    rename_table :media, :medias
  end

  def down
    rename_table :medias, :media
  end
end
