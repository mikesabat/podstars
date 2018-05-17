class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    require 'unirest'
  #do we actually need to require unirest?

  # def hello
  # 	render html: "Hello World!"
  # end
end
