class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def new
        @post = current_user.posts.build
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

    private
    def post_params
        params.require(:post).permit(:description, images:[])
    end
end
