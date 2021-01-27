class HomeController < ApplicationController
  def index
    @posts = Post.all
  
      
     
  end
  # def add_score
  #   user = User.find params[:id]
  #   REDIS.zincrby "posts", 1, user.id
  # end 
end
