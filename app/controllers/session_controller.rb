class SessionController < ApplicationController

     # skip_before_action :verify_authenticity_token 
    # ^ look up how to make valid CSRF token


    def login
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            # session.delete(:current_user)
            
            # session[:current_user] ||= user.id
            session[:current_user] = user.id
            
            render json: user, status: :ok            
        else
            render json: {results: 'wrong password lmfaoo'}, status: :ok

        end
    end

    #check if session exists
    def is_logged_in

        # if session
          
        #     user = User.find(session[:current_user])
        #     render json: user, status: :ok
        # else
            
        #     render json: {status: "no one logged in"}
        # end
        
       session[:test] ||= 1
       render json: {hi: session[:test]}
    end
    
    
    def logout
        session[:logged_in] = nil
        render json: "logged out", status: :ok
    end

    private

    def route_params
        params.permit(:id, :username, :password)
    end
    
end
