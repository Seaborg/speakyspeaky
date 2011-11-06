require 'rho/rhocontroller'
require 'helpers/browser_helper'

class MannerController < Rho::RhoController
  include BrowserHelper

  # GET /Manner
  def index
    @manners = Manner.find(:all)
    render :back => '/app'
  end

  # GET /Manner/{1}
  def show
    @manner = Manner.find(@params['id'])
    if @manner
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Manner/new
  def new
    @manner = Manner.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Manner/{1}/edit
  def edit
    @manner = Manner.find(@params['id'])
    if @manner
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Manner/create
  def create
    @manner = Manner.create(@params['manner'])
    redirect :action => :index
  end

  # POST /Manner/{1}/update
  def update
    @manner = Manner.find(@params['id'])
    @manner.update_attributes(@params['manner']) if @manner
    redirect :action => :index
  end

  # POST /Manner/{1}/delete
  def delete
    @manner = Manner.find(@params['id'])
    @manner.destroy if @manner
    redirect :action => :index  
  end
end
