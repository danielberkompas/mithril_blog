# Blog

The Elixir backend for Blog, based on 
[Blog](https://github.com/infinitered/blog).

## Scripts

<dl>
  <dt>bin/setup</dt>
  <dd>
    Bash script that sets up the project, its dependencies, seeds, and runs 
    <code>bin/test</code> to verify everything is working. You should run this 
    script on the CI server.
  </dd>
  <dt>bin/test</dt>
  <dd>
    Bash script which runs all the tests for the project. For example: credo,
    dialyzer, <code>compile --warnings-as-errors</code>, run tests.
  </dd>
  <dt>bin/update</dt>
  <dd>
    Bash script which <code>git pull</code>s, updates dependencies, runs 
    migrations, etc. It makes it easy for a mobile developer to pull down and 
    update everything.
  </dd>
  <dt>bin/reset</dt>
  <dd>
    Bash script which resets everything and reruns <code>bin/setup</code> 
    again.
  </dd>
  <dt>mix docs</dt>
  <dd>
    Generates ExDoc documentation for the project.
  </dd>
</dl>

## Architecture

Blog uses the Blog code organization conventions.

- `apps/blog` contains the business logic for the application.
  See its README and docs for details on its public API.

TODO: describe other apps
