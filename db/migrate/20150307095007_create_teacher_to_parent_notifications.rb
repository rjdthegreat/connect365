class CreateTeacherToParentNotifications < ActiveRecord::Migration
  def change
    create_table :teacher_to_parent_notifications do |t|
      t.references :teacher, index: true
      t.references :parent, index: true
      t.integer :importance
      t.string :subject
      t.string :content
      t.date :show_until

      t.timestamps null: false
    end
    add_foreign_key :teacher_to_parent_notifications, :teachers
    add_foreign_key :teacher_to_parent_notifications, :parents
  end
end
