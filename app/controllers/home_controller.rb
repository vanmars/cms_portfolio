class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only [:index]

  def index
    if current_user
      @name = current_user.first_name
    else
      @name = 'Stranger'
    end
  end
end
ß