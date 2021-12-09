class ArticlesController < ApplicationController
  
  def show
      @article = Article.find(params[:id])
  end

  def index
      @allArticle = Article.all
  end

  def new
    
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
      if @article.save
        flash[:notice] = 'Article created sucessfully'
        redirect_to article_path(@article)
      else 
        render 'new'
      end    
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
      if @article.update(params.require(:article).permit(:title, :description))
        flash[:notice] = 'Article updated sucessfully'
        redirect_to article_path(@article)
      else 
        render 'new'
      end  
  end

end