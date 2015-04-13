class JoinsController < ApplicationController
  before_action :authenticate_user!

  def index
    @joined_ideas = current_user.joined_ideas
  end

  def create
    join = current_user.joins.new
    idea = Idea.find(params[:idea_id])
    join.idea = idea
    if idea.save
      redirect_to idea, notice: "Joined!"
    else
      redirect_to idea, alert: "Not joined"
    end
  end

  def destroy
    join = current_user.joins.find(params[:id])
    join.destroy
    redirect_to join.idea, notice: "Un-joined"
  end
end
