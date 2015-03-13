class AuthorController < ApplicationController
  def index
  	@authors = Author.paginate(:page => params[:page], :per_page => 10)
  end
  def show
  	@author = Author.find(params[:id])
  end
end
