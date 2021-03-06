# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_service, only: %i[show edit update destroy]
  before_action :set_recommended_services, only: [:show]

  # GET /services
  # GET /services.json
  def index
    @service_decorators = Service.order('id desc').all.map { |service| ServiceDecorator.new(service, view_context) }
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service_decorator = ServiceDecorator.new(@service, view_context)
    @recommended_services_decorators = @recommended_services.map { |service| ServiceDecorator.new(service, view_context) }
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit; end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  def set_recommended_services
    @recommended_services = Service.order('id desc').all.where.not(id: params[:id]).limit(10)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def service_params
    params.require(:service).permit(:title, :preview, :description, :preview_img)
  end
end
