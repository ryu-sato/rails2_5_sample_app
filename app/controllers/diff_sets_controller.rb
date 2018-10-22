class DiffSetsController < ApplicationController
  # GET /diff_sets/1
  # GET /diff_sets/1.json
  def show
    @diff_set = DiffSet.find(params[:id])
  end
end
