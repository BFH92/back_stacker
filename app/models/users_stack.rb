class UsersStack < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :stack
end
