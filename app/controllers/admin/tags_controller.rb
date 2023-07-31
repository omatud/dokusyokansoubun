class Admin::TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to admin_tags_path

  end

  def index
    @tag=Tag.new
    @tags=Tag.all

  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
