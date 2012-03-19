class ChangeColumnNamesInRelationships < ActiveRecord::Migration
  def change
    rename_column(:relationships, :follower_id, :user_id)
    rename_column(:relationships, :followed_id, :match_id)
  end
end
