class BooksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :check_auth, except: %i[index show]
  before_action :set_book, only: %i[edit show update destroy]
  before_action :set_authors_and_genres, only: %i[new edit create update]

  def index
    @books = Book.order(:title)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      flash[:errors] = @book.errors.full_messages
      render action: 'new'
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      flash.now[:errors] = @book.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def edit; end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def set_authors_and_genres
    @authors = Author.order(:last_name)
    @genres = Genre.order(:name)
  end

  def check_auth
    authorize Book
  end

  def book_params
    params.require(:book).permit(:title, :author_id, :cover, genre_ids: [])
  end
end
