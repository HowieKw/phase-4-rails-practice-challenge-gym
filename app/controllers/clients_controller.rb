class ClientsController < ApplicationController

    before_action :find_client, only: [:show]

    def show
        if @client
            render json: @client.to_json(except: [:created_at, :updated_at], include: [:memberships]), status: :ok
        else
            render json: { "error": "Client not found"}, status: :not_found
        end
    end

    private
    
    def find_client
        @client = Client.find_by(id: params[:id])
    end
end
