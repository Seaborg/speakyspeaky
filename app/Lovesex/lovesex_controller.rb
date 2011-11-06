require 'rho/rhocontroller'
require 'helpers/browser_helper'

class LovesexController < Rho::RhoController
  include BrowserHelper

  # GET /Lovesex
  def index
    @lovesexes = Lovesex.find(:all)
    render :back => '/app'
  end

  # GET /Lovesex/{1}
  def show
    @lovesex = Lovesex.find(@params['id'])
    if @lovesex
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Lovesex/new
  def new
    @lovesex = Lovesex.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Lovesex/{1}/edit
  def edit
    @lovesex = Lovesex.find(@params['id'])
    if @lovesex
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Lovesex/create
  def create
    @lovesex = Lovesex.create(@params['lovesex'])
    redirect :action => :index
  end

  # POST /Lovesex/{1}/update
  def update
    @lovesex = Lovesex.find(@params['id'])
    @lovesex.update_attributes(@params['lovesex']) if @lovesex
    redirect :action => :index
  end

  # POST /Lovesex/{1}/delete
  def delete
    @lovesex = Lovesex.find(@params['id'])
    @lovesex.destroy if @lovesex
    redirect :action => :index  
  end
end
