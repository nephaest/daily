class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :siret
      t.date :creation_date
      t.string :address
      t.string :size
      t.string :category
      t.string :website_url
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
