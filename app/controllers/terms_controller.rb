class TermsController < ApplicationController
  before_filter :authorize!
  def index
    @terms = Term.all
  end

  def show
    @term = Term.find(params[:id])
  end

  def new
    @term = Term.new
  end

  def edit
    @term = Term.find(params[:id])
  end

  def create
    # to investigate that is being sent
    # render plain: params[:term].inspect
    @term = Term.new(term_params)

    if @term.save
      redirect_to @term
    else
      render 'new'
    end
  end

  def update
    @term = Term.find(params[:id])

    if @term.update(term_params)
      redirect_to @term
    else
      render 'edit'
    end
  end


  # def update
  #   @article = Article.find(params[:id])
  #
  #   if @article.update(article_params)
  #     redirect_to @article
  #   else
  #     render 'edit'
  #   end
  # end

  def destroy
    @term = Term.find(params[:id])
    @term.destroy

    redirect_to terms_path
  end

  private
    def term_params
      params.require(:term).permit(:name, :definition, :author, :web_link, :category_id)
    end
end
