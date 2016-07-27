class FakePostsController < ApplicationController

  def create
    render plain: "Success! You posted parameters:\n #{params.to_json}"
  end

end
