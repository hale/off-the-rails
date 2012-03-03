class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user1_id
      t.integer :user2_id
    end
  end
end
