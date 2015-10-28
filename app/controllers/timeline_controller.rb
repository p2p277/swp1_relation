class TimelineController < ApplicationController
    before_action :authenticate_user!, except: :index
    
    def index
        @blogs = Blog.all.reverse
    end
    
    def write
        Blog.create(user_id: current_user.id, content: params[:naeyong])
        redirect_to :root
    end
    
    def comment
        Comment.create(user_id: current_user.id, blog_id: params[:blog_id], msg: params[:comment])
        redirect_to :root
    end
    
    def destroy
        pp = Blog.find(params[:id])
        pp.destroy
        redirect_to :root
    end
    
    def destroy2
        pp = Comment.find(params[:id])
        pp.destroy
        redirect_to :root
    end
    
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def edit2
        @comment = Comment.find(params[:id])
    end
   
    def update
        pp = Blog.find(params[:id])
        pp.content = params[:naeyong]
        pp.save
        redirect_to :root
    end
    
    def update2
        pp = Comment.find(params[:id])
        pp.msg = params[:comment]
        pp.save
        redirect_to :root
    end
    
    def view
        @blogs = Blog.where(user_id: current_user.id).reverse
    end
    
    def other
        @ppp = User.all
    end
    
    def yourblog
       @pppp = Blog.where(user_id: params[:id]).reverse
    end
end
