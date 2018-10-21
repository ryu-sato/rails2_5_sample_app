class ComparisonUnitsController < ApplicationController
  # GET /comparison_units/1
  # GET /comparison_units/1.json
  def show
    @comparison_unit = ComparisonUnit.find(params[:id])
  end
end
