class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.references :school, index: true
      t.integer :standard
      t.string :division

      t.timestamps null: false
    end
    add_foreign_key :classrooms, :schools
  end
end
