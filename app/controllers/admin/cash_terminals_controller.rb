class Admin::CashTerminalsController < ApplicationController
  before_action :set_cash_terminal, only: [:show, :edit, :update, :destroy]

  # GET /cash_terminals
  # GET /cash_terminals.json
  def index
    @cash_terminals = CashTerminal.all
  end

  # GET /cash_terminals/1
  # GET /cash_terminals/1.json
  def show
  end

  # GET /cash_terminals/new
  def new
    @cash_terminal = CashTerminal.new
  end

  # GET /cash_terminals/1/edit
  def edit
  end

  # POST /cash_terminals
  # POST /cash_terminals.json
  def create
    @cash_terminal = CashTerminal.new(cash_terminal_params)

    respond_to do |format|
      if @cash_terminal.save
        format.html { redirect_to admin_cash_terminal_path(@cash_terminal), notice: 'Cash terminal was successfully created.' }
        format.json { render :show, status: :created, location: @cash_terminal }
      else
        format.html { render :new }
        format.json { render json: @cash_terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_terminals/1
  # PATCH/PUT /cash_terminals/1.json
  def update
    respond_to do |format|
      if @cash_terminal.update(cash_terminal_params)
        format.html { redirect_to admin_cash_terminal_path(@cash_terminal), notice: 'Cash terminal was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash_terminal }
      else
        format.html { render :edit }
        format.json { render json: @cash_terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_terminals/1
  # DELETE /cash_terminals/1.json
  def destroy
    @cash_terminal.destroy
    respond_to do |format|
      format.html { redirect_to admin_cash_terminals_path, notice: 'Cash terminal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_terminal
      @cash_terminal = CashTerminal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_terminal_params
      params.require(:cash_terminal).permit(:name, :address, :type_id, :workdays, :currencies,:lon,:lat)
    end
end
