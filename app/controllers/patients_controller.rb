class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :edit, :update, :destroy]
  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new 
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save 
    redirect_to patients_path
  end

  def edit 

  end

  def update
    @patient.update(patient_params) 
    redirect_to patients_path
  end
  
  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private

  def find_patient
    @patient = Patient.find_by_id(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :email, :age)
  end
end
