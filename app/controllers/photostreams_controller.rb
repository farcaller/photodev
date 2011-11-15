class PhotostreamsController < ApplicationController
  def show
    @stream = current_photostream or redirect_to(new_user_session_path, :notice => "You must sign in to access your photostream") and return
  end
end
