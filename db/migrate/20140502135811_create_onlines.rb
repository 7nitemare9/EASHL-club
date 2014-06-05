class CreateOnlines < ActiveRecord::Migration
  def change
    create_table :onlines do |t|
      t.string :status
      t.string :image
      t.string :name

      t.timestamps
    end
  end
end
