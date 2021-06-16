defmodule PentoWeb.WrongLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, score: 0, message: "Guess a number. ", time: DateTime.utc_now())}
  end

  def render(assigns) do
    ~L"""
      <h1>Your score: <%= @score %></h1>
      <h2>
        <%= @message %>
        It's <%= to_string @time %>
      </h2>
      <h2>
        <%= for n <- 1..10 do%>
          <a href="#" phx-click="guess" phx-value-number="<%= n %>"><%= n %></a>
        <% end %>
      </h2>
    """
  end

  def handle_event("guess", %{"number" => guess} = data, socket) do
    IO.inspect(data)
    message = "Your guess: #{guess}. Wrong. Guess again. "
    score = socket.assigns.score - 1
    time = DateTime.utc_now()

    {:noreply, assign(socket, score: score, message: message, time: time)}
  end
end
