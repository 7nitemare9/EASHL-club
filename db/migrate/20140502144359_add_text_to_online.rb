class AddTextToOnline < ActiveRecord::Migration
  def change
    add_column :onlines, :text, :string
  end
end
