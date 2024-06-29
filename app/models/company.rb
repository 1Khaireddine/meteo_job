class Company < ApplicationRecord
  has_many :superadmins
  has_many :admins

  has_many :offers
end
