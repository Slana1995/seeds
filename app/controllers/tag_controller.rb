class TagController < ApplicationController
  def articles
    @tag = Tag.find(params[:id])
    @articles = @tag.articles.order('id DESC')
  end
end
