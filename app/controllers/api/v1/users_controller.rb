module Api
  module V1
    class UsersController < Api::V1::BaseController

      # GET /api/v1/users
      def index
        render json: User.all
      end

      # GET /api/v1/users/:id
      def show
        render json: User.find(params[:id])
      end
    end
  end
end
