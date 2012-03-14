class AddUserIdToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :user_id, :integer

  end
end
