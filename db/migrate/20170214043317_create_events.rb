class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :event_type
      t.text :ext_data

      t.timestamps
    end
  end
end
