def parse_S(string):
  """
  Parses the input string according to the grammar S → cAd, A → ab / a.

  Args:
    string: The string to be parsed.

  Returns:
    True if the string is successfully parsed, False otherwise.
  """
  if len(string) < 3:
    return False
  if string[0] != "c":
    return False
  if not parse_A(string[1:]):
    return False
  if string[-1] != "d":
    return False
  return True

def parse_A(string):
  """
  Parses the input string according to the grammar A → ab / a.

  Args:
    string: The string to be parsed.

  Returns:
    True if the string is successfully parsed, False otherwise.
  """
  if len(string) == 1 and string[0] == "a":
    return True
  if len(string) >= 2 and string[0] == "a" and string[1] == "b":
    return True
  return False

# Example usage
input_string = "cad"
if parse_S(input_string):
  print(f"String '{input_string}' is valid according to the grammar.")
else:
  print(f"String '{input_string}' is not valid according to the grammar.")

# other strings
input_strings = ["cabd", "cab", "c", "ca", "cadb"]
for string in input_strings:
  if parse_S(string):
    print(f"String '{string}' is valid according to the grammar.")
  else:
    print(f"String '{string}' is not valid according to the grammar.")
