class CreateParentToTeacherNotifications < ActiveRecord::Migration
  def change
    create_table :parent_to_teacher_notifications do |t|
      t.references :parent, index: true
      t.references :teacher, index: true
      t.integer :importance
      t.string :subject
      t.string :content
      t.date :show_until

      t.timestamps null: false
    end
    add_foreign_key :parent_to_teacher_notifications, :parents
    add_foreign_key :parent_to_teacher_notifications, :teachers
  end
end
