# GrpcElixir

A sample elixir grpc server.

## Generate the pb.ex files

```
protoc -I priv/proto --elixir_out=plugins=grpc:./lib/proto/ priv/proto/account.proto
```


## Start and call the server as follow:

```elixir
GRPC.Server.start(RpcElixir.AccountService.Server, 50051)
{:ok, channel} = GRPC.Stub.connect("localhost:50051")
request = GrpcElixir.GetBalanceRequest.new(%{address: "0x1111", block_heights: [1, 2, 3, 4]})
{:ok, reply} = channel |> GrpcElixir.AccountService.Stub.get_balance(request)
```
