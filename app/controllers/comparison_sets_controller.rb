class ComparisonSetsController < ApplicationController
  # GET /comparison_sets/1
  # GET /comparison_sets/1.json
  def show
    @comparison_set = ComparisonSet.find(params[:id])
  end
end
