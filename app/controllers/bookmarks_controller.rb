class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  # def show
  #   @bookmark = Bookmark.find(params[:id])
  # end

  def create
    @bookmark = Bookmark.new(bookmark_params)
      new_list = @bookmark.list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new
      new_list
    end

  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy!
      redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :list_id, :comment )
  end
end
