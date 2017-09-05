class WelcomeController < ApplicationController

  def index
    render :status => 200, :json => {}
  end

  def ok
    render :json => {hello: "world"}
    head :no_content
  end

end
