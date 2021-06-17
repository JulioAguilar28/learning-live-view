defmodule PentoWeb.SimulatorLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, ms: 500, has_finished: false)}
  end

  def handle_event("change_form", %{"ms" => ms}, socket) do
    {:noreply, assign(socket, ms: ms, has_finished: false)}
  end

  def handle_event("init", _params, socket) do
    {:noreply, assign(socket, has_finished: true)}
  end

  def handle_event("change_status", %{"has_finished" => has_finished}, socket) do
    {:noreply, assign(socket, has_finished: has_finished)}
  end

  def has_finished_class(has_finished) do
    if has_finished == true, do: "simulator-package-end"
  end
end
