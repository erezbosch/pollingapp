class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :answer_choice_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :responses, :users, name: :user_id
    add_foreign_key :responses, :answer_choices, name: :answer_choice_id
  end
end
