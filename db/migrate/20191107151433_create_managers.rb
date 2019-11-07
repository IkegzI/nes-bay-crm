class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :phone
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
