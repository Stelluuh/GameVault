class FallbackController < ActionController::Base
    def index
      render file: 'public/index.html'
    end
    #This action has just one job: to render the HTML file for our React application! Note that the FallbackController must inherit from ActionController::Base in order to render HTML.
  end
