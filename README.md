Helper repo to migrate RPC to null safety.

In order to run this, you need a dart version under `2.12` (we've tested with
`2.10`).

Obviously, after migration, it should run at `2.14`.

I've removed all the code from the functions, so nearly all of them will fail
when trying to invoke them, because they don't return the proper messages.

The two calls that work are:

- `http://localhost:8080/account/v1/notifications`
- `http://localhost:8080/account/v1/logout`

Run the server with:

```
dart bin/server.dart
```

Build the discovery api JSON with: `./build_discovery.sh`.
