class CreateUserProjectAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_project_assignments do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
