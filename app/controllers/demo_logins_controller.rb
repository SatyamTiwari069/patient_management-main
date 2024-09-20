class DemoLoginsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:doctor_demo_login,
                                                 :receptionist_demo_login]
  def doctor_demo_login
    user = User.find_by(email: 'demodoctor@example.com')
    sign_in(user)
    redirect_to root_path
  end

  def receptionist_demo_login
    user = User.find_by(email: 'demoreceptionist@example.com')
    sign_in(user)
    redirect_to root_path
  end
end
