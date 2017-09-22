class DonationsController < ApplicationController
  def create
    @donation = Donation.new donation_params
    if @donation.save
      redirect_to root_path, notice: 'Transaction was successfully created'
    else
      flash[:error] = @donation.errors.full_messages.first
      redirect_to root_path
    end
  end

  protected
    def donation_params
      params.require(:donation).permit(:amount, :project_id)
    end
end
