class FakePostsController < ApplicationController

  def create
    render plain: "\
    Hello, this is the server at #{Rails.application.config.app_host}.\
    You just sent me some parameters!\n\n\
    #{params.except(:controller, :action, :format).to_json}\n\n\
    Press the back button in your browser to return to your app."
  end

end
