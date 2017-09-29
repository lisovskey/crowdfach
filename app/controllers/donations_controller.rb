class DonationsController < ApplicationController
  load_and_authorize_resource
  
  def create
    redirect_to Project.find(params[:project_id]), notice: 'TODO'
  end

  protected
    def donation_params
      params.require(:donation).permit(:amount).merge({
        user_id: current_user.id
      })
    end
end
