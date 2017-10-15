class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :edit, :update]

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

    # @article = Article.new(params[:article]) #BAD! ERRORS! BAD! this blindly accepts any params from the http request.
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article '#{@article.title}' was created."

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    flash.notice = "Article '#{@article.title}' has been Deleted."
    redirect_to articles_path #this is plural - the index path
  end

  def edit
  end

  def update
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' was updated!"
    redirect_to article_path(@article)
  end


  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
