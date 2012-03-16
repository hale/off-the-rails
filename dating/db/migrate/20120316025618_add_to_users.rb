class AddToUsers < ActiveRecord::Migration
def change
  	add_column :users, :twitter, :string
  	add_column :users, :status, :string
  	drop_table :user_infos
  end
end
