class Movie < ApplicationRecord

  belongs_to :user, inverse_of: :movies
  belongs_to :post, inverse_of: :movie
end
