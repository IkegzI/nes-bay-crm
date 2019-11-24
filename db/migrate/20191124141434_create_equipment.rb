class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.text :name
      t.string :manufacturer
      t.string :speed
      t.string :shaft
      t.string :type
      t.string :feedrate
      t.boolean :cnc
      t.string :comment
      t.string :photo
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
