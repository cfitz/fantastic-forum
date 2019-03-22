class HomeController < ApplicationController
  
  skip_before_action :authenticate_user, only: %i(index)

  def index
    render plain: "~~~ Fantastic Forum API ~~~"
  end

end
