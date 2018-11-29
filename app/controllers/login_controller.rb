class LoginController < ApplicationController
  def new
    if current_user
      redirect_to root_path
      flash.now[:danger] = "Ya inicio sesión"
    end
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to root_path
    else
      redirect_to login_path, danger: "El correo/contraseña son inválidos"
    end
  end

  def destroy
  	log_out
    redirect_to root_url
  end
end
