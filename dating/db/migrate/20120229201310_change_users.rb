class ChangeUsers < ActiveRecord::Migration
def change
    drop_table(User)
    create_table :users do |t|
      t.string "password_digest"
      t.string "first_name"
      t.string "last_name"
      t.string "email"  
      t.timestamps
    end
  end
end
