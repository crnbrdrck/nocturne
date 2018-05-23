class PlayerBaseController < ApplicationController
  LAYOUT = "player_application.slang"

  private def redirect_non_player
    if !signed_in?
      # Redirect to login page
      flash[:info] = "Please Sign In"
      redirect_to "/signin/?next=#{request.path}"
    end
    # Check the currently logged in user is a player
    if !current_user.not_nil!.player
      redirect_to "/"
    end
  end

  before_action do
    all { redirect_non_player }
  end
end

class PlayerController < PlayerBaseController
end
