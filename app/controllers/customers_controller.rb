class CustomersController < ApplicationController
  def index
    @customers = Customer.all.order(:lname,:fname)

    render("customer_templates/index.html.erb")
  end

  def show
    @customer = Customer.find(params.fetch("id_to_display"))

    render("customer_templates/show.html.erb")
  end

  def new_form
    @customer = Customer.new

    render("customer_templates/new_form.html.erb")
  end

  def create_row
    @customer = Customer.new

    @customer.fname = params.fetch("fname")
    @customer.lname = params.fetch("lname")
    @customer.username = params.fetch("username")
    @customer.email = params.fetch("email")

    if @customer.valid?
      @customer.save

      redirect_back(:fallback_location => "/customers", :notice => "Customer created successfully.")
    else
      render("customer_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @customer = Customer.find(params.fetch("prefill_with_id"))

    render("customer_templates/edit_form.html.erb")
  end

  def update_row
    @customer = Customer.find(params.fetch("id_to_modify"))

    @customer.fname = params.fetch("fname")
    @customer.lname = params.fetch("lname")
    @customer.username = params.fetch("username")
    @customer.email = params.fetch("email")
 
    if @customer.valid?
      @customer.save

      redirect_to("/customers/#{@customer.id}", :notice => "Customer updated successfully.")
    else
      render("customer_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @customer = Customer.find(params.fetch("id_to_remove"))

    @customer.destroy

    redirect_to("/customers", :notice => "Customer deleted successfully.")
  end
end
