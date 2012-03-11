class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :interest

      t.timestamps
    end
  end
end
