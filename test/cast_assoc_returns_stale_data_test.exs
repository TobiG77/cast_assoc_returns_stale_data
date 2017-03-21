defmodule CastAssocReturnsStaleDataTest do
  use ExUnit.Case
  doctest CastAssocReturnsStaleData

  alias CastAssocReturnsStaleData.Repo
  alias CastAssocReturnsStaleData.Address
  alias CastAssocReturnsStaleData.LeftLocation
  alias CastAssocReturnsStaleData.Link

  describe "UpdateScenario" do
    setup [:seed_data]

    test "do something" do
      assert 1 +1 == 2
    end

    test "updating an address reference on a link, should return the new reference", %{ link: link, address_a: address_a, address_b: address_b } do
      params = %{ left_location: %{ address_id: address_a.id }}
      link_v1 = 
        link
        |> Repo.preload(:left_location)
        |> Link.changeset(params)
        |> Repo.update!
        |> preload

      assert link_v1.left_location.address.name == "CITY OFFICE"

      link_v2 = 
        link_v1
        |> Link.changeset(%{ left_location: %{ id: link_v1.left_location.id, address_id: address_b.id }})
        |> Repo.update!
        |> preload

      reload_v2 =
        Link
        |> Repo.get(link_v2.id)
        |> preload

      # WORKS AS INTENDED
      assert reload_v2.left_location.address.name == "BEACH OFFICE"

      # EXPECTED THIS TO WORK, TOO
      assert link_v2.left_location.address.name == "BEACH OFFICE"

    end
  end

  defp seed_data(_) do
    Repo.delete_all(Link)
    Repo.delete_all(Address)
    Repo.delete_all(LeftLocation)
    link = Link.changeset(%Link{}, %{ name: "MY LINK" }) |> Repo.insert!
    address_a = Address.changeset(%Address{}, %{ name: "CITY OFFICE" }) |> Repo.insert!
    address_b = Address.changeset(%Address{}, %{ name: "BEACH OFFICE" }) |> Repo.insert!
    [
      link: link,
      address_a: address_a,
      address_b: address_b
    ]
  end

  defp preload(q) do
    q
    |> Repo.preload(:left_location)
    |> Repo.preload([left_location: :address], force: true)
  end

end
