class AssociationsController < ApplicationController
  def index
    #@associations = Association.all
    @associations = Association.joins("join requests on associations.request_id = requests.id join customers on requests.customer_id = customers.id join publications on associations.publication_id = publications.id order by customers.lname, customers.fname, requests.req_date").select("associations.*,customers.fname,customers.lname,requests.req_date,publications.pubmed_date")


    render("association_templates/index.html.erb")
  end

  def show
    @association = Association.joins("join requests on associations.request_id = requests.id join customers on requests.customer_id = customers.id join publications on associations.publication_id = publications.id").select("associations.*,customers.fname,customers.lname,requests.req_date,requests.req_title,publications.pubmed_title,publications.pubmed_narrative,publications.pubmed_date").find(params.fetch("id_to_display"))

    render("association_templates/show.html.erb")
  end

  def new_form
    @association = Association.new

    render("association_templates/new_form.html.erb")
  end

  def create_row
    @association = Association.new

    @association.request_id = params.fetch("request_id")
    @association.publication_id = params.fetch("publication_id")
    @association.similar_score = params.fetch("similar_score")

    if @association.valid?
      @association.save

      redirect_back(:fallback_location => "/associations", :notice => "Association created successfully.")
    else
      render("association_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @association = Association.find(params.fetch("prefill_with_id"))

    render("association_templates/edit_form.html.erb")
  end

  def update_row
    @association = Association.find(params.fetch("id_to_modify"))

    if params[:confirm].blank?
      @association.confirm = false
    else
      @association.confirm = true
    end

    if @association.valid?
      @association.save

      redirect_to("/associations", :notice => "Association updated successfully.")
    else
      render("association_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @association = Association.find(params.fetch("id_to_remove"))

    @association.destroy

    redirect_to("/associations", :notice => "Association deleted successfully.")
  end
end
