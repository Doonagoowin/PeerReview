class AddUserToAnswerComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :answer_comments, :user, foreign_key: true
  end
end
