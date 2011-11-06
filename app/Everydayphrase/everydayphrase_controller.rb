require 'rho/rhocontroller'
require 'helpers/browser_helper'

class EverydayphraseController < Rho::RhoController
  include BrowserHelper

  # GET /Everydayphrase
  def index
    @everydayphrases = Everydayphrase.find(:all)
    render :back => '/app'
  end

  # GET /Everydayphrase/{1}
  def show
    @everydayphrase = Everydayphrase.find(@params['id'])
    if @everydayphrase
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Everydayphrase/new
  def new
    @everydayphrase = Everydayphrase.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Everydayphrase/{1}/edit
  def edit
    @everydayphrase = Everydayphrase.find(@params['id'])
    if @everydayphrase
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Everydayphrase/create
  def create
    @everydayphrase = Everydayphrase.create(@params['everydayphrase'])
    redirect :action => :index
  end

  # POST /Everydayphrase/{1}/update
  def update
    @everydayphrase = Everydayphrase.find(@params['id'])
    @everydayphrase.update_attributes(@params['everydayphrase']) if @everydayphrase
    redirect :action => :index
  end

  # POST /Everydayphrase/{1}/delete
  def delete
    @everydayphrase = Everydayphrase.find(@params['id'])
    @everydayphrase.destroy if @everydayphrase
    redirect :action => :index  
  end
  def play_file
     @everydayphrase = Everydayphrase.find(@params['id'])
     # WebView.navigate(url_for(:action => :index))
     # render :action => :show, :back => url_for(:action => :index)
     # @everydayphrase = Goingout.find(@params['id'])

     Alert.play_file @params['file_name'], @params['media_type']
     # Alert.play_file "/public/sounds/test.mp3"
     # WebView.refresh(edit) 
     # render :action => :show, :back => url_for(:action => :index)
     # render :action => :index, :back => '/app'
     # render :back => url_for(:action => :index)

     redirect :action => :index  
     # WebView.navigate(url_for(:action => :index))
     
     # WebView.refresh()
     # WebView.navigate(url_for(:action => :show))
     # render :action => :show, :back => url_for(:action => :index)
     # render :action => :index, :back => '/app'
     # WebView.refresh()
     # render :action => :show, :back => url_for(:action => :index)
   end
end
