class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :time
      t.boolean :read
      t.string :msg_type
      t.text :message

      t.timestamps
    end
  end
end
