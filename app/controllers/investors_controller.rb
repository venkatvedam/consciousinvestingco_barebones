class InvestorsController < ApplicationController
  def index
    @investors = Investor.all
  end

  def import
    Investor.import(params[:file])
    redirect_to investors_path, notice: "Investors imported."
  end

  def calculate
    portfolio = params[:investor_ids]

    investments = Investor.find(portfolio)

    e_scores = []
    s_scores = []
    g_scores = []
    impact_score = []
    $companies = []

    investments.each do |id|
      e_scores << id["e"]
      s_scores << id["s"]
      g_scores << id["g"]
      impact_score << id["total_esg"]
      $companies << id["description"]
    end

    $e_average = (e_scores.inject(0.0) {|sum, score| sum + score}/e_scores.size).round(2)
    $s_average = (s_scores.inject(0.0) {|sum, score| sum + score}/s_scores.size).round(2)
    $g_average = (g_scores.inject(0.0) {|sum, score| sum + score}/g_scores.size).round(2)
    $total_impact = (impact_score.inject(0.0) {|sum, score| sum + score}/impact_score.size).round(2)

    redirect_to investors_path
  end
end
