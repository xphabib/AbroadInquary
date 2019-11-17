class CommentsController < ApplicationController
  skip_before_action :authenticate_user!


  def create
    @post = Blog.find_by_id(params[:blog_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id if current_user.present?
    respond_to do |format|
      if @comment.save!
        format.html { redirect_to @post, notice: 'Comments was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name, :user_email, :user_phone, :user_id)
  end
end