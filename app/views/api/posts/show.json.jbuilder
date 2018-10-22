json.post do
  json.(
    @post,
    :id, :title, :comment, :updated_at,
  )  
  json.movie do    
    if @post.movie_id.present?
      json.(
        Movie.find(@post.movie_id),
        :id, :title, :poster_path, :mvdb_id, :backdrop_path,
        )
    else
      json.(
        Movie.new,
        :id, :title, :poster_path, :mvdb_id, :backdrop_path,
      )
    end
  end
end
