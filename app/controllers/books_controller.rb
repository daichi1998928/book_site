class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all

    @book = Book.new
    @user = current_user

  end

  def show
    @book_show = Book.find(params[:id])

    @user = current_user
    @book = Book.new
    @post_comment = PostComment.new
  end

  def create

    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to book_path(book)
    else
      redirect_to user_path(current_user)
    end
    @book = book

  end

  def edit
     @book = Book.find(params[:id])

   if @book.user.id != current_user.id
      redirect_to book_path(@book)
    end
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      redirect_to book_path(book)
    else
       redirect_to edit_book_path(book)
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path

  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end



end
