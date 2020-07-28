class Api::V1::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token

  protected
  # method for success meesage, this can be customized
  def render_success
    render status: :ok, json: {
        message: 'User imported successfully'
    }
  end

  # method to render response data
  def render_data(data)
    render status: :ok, json: {
        data: data
    }
  end

  # method for error meesage, this can be customized
  def render_error
    render json: {
        message: 'oops!! Error in request'
    }, status: :unprocessable_entity
  end


  # method for empty data rendering
  def render_not_found(model)
    render json: {
        message: "#{model} not found"
    }, status: '404'
  end




end