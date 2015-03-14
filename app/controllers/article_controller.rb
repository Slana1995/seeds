class ArticleController < ApplicationController
  def index
  	@articles = Article.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end

  def show
    @article = Article.find(find_params)
    @tags = @article.tags
  end
  # def tags
  #   @tags = @article.tags
  #   @tag = Tag.find(params[:id])
  #   @articles = @tag.articles.order('id DESC')
  # end
  private
    def find_params
      @article = Article.find(params[:id]) 
    end
end
