class ReviewsController < ApplicationController
    before_action :set_photo, only: [:new, :create]

  def index
    @reviews = photo.reviews
  end

  def new
    #creates a review for the given photo
    @review = @photo.reviews.new
    @review.user = current_user
  end

  def create
    @review = @photo.reviews.new(review_params)
    #for the new review sets the user to be current_user
    @review.user = current_user
    if @review.save
      flash[:success] = "Review posted!"
      redirect_to photo_path(@photo.id)
    else 
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:photo_id])
    @review = photo.reviews.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @review = Review.find(params[:id])
    @review.destroy 
    redirect_to photo_path(@photo.id)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

end
