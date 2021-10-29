class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.string :github_link, null: false, default: ""
      t.string :website_link, null: false, default: ""
      t.string :staff_size, null: false, default: ""
      t.boolean :is_it_recruiting, null: false, default: false
      #t.belongs_to :company_category, null: false, default: ""
      
      t.timestamps
    end
  end
end
