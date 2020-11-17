class BudgetsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
    before_action :set_budget, only: [:show, :edit, :update, :destroy]
    layout 'budget_layout'

    def index
        @budgets = Budget.all.includes(:lives)
    end

    def show
    end

    def new
        @budget = Budget.new
    end

    def edit
    end

    def create
      @budget = Budget.new(budget_params)
      if @budget.save
        flash.notice = "The budget record was created successfully."
        redirect_to @budget
      else
        flash.now.alert = @budget.errors.full_messages.to_sentence
        render :new  
      end
    end

    def update    
      if @budget.update(budget_params)
        flash.notice = "The budget record was updated successfully."
        redirect_to @budget
      else
        flash.now.alert = @budget.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      @budget.destroy
      respond_to do |format|
        format.html { redirect_to budgets_url, notice: 'Budget event was successfully deleted.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      # byebug
      @budget = Budget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_params
      params.require(:budget).permit(:life_id, :life_name, :expected_income, :expected_income_amount, :actual_income_amount, :actual_diff)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to budgets_path
    end
end
