class UsersController < ApplicationController
    def create
        user = User.create!(username: params[:username], password: params[:password])
        Profile.create!(display_name: params[:display_name], bio: "Your Bio Here", user_id: user.id ,profile_pic: 'https://twirpz.files.wordpress.com/2015/06/twitter-avi-gender-balanced-figure.png?w=640')
        session[:current_user] = user.id
        render json: user, status: :created
    end

    def show
        render json: User.find(params[:id]), status: :ok
    end
    
    def get_user_tweets
        user = User.find(session[:current_user])
        # user = User.find(2)
       
        render json: {user: user, tweets: user.user_tweets, profile: user.profile}
    end

    private

    def route_params
        params.permit(:id, :username, :password, :display_name)
    end
end
