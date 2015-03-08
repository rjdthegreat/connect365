class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :city
      t.string :address
      t.string :contact_number
      t.string :email_address
      t.boolean :is_pending

      t.timestamps null: false
    end
  end
end
