json.posts do
  json.array!(@posts) do |post|
    json.(
      post,
      :id, :comment, :updated_at,
    )
  end
end
