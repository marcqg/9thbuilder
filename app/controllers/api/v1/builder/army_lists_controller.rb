module Api
  module V1
    module Builder
      class ArmyListsController < ApiController
        respond_to :json

        before_action :authenticate_user!

        # GET /army_lists
        # GET /army_lists.xml
        def index

          @army_lists = ::Builder::ArmyList.where(user: current_user)
                            .order('value_points DESC')

          respond_to do |format|
            format.json
          end
        end
      end
    end
  end
end
