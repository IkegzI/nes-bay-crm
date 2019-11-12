class CreateCompanyInstrument < ActiveRecord::Migration[5.2]
  def change
    create_table :companies_instruments do |t|
      t.references :company
      t.references :instrument
    end
  end
end
