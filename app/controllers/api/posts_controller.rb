class Api::PostsController < Api::AbstractController
  before_action :set_post, only: [:show]

  def index
    @posts = current_user.posts
  end

  def show
  end

  def create
    post = current_user.posts.create(title: params[:title], comment: params[:comment])
    if params[:movie][:title].present?
      movie = Movie.create(title: params[:movie][:title], poster_path: params[:movie][:posterPath],
        overview: params[:movie][:overview], mvdb_id: params[:movie][:id], original_title: params[:movie][:originalTitle],
        original_language: params[:movie][:originalLanguage], backdrop_path: params[:movie][:backdropPath], user_id: current_user.id)
      post.update(movie_id: movie.id)
    end

    render json: { post: post }, status: 200
  rescue
    render json: { error: 'Create failed' }, status: 422
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

end
