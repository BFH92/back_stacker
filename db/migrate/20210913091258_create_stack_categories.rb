class CreateStackCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :stack_categories do |t|
      t.string :name
      t.belongs_to :stack

      t.timestamps
    end
  end
end
