class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.text :text, null: false
      t.integer :question_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :answer_choices, :questions, name: :question_id
  end
end
