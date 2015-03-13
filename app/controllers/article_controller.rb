class ArticleController < ApplicationController
  def index
  	@articles = Article.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @article = Article.find(params[:id])
    @tags = @article.tags
  end
  def tags
    @tags = @article.tags
    @tag = Tag.find(params[:id])
    @articles = @tag.articles.order('id DESC')
  end
end
