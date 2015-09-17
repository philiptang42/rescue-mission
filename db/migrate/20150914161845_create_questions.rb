class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false, length: { minimum: 0 }
      t.string :description, null: false, length: { minimum: 0 }
      t.integer :user_id

    end
  end
end
