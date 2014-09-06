class RankingController < ApplicationController

  def index
    # userがウケているテストのみ表示
    @categories = current_user.took_tests_categories
  end

  def show
    @ranking = Redis.new.zrevrange("ranking-#{params[:category_id]}", 0, -1, :with_scores => true)
  end
end
