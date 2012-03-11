class CreateTimelineUpdates < ActiveRecord::Migration
  def change
    create_table :timeline_updates do |t|
      t.references :user
      t.string :message

      t.timestamps
    end
    add_index :timeline_updates, :user_id
  end
end
