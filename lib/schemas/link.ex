defmodule CastAssocReturnsStaleData.Link do

    use CastAssocReturnsStaleData.Web, :model
    
    @required_fields [ :name ]
    
    schema "links" do
        field :name, :string
        belongs_to :left_location, CastAssocReturnsStaleData.LeftLocation
    end

    def changeset(struct, params \\ %{}) do
        IO.puts("LINK PARAMS:")
        IO.inspect params
        struct
        |> cast(params, @required_fields)
        |> validate_required(@required_fields)
        |> foreign_key_constraint(:left_location_id)
        |> cast_assoc(:left_location)
    end

end
