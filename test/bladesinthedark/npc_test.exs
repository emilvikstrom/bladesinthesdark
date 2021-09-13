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

      assert Config.read(BladesInTheDark.NPC, :names)
             |> Enum.member?(name)

      assert Config.read(BladesInTheDark.NPC, :family_names)
             |> Enum.member?(family_name)
    end

    test "with input params" do
      assert %NPC{
               name: "testman"
             } = NPC.new(%{name: "testman"})
    end

    test "with invalid input params" do
      assert_raise KeyError, fn -> NPC.new(%{invalid: "data"}) |> IO.inspect() end
    end
  end
end
