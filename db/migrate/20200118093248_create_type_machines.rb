class CreateTypeMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :type_machines do |t|
      t.string :name

      t.timestamps
    end
  end
end
