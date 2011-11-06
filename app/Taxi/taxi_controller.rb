require 'rho/rhocontroller'
require 'helpers/browser_helper'

class TaxiController < Rho::RhoController
  include BrowserHelper

  # GET /Taxi
  def index
    @taxis = Taxi.find(:all)
    render :back => '/app'
  end

  # GET /Taxi/{1}
  def show
    @taxi = Taxi.find(@params['id'])
    if @taxi
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Taxi/new
  def new
    @taxi = Taxi.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Taxi/{1}/edit
  def edit
    @taxi = Taxi.find(@params['id'])
    if @taxi
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Taxi/create
  def create
    @taxi = Taxi.create(@params['taxi'])
    redirect :action => :index
  end

  # POST /Taxi/{1}/update
  def update
    @taxi = Taxi.find(@params['id'])
    @taxi.update_attributes(@params['taxi']) if @taxi
    redirect :action => :index
  end

  # POST /Taxi/{1}/delete
  def delete
    @taxi = Taxi.find(@params['id'])
    @taxi.destroy if @taxi
    redirect :action => :index  
  end
end
