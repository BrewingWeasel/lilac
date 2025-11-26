# Lilac

A simple string manipulation language with a focus on pattern matching

```ruby
pattern greeting = ("hello" | "hi"):lower
pattern introduction = ("my name is" | "i'm" | "i am"):lower

def main(($greeting + ", ")? + $introduction + " " + name)
	"Nice to meet you, " + name + "!"
where 
	main("Hi, I'm Bob") == "Nice to meet you, Bob!";
	main("my name is Alice") == "Nice to meet you, Alice!";
end
```

## Features

### Beautiful linting & error messages
<img width="2138" height="1497" alt="error_messages" src="https://github.com/user-attachments/assets/a80e421f-76b4-4c7d-a9e3-ed8e3163cda3" />

### Inline tests
Define tests in `where` blocks at the end of functions:
```ruby
def replace_separator(content + ";" + rest, new_separator)
	content + new_separator + replace_separator(rest, new_separator)
end

def replace_separator(content, _new_separator)
	content
where
	replace_separator("a;b;c", ",") == "a,b,c";
	replace_separator("one;two;three;four", "|") == "one|two|three|four";
	# those will pass, but this test will fail
	replace_separator("a|b;c", ",") == "a,b,c";
end
```
and test them with `lilac test`:
<img width="1559" height="979" alt="testing" src="https://github.com/user-attachments/assets/b4f3fa07-d418-4af2-a4fe-58f12e3ce9d3" />

### Powerful pattern matching

```ruby
def variable("My name is " + name + "!")
	"Your name is " + name + "."
where
	variable("My name is Alice!") == "Your name is Alice.";
end

def optional("My name is " + name + "!"?)
	"Your name is " + name + "."
where
	optional("My name is Alice!") == "Your name is Alice.";
	optional("My name is Bob") == "Your name is Bob.";
end

def transform_case("my name is ":lower + name + "!")
	"Your name is " + name + "."
where
	transform_case("MY name IS Alice!") == "Your name is Alice.";
end

def either(("my name is " | "i'm " | "i am "):lower + name + "!")
	"Your name is " + name + "."
where
	either("I'm Alice!") == "Your name is Alice.";
	either("My name is Bob!") == "Your name is Bob.";
end

def as_pattern("My name is " + (_name + ("!" | ".")) as name_with_punctuation )
	"Your name is " + name_with_punctuation
where
	as_pattern("My name is Alice!") == "Your name is Alice!";
	as_pattern("My name is Alice.") == "Your name is Alice.";
end
```
