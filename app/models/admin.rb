class Admin < User
  belongs_to :company

  has_many :offers
end
