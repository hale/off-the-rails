class CreateUsers < ActiveRecord::Migration
  def change
    drop_table  :users
    create_table :users do |t|
      t.timestamps
      t.string :name
      t.string :email
      t.string :password_digest
    end
  end
end
