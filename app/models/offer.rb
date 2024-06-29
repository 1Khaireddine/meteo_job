class Offer < ApplicationRecord
  belongs_to :company
  belongs_to :admin, foreign_key: :user_id, optional: true
  belongs_to :superadmin, foreign_key: :user_id, optional: true

  has_many :posts
  has_many :candidates, through: :posts
end
