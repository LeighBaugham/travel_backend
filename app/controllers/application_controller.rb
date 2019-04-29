class ApplicationController < ActionController::API
    def current_user
        
      token = request.headers['Authorization'].split(" ")[1]
      
      payload = JWT.decode(token, 's3cr3t')[0]
      
      user_id = payload['user_id']
      user_id && User.find_by(id: user_id)
    # rescue JWT::DecodeError
    #   nil
    end
  
    def authenticate!
      unless current_user
        render json: { errors: 'Not logged in' }, status: :unauthorized
      end
    end
  end