class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    sales_associate = SalesAssociate.from_omniauth(request.env['omniauth.auth'])
    if sales_associate.persisted?

      scope    = Devise::Mapping.find_scope!(sales_associate)
      sign_in(scope, sales_associate)

      redirect_to edit_sales_associate_path(sales_associate), notice: I18n.t('devise.sessions.signed_in')
    else
      redirect_to root_path, alert: sales_associate.errors.full_messages.first
    end
  end

  def linkedin
    sales_associate = SalesAssociate.from_omniauth(request.env['omniauth.auth'])
    if sales_associate.persisted?

      scope    = Devise::Mapping.find_scope!(sales_associate)
      sign_in(scope, sales_associate)

      redirect_to edit_sales_associate_path(sales_associate), notice: I18n.t('devise.sessions.signed_in')
    else
      redirect_to root_path, alert: sales_associate.errors.full_messages.first
    end
  end

end
