  class ArticlesController < ApplicationController
    include ArticlesHelper

    before_filter :require_login, only: [:new, :create, :update, :destroy ]

    def index
      @articles = Article.all
    end

    def show
      @articles = Article.find(params[:id])
      @comment = Comment.new
      @comment.article_id = @articles.id
    end

    def new
      @articles = Article.new
    end

    def create
      @articles = Article.new(article_params)
      @articles.title = params[:article][:title]
      @articles.save

      flash.notice = "Article '#{@articles.title}' Created!"

      redirect_to article_path(@articles)
    end

    def destroy
      @articles = Article.find(params[:id])
      @articles.destroy

      flash.notice = "Article '#{@articles.title}' Deleted!"

      redirect_to articles_path
    end

    def edit
      @articles = Article.find(params[:id])
    end

    def update
      @articles = Article.find(params[:id])
      @articles.update (article_params)

      flash.notice = "Article '#{@articles.title}' Updated!"

      redirect_to article_path(@articles)

    end

  end
