class HomeController < ApplicationController
  def index
    if current_user
      @name = current_user.first_name
    else
      @name = 'Stranger'
    end
  end
end
