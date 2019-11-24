class AddColumnToCompany < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :region, foreign_key: true
    add_reference :companies, :user, foreign_key: true
    add_reference :companies, :status, foreign_key: true
    add_reference :companies, :jurface, foreign_key: true
    add_reference :companies, :equipment, foreign_key: true
  end
end
