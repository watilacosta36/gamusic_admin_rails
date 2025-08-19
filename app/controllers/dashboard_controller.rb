class DashboardController < ApplicationController
  def index
    @stats = {
      total_challenges: Challenge.count,
      total_by_category: Challenge.group(:category).count,
      total_by_difficulty: Challenge.group(:difficulty).count,
      recent_challenges: Challenge.recent.limit(5)
    }
    
    @recent_challenges = Challenge.includes(:user).recent.limit(10)
  end
end