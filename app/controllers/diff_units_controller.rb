class DiffUnitsController < ApplicationController
  # GET /diff_units/1
  # GET /diff_units/1.json
  def show
    @diff_unit = DiffUnit.find(params[:id])
  end
end
