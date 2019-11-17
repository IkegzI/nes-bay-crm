class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, foreign_key: true
      t.text :address
      t.string :phone
      t.boolean :active
      t.string :email
      t.string :site
      t.string :equipment

      t.timestamps
    end
  end
end
