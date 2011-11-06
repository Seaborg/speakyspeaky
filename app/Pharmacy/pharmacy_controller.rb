require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PharmacyController < Rho::RhoController
  include BrowserHelper

  # GET /Pharmacy
  def index
    @pharmacies = Pharmacy.find(:all)
    render :back => '/app'
  end

  # GET /Pharmacy/{1}
  def show
    @pharmacy = Pharmacy.find(@params['id'])
    if @pharmacy
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Pharmacy/new
  def new
    @pharmacy = Pharmacy.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Pharmacy/{1}/edit
  def edit
    @pharmacy = Pharmacy.find(@params['id'])
    if @pharmacy
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Pharmacy/create
  def create
    @pharmacy = Pharmacy.create(@params['pharmacy'])
    redirect :action => :index
  end

  # POST /Pharmacy/{1}/update
  def update
    @pharmacy = Pharmacy.find(@params['id'])
    @pharmacy.update_attributes(@params['pharmacy']) if @pharmacy
    redirect :action => :index
  end

  # POST /Pharmacy/{1}/delete
  def delete
    @pharmacy = Pharmacy.find(@params['id'])
    @pharmacy.destroy if @pharmacy
    redirect :action => :index  
  end
end
