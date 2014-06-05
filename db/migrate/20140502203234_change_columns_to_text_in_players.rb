class ChangeColumnsToTextInPlayers < ActiveRecord::Migration
  def up
    change_column :players, :strength, :text, :limit => nil
    change_column :players, :style, :text, :limit => nil
  end

  def down
    change_column :players, :strength, :string
    change_column :players, :style, :string
  end
end
