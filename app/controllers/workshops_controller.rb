class WorkshopsController < ApplicationController

  # before_action :set_app_host

  # require 'uri'



  def show
    # render plain: params.inspect
    render "workshops/#{params[:page]}" if params[:page]
  end

  protected

  # def set_app_host
  #   @app_host = Rails.config.app_host
  # end


end
