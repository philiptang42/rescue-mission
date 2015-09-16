class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, null: false, length: { minimum: 50 }
      t.integer :user_id
      t.integer :question_id
    end
  end
end
