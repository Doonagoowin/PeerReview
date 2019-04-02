class DropCohortColumnFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :cohort
  end
end
