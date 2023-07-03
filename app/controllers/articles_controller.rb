class ArticlesController < ApplicationController
  before_action :authorize_user, only: [:index, :show]

  def index
    articles = Article.all
    render json: articles, each_serializer: ArticlePreviewSerializer
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  private

  def authorize_user
    return if current_user

    render json: { error: 'Not authorized' }, status: :unauthorized
  end
end
