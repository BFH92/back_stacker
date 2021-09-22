class CreateSavedSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :saved_searches do |t|
      t.string :staff_size
      t.string :company_category
      t.string :stacks
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
