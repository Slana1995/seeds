class ArticleController < ApplicationController
  def index
  	@articles = Article.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  	@article = Article.find(params[:id])
  end
  def tags
    @article = Article.find(params[:id])
    @tags = @article.tags
  end
end
