class Manage::MainController < ApplicationController
  before_filter :login_required
  layout "manage"
end
