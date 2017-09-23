class DonationsController < ApplicationController
  def create
    @donation = Donation.new donation_params
    if @donation.save
      redirect_to Project.find(@donation.project_id), notice: 'Transaction was successfully created'
    else
      flash[:error] = @donation.errors.full_messages.first
      redirect_to root_path
    end
  end

  protected
    def donation_params
      params.require(:donation).permit(:amount, :project_id).merge({
        user_id: current_user.id
      })
    end
end
