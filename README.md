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

### Powerful pattern matching

### Compile-time linting & beautiful error messages

### Inline tests
