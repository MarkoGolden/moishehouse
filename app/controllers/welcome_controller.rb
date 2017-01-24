class WelcomeController < ApplicationController
layout "mintranet"
  def index
    if current_user
      if current_user.role == "resident"
      	redirect_to residents_index_path
    	elsif current_user.role == "mhwow"
    		redirect_to host_center_path
      end
    end
  end
  
end
