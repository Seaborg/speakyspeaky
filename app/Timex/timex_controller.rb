require 'rho/rhocontroller'
require 'helpers/browser_helper'

class TimexController < Rho::RhoController
  include BrowserHelper

  # GET /Timex
  def index
    @timexes = Timex.find(:all)
    render :back => '/app'
  end

  # GET /Timex/{1}
  def show
    @timex = Timex.find(@params['id'])
    if @timex
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Timex/new
  def new
    @timex = Timex.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Timex/{1}/edit
  def edit
    @timex = Timex.find(@params['id'])
    if @timex
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Timex/create
  def create
    @timex = Timex.create(@params['timex'])
    redirect :action => :index
  end

  # POST /Timex/{1}/update
  def update
    @timex = Timex.find(@params['id'])
    @timex.update_attributes(@params['timex']) if @timex
    redirect :action => :index
  end

  # POST /Timex/{1}/delete
  def delete
    @timex = Timex.find(@params['id'])
    @timex.destroy if @timex
    redirect :action => :index  
  end
end
