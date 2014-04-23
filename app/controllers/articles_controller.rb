class ArticlesController < ApplicationController
  include UserArea

  before_action :set_article, except: [:index, :new]
  before_action :check_ownership!, except: [:index, :show]

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
      @article = Article.get_by_user_id(@user, params[:id])
    end

    def get_articles
      articles = Article.by_user(@user)
      articles = articles.published unless has_ownership?
      return articles
    end

    def article_params
      params.require(:article).permit(:title, :brief, :content, :published, :published_at).merge(user_id: current_user.id)
    end
end
