class CreateShouts < ActiveRecord::Migration
  def up
    create_table :shouts do |t|
      t.string :message
      t.string :email
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :shouts
  end
end
