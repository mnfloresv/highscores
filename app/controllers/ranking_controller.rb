class RankingController < ApplicationController
  def index
    # Use the service pattern to keep the controller clean of logic, see: app/services/ranking_service.rb
    @ranking = RankingService.new.call
  end
end
