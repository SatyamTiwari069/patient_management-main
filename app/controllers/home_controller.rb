class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.role == 'doctor'
        redirect_to doctors_path
      else
        redirect_to patients_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
