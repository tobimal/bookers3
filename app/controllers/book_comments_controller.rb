class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

 def create
 	book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
  	comment.book_id = book.id
  	comment.save
  	redirect_to book_path(book)
  end

  def update
  end

  def destroy
    book_comment = BookComment.find(params[:id])
    # comment = current_user.book_comments.find_by(book_id: params[:book_id], id: params[:id])
    book_comment.destroy
    redirect_to book_path(book_comment.book.id)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment, :user_id, :book_id)
  end

  def correct_user
    @book_comment = BookComment.find(params[:id])
    if current_user != @book_comment.user
      redirect_to books_path
    end
  end
end

