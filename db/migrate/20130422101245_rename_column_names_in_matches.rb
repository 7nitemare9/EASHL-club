class RenameColumnNamesInMatches < ActiveRecord::Migration
  def change
	rename_column :matches, :pDef, :pDef2
	rename_column :matches, :hDef, :hDef2  
  end
end
