class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]
  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new 
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.save 
    redirect_to appointments_path
  end

  def edit 

  end

  def update
    @appointment.update(appointment_params) 
    redirect_to appointments_path
  end
  
  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def find_appointment
    @appointment = Appointment.find_by_id(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :appointment_date)
  end
end
