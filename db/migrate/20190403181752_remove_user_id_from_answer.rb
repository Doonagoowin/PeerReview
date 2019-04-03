class RemoveUserIdFromAnswer < ActiveRecord::Migration[5.2]
  def change
    remove_index :answers, :user_id
    remove_column :answers, :user_id
  end
end
