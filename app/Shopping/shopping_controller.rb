require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ShoppingController < Rho::RhoController
  include BrowserHelper

  # GET /Shopping
  def index
    @shoppings = Shopping.find(:all)
    render :back => '/app'
  end

  # GET /Shopping/{1}
  def show
    @shopping = Shopping.find(@params['id'])
    if @shopping
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Shopping/new
  def new
    @shopping = Shopping.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Shopping/{1}/edit
  def edit
    @shopping = Shopping.find(@params['id'])
    if @shopping
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Shopping/create
  def create
    @shopping = Shopping.create(@params['shopping'])
    redirect :action => :index
  end

  # POST /Shopping/{1}/update
  def update
    @shopping = Shopping.find(@params['id'])
    @shopping.update_attributes(@params['shopping']) if @shopping
    redirect :action => :index
  end

  # POST /Shopping/{1}/delete
  def delete
    @shopping = Shopping.find(@params['id'])
    @shopping.destroy if @shopping
    redirect :action => :index  
  end
end
