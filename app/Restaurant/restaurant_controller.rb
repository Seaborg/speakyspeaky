require 'rho/rhocontroller'
require 'helpers/browser_helper'

class RestaurantController < Rho::RhoController
  include BrowserHelper

  # GET /Restaurant
  def index
    @restaurants = Restaurant.find(:all)
    render :back => '/app'
  end

  # GET /Restaurant/{1}
  def show
    @restaurant = Restaurant.find(@params['id'])
    if @restaurant
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Restaurant/new
  def new
    @restaurant = Restaurant.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Restaurant/{1}/edit
  def edit
    @restaurant = Restaurant.find(@params['id'])
    if @restaurant
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Restaurant/create
  def create
    @restaurant = Restaurant.create(@params['restaurant'])
    redirect :action => :index
  end

  # POST /Restaurant/{1}/update
  def update
    @restaurant = Restaurant.find(@params['id'])
    @restaurant.update_attributes(@params['restaurant']) if @restaurant
    redirect :action => :index
  end

  # POST /Restaurant/{1}/delete
  def delete
    @restaurant = Restaurant.find(@params['id'])
    @restaurant.destroy if @restaurant
    redirect :action => :index  
  end
end
