class CreateStudentResults < ActiveRecord::Migration
  def change
    create_table :student_results do |t|
      t.references :exam, index: true
      t.references :student, index: true
      t.string :grade
      t.string :comments

      t.timestamps null: false
    end
    add_foreign_key :student_results, :exams
    add_foreign_key :student_results, :students
  end
end
