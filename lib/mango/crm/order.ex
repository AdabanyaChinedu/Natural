defmodule Mango.CRM.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mango.CRM.{Order, Customer} 

  schema "orders" do
     field :status, :string
     field :total, :decimal
     field :comments, :string
     field :line_items, {:array, :map}
     belongs_to :customer, Customer

    timestamps()
  end

  @doc false
  def changeset(%Order{} = order, attrs) do
    order
    |> cast(attrs, [:status, :total, :line_items, :comments])
    |> validate_required([:status, :total, :line_items])
  end
end
