class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text, null: false
      t.integer :poll_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :questions, :polls, name: :poll_id
  end
end
