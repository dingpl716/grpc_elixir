defmodule RpcElixir.AccountService.Server do
  use GRPC.Server, service: GrpcElixir.AccountService.Service

  alias GrpcElixir.GetBalanceRequest
  alias GrpcElixir.GetBalanceResponse

  @db %{
    "0x1234abcd" => %{6001 => 100, 6002 => 200, 6003 => 150}
  }

  @spec get_balance(GetBalanceRequest.t(), GRPC.Server.Stream.t()) :: GetBalanceResponse.t()
  def get_balance(request, stream) do
    IO.inspect(binding(), label: "@@@")

    balances = [
      GetBalanceResponse.BalanceValue.new(%{block_height: 6001, balance: 100}),
      GetBalanceResponse.BalanceValue.new(%{block_height: 6002, balance: 200})
    ]

    GetBalanceResponse.new(%{address: "0x1234abcd", balances: balances})
  end
end
