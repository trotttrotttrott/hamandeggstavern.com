class Public::BaseController < ApplicationController

  layout 'public'

  before_filter :metadata

  def metadata
    @title = "Ham and Eggs"
    @metatags = "bar, restaurant, music, radical, magical, fuckin cool, wine bar, venue, private party, tavern, beer, cheap beer, cheap drinks, cheap, friendly, attractive, downtown, dtla, los angeles, happy hour, hip, cool, trendy, hipster, fun, dance, party, david deluca, davin sanchez"
    @description = "A friendly place to gather"
    @canonical = request.url
  end
end
