class ArticlesController < ApplicationController
  before_action :set_user
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :check_ownership!, only: [:edit, :create, :update, :destroy]

  def index
    @articles = get_articles
  end

  def show ; end

  def new
    @article = Article.new
  end

  def edit ; end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to [@user, @article], notice: I18n.t('model.created', class_name: @article.class)
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to [@user, @article], notice: I18n.t('model.updated', class_name: @article.class)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to user_articles_url
  end

  private

    def set_article
      @article = Article.get_by_user_id(@user.id, params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def get_articles
      articles = Article.by_user(@user)
      articles = articles.published unless has_ownership?
      return articles
    end

    def article_params
      params.require(:article).permit(:title, :brief, :content, :published, :published_at).merge(user_id: current_user.id)
    end

    def check_ownership!
      if !has_ownership?
        redirect_to user_articles_url, alert: I18n.t('account.unauthorized')
      end
    end

    def has_ownership?
      current_user && @user.id == current_user.id
    end
end
