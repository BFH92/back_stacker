class User < ApplicationRecord

  has_many :stacks, through: :users_stacks
  
end
