defmodule PentoWeb.SimulatorLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, ms: 500)}
  end

  def handle_event("change_form", %{"title" => title}, socket) do
    {:noreply, assign(socket, title: title)}
  end

  def handle_event("change_form", %{"ms" => ms}, socket) do
    {:noreply, assign(socket, ms: ms)}
  end
end
