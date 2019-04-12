class BookController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @book = Book.new(book_params)

        respond_to do |format|
          if @book.save
            # format.html { redirect_to @post, notice: 'Post was successfully created.' }
            format.json { render json: @book }
          else
            format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end

    private
    def book_params
        params.require(:book).permit(:title, :present)
    end
end