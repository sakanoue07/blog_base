class PostsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_post, only: [ :edit, :update, :show]
    def index
        @post = Post.all
        
    end



    def new
        @post = Post.new
    end

    def show 
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            redirect_to post_path(@post), notice: '作成できました'
        else
            render :new
        end
    end

    def edit
        if @post.user != current_user
            redirect_to root_path, alert: 'あなたの投稿ではありません'
        end
    end
    def update
        if @post.update(post_params)
            redirect_to post_path(@post), notice: '更新できました'
        end
    end

    def destroy
        post = Post.find(params[:id])
        if post.destroy
            redirect_to root_path, notice: '削除できました'
        else
            redirect_to root_path, alert: '削除できませんでした'
        end
    end

    private
    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
