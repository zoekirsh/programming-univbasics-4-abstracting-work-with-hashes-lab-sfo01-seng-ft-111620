# Intro to Hashes Lab

## Learning Goals

- Build simple hashes.
- Access and modify data stored in a hash.
- Add new data to a hash.

## Introduction

We have created hashes, and now we can move on to practicing reading and updating
them. Instead of merely requiring you to access and change hash values, we're
going to incorporate methods to add a bit of abstraction.

**Reminder:** Hashes can be read and updated using brackets:

```sh
2.6.1 :001 > my_favorite_stream = { name: 'lofi hip hop radio', location: 'youtube' }
 => {:name=>"lofi hip hop radio", :location=>"youtube"}
2.6.1 :002 > my_favorite_stream[:name]
 => "lofi hip hop radio"
2.6.1 :003 > my_favorite_stream[:name] = "lofi hip hop radio - beats to relax/study to"
 => "lofi hip hop radio - beats to relax/study to"
```

## Instructions

Code your solution in the `lib/intro_to_ruby_hashes_lab.rb` file located in the main
directory of this lab.

1. Create a method called `my_hash_creator` that takes in two parameters. In
   this method, create and return a hash with one key/value pair, using the first
   parameter as the _key_, and the second parameter as the _value_.

   ```sh
   2.6.1 :010 > my_hash_creator(:name, "George")
    => {:name=>"George"}
   2.6.1 :011 > my_hash_creator(:id, 5)
    => {:id=>5}
   2.6.1 :012 > my_hash_creator("age", 39)
    => {"age"=>39}
   ```

2. Create a method called `read_from_hash` that takes in two parameters. The first
   parameter is a hash, the second is a key. Used together, they will either
   produce a value on that hash corresponding to the key, or `nil` by default.
   Use these two parameters in conjunction, returning the result.

   ```sh
   2.6.1 :013 > hash_to_read = {location: 'New York City', occupation: 'Student'}
    => {:location=>"New York City", :occupation=>"Cashier"}
   2.6.1 :014 > read_from-hash(hash_to_read, :location)
    => "New York City"
   2.6.1 :015 > read_from-hash(hash_to_read, :occupation)
    => "Student"
   ```

3. Create a method called `update_counting_hash` that takes in two parameters.
   Similar to the last method, the first parameter is a hash, and the second is
   a key. This time, instead of reading the value, you will need to change it.

   The hash provided will have any number of keys, but all values will be
   integers. The `update_counting_hash` method should do one of two things:
   increment an existing value based on the provided key parameter, or create a
   new key/value pair using the provided key, setting the value to `1`. So, for
   example, if we had the following hash:

   ```ssh
   2.6.1 :016 > hash_to_change = { apples: 3 }
    => {:apples=>3}
   ```

   ..and a provided key, `:apples`, `update_counting_hash` should return an updated hash:

   ```ssh
   2.6.1 :017 > update_counting_hash(hash_to_change, :apples)
    => {:apples=>4}
   ```

   However, if the hash was given a key that doesn't exist, like `:oranges`, it
   should return a hash with that new key set to `1`.

   ```ssh
   2.6.1 :018 > update_counting_hash(hash_to_change, :oranges)
    => {:apples=>4, :oranges=>1}
   ```

Try your best to solve these using `learn` to track your progress. A walkthrough
is provided below if you get stuck or are curious to learn a bit more.

## Solving this Lab

For this lab, we're implementing three methods: `my_hash_creator`,
`read_from_hash`, and `update_counting_hash`.

### `my_hash_creator`

For `my_hash_creator`, we need to create a hash using the two parameters
provided. We can do this by creating a hash using its implicit form:

```rb
def my_hash_creator(key, value)
  { key => value }
end
```

It is possible you might have written something like this:

```rb
def my_hash_creator(key, value)
  { key: value }
end
```

Can you spot the problem with this code? This is the alternate syntax for
_symbols_. We have a _parameter_ given the name of `key`, which could be
whatever value is passed into the method when called. The code above just
creates a symbol, `:key` as the key, regardless of what the `key` parameter is
equal to.

> **Extra Reading:** It may seem silly to have a method that creates a hash this
> way. Can't we just build the hash directly? Yes, absolutely. In this example,
> the resulting hash is small enough that this method would not be useful in a
> real-world situation. However, this kind of method becomes useful when we want
> to produce many copies of consistently structured hash. For instance, we
> might want to create a hash of info for every student in a class with the same
> keys - `:name`, `:age`, `:birthday`, etc... in this case, we could write a
> method where we just need to pass in the student's unique info and the method
> takes care of structuring the data into a hash for us.

### `read_from_hash`

For the `read_from_hash` method, we need to use the two parameters, `hash` and
`key` to get a value. Like in the example at the beginning of this lesson, we
can use brackets to access a particular value from a hash.

```rb
def read_from_hash(hash, key)
  hash[key]
end
```

If the provided key is not found on the hash, `nil` is returned.

> **Extra Reading:** Here again, in this particular case, it would be simpler to
> skip the method and just use the hash and key to access a value. A more
> real-world example: you're working with a hash of weather data that uses
> Celsius, and want to get temperatures in Fahrenheit - you could write a method
> that reads a value from a hash and returns its converted value without
> modifying the original hash.

### `update_counting_hash`

The `update_counting_hash` method is a bit more complex than the previous two.
It needs to take in a hash and a key. If the key is present in the hash, the
associated value should be incremented by one. If the key is not present, it
should be added to the hash. The newly updated hash should be returned.

That this method will do one of two things suggests we will need to use some
sort of conditional statement dependent on whether or not the key is present on
the hash. We can start by writing that out:

```rb
def update_counting_hash(hash, key)
  if hash[key]
    # the key is present - increment the existing value
  else
    # the key is not present - add the key and assign it the value of 1
  end
end
```

If the `key` is present, regardless of its value, we want to add `1`:

```rb
def update_counting_hash(hash, key)
  if hash[key]
    hash[key] = hash[key] + 1  # Alternatively: hash[key] += 1
  else

  end
end
```

If not present, we assign the key:

```rb
def update_counting_hash(hash, key)
  if hash[key]
    hash[key] = hash[key] + 1
  else
    hash[key] = 1
  end
end
```

Finally, we need to return the updated hash. At the moment, the last line of
code executed in this method will either be `hash[key] = hash[key] + 1` or
`hash[key] = 1`, meaning that the method is implicitly returning whatever one of
those lines evaluated to. We add one more line at the end to stop this:

```rb
def update_counting_hash(hash, key)
  if hash[key]
    hash[key] = hash[key] + 1
  else
    hash[key] = 1
  end
  hash
end
```

We could also rewrite this with a ternary:

```rb
def update_counting_hash(hash, key)
  hash[key] ? hash[key] += 1 : hash[key] = 1
  hash
end
```

Either is a valid solution.

## Conclusion

Hashes are an essential data type that we will use frequently. Now that you've
seen the basics of creating, reading and updating hashes, we can explore
some examples of more complicated structures!

## Resources

- [What is a Hash in Ruby?](http://ruby.about.com/od/rubyfeatures/a/hashes.htm)
- [Ruby Documentation on Hashes](https://ruby-doc.org/core-2.5.1/Hash.html)

[rand]: https://ruby-doc.org/core-2.5.0/Random.html
