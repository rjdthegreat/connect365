class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.references :classroom, index: true
      t.string :first_name
      t.string :last_name
      t.string :contact_number
      t.string :email_address
      t.boolean :is_pending

      t.timestamps null: false
    end
    add_foreign_key :teachers, :classrooms
  end
end
