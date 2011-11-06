require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PubController < Rho::RhoController
  include BrowserHelper

  # GET /Pub
  def index
    @pubs = Pub.find(:all)
    render :back => '/app'
  end

  # GET /Pub/{1}
  def show
    @pub = Pub.find(@params['id'])
    if @pub
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Pub/new
  def new
    @pub = Pub.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Pub/{1}/edit
  def edit
    @pub = Pub.find(@params['id'])
    if @pub
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Pub/create
  def create
    @pub = Pub.create(@params['pub'])
    redirect :action => :index
  end

  # POST /Pub/{1}/update
  def update
    @pub = Pub.find(@params['id'])
    @pub.update_attributes(@params['pub']) if @pub
    redirect :action => :index
  end

  # POST /Pub/{1}/delete
  def delete
    @pub = Pub.find(@params['id'])
    @pub.destroy if @pub
    redirect :action => :index  
  end
end
