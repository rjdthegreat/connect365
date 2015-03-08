class CreateSchoolNotifications < ActiveRecord::Migration
  def change
    create_table :school_notifications do |t|
      t.references :school, index: true
      t.integer :importance
      t.string :subject
      t.string :content
      t.date :show_until

      t.timestamps null: false
    end
    add_foreign_key :school_notifications, :schools
  end
end
