class StarSystem

  attr_reader :name, :planets

  def initialize(name, planets)

    @name = name
    @planets = planets

  end

  def planet_names()

    return @planets.map() do |planet|
      planet.name
    end

  end

  def get_planet_by_name(planet_name)

    return @planets.find() do |planet|
      planet_name == planet.name
    end

  end

  def get_largest_planet()

    biggest_planet = @planets[0]

    @planets.each() do |planet|
      if planet.diameter > biggest_planet.diameter
        biggest_planet = planet
      end
    end

    return biggest_planet

  end

  def get_smallest_planet()

    smallest_planet = @planets[0]

    @planets.each() do |planet|
      if planet.diameter < smallest_planet.diameter
        smallest_planet = planet
      end
    end

    return smallest_planet

  end

  def get_planets_with_no_moons()

    return @planets.select() do |planet|
      planet.number_of_moons == 0
    end

  end

  def get_planets_with_more_moons(amount)

    more_than_four_moons = @planets.select() do |planet|
      planet.number_of_moons > amount
    end

    return more_than_four_moons.map() do |planet|
      planet.name
    end

  end

  def get_number_of_planets_closer_than(distance)

    close_planets = @planets.select() do |planet|
      planet.distance_from_sun < distance
    end

    return close_planets.count()

  end

  def get_total_number_of_moons

    return @planets.reduce(0) do |moon_total, planet|
      moon_total += planet.number_of_moons
    end

  end

  def get_closest_planet()
    closest_planet = @planets[0]
    @planets.each() do |planet|
      if planet.distance_from_sun < closest_planet.distance_from_sun
        closest_planet = planet
      end
    end
    return closest_planet
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun()

    planets_clone = @planets.clone
    sorted_planets = []

    planets_clone.each do |planet|
      result = get_closest_planet()
      sorted_planets.push( result.name )
      @planets.delete( result )
      # binding.pry
    end

    return sorted_planets
  end

  # def get_planet_names_sorted_by_increasing_distance_from_sun()
  #
  #   sorted_planets = @planets.sort_by do |planet|
  #     planet.distance_from_sun
  #   end
  #
  #   return sorted_planets.map do |planet|
  #     planet.name
  #   end
  #
  # end

  def get_planet_names_sorted_by_size_decreasing()

    sorted_planets = @planets.sort_by() do |planet|
      planet.diameter
    end

    sorted_planets.reverse!()

    return sorted_planets.map() do |planet|
      planet.name
    end

  end

end
