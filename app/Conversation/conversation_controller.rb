require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ConversationController < Rho::RhoController
  include BrowserHelper

  # GET /Conversation
  def index
    @conversations = Conversation.find(:all)
    render :back => '/app'
  end

  # GET /Conversation/{1}
  def show
    @conversation = Conversation.find(@params['id'])
    if @conversation
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Conversation/new
  def new
    @conversation = Conversation.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Conversation/{1}/edit
  def edit
    @conversation = Conversation.find(@params['id'])
    if @conversation
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Conversation/create
  def create
    @conversation = Conversation.create(@params['conversation'])
    redirect :action => :index
  end

  # POST /Conversation/{1}/update
  def update
    @conversation = Conversation.find(@params['id'])
    @conversation.update_attributes(@params['conversation']) if @conversation
    redirect :action => :index
  end

  # POST /Conversation/{1}/delete
  def delete
    @conversation = Conversation.find(@params['id'])
    @conversation.destroy if @conversation
    redirect :action => :index  
  end
end
