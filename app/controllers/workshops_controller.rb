class WorkshopsController < ApplicationController

  def show
    # render plain: params.inspect
    render "workshops/#{params[:page]}" if params[:page]
  end

end
