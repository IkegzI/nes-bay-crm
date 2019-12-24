class CreateJurfaces < ActiveRecord::Migration[5.2]
  def change
    create_table :jurfaces do |t|
      t.string :name, null: false
      t.string :inn
      t.string :acc
      t.references :company

      t.timestamps
    end
  end
end
