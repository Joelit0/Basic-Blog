require 'base64'

class ImagesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_article
  before_action :set_image, only: [:edit, :update, :destroy] 

  def new
    @image = @article.images.build
  end

  def create
    @image = @article.images.build(image_params)
    image = params[:image][:image]
    @image.image = Base64.encode64(image.read)

    if @image.save
      redirect_to @article
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    image = params[:image][:image]

    if @image.update(image: Base64.encode64(image.read))
      redirect_to @article
    else
      render action: "edit"
    end
  end

  def destroy
    @image.destroy

    redirect_to @article
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_image
    @image = @article.images.find(params[:id])
  end
end
