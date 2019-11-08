class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :position
      t.date :birthday
      t.text :comment
      t.timestamps
    end
  end
end
