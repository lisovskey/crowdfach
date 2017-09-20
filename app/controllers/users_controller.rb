class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: [:show, :projects]

  def projects
    @projects = current_user.projects
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  protected
    def verify_captcha(response)
      result = RestClient.post(
                  'https://www.google.com/recaptcha/api/siteverify',
                  secret: Rails.application.secrets[:recaptcha][:secret_key],
                  response: response)

      JSON.parse(result)[:success]
    end

  private
    def admin_only
      unless current_user.admin?
        redirect_to root_path, :alert => "Access denied"
      end
    end
end
