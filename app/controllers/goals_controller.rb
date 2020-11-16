class GoalsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
    before_action :set_goal, only: [:show, :edit, :update, :destroy]
    layout 'goal_layout'

    def index
        @goals = Goal.all
    end

    def show
    end

    def new
        @goal = Goal.new
    end

    def edit
    end

    def create
      @goal = Goal.new(goal_params)
      if @goal.save
        flash.notice = "The goal record was created successfully."
        redirect_to @goal
      else
        flash.now.alert = @goal.errors.full_messages.to_sentence
        render :new  
      end
    end

    def update    
      if @goal.update(goal_params)
        flash.notice = "The goal record was updated successfully."
        redirect_to @goal
      else
        flash.now.alert = @goal.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      @goal.destroy
      respond_to do |format|
        format.html { redirect_to goals_url, notice: 'Goal event was successfully deleted.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      # byebug
      @goal = Goal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.require(:goal).permit(:lives_id, :create_goal, :start_date, :end_date, :achieved, :note_goal)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to goals_path
    end
end
