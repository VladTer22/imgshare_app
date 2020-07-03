class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    @picture.image.attach(params[:picture][:image])
    if @picture.save
      flash[:success] = 'Picture uploaded'
      redirect_to @picture
    else
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      flash[:success] = 'Picture updated'
      redirect_to @picture
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to action: :index
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :category_id, :image)
  end
end

