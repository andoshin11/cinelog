class Post < ApplicationRecord

  belongs_to :user, inverse_of: :posts
  has_one :movie, inverse_of: :post
end
