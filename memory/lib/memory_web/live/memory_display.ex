defmodule MemoryWeb.Live.MemoryDisplay do
  use MemoryWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, schedule_tick_and_update_assign(socket)}
  end

  def handle_info(:tick, socket) do
    {:noreply, schedule_tick_and_update_assign(socket)}
  end

  def schedule_tick_and_update_assign(socket) do
    Process.send_after(self(), :tick, 1000)

    socket
    |> assign(:memory, :erlang.memory())
    |> assign(:current_hour, DateTime.utc_now())
  end

  def render(assigns) do
    ~L"""
    <h1>LiveView</h1>

    <h2>Memory</h2>

    <table>
      <%= for { name, value } <- assigns.memory do %>
      <tr>
        <th><%= name %></th>
        <td><%= value %></td>
      </tr>
      <% end %>
    </table>

    <h2>Current Hour</h2>

    <p><%= assigns.current_hour %></p>
    """
  end
end
