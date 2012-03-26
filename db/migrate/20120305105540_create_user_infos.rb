class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :fname
      t.string :lname
      t.date :dob
      t.string :location
      t.string :gender
      t.string :interested_in
      t.string :looking_for
      t.string :about
      t.string :status
      t.datetime :last_visit
      t.references :user

      t.timestamps
    end
    add_index :user_infos, :user_id
  end
end
