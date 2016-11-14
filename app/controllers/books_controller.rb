class BooksController < ApplicationController
  def index
    books = Book.all
    render json: {status: 200, books: books}
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: {status: 200, book: book}
    else
      render json: {status: 422, errors: list.errors}
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    render json: {status: 204}
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      render json: {status: 200, book: book}
    else
      render json: {status: 204, errors: book.errors}
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :read)
  end
end
