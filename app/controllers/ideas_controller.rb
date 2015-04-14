class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @ideas = Idea.all
    @idea = Idea.new
    #@idea = Idea.find(params[:id])
    #@join = @idea.join_for(current_user) if user_signed_in?
    #@like = @idea.like_for(current_user) if user_signed_in?
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea Created Successfully!"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
    @join = @idea.join_for(current_user) if user_signed_in?
    @like = @idea.like_for(current_user) if user_signed_in?
  end
    

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :image)
  end

end
