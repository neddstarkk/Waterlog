def square(x):
  """Squares a number."""
  return x * x

def cube(x):
  """Cubes a number."""
  return x * x * x

def map_and_filter(numbers, mapper, filter_fn):
  """Maps and filters a list of numbers."""
  mapped_numbers = map(mapper, numbers)
  filtered_numbers = filter(filter_fn, mapped_numbers)
  return filtered_numbers

def main():
  numbers = [1, 2, 3, 4, 5]

  # Square and filter the numbers
  squared_numbers = map_and_filter(numbers, square, lambda x: x % 2 == 0)
  for i in squared_numbers:
    print("Squared numbers: " + str(i)) # OUTPUT: [4, 16]

  # Cube and filter the numbers
  cubed_numbers = map_and_filter(numbers, cube, lambda x: x % 3 == 0)
  for i in cubed_numbers:
    print("Cubed numbers: " + str(i)) # OUTPUT: [27]

  # Create a list of strings
  strings = ["Hello", "World", "!"]

  # Map the strings to uppercase
  uppercase_strings = map(lambda x: x.upper(), strings)
  for i in uppercase_strings:
    print(i) # OUTPUT: ['HELLO', 'WORLD', '!']

  # Filter the uppercase strings to only include those with length 5
  filtered_uppercase_strings = filter(lambda x: len(x) == 5, uppercase_strings) 
  for i in filtered_uppercase_strings:
    print(i) # OUTPUT: ['WORLD']

  # Create a function that adds 1 to each number
  add_one = lambda x: x + 1

  # Map the numbers to their sum with 1 added
  added_numbers = map(add_one, numbers)
  for i in added_numbers:
    print(i) # OUTPUT: [2, 3, 4, 5, 6]

  # Create a function that squares each number
  square_numbers = lambda x: x * x

  # Map the numbers to their squares
  squared_numbers = map(square_numbers, numbers)
  for i in squared_numbers:
    print(i) # Output: [1, 4, 9, 16, 25]

if __name__ == "__main__":
  main()