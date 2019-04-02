class CreateAnswerComments < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_comments do |t|
      t.string :body
      t.belongs_to :answer, foreign_key: true

      t.timestamps
    end
  end
end
