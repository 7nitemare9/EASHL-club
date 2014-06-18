# Posts Controller
class PostsController < ApplicationController
  require 'auth_helper'
  include AuthHelper
  before_filter :is_admin, except: [:index, :show]

  def index
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
    redirect_to root_path if @post.update_attributes(params[:post])
  end

  def show
    @post = Post.find(params[:id])
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
