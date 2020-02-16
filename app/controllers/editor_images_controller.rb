class EditorImagesController < InheritedResources::Base
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :verify_authenticity_token, only: [:index]
  def index
    if params[:file].class == ActionDispatch::Http::UploadedFile
      @image = EditorImage.new(image: params[:file])
      respond_to do |format|
        if @image.save
          format.json { render json: { location: @image.image.url }.to_json, status: :ok }
        else
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end
