Rails.application.routes.draw do
  # Routes for the customer resource:
  # CREATE
  get("/customers/new", { :controller => "customers", :action => "new_form" })
  post("/create_customer", { :controller => "customers", :action => "create_row" })

  # READ
  get("/customers", { :controller => "customers", :action => "index" })
  get("/customers/:id_to_display", { :controller => "customers", :action => "show" })

  # UPDATE
  get("/customers/:prefill_with_id/edit", { :controller => "customers", :action => "edit_form" })
  post("/update_customer/:id_to_modify", { :controller => "customers", :action => "update_row" })

  # DELETE
  get("/delete_customer/:id_to_remove", { :controller => "customers", :action => "destroy_row" })
  
  
  # Routes for the Association resource:
  # CREATE
  get("/associations/new", { :controller => "associations", :action => "new_form" })
  post("/create_association", { :controller => "associations", :action => "create_row" })

  # READ
  get("/associations", { :controller => "associations", :action => "index" })
  get("/associations/:id_to_display", { :controller => "associations", :action => "show" })

  # UPDATE
  get("/associations/:prefill_with_id/edit", { :controller => "associations", :action => "edit_form" })
  post("/update_association/:id_to_modify", { :controller => "associations", :action => "update_row" })

  # DELETE
  get("/delete_association/:id_to_remove", { :controller => "associations", :action => "destroy_row" })



  # Routes for the Request resource:
  # CREATE
  get("/requests/new", { :controller => "requests", :action => "new_form" })
  post("/create_request", { :controller => "requests", :action => "create_row" })

  # READ
  get("/requests", { :controller => "requests", :action => "index" })
  get("/requests/:id_to_display", { :controller => "requests", :action => "show" })

  # UPDATE
  get("/requests/:prefill_with_id/edit", { :controller => "requests", :action => "edit_form" })
  post("/update_request/:id_to_modify", { :controller => "requests", :action => "update_row" })

  # DELETE
  get("/delete_request/:id_to_remove", { :controller => "requests", :action => "destroy_row" })



  # Routes for the Publication resource:
  # CREATE
  get("/publications/new", { :controller => "publications", :action => "new_form" })
  post("/create_publication", { :controller => "publications", :action => "create_row" })

  # READ
  get("/publications", { :controller => "publications", :action => "index" })
  get("/publications/:id_to_display", { :controller => "publications", :action => "show" })

  # UPDATE
  get("/publications/:prefill_with_id/edit", { :controller => "publications", :action => "edit_form" })
  post("/update_publication/:id_to_modify", { :controller => "publications", :action => "update_row" })

  # DELETE
  get("/delete_publication/:id_to_remove", { :controller => "publications", :action => "destroy_row" })



  root "customers#index"
  
  devise_for :users

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Routes for  User resource:
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })  
  
end
