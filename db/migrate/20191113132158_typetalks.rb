class Typetalks < ActiveRecord::Migration[5.2]
  def change
    create_table :typetalks do |t|
      t.string :name
    end
  end
end
