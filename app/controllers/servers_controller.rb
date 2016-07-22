class ServersController < ApplicationController

  def show
    @messages = Message.all
  end

end
