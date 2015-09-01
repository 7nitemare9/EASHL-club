# Posts Controller
class PostsController < ApplicationController
  require 'auth_helper'
  include AuthHelper
  before_filter :is_admin, except: [:index, :show]


  def index
   #if params[:id]
   #   @posts = Post.news.rotate(params[:id].to_i)
   #   render layout: false
   # end
   # @posts = Post.news
    @posts = Post.news
    respond_to do |format|
      format.html
      format.json {render :json => @posts}
    end
  end

  def data
    @posts.news
    respond_to do |format|
      format.json {render :json => @posts}
    end
  end

  def archive
    @posts = Post.news
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root_path
  end

  def update
    @post = Post.find(params[:id])
    redirect_to root_path if @post.update_attributes(post_params)
  end

  def show
    respond_to do |format|
      format.html {render :html => @post = Post.find(params[:id])}
      format.json {render :json => Post.find(params[:id]).comments}
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to root_path if @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
