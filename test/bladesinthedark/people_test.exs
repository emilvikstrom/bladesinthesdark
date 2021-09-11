defmodule BladesInTheDark.PeopleTest do
  use ExUnit.Case, async: true

  alias BladesInTheDark.{Config, People}

  describe "create new people" do
    test "successfully" do
      new_person = People.new()

      assert %People{
               name: name,
               family_name: family_name
             } = new_person

      assert BladesInTheDark.Config.read(BladesInTheDark.People, :names)
             |> Enum.member?(name)

      assert BladesInTheDark.Config.read(BladesInTheDark.People, :family_names)
             |> Enum.member?(family_name)
    end
  end
end
