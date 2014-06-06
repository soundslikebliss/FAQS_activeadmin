class FaqsController < ApplicationController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]

  # GET /faqs
  def index
    @faqs = if !params[:query].blank?
      Faq.faq_search(params[:query])
    else
      Faq.all
    end
    @general_faqs = Faq.where(:category_id => 1)
    @admin_faqs = Faq.where(:category_id => 2)
  end

  # GET /faqs/1
  def show
  end

  # GET /faqs/new
  def new
    @faq = Faq.new
  end

  # GET /faqs/1/edit
  def edit
  end

  # POST /faqs
  def create
    @faq = Faq.new(faq_params)

    if @faq.save
      redirect_to @faq, notice: 'Faq was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /faqs/1
  def update
    if @faq.update(faq_params)
      redirect_to @faq, notice: 'Faq was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /faqs/1
  def destroy
    @faq.destroy
    redirect_to faqs_url, notice: 'Faq was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faq
      @faq = Faq.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def faq_params
      params.require(:faq).permit(:title, :body, :category_id)
    end
end
