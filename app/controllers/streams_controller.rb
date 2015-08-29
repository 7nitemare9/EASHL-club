class StreamsController < ApplicationController
  require 'auth_helper'
  include AuthHelper
  before_filter :is_admin, except: [:index]
  before_action :set_stream, only: [:show, :edit, :update, :destroy]

  # GET /streams
  def index
    respond_to do |format|
      format.html {render :html => @streams = Stream.all}
      format.json {render :json => Stream.streams}
    end
  end

  # GET /streams/1
  def show
  end

  # GET /streams/new
  def new
    @stream = Stream.new
  end

  # GET /streams/1/edit
  def edit
  end

  # POST /streams
  def create
    @stream = Stream.new(stream_params)

    if @stream.save
      redirect_to @stream, notice: 'Stream was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /streams/1
  def update
    if @stream.update(stream_params)
      redirect_to @stream, notice: 'Stream was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /streams/1
  def destroy
    @stream.destroy
    redirect_to streams_url, notice: 'Stream was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stream
      @stream = Stream.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stream_params
      params.require(:stream).permit(:name)
    end
end
