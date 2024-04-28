class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :check_ban, only: %i[create update like dislike]

  # GET /posts or /posts.json
  def index
    @posts = Post.where(is_hidden: false)
    sort_by = params[:sort_by]
    direction = params[:direction] == 'desc' ? :desc : :asc
    @posts = case sort_by
             when 'date'
               @posts.order(created_at: direction)
             when 'rating'
               @posts.sort_by do |post|
                 reactions = post.likes + post.dislikes
                 if reactions > 0
                   rating = post.likes.to_f / reactions
                 elsif post.likes == 0 && post.dislikes > 0
                   rating = -1
                 else
                   rating = -2
                 end
                 direction == :desc ? -rating : rating
               end
             when 'topics'
               @posts.joins(:topic).order("topics.name #{direction}")
             else
               @posts.order(created_at: direction)
             end
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
    @post = current_user.posts.new(post_params)
    @post.replies = 0
    @post.likes = 0
    @post.dislikes = 0

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
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
    @posts = @user.posts.where(is_hidden: false).order(likes: :desc, dislikes: :asc)
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
