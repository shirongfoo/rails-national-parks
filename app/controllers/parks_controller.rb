class ParksController < ApplicationController
  before_action :set_park, only: [:show, :edit, :update, :destroy]
  before_action :upload, only: [:create, :update]

 def index
   @parks = Park.all
 end

 def show
 end

 def edit
 end

 def new
   @park = Park.new
 end

 def create
   @park = Park.new(park_params)

  if @park.save
    redirect_to @park, notice: 'Park was successfully created.'
  else
    render :new
  end
 end

 def update

   if @park.update(park_params)
       redirect_to @park, notice: 'Park was successfully updated.'
     else
       render :edit
    end
 end

 def destroy
   @park.destroy
   redirect_to parks_url, notice: 'Park was successfully destroyed.'
 end

 private

 def set_park
   @park = Park.find(params[:id])
 end

 def park_params
   params.require(:park).permit(:name, :description, :picture)
 end

 def upload
   if params[:park][:picture] != nil
   uploaded_file = params[:park][:picture].path
   cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
   params[:park][:picture] = cloudnary_file['public_id']
 end
 end
end
