class AddUsernameAndFullNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :full_name, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
