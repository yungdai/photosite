class PhotosController < ApplicationController
  def index

  end

  def show

  end
  def edit

  end
  def update

  end
  def new

  end
  def create

  end
  private
  def photo_params
    params.require(:photo).permit(:title, :comment,:user_id, :picture)
  end
end
