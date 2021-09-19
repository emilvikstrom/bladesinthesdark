defmodule BladesInTheDarkWeb.NPCComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
        Name: <%= @npc.name %> <%= if @npc.nickname != nil do %><%= @npc.nickname %>,<% end %> <%= @npc.family_name %>
        Profession: <%=@npc.profession%><br>
        Heritage: <%=@npc.heritage%><br>
        Looks: <%=@npc.looks%><br>
        Style: <%=@npc.style%><br>
        Goals:<%=@npc.goals%><br>
        Preferred Methods: <%=@npc.preferred_methods%><br>
        Traits:<%=@npc.traits%> <br>
        Interests:<%=@npc.interests%><br>
        Quirks: <%=@npc.quirks%><br>
    """
  end
end
