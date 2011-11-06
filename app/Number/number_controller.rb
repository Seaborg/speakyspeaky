require 'rho/rhocontroller'
require 'helpers/browser_helper'

class NumberController < Rho::RhoController
  include BrowserHelper

  # GET /Number
  def index
    @numbers = Number.find(:all)
    render :back => '/app'
  end

  # GET /Number/{1}
  def show
    @number = Number.find(@params['id'])
    if @number
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Number/new
  def new
    @number = Number.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Number/{1}/edit
  def edit
    @number = Number.find(@params['id'])
    if @number
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Number/create
  def create
    @number = Number.create(@params['number'])
    redirect :action => :index
  end

  # POST /Number/{1}/update
  def update
    @number = Number.find(@params['id'])
    @number.update_attributes(@params['number']) if @number
    redirect :action => :index
  end

  # POST /Number/{1}/delete
  def delete
    @number = Number.find(@params['id'])
    @number.destroy if @number
    redirect :action => :index  
  end
end
