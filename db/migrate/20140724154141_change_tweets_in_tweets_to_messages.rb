class ChangeTweetsInTweetsToMessages < ActiveRecord::Migration
  def change
    rename_column :tweets, :tweets, :messages
  end
end
