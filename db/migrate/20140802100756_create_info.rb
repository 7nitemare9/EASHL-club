class CreateInfo < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
