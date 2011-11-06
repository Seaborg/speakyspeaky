require 'rho/rhocontroller'
require 'helpers/browser_helper'

class MoneyController < Rho::RhoController
  include BrowserHelper

  # GET /Money
  def index
    @money = Money.find(:all)
    render :back => '/app'
  end

  # GET /Money/{1}
  def show
    @money = Money.find(@params['id'])
    if @money
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Money/new
  def new
    @money = Money.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Money/{1}/edit
  def edit
    @money = Money.find(@params['id'])
    if @money
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Money/create
  def create
    @money = Money.create(@params['money'])
    redirect :action => :index
  end

  # POST /Money/{1}/update
  def update
    @money = Money.find(@params['id'])
    @money.update_attributes(@params['money']) if @money
    redirect :action => :index
  end

  # POST /Money/{1}/delete
  def delete
    @money = Money.find(@params['id'])
    @money.destroy if @money
    redirect :action => :index  
  end
end
