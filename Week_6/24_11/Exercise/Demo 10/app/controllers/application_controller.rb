# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Pagy::Backend
end
