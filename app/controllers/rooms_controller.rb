class RoomsController < ApplicationController
  respond_to :json
  # before_action :allow_cross_site_json_requests

  def index
    respond_with Room.all
  end

  def show
    respond_with Room.find(params[:id])
  end

  def create
    @room = Room.new(strong_params.merge({user_id: current_user.id}))
    if @room.save
      respond_with @room, status: 201
      CreateRoomJob.perform_now(@room)
    else
      render json: { errors: @room.errors.full_messages }.to_json, status: 422
    end
  end

  private

  def strong_params
    params.require(:room).permit(:name, :user_id)
  end

end
