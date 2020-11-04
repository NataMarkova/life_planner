class LivesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
    before_action :set_life, only: [:show, :edit, :update, :destroy]
    layout 'life_layout'

    def index
        @lives = Life.all
    end

    def show
    end

    def new
        @life = Life.new
    end

    def edit
    end

    def create
      # byebug
        @life = Life.new(life_params)
        if @life.save
          flash.notice = "The life event record was created successfully."
          redirect_to @life
        else
          flash.now.alert = @life.errors.full_messages.to_sentence
          render :new  
        end
    end

    def update    
        if @life.update(life_params)
          flash.notice = "The life record was updated successfully."
          redirect_to @life
        else
          flash.now.alert = @life.errors.full_messages.to_sentence
          render :edit
        end
    end

    def destroy
        @life.destroy
        respond_to do |format|
          format.html { redirect_to lives_url, notice: 'Life event was successfully deleted.' }
          format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_life
      # byebug
      @life = Life.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def life_params
      params.require(:life).permit(:life_category, :life_name, :life_activity)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to lives_path
    end
end
