class CodesController < ApplicationController
  require 'auth_helper'
  include AuthHelper
  before_filter :is_admin, except: [:index, :show]

  def index
    @codes = Code.order('id DESC').page(params[:page]).per(1)
  end

  def new
  end

  def create
    @code = Code.new(media_params)
    @code.save
    redirect_to root_path
  end

  def update
    @code = Code.find(params[:id])
    redirect_to root_path if @code.update_attributes(media_params)
  end

  def show
    @code = Code.find(params[:id])
  end

  def edit
    @code = Code.find(params[:id])
  end

  def destroy
    @code = Code.find(params[:id])
    redirect_to root_path if @code.destroy
  end

  private

  def media_params
    params.require(:code).permit(:title, :text)
  end
end
