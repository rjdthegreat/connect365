class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :classroom, index: true
      t.string :first_name
      t.string :last_name
      t.date :doB

      t.timestamps null: false
    end
    add_foreign_key :students, :classrooms
  end
end
