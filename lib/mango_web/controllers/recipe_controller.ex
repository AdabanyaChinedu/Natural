defmodule MangoWeb.RecipeController do
  use MangoWeb, :controller

  alias Mango.CRM
  alias Mango.Catalog.Recipe

  def index(conn, _params) do
    recipes = get_json("recipe_data.ex")
    IO.puts "$$$$$$$$$$$$$$$$$$$$$$$$$"
    IO.inspect recipes

    #total= Enum.count(recipes)

    # count =
    #   case Integer.mod(total, 2) do
    #     0 ->
    #       Integer.floor_div(total, 2)
    #     _ ->
    #       Integer.floor_div(total, 2) + 1
    #   end

    render(conn, "index.html")
  end


  def show(conn, %{"id" => id}) do
    {:ok, result} = get_json("recipe_data.json")

    recipe = Enum.find(result["recipes"], fn x -> x["id"] == id end)

    render(conn, "show.html", recipe: recipe)
  end

  def get_json(filename) do
    with {:ok, body} <- File.read(Recipe.local_path(filename)),
         {:ok, json} <- Poison.decode(body), do: {:ok, json}
  end
end
