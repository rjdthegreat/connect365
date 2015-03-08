class CreateClassroomNotifications < ActiveRecord::Migration
  def change
    create_table :classroom_notifications do |t|
      t.references :classroom, index: true
      t.integer :importance
      t.string :subject
      t.string :content
      t.date :show_until

      t.timestamps null: false
    end
    add_foreign_key :classroom_notifications, :classrooms
  end
end
