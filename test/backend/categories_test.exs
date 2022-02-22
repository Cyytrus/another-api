defmodule Backend.CategoriesTest do
  use Backend.DataCase
  alias Backend.Categories
  alias Backend.Categories.Category

  test "give a call to list categories return all" do
    assert Categories.all() == []
  end

  test "give infos about categories should create one category" do
    payload = %{
      name: "Sport",
      description: "lorem"
    }

    assert {:ok, %Category{} = category} = Categories.create(payload)
    assert category.name == payload.name
    assert category.description == payload.description
  end
end
