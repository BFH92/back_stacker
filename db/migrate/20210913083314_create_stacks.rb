class CreateStacks < ActiveRecord::Migration[6.1]
  def change
    create_table :stacks do |t|
      t.string :name
      t.string :slug
      #t.belongs_to :stack_category

      t.timestamps
    end
  end
end
