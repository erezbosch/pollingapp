class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.integer :author_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :polls, :users, name: :author_id
  end
end
