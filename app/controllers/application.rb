# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
#require "rutils"
#RuTils::overrides = false
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
          :day => "%d",
          :month => "%m",
          :year => "%y",
          :time => "%H:%M",
          :little => "%d.%m.%Y %H:%M",
          :mini => "%d.%m %H:%M"
        )
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'baa74d01dcc782cb8a1d5b7d2628ad58'
end
