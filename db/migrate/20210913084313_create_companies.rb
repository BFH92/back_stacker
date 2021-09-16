class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :github_link
      t.string :website_link
      t.string :staff_size
      t.boolean :is_it_recruiting

      t.belongs_to :company_category
      
      t.timestamps
    end
  end
end
