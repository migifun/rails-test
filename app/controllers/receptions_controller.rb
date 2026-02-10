class ReceptionsController < ApplicationController
  before_action :require_admin, only: [ :index, :destroy ]

  def new
    @reception = Reception.new
  end

  def create
    @reception = Reception.new(reception_params)

    if @reception.save
      SlackNotifier.notify(@reception)
      redirect_to calling_reception_path(@reception)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def calling
    @reception = Reception.find(params[:id])
  end

  def index
    @receptions = Reception.order(created_at: :desc)
  end

  def destroy
    @reception = Reception.find(params[:id])
    @reception.destroy
    redirect_to receptions_path, notice: "受付データを削除しました"
  end

  private

  def reception_params
    params.require(:reception).permit(:name, :company, :purpose)
  end
end
