class AddQuantityToProducts < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:products, :quantity)
      add_column :products, :quantity, :integer
    end
  end
end
