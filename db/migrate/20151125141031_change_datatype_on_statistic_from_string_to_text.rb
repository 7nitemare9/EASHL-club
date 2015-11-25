class ChangeDatatypeOnStatisticFromStringToText < ActiveRecord::Migration
  def up
    change_column :statistics, :forwards, :text, :limit => nil
    change_column :statistics, :defenders, :text, :limit => nil
    change_column :statistics, :goalies, :text, :limit => nil
  end

  def down
    change_column :statistics, :forwards, :string
    change_column :statistics, :defenders, :string
    change_column :statistics, :goalies, :string
  end
end
