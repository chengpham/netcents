class Api::V1::BitcoinsController < Api::ApplicationController
    def index
        bitcoins = Bitcoin.order(created_at: :DESC)
        if bitcoins
            render json: bitcoins
        else
            render json: {message: "Nothing to show"}
        end
    end

end
