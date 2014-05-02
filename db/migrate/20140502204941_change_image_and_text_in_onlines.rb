class ChangeImageAndTextInOnlines < ActiveRecord::Migration
  def up
    change_column :onlines, :image, :text, :limit => nil
    change_column :onlines, :text, :text, :limit => nil
  end

  def down
    change_column :onlines, :image, :string
    change_column :onlines, :string
  end
end
