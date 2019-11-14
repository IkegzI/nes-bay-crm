class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.text :text
      t.references :typetalk, foreign_key: true
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
