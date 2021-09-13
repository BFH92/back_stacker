class CreateCompanyCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :company_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
