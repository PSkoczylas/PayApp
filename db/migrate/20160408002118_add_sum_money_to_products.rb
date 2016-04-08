class AddSumMoneyToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sum_money, :integer
  end
end
