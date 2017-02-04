class Post < ApplicationRecord

  belongs_to :user, inverse_of: :plans
end
