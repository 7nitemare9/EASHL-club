class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :opponent
      t.integer :gScored
      t.integer :gLetIn
      t.string :Center
      t.integer :pCenter
      t.integer :hCenter
      t.string :RW
      t.integer :pRW
      t.integer :hRW
      t.string :LW
      t.integer :pLW
      t.integer :hLW
      t.string :Def1
      t.integer :pDef1
      t.integer :hDef1
      t.string :Def2
      t.integer :pDef
      t.integer :hDef
      t.string :Goalie

      t.timestamps
    end
  end
end
