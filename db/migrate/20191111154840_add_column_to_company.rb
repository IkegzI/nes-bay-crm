class AddColumnToCompany < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :region, foreign_key: true
    add_reference :companies, :user, foreign_key: true
  end
end
