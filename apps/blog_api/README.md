# BlogAPI

A GraphQL API for Blog, based on [Absinthe](http://absinthe-graphql.org).

`BlogWeb.Router` mounts the API schema for HTTP clients.

## Rules

- BlogAPI is a _client_ of Blog. Only call Blog's public interface.
- Do not use `absinthe_ecto`. Instead, load associations using `BlogAPI.Batch.batch_on/2`.