class MyOmniauthController < ApplicationController

  def create
    if params[:provider].eql?("facebook")
      facebook
    else
      linkedin
    end
  end

  private
  def facebook
    omniauth_params = request.env["omniauth.params"]
    model_class = Object.const_get omniauth_params["resource"].classify
    user = model_class.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?

      scope    = Devise::Mapping.find_scope!(user)
      sign_in(scope, user)

      redirect_to controller: omniauth_params["resource"].pluralize, action: "edit", id: user,
          notice: I18n.t('devise.sessions.signed_in')
    else
      redirect_to root_path, alert: user.errors.full_messages.first
    end
  end

  def linkedin
    omniauth_params = request.env["omniauth.params"]
    model_class = Object.const_get omniauth_params["resource"].classify
    user = model_class.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?

      scope    = Devise::Mapping.find_scope!(user)
      sign_in(scope, user)

      redirect_to controller: omniauth_params["resource"].pluralize, action: "edit", id: user,
                  notice: I18n.t('devise.sessions.signed_in')
    else
      redirect_to root_path, alert: user.errors.full_messages.first
    end
  end

end
