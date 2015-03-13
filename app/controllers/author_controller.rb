class AuthorController < ApplicationController
  def index
    @authors = Author.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end
  def show
    @author = Author.find(params[:id])
  end
  def articles
    @author = Author.find(params[:id])
    @articles = @author.articles.order('created_at DESC')
  end
end
