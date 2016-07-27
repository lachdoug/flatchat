class RoomsController < ApplicationController
  respond_to :json
  # before_action :allow_cross_site_json_requests

  def index
    respond_with Room.all.reverse
  end

  def show
    respond_with Room.find(params[:id]).to_json(include: :messages)
  end

  def create

p "current_user #{current_user}"

    @room = Room.new(strong_params.merge({user_id: current_user.id}))
    if @room.save
      render json: @room.to_json, status: 201
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
