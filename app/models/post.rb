class Post < ApplicationRecord
  belongs_to :candidate, class_name: 'User', foreign_key: :user_id
  belongs_to :offer
end
