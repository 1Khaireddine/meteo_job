class Candidate < User
  has_many :posts, foreign_key: :user_id
  has_many :offers, through: :posts
end
