class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :check_ban, only: %i[create update like dislike]

  # GET /posts or /posts.json
  # app/controllers/posts_controller.rb

  def index
    @posts = PostSortingService.sort_posts(params[:sort_by], params[:direction])
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    result = PostCreationService.create_post(current_user, post_params)

    respond_to do |format|
      if result[:status] == :created
        @post = result[:post]
        format.html { redirect_to post_url(@post), notice: result[:message] }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: result[:errors], status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.increment!(:likes)
    redirect_back(fallback_location: root_path)
  end

  def dislike
    @post = Post.find(params[:id])
    @post.increment!(:dislikes)
    redirect_back(fallback_location: root_path)
  end

  def user_posts
    @user = User.find(params[:id])
    @posts = UserPostsQuery.call(@user.id)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:topic_id, :replies, :title, :body, :likes, :dislikes, :image)
  end

  def check_ban
    return unless current_user.is_banned

    redirect_to root_path, alert: "Your account is banned. You cannot perform this action."
  end
end
