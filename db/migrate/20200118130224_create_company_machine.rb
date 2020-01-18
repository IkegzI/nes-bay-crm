class CreateCompanyMachine < ActiveRecord::Migration[5.2]
  def change
    create_table :companies_machines do |t|
      t.references :company, foreign_key: true
      t.references :machine, foreign_key: true
    end
  end
end
