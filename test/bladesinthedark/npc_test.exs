defmodule BladesInTheDark.NPCTest do
  use ExUnit.Case, async: true

  alias BladesInTheDark.{Config, NPC}

  describe "create new people" do
    test "successfully" do
      new_person = NPC.new()

      assert %NPC{
               name: name,
               family_name: family_name
             } = new_person

      assert BladesInTheDark.Config.read(BladesInTheDark.NPC, :names)
             |> Enum.member?(name)

      assert BladesInTheDark.Config.read(BladesInTheDark.NPC, :family_names)
             |> Enum.member?(family_name)
    end
  end
end
