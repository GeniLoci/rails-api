class EntriesController < ApplicationController
  def index
   @entries = Entry.all
  end

  def show
   @entry = Entry.find(params[:id])
  end 

  def create
   @entry = Entry.new(permitted_params)

   @entity = Entity.new   
   @entity.entry = @entry
   @entity.file = decode_base64
   @entity.save
   
   @entry.save
  end

  def last_image
    send_file ActionController::Base.helpers.asset_path(Entry.last.entities[0].file.path), :type => 'image/jpeg', disposition: 'inline'
  end

  def prev_image
    send_file ActionController::Base.helpers.asset_path(Entry.all[-2].entities[0].file.path), :type => 'image/jpeg', disposition: 'inline'
  end 

  def third_image
    send_file ActionController::Base.helpers.asset_path(Entry.all[-3].entities[0].file.path), :type => 'image/jpeg', disposition: 'inline'
  end


  def permitted_params
    params.require(:entry).permit(:latitude, :longitude, :name)
  end

  protected 

  def decode_base64
    decoded_data = Base64.decode64(params[:file][:base64])
    data = StringIO.new(decoded_data)
    data.class_eval do
      attr_accessor :content_type, :original_filename
    end
    data.content_type = params[:file][:filetype]
    data.original_filename = params[:file][:filename]
    return data
  end

end
