class RequestsController < ApplicationController
  def index
    @requests = Request.joins("join customers on requests.customer_id = customers.id order by customers.lname, customers.fname, requests.req_date").all

    render("request_templates/index.html.erb")
  end

  def show
    @request = Request.find(params.fetch("id_to_display"))

    render("request_templates/show.html.erb")
  end

  def new_form
    @request = Request.new

    render("request_templates/new_form.html.erb")
  end

  def create_row
    @request = Request.new

    @request.user_id = params.fetch("user_id")
    @request.rtc_req_id = params.fetch("rtc_req_id")

    if @request.valid?
      @request.save

      redirect_back(:fallback_location => "/requests", :notice => "Request created successfully.")
    else
      render("request_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @request = Request.find(params.fetch("prefill_with_id"))

    render("request_templates/edit_form.html.erb")
  end

  def update_row
    @request = Request.find(params.fetch("id_to_modify"))

    @request.user_id = params.fetch("user_id")
    @request.rtc_req_id = params.fetch("rtc_req_id")

    if @request.valid?
      @request.save

      redirect_to("/requests/#{@request.id}", :notice => "Request updated successfully.")
    else
      render("request_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @request = Request.find(params.fetch("id_to_remove"))

    @request.destroy

    redirect_to("/requests", :notice => "Request deleted successfully.")
  end
end
