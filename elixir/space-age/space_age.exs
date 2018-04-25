defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    case planet do
      :mercury ->
        age_on(:earth, seconds) / 0.2408467

      :venus ->
        age_on(:earth, seconds) / 0.61519726

      :earth ->
        seconds / 31557600

      :mars ->
        age_on(:earth, seconds) / 1.8808158

      :jupiter ->
        age_on(:earth, seconds) / 11.862615

      :saturn ->
        age_on(:earth, seconds) / 29.447498

      :uranus ->
        age_on(:earth, seconds) / 84.016846

      :neptune ->
        age_on(:earth, seconds) / 164.79132
    end
  end
end
