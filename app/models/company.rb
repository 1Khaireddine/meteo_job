class Company < ApplicationRecord
  has_many :superadmins
  has_many :admins
end
