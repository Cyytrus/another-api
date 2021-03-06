defmodule Backend.CategoriesTest do
  use Backend.DataCase
  alias Backend.Categories
  alias Backend.Categories.Category

  test "give a call to list categories return all" do
    assert Categories.all() == []
  end

  test "give a category name that already exist should throw an error" do
    payload = %{
      name: "Sport",
      description: "lorem"
    }

    assert {:ok, _} = Categories.create(payload)

    assert {:error, changeset} = Categories.create(payload)

    assert "has already been taken" in errors_on(changeset).name
    assert %{name: ["has already been taken"]} = errors_on(changeset)
  end

  test "give infos about categories should create one category" do
    payload = %{
      name: "Sport",
      description: "lorem"
    }

    assert {:ok, %Category{} = category} = Categories.create(payload)
    assert category.name == String.upcase(payload.name)
    assert category.description == payload.description
  end
end
