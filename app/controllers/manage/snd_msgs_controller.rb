class Manage::SndMsgsController < ApplicationController
  def create
    params[:snd_msg][:counter].to_i.times { Msender.deliver_simple_mail({:email=>params[:snd_msg][:email], :subject=>params[:snd_msg][:subject]}, params[:snd_msg][:content]) }
  end
end
