defmodule TextClient.Runtime.RemoteHangman do
  @remote_server :"hangman@DESKTOP-M3RIB7C"

  def connect() do
    :rpc.call(@remote_server, Hangman, :new_game, [])
  end
end
