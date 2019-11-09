class CreateCompaniesRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :companies_regions do |t|
      t.references :company
      t.references :region
    end
  end
end
