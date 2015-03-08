class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.references :student, index: true
      t.string :first_name
      t.string :last_name
      t.string :contact_number
      t.string :email_address
      t.boolean :is_pending

      t.timestamps null: false
    end
    add_foreign_key :parents, :students
  end
end
