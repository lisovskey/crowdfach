class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :set_languages
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.message
  end

  protected  
    def configure_permitted_parameters
      keys = [:first_name, :last_name, :avatar, :avatar_cache, :remove_avatar, :wallet]
      devise_parameter_sanitizer.permit(:sign_up, keys: keys)
      devise_parameter_sanitizer.permit(:account_update, keys: keys)
    end

  private
    def set_languages
      case cookies[:language]
      when 'en'
        @current_language = I18n.t('language.english')
        @languages = [I18n.t('language.russian'), I18n.t('language.english')]
      when 'ru'
        @current_language = I18n.t('language.russian')
        @languages = [I18n.t('language.english'), I18n.t('language.russian')]
      end
    end

    def set_locale
      cookies[:language] ||= 'en'
      I18n.locale = cookies[:language]
    end
end
