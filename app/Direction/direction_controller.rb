require 'rho/rhocontroller'
require 'helpers/browser_helper'

class DirectionController < Rho::RhoController
  include BrowserHelper

  # GET /Direction
  def index
    @directions = Direction.find(:all)
    render :back => '/app'
  end

  # GET /Direction/{1}
  def show
    @direction = Direction.find(@params['id'])
    if @direction
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Direction/new
  def new
    @direction = Direction.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Direction/{1}/edit
  def edit
    @direction = Direction.find(@params['id'])
    if @direction
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Direction/create
  def create
    @direction = Direction.create(@params['direction'])
    redirect :action => :index
  end

  # POST /Direction/{1}/update
  def update
    @direction = Direction.find(@params['id'])
    @direction.update_attributes(@params['direction']) if @direction
    redirect :action => :index
  end

  # POST /Direction/{1}/delete
  def delete
    @direction = Direction.find(@params['id'])
    @direction.destroy if @direction
    redirect :action => :index  
  end
end
