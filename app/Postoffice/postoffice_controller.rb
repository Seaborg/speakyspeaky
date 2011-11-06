require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PostofficeController < Rho::RhoController
  include BrowserHelper

  # GET /Postoffice
  def index
    @postoffices = Postoffice.find(:all)
    render :back => '/app'
  end

  # GET /Postoffice/{1}
  def show
    @postoffice = Postoffice.find(@params['id'])
    if @postoffice
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Postoffice/new
  def new
    @postoffice = Postoffice.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Postoffice/{1}/edit
  def edit
    @postoffice = Postoffice.find(@params['id'])
    if @postoffice
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Postoffice/create
  def create
    @postoffice = Postoffice.create(@params['postoffice'])
    redirect :action => :index
  end

  # POST /Postoffice/{1}/update
  def update
    @postoffice = Postoffice.find(@params['id'])
    @postoffice.update_attributes(@params['postoffice']) if @postoffice
    redirect :action => :index
  end

  # POST /Postoffice/{1}/delete
  def delete
    @postoffice = Postoffice.find(@params['id'])
    @postoffice.destroy if @postoffice
    redirect :action => :index  
  end
end
