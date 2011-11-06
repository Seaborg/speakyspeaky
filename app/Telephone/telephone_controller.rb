require 'rho/rhocontroller'
require 'helpers/browser_helper'

class TelephoneController < Rho::RhoController
  include BrowserHelper

  # GET /Telephone
  def index
    @telephones = Telephone.find(:all)
    render :back => '/app'
  end

  # GET /Telephone/{1}
  def show
    @telephone = Telephone.find(@params['id'])
    if @telephone
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Telephone/new
  def new
    @telephone = Telephone.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Telephone/{1}/edit
  def edit
    @telephone = Telephone.find(@params['id'])
    if @telephone
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Telephone/create
  def create
    @telephone = Telephone.create(@params['telephone'])
    redirect :action => :index
  end

  # POST /Telephone/{1}/update
  def update
    @telephone = Telephone.find(@params['id'])
    @telephone.update_attributes(@params['telephone']) if @telephone
    redirect :action => :index
  end

  # POST /Telephone/{1}/delete
  def delete
    @telephone = Telephone.find(@params['id'])
    @telephone.destroy if @telephone
    redirect :action => :index  
  end
end
