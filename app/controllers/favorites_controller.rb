class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "Successfully Favorited!"
      redirect_to [post.topic, post]
    else
      flase[:error] = "Error favoriting this post."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Post unfavorited successfully."
       redirect_to [post.topic, post]
    else
      flash[:error] = "Error, please try again."
      redirect_to [post.topic, post]
    end
  end

end
