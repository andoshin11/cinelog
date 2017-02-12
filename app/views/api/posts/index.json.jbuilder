json.posts do
  json.array!(@posts) do |post|
    json.(
      post,
      :id, :title, :comment, :updated_at,
    )
  end
end
