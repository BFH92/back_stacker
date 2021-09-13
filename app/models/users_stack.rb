class UsersStack < ApplicationRecord
  belongs_to :user
  belongs_to :stack
end
