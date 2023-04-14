class BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def show
    render json: Book.find(params[:id])
  end 

  def create
    book=Book.new(title: params[:title],author: params[:author])

    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end


  def update
   render Book.find(params[:id]).update(
      title:params[:title],
      author:params[:author],
    )
  end

  def destroy
    Book.find(params[:id]).destroy!

    head :no_content
  end

  private
  def book_params
     params.require(:book).permit(:title, :author)
  end

end