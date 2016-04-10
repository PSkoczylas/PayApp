class AddNrToProduct < ActiveRecord::Migration
  def change
    add_column :products, :nr, :integer
  end
end
