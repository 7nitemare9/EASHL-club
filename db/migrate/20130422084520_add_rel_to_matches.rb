class AddRelToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :rel, :integer
  end
end
