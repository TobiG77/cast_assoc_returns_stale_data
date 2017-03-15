defmodule CastAssocReturnsStaleData.LeftLocation do

    use CastAssocReturnsStaleData.Web, :model
    
    schema "left_locations" do
        belongs_to :address, CastAssocReturnsStaleData.Address
        has_one :link, CastAssocReturnsStaleData.Link
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:address_id])
        |> foreign_key_constraint(:address_id)
    end

end
