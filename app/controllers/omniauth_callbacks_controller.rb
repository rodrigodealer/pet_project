class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    auth = request.env['omniauth.auth']
    email = auth.info.email
    if auth.info.email.nil?
      email = get_user_email(auth)
    end
    @user = User.facebook(auth: auth, email: email)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = auth
      flash[:user] = @user
      redirect_to new_user_registration_path(@user)
    end
  end

  def failure
    redirect_to root_path
  end

  def get_user_email(request)
    email = RestClient.get "https://graph.facebook.com/v2.8/me?fields=id%2Cname%2Cemail&access_token=#{request.credentials.token}"
    email = JSON.parse(email.body)['email']
  end
end
