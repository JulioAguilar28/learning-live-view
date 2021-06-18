defmodule PentoWeb.SimulatorLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 500)

    {:ok, assign(socket, ms: 500, init_request: true, requests: [1])}
  end

  def handle_info(:update, socket) do
    Process.send_after(self(), :reset, socket.assigns.ms)

    {:noreply, assign(socket, init_request: true, requests: [1 | socket.assigns.requests])}
  end

  def handle_info(:reset, socket) do
    Process.send_after(self(), :update, socket.assigns.ms)

    {:noreply, assign(socket, init_request: false)}
  end

  def handle_event("change_form", %{"ms" => ms}, socket) do
    {:noreply, assign(socket, ms: String.to_integer(ms))}
  end
end
