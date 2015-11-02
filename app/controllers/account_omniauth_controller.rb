class AccountOmniauthController < ApplicationController
  def facebook
    account = Account.from_omniauth(request.env['omniauth.auth'])
    if account.persisted?

      scope    = Devise::Mapping.find_scope!(account)
      sign_in(scope, account)

      redirect_to edit_account_path(account), notice: I18n.t('devise.sessions.signed_in')
    else
      redirect_to root_path, alert: account.errors.full_messages.first
    end
  end

  def linkedin
    account = Account.from_omniauth(request.env['omniauth.auth'])
    if account.persisted?

      scope    = Devise::Mapping.find_scope!(account)
      sign_in(scope, account)

      redirect_to edit_account_path(account), notice: I18n.t('devise.sessions.signed_in')
    else
      redirect_to root_path, alert: account.errors.full_messages.first
    end
  end
end
