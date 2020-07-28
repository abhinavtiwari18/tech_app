class Api::V1::UsersController < Api::V1::BaseController
  before_action :validate_params, only: [:search]

  def import
    if BulkImporter.user_import(params[:file])
      render_success
    else
      render_error
    end
  end


  def search
    users = User.within(params[:lat], params[:long], params[:radius])
    if users.present?
      render_data(users)
    else
      render_not_found('User')
    end
  end

  private
  def validate_params
    render_error and return unless params[:lat].present? && params[:long].present? && params[:radius].present?
  end
end
