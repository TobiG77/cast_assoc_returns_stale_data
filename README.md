# CastAssocReturnsStaleData

* a very simple testcase verifying observed behavior of Ecto returning stale data, when returning responses on updating associated data

# To reproduce

```
MIX_ENV=test mix ecto.create
MIX_ENV=test mix ecto.migrate
mix test
```
