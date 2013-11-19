# Blog posts controller
class PostsController < ApplicationController
  before_filter :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = policy_scope(Post)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    authorize @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    authorize @post
    respond_to do |format|
      if @post.save
        current_user.posts << @post
        format.html do
          redirect_to @post, notice: 'Post was successfully created.'
        end
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    authorize @post
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html do
          redirect_to @post, notice: 'Post was successfully updated.'
        end
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize @post
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was deleted." }
      format.json { head :no_content }
    end
  end

private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :author_id, :published)
  end
end
