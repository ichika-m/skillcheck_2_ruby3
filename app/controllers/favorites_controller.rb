class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = Favorite.new(book_id: book.id, user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = Favorite.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to request.referer
  end
end
