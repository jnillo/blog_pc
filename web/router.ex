defmodule Patricia.Router do
  use Patricia.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Patricia do
    pipe_through :browser # Use the default browser stack
    # Posts
    resources "/posts", PostController do
      post "/comment", PostController, :add_comment
    end
    get "/", PostController, :index
  end


  # Other scopes may use custom stacks.
  # scope "/api", Patricia do
  #   pipe_through :api
  # end
end
