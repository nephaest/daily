class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :birth_place
      t.text :description
      t.string :position
      t.integer :min_wage
      t.string :address
      t.integer :mobility_radius
      t.boolean :on_duty
      t.string :social_security_number

      t.timestamps null: false
    end
  end
end
