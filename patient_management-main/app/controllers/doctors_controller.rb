class DoctorsController < ApplicationController
  before_action :verify_doctor
  def index
    @patients = current_user.patients
    @patients_by_day = @patients.group_by_day(:appointment_date).count
  end
  def patients_vs_days_graph
    @patients = current_user.patients
    @patients_by_day = @patients.group_by_day(:appointment_date).count
  end

  private
  def verify_doctor
    unless current_user.role == 'doctor'
      redirect_to root_path, alert: 'You are not authorized to view this page.'
    end
  end

end
