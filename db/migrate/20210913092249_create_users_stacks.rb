class CreateUsersStacks < ActiveRecord::Migration[6.1]
  def change
    create_table :users_stacks do |t|
      
      t.belongs_to :user
      t.belongs_to :stack
      
      t.timestamps
    end
  end
end
