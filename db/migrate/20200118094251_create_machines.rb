class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.string :name
      t.references :type_machine
      t.references :instrument
      t.string :landing1
      t.string :landing2
      t.integer :turnovers1
      t.integer :turnovers2

      t.timestamps
    end
  end
end
