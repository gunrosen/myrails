class AuthorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
	def show
  end

  # POST /authors.json
	def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        # format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render json: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

	private
		def author_params
			params.require(:author).permit(:name, :gender)
		end
end
