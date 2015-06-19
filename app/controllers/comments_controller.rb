class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @article = Article.find(params[:article_id])
  end
  
  def create
    @comment = Comment.new(comment_parameters)
    if @comment.save
      redirect_to article_path(@comment.article_id), notice: "Dodano Twój komentarz."
    else
      flash.now[:alert] = "Czegoś brakuje."
      render 'new'
    end
  end
  
  private
  
  def comment_parameters
    params.require(:comment).permit(:text, :author, :article_id)
  end
  
end
