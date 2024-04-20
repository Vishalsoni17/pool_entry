class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy entry_out ]


  # GET /customers or /customers.json
    def index
      if params[:search]
        @customers = Customer.search(params[:search]).order("created_at DESC")
      else
        @customers = Customer.all.order('created_at ASC')
      end
    end


  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_url, notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_url, notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to history_customers_url, notice: "Customer was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def entry_out
    @customer.out_time = Time.now
    respond_to do |format|
      if @customer.update(out_time: Time.now + 5.hour + 30.minute) 
        format.html { redirect_to customers_url, notice: "Entry Out." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def history
    if params[:search]
      @customers = Customer.search(params[:search]).order("created_at DESC")
    else
      # @customers = Customer.all.order('created_at DESC')
     @customers = Customer.all.where.not(out_time: nil).order('out_time DESC')
    end
    # @customers = Customer.all.where.not(out_time: nil).order('out_time DESC')
  end

  def detailed_status
    
  end

  def delete_all_customers
    respond_to do |format|
      if Customer.delete_all
        format.html { redirect_to customers_url, notice: "Customers were successfully deleted." }
      else
        format.html { redirect_to customers_url, notice: "There is some issue please contact Vishal Soni" }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :address, :contact, :in_time, :out_time, :qty, :refrence, :out_at, :message)
    end
end
