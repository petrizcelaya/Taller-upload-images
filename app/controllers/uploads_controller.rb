class UploadsController < ApplicationController
	def new
		@upload = Upload.new
	end
	def index
		#checar que solo mande las imagenes
		@upload = Upload.all
	end

	def create
		@upload = Upload.create(upload_params)
		#recordar guardar el id
		if @upload.save
			render json: {message: "success", fileId: @upload.id}, :status => 200
		else
  		#el error va a mostrarse separado por una coma 
  		render json: {message: @upload.errors.full_messages.join(',')}, :status => 400
  	end

  end

  def destroy
  	@upload = Upload.find(params[:id])
  	if @upload.destroy
  		redirect_to action: 'index'
  	else
  		render json: {message: @upload.errors.full_messages.join(',')}
  	end
  end

  private
  def upload_params
  	#solo va a permitir subir o guardar lo que le pasemos en esta linea 
  	params.require(:upload).permit(:image)
  end
end
