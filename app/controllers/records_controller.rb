class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def create
    @record = Record.new(records_params)

    if @record.save
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  private

  def records_params
    params.require(:record).permit(:title, :amount, :data)
  end
end
