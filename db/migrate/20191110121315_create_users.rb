class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.text :pass
      t.references :role, foreign_key: true
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
