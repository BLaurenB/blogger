class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # fail #halts the request, allowing you to examine the request

    # @article = Article.new
    # @article.title = params[:article][:title] #because the hash is nested
    # @article.body = params[:article][:body] #because the hash is nested
    # @article.save

    @article = Article.new(params[:article])
    @article.save

    redirect_to article_path(@article)
  end

end
