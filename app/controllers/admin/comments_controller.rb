class Admin::CommentsController < Admin::AdminController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to admin_post_path([:admin, @post])
  end
  
  def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path([:admin, @post])
  end
end
