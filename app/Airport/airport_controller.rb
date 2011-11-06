require 'rho/rhocontroller'
require 'helpers/browser_helper'

class AirportController < Rho::RhoController
  include BrowserHelper

  # GET /Airport
  def index
    @airports = Airport.find(:all)
    render :back => '/app'
  end

  # GET /Airport/{1}
  def show
    @airport = Airport.find(@params['id'])
    if @airport
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Airport/new
  def new
    @airport = Airport.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Airport/{1}/edit
  def edit
    @airport = Airport.find(@params['id'])
    if @airport
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Airport/create
  def create
    @airport = Airport.create(@params['airport'])
    redirect :action => :index
  end

  # POST /Airport/{1}/update
  def update
    @airport = Airport.find(@params['id'])
    @airport.update_attributes(@params['airport']) if @airport
    redirect :action => :index
  end

  # POST /Airport/{1}/delete
  def delete
    @airport = Airport.find(@params['id'])
    @airport.destroy if @airport
    redirect :action => :index  
  end
end
