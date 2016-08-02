class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @entry = current_user.entries.build
      @feed_items = current_user.feeds.paginate page: params[:page]
    else
      @feed_items = Entry.all.paginate page: params[:page]
    end
    @comment = Comment.new
  end
end
