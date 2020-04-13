class AddAdminToSellers < ActiveRecord::Migration[5.1]
  def change
  	add_column :sellers, :admin, :boolean, default: false
  end
end
