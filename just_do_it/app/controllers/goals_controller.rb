class GoalsController < ApplicationController 
  
  def index
    @goals = Goal.all
    render :mew
  end
  
  def new
    @goal = Goal.new
    
  end 
  
  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      render :new
    end
  end 
  
  def show 
    @goal = Goal.find(params[:id])
  
  end 
  
  def edit 
    @goal = Goal.find(params[:id])
    
  end 
  
  def update 
    goal = Goal.find(params[:id])
    if goal.update_attributes(goal_params)
      redirect_to goal_url(goal)
    else
      render :edit
    end
  end 
  
  def destroy 
    @goal = Goal.find(params[:id])
    @goal.destroy!
    render user_goals(current_user)
    
  end
  
  def goal_params
    params.require(:goal).permit(:title, :body, :user_id, :private)
  end 
  
end 