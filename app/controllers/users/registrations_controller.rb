class Users::RegistrationsController < Devise::RegistrationsController

  def create
    puts "in create"
    super
#    session[:omniauth] = nil unless @user.new_record?
  end

  def build_resource(*args)
    puts "in build resouce"
    super
#    if session[:omniauth]
#      @user.make_authentication(:build, session[:omniauth])
#      @user.valid?
#    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  private :sign_up_params
end

