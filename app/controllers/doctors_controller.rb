class DoctorsController < ApplicationController

  before_action :find_doctor, only: [:show, :edit, :update, :destroy]
  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new 
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.save 
    redirect_to doctors_path
  end

  def edit 

  end

  def update
    @doctor.update(doctor_params) 
    redirect_to doctors_path
  end
  
  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private

  def find_doctor
    @doctor = Doctor.find_by_id(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :email)
  end
end
