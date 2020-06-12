class HomeController < ApplicationController
  def index
    @cities = City.all
  end

  def difference
    
  end 

  def findCity
    @city=City.find(params[:id])
  end 

  def local (*args)
    localTime=Time.utc(*args)
    ActiveSupport::TimeWithZone.new(nil,self,localTime)
  end 

  def today
    tzinfo.now.to_date
  end 
end
