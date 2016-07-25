class ServersController < ApplicationController

  def show
    @messages = Message.all.reverse
    @rooms = Room.all.reverse
  end

end
