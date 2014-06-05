class AddEaidToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :eaid, :string
  end
end
