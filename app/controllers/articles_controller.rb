class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @pages = Page.all.order(:created_at => :desc).page(params[:page]).per_page(5)
    @articles = Article.page(params[:page]).per_page(6).order('created_at DESC')
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @pages = Page.all.order(:created_at => :desc).page(params[:page]).per_page(6)
    @article.increment
  end

  # GET /articles/form


  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article.page, notice: ' Posted.' }
        format.mobile { redirect_to @article, notice: ' Posted.' }
      else
        format.html { redirect_to @article.page,notice: 'Not posted , Post must be 25 up word '}
        format.mobile { redirect_to @article.page, notice: 'Not posted , Post must be 25 up word '}
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: ' updated.' }
        format.mobile { redirect_to @article, notice: ' updated.' }
      else
        format.html { render :edit }
        format.mobile { render :edit }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def delete
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to @article
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Post delete.' }
      format.mobile { redirect_to current_user, notice: 'Post delete.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

  def set_article_id
    @article_ids = Article.find(params[:id])
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :user_id,  :page_id, :image,:category_id )
    end
end
