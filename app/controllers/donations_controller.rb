class DonationsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @donation = Donation.new donation_params
    @donation.project_id = params[:project_id]
    respond_to do |format|
      if @donation.save
        @project = Project.find params[:project_id]
        @project.increment! :balance, params[:donation][:amount].to_f
        format.html { redirect_to @project, notice: "Successfully donated #{@donation.amount}BTC" }        
      else
        flash[:error] = @donation.errors.full_messages.first
        format.html { redirect_to root_path }
      end
    end
  end

  protected
    def donation_params
      params.require(:donation).permit(:amount).merge({
        user_id: current_user.id
      })
    end
end
