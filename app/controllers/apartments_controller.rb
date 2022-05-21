class ApartmentsController < ApplicationController
  def index
    apartments = Apartment.all
    render json: apartments, status: :ok
  end

  def show
    apartments = find_apartment
    render json: apartments, status: :ok
  end

  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :created
  end

  def update
    apartment = Apartment.find(params[:id])
    apartment.update(apartment_params)
    render json: apartment, status: :ok
  end

  def destroy
    apartment = find_apartment
    apartment.destroy
    head :no_content, status: :no_content
  end

  private

  def apartment_params
    params.permit(:number)
  end

  def find_apartment
    Apartment.find(params[:id])
  end
end
