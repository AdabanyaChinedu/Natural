defmodule Mango.Catalog.Recipe do
  use Ecto.Schema

  schema "recipe" do
    field :name, :string
    field :title, :string
    field :cooking, :integer
    field :preparation, :integer
    field :ready, :integer
    field :ingredient, {:array, :string}
    field :calorie, :integer
    field :serving, :integer
    field :direction, :string
    field :image_path, :string

    timestamps()

    def data_directory do
      Application.get_env(:mango, :json_path)
    end

    def local_path(filename) do
      [File.cwd!, data_directory(), "#{filename}"]
      |> Path.join
    end

    def app_path(filename) do
      [data_directory(), "#{filename}"]
      |> Path.join
    end
  end

end
