class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @user = User.find_by({ "id" => session["user_id"] })

    if @user && @place
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @user["id"] })
    else
      @entries = nil #nil to prevent errors in the view
    end
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
