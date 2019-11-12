class CreateCompanySpherework < ActiveRecord::Migration[5.2]
  def change
    create_table :companies_sphereworks do |t|
      t.references :company
      t.references :spherework
    end
  end
end
