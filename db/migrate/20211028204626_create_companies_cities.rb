class CreateCompaniesCities < ActiveRecord::Migration[6.1]
  def change
    create_table :companies_cities do |t|
      t.belongs_to :city, null: false, foreign_key: true
      t.belongs_to :company, null: false, foreign_key: true
      t.timestamps
    end
  end
end
