class BookCommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    book = Book.find(params[:book_id])
		comment = BookComment.new(book_comment_params)
		comment.book_id = book.id
		comment.user_id = current_user.id
		comment.save
  	redirect_to book_path(book)

  end

  def destroy
    BookComment.find_by(id: params[:id]).destroy
    redirect_to book_path(params[:book_id])
	end


	private
	
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end



end
