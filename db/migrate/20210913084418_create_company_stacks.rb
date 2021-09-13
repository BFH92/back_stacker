class CreateCompanyStacks < ActiveRecord::Migration[6.1]
  def change
    create_table :company_stacks do |t|

      t.timestamps
    end
  end
end
