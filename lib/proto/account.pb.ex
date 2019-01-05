defmodule GrpcElixir.GetBalanceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t(),
          block_time: Google.Protobuf.Timestamp.t(),
          block_heights: [non_neg_integer]
        }
  defstruct [:address, :block_time, :block_heights]

  field :address, 1, type: :string
  field :block_time, 2, type: Google.Protobuf.Timestamp
  field :block_heights, 3, repeated: true, type: :uint32, packed: true
end

defmodule GrpcElixir.GetBalanceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t(),
          balances: [GrpcElixir.GetBalanceResponse.BalanceValue.t()]
        }
  defstruct [:address, :balances]

  field :address, 1, type: :string
  field :balances, 2, repeated: true, type: GrpcElixir.GetBalanceResponse.BalanceValue
end

defmodule GrpcElixir.GetBalanceResponse.BalanceValue do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block_height: non_neg_integer,
          balance: non_neg_integer
        }
  defstruct [:block_height, :balance]

  field :block_height, 1, type: :uint32
  field :balance, 2, type: :uint64
end

defmodule GrpcElixir.AccountService.Service do
  @moduledoc false
  use GRPC.Service, name: "grpc_elixir.AccountService"

  rpc :GetBalance, GrpcElixir.GetBalanceRequest, GrpcElixir.GetBalanceResponse
end

defmodule GrpcElixir.AccountService.Stub do
  @moduledoc false
  use GRPC.Stub, service: GrpcElixir.AccountService.Service
end
