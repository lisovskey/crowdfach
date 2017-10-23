class ValidationsController < ApplicationController
  load_and_authorize_resource

  def new
    @validation = Validation.new
  end

  def create
    @validation = Validation.new validation_params
    @validation.scan = params[:validation][:scan]
    respond_to do |format|
      if @validation.save
        format.html { redirect_to projects_path, notice: I18n.t('.success') }
      else
        flash[:error] = @validation.errors.full_messages.first
        format.html { render :new }
      end
    end
  end

  private
    def validation_params
      params.require(:validation).permit(:number, :first_name, :last_name, :scan,
                                         :expiration_date, :city, :country, :index,
                                         :scan_cache, :address).merge({
          user_id: current_user.id
        })
    end
end
