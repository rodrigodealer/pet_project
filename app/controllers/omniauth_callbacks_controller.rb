class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    email = request.env['omniauth.auth'].info.email
    if request.env['omniauth.auth'].info.email.nil?
      email = RestClient.get "https://graph.facebook.com/v2.8/me?fields=id%2Cname%2Cemail&access_token=#{request.env['omniauth.auth'].credentials.token}", {accept: :json}
      email = JSON.parse(email.body)['email']
    end
    @user = User.facebook(auth: request.env['omniauth.auth'], email: email)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
