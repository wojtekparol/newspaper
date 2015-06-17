class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      redirect_to new_article_path, alert: "Czegoś brakuje."
    end
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end
