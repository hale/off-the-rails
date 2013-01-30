class ChangeStringToTextOnUser < ActiveRecord::Migration
  def change
    change_column :users, :about, :text
    change_column :users, :looking_for, :text
  end
end
