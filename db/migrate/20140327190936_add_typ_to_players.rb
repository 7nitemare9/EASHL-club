class AddTypToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :typ, :string
  end
end
