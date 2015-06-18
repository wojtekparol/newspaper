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
      redirect_to root_path, notice: "Dodano pomyślnie."
    else
      flash.now[:alert] = "Czegoś brakuje."
      render 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, notice: "Udało się zmienić."
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Pomyślnie usunięto."
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end
