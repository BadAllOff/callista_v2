class RealtiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_country
  before_action :set_realty, only: [:show, :edit, :update, :destroy]
  before_action :set_realties, only: [:show]

  # GET countries/1/realties
  def index
    @realties_decorators = @country.realties.order('id desc').all.map { |realty| RealtyDecorator.new(realty, view_context) }
  end

  # GET countries/1/realties/1
  def show
    @realty_decorator = RealtyDecorator.new(@realty, view_context)
    @realties_decorators = @realties.map { |realty| RealtyDecorator.new(realty, view_context) }
  end

  # GET countries/1/realties/new
  def new
    @realty = @country.realties.build
  end

  # GET countries/1/realties/1/edit
  def edit
  end

  # POST countries/1/realties
  def create
    @realty = @country.realties.build(realty_params)

    if @realty.save
      redirect_to([@realty.country, @realty], notice: 'Realty was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT countries/1/realties/1
  def update
    if @realty.update_attributes(realty_params)
      redirect_to([@realty.country, @realty], notice: 'Realty was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE countries/1/realties/1
  def destroy
    @realty.destroy

    redirect_to country_realties_url(@country)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:country_id])
    end

    def set_realty
      @realty = @country.realties.find(params[:id])
    end

    def set_realties
      @realties = @country.realties.order('id desc').all.limit(10)
    end
    # Only allow a trusted parameter "white list" through.
    def realty_params
      params.require(:realty).permit(:title, :preview, :description, :preview_img, images: [])
    end
end
