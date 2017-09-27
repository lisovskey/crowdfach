class DonationsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @donation = Donation.new donation_params
    @donation.project_id = params[:project_id]
    if @donation.save
      redirect_to Project.find(@donation.project_id), notice: I18n.t('.success')
    else
      flash[:error] = @donation.errors.full_messages.first
      redirect_to root_path
    end
  end

  protected
    def donation_params
      params.require(:donation).permit(:amount).merge({
        user_id: current_user.id
      })
    end
end
