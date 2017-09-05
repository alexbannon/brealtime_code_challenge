class WelcomeController < ApplicationController

  def index
    render :status => 200, :json => "OK"
  end

  def ok
    render plain: "OK"
  end

end
