class CreateSphereworks < ActiveRecord::Migration[5.2]
  def change
    create_table :sphereworks do |t|
      t.string :name

      t.timestamps
    end
  end
end
