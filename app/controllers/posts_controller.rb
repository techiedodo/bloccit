class PostsController < ApplicationController
  #def index
  #  @posts = Post.all
  #  authorize @posts
  #end

   def show
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     @comments = @post.comments
     @comment = @post.comments.build
     authorize @post #will this cause issue?
   end

   def new
     @topic = Topic.find(params[:topic_id])
     @post = Post.new
     authorize @post
     authorize @comment
   end

   def edit
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
   end

   def create
     @topic = Topic.find(params[:topic_id])
     @post = Post.new(post_params)
     @post.user = current_user
     @post.topic = @topic
     authorize @post
     authorize @comment
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end

   def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post

     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end
 end

 private

 def post_params
   params.require(:post).permit(:title, :body)
 end
