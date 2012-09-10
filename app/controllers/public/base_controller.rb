class Public::BaseController < ApplicationController

  layout 'public'

  before_filter :metadata

  def metadata
    @title = "Ham and Eggs"
    @metatags = "bar, restaurant, music, radical, magical, fuckin cool"
    @description = "Ham and Eggs is pretty much the coolest place you can go to drink and eat in Los Angeles"
  end
end
