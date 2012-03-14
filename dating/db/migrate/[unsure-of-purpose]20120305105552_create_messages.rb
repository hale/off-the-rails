class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :relationship
      t.string :message

      t.timestamps
    end
    add_index :messages, :relationship_id
  end
end
