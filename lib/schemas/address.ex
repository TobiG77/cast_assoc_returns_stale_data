defmodule CastAssocReturnsStaleData.Address do

    use CastAssocReturnsStaleData.Web, :model
    
    @required_fields [ :name ]
    
    schema "addresses" do
        field :name, :string
        has_many :left_locations, CastAssocReturnsStaleData.LeftLocation
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, @required_fields)
        |> validate_required(@required_fields)
    end

end
