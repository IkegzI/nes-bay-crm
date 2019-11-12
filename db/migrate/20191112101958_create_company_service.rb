class CreateCompanyService < ActiveRecord::Migration[5.2]
  def change
    create_table :companies_services do |t|
      t.references :company
      t.references :service
    end
  end
end
