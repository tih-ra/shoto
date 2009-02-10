class WorksController < ApplicationController
  def index
    @works = Work.paginate(:page => params[:page], :per_page => 40, :order=>"works.created_at DESC")
  end
  def show
    @work = Work.find(params[:id])
  end
end
