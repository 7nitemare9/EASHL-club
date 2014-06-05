class ChangeEaidFromStringToTextInPlayers < ActiveRecord::Migration
  def up
    change_column :players, :eaid, :text, :limit => nil
  end

  def down
    change_column :players, :eaid, :string
  end
end
