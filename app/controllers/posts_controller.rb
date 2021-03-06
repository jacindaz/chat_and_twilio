class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:room)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.room = Room.find(params[:post][:room_id])
    @post.user = current_user

    if @post.save
      if request.xhr?
        @room = @post.room
        render :'rooms/show'
      else
        flash[:message] = "Post saved."
        redirect_to posts_path
      end
    else
      flash[:message] = "Post failed to save."
      @room = @post.room
      render :'rooms/show'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.room = Room.find(params[:post][:room_id])

    if @post.update(post_params)
      flash[:message] = "Post updated."
      redirect_to posts_path
    else
      flash[:message] = "Post failed to update."
      render edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:message] = "Post deleted."
      redirect_to posts_path
    else
      flash[:message] = "Post failed to delete."
      render posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, :room_id)
  end
end
