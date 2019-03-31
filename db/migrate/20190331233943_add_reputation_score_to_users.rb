class AddReputationScoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reputation_score, :string
  end
end
