class CreateCompaniesContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :companies_contacts do |t|
      t.references :company
      t.references :contact
    end
  end
end
