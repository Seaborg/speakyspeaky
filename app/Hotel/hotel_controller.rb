require 'rho/rhocontroller'
require 'helpers/browser_helper'

class HotelController < Rho::RhoController
  include BrowserHelper

  # GET /Hotel
  def index
    @hotels = Hotel.find(:all)
    render :back => '/app'
  end

  # GET /Hotel/{1}
  def show
    @hotel = Hotel.find(@params['id'])
    if @hotel
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Hotel/new
  def new
    @hotel = Hotel.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Hotel/{1}/edit
  def edit
    @hotel = Hotel.find(@params['id'])
    if @hotel
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Hotel/create
  def create
    @hotel = Hotel.create(@params['hotel'])
    redirect :action => :index
  end

  # POST /Hotel/{1}/update
  def update
    @hotel = Hotel.find(@params['id'])
    @hotel.update_attributes(@params['hotel']) if @hotel
    redirect :action => :index
  end

  # POST /Hotel/{1}/delete
  def delete
    @hotel = Hotel.find(@params['id'])
    @hotel.destroy if @hotel
    redirect :action => :index  
  end
end
