class Api::V1::BitcoinsController < Api::ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user!, only:[:edit, :update, :destroy, :create]
    def index 
        # http://localhost:3000/api/v1/session
        # POST with {"email":"js@winterfell.gov", "password":"supersecret"} FIRST
        bitcoins = Bitcoin.all.order(created_at: :DESC)
        render json: bitcoins
    end


    private
    def authorize_user!
        redirect_to root_path, alert: "Not Authorized" unless can?(:crud, @bitcoin)
    end
end
