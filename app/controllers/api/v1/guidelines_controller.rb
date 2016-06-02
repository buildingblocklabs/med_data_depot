module API
  module V1
    class GuidelinesController < API::V1::APIController

      def index
        guidelines = Guideline.all

        render json: guidelines, each_serializer: GuidelineSerializer
      end

      def show
        guideline = Guideline.find_by_id(params[:id])

        render json: guideline, each_serializer: GuidelineSerializer
      end

    end
  end
end