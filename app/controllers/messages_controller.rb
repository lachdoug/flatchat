class MessagesController < ApplicationController

  # before_action :allow_cross_site_json_requests

  def show
    @message = Message.find(params[:id])
    respond_to do |format|
      format.json { render json: @message }
    end
  end

  def create
    @message = Message.new(strong_params.merge({user_id: current_user.id}))
    if @message.save
      CreateMessageJob.perform_now(@message)
      respond_to do |format|
        format.json { render json: @message, status: 201 }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @message.errors.full_messages }, status: 422 }
      end
    end
  end

  private

  def strong_params
    params.require(:message).permit(:room_id, :body)
  end

end