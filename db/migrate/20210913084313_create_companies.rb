class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :stack
      t.string :github
      t.string :staff_size
      t.boolean :is_it_recruiting

      t.timestamps
    end
  end
end
