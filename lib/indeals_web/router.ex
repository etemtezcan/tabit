defmodule IndealsWeb.Router do
  use IndealsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :login_required do
    plug Guardian.Plug.EnsureAuthenticated, handler: IndealsWeb.Auth.AuthHandler
  end

  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # controllers_web/controllers
  scope "/", IndealsWeb do
    pipe_through [:browser, :browser_session]

    # PUBLIC PAGES
    get "/", PageController, :index
    get "/about", PageController, :about
    get "/contact", PageController, :contact
    post "/contact", PageController, :contact_post
    get "/terms", PageController, :terms
    get "/all", DealController, :all  
 

    # AUTH STUFF
    get "/login", Auth.LoginController, :new
    post "/login", Auth.LoginController, :create
    get "/logout", Auth.LoginController, :delete
    get "/register/:code", Auth.RegisterController, :verify
    get "/register", Auth.RegisterController, :new
    post "/register", Auth.RegisterController, :create
    get "/forgot", Auth.ForgotController, :new
    post "/forgot", Auth.ForgotController, :create
    get "/reset/:code", Auth.ResetController, :new
    post "/reset/:code", Auth.ResetController, :create

    scope "/" do
      pipe_through [:login_required]
      # USER SETTINGS
      get "/account", AccountController, :index
      put "/account", AccountController, :update
      post "/account", AccountController, :update
      get "/account/password", AccountController, :index_password
      put "/account/password", AccountController, :update_password
      post "/account/password", AccountController, :update_password
      # USER JOBS
      get "/jobs", JobsController, :index 
      get "/jobs/submit", JobsController, :new
      post "/jobs/submit", JobsController, :create
      get "/jobs/repost/:id", JobsController, :repost
      get "/jobs/update/:id", JobsController, :edit
      put "/jobs/update/:id", JobsController, :update
      post "/jobs/update/:id", JobsController, :update
      get "/jobs/destroy/:id", JobsController, :delete

      # USER DEALS
      get "/deals", DealController, :index 
      get "/src", DealController, :src
#      get "/all", DealController, :all  
      get "/deals/submit", DealController, :new
      post "/deals/submit", DealController, :create
      get "/deals/repost/:id", DealController, :repost
      get "/deals/update/:id", DealController, :edit
      put "/deals/update/:id", DealController, :update
      post "/deals/update/:id", DealController, :update
      get "/deals/destroy/:id", DealController, :delete
      resources "/urunler", UrunController
      resources "/tohumlar", TohumController
      resources "/gubreler", GubreController
      resources "/ekipmanlar", EkipmanController
      resources "/araziler", AraziController
    end

    get "/jobs/apply/:id", JobsApplyController, :new
    post "/jobs/apply/:id", JobsApplyController, :create
    
    get "/deals/:id", DealController, :show
    get "/jobs/:id", JobsController, :show
    get "/company/:id", AccountController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", IndealsWeb do
  #   pipe_through :api
  # end
end
