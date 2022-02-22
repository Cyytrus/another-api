defmodule BackendWeb.CategoryControllerTest do
  use BackendWeb.ConnCase

  describe "categories" do
    test "list all categories", %{conn: conn} do
      conn = get(conn, Routes.category_path(conn, :index))
      assert json_response(conn, 200) == []
    end

    test "should create a category", %{conn: conn} do
      category = %{name: "Sport", description: "rogerio777"}
      conn = post(conn, Routes.category_path(conn, :create, category: category))
      assert %{"id" => id} = json_response(conn, 201)

      conn = get(conn, Routes.category_path(conn, :show, id))

      assert %{"id" => id, "description" => "rogerio777", "name" => "SPORT"} =
               json_response(conn, 200)
    end
  end
end
