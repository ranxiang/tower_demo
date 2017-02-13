class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :content
      t.boolean :deleted
      t.boolean :finished
      t.datetime :finished_at
      t.references :project, foreign_key: true
      t.references :creator
      t.references :assignee

      t.timestamps
    end
    add_foreign_key :todos, :users, column: :creator_id
    add_foreign_key :todos, :users, column: :assignee_id
  end
end
