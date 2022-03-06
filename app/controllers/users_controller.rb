class UsersController < ApplicationController
    def create
        user = User.create!(route_params)
        render json: user, status: :created
    end

    private

    def route_params
        params.permit(:id, :username, :password)
    end
end
