json.extract! user, :id, :name, :sex, :profile_pic, :city, :created_at, :updated_at
json.url user_url(user, format: :json)