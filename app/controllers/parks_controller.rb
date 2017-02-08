class ParksController < ApplicationController

  before_action :set_park, only: [:show, :edit, :update, :destroy]
  before_action :set_all_rangers, only: [:new, :edit]

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
   upload
  if @park.save
    redirect_to @park, notice: 'Park was successfully created.'
  else
    render :new
  end
 end

 def update
   upload
   if @park.update(park_params)
      delete_old_file
       redirect_to @park, notice: 'Park was successfully updated.'
     else
       render :edit
    end
 end

 def destroy
   @park.rangers.clear
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
     if @park.valid?
       uploaded_file = params[:park][:picture].path
       cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
       @park.picture = cloudnary_file['public_id']
     end
     params[:park].delete :picture
   end
end

def set_all_rangers
  @rangers = Ranger.all
end


end
