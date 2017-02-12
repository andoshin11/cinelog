class Api::PostsController < Api::AbstractController
  before_action :set_post, only: [:show]

  def index
    @posts = current_user.posts
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

end
