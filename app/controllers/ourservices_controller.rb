class OurservicesController < ApplicationController
  def show
    @our_service = Service.find_by_category(params[:id])
  end
end
