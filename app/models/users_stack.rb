class UsersStack < ApplicationRecord
  belongs_to :user
  belongs_to :stack
  #validates_uniqueness_of :stack_id, scope: [:stack_id, :user_id] TODO: à réactiver après seeds en prod
end
