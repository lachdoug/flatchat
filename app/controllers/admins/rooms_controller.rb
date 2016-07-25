module Admins
  class RoomsController < ApplicationController

    def destroy
      if current_user.is_admin?
        @room = Room.find(params[:id])
        @room.destroy
        # respond_to do |format|
        #   format.js
        # end
      end
    end

    private

    def strong_params
      params.require(:room).permit(:name, :user_id)
    end

  end
end
