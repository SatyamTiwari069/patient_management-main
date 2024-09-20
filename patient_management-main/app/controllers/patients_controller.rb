class PatientsController < ApplicationController

  before_action :verify_patient, except: [:show]
  def index
    @patients = Patient.order(created_at: :desc)
  end
  def new
    @patient = Patient.new
  end
  def create
    @patient = Patient.new(patient_params)
    @patient.registered_by = current_user

    respond_to do |format|
      if @patient.save
        format.html {redirect_to root_path, notice: "patient created successfully"}
      else
        format.html {render 'new', status: :unprocessable_entity}
      end
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    respond_to do |format|
      if @patient.update(patient_params)
        format.html {redirect_to patient_path, notice: "Patient updated successfully!"}
      else
        format.html {render 'edit', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to root_path, notice: "Patient deleted successfully!"
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :doctor_id,
                                    :appointment_date, :date_of_birth,
                                    :allergies, :chief_complaints)
  end

  def verify_patient
    unless current_user.role == 'receptionist'
      redirect_to root_path, alert: 'You are not authorized to view this page.'
    end
  end
end
