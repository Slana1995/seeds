class ArticleController < ApplicationController
  def index
  end

  def show
  	@article = Article.find(params[:id])
  end
  def tags
    @article = Article.find(params[:id])
    @tags = @article.tags
  end
end
