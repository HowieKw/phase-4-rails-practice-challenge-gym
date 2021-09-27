class GymsController < ApplicationController

    before_action :find_gym, only: [:show, :destroy]
    
    def show
        if @gym
            render json: @gym, status: :ok
        else
            render json: { "error": "Gym not found"}, status: :not_found
        end
    end

    def destroy
        if @gym
            @gym.destroy
            render json: @gym, status: :ok
        else
            render json: { "error": "Gym not found"}, status: :not_found
        end
    end

    private

    def find_gym
        @gym = Gym.find_by(id: params[:id])
    end
end
