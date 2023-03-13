class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def new
        @post = current_user.posts.build
    end
    def show
        @post = Post.find(params[:id])
    end
    def create
        @post = current_user.posts.create(post_params)
        if @post.save
            redirect_to root_path
        else
            flash[:notice] = @post.errors.full_message
            redirect_to new_post_path(@post)
        end
    end
    def edit
        @post = Post.find(params[:id])
    end
    def update
        @post = Post.find(params[:id])
        # debugger
        respond_to do |format|
            if @post.update(post_params)
              format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
              format.json { render :show, status: :ok, location: @post }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end      
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        respond_to do |format|
            format.html { redirect_to posts_url, notice: "Post was successfully deleted." }
            format.json { head :no_content }
        end
    end

    private
    def post_params
        params.require(:post).permit(:description, images:[])
    end
end
