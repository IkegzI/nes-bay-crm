class CreateJurfaces < ActiveRecord::Migration[5.2]
  def change
    create_table :jurfaces do |t|
      t.string :name
      t.string :inn
      t.string :
      t.references :company

      t.timestamps
    end
  end
end
