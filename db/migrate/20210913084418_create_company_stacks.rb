class CreateCompanyStacks < ActiveRecord::Migration[6.1]
  def change
    create_table :company_stacks do |t|

      t.belongs_to :company
      t.belongs_to :stack

      t.timestamps
    end
  end
end
