class Api::V1::PostsController < Api::V1::ApplicationController
    def index
        @posts = Post.all
        render json:@posts, status: 200
    end
    def show
        @post = Post.find(params[:id])
        if @post
            render json: @post, status: 200
        else
            render json:{error: "post not found" }
        end
    end
    def create 
        @post = Post.new(description: params[:description], user_id:params[:user_id])
        # debugger
        # @post.images.attach([params[:images]])
        if @post.save
            render json: @post, status: 200
        else
            render json: { error: "Post not created"}
        end
    end
    def update
        @post = Post.find(params[:id])
        @post.update(description:params[:description], user_id:params[:user_id])
        render json: @post
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        render json: Post.all
    end
end
