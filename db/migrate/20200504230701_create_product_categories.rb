class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.integer :product_id
      t.integer :category_id
    end
  end
end
