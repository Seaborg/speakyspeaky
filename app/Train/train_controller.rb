require 'rho/rhocontroller'
require 'helpers/browser_helper'

class TrainController < Rho::RhoController
  include BrowserHelper

  # GET /Train
  def index
    @trains = Train.find(:all)
    render :back => '/app'
  end

  # GET /Train/{1}
  def show
    @train = Train.find(@params['id'])
    if @train
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Train/new
  def new
    @train = Train.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Train/{1}/edit
  def edit
    @train = Train.find(@params['id'])
    if @train
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Train/create
  def create
    @train = Train.create(@params['train'])
    redirect :action => :index
  end

  # POST /Train/{1}/update
  def update
    @train = Train.find(@params['id'])
    @train.update_attributes(@params['train']) if @train
    redirect :action => :index
  end

  # POST /Train/{1}/delete
  def delete
    @train = Train.find(@params['id'])
    @train.destroy if @train
    redirect :action => :index  
  end
end
