class AddColumnToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :first_name, :string
  end
end
