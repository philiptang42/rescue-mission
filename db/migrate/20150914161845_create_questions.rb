class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false, length: { minimum: 40 }
      t.string :description, null: false, length: { minimum: 150 }
      t.integer :user_id

    end
  end
end
