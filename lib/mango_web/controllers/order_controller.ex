defmodule MangoWeb.OrderController do
  use MangoWeb, :controller

  alias Mango.CRM

  def index(conn, _params) do
    customer = conn.assigns.current_customer
    orders = CRM.list_customer_orders(customer)
    render(conn, "index.html", orders: orders)
  end

 
  def show(conn, %{"id" => id}) do
    customer = conn.assigns.current_customer
    order = CRM.get_customer_order!(customer, id)
    render(conn, "show.html", order: order)
  end
end
