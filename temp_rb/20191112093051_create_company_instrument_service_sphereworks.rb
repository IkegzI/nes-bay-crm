class CreateCompanyInstrumentServiceSphereworks < ActiveRecord::Migration[5.2]
  def change
    create_table :company_instrument_service_sphereworks do |t|
      t.references :company
      t.references :instrument
      t.references :service
      t.references :spherework
      end
  end
end
