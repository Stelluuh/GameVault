class ApplicationController < ActionController::API
    include ActionController::Cookies

    def hello_world
        session[:count] = (session[:count] || 0) + 1
        # puts request.env["action_dispatch.cookies"]
        render json: { count: session[:count] }
    end

end
