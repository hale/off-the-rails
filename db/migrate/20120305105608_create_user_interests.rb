class CreateUserInterests < ActiveRecord::Migration
  def change
    create_table :user_interests do |t|
      t.references :user
      t.references :interest

      t.timestamps
    end
    add_index :user_interests, :user_id
    add_index :user_interests, :interest_id
  end
end
