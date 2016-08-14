# Lootbox-Api-Wrapper For Swift

[![Build Status](https://travis-ci.org/roccoma504/Lootbox-Api-Wrapper.svg?branch=master)](https://travis-ci.org/roccoma504/Lootbox-Api-Wrapper) [![codecov](https://codecov.io/gh/roccoma504/Lootbox-Api-Wrapper/branch/master/graph/badge.svg)](https://codecov.io/gh/roccoma504/Lootbox-Api-Wrapper) [![Code Climate](https://codeclimate.com/github/roccoma504/Lootbox-Api-Wrapper/badges/gpa.svg)](https://codeclimate.com/github/roccoma504/Lootbox-Api-Wrapper)

The Wrapper is built with Swift 2.3 and is a wrapper for the Lootbox API found here [lootbox]. The API provides users with data corresponding to HeroWatch stats. This Wrapper is no way affliated with Blizzard.


# **Goal**

Goal of the Wrapper is to support Swift developers to retrieve OverWatch stats more easily. The wrapper provides data for the following

# **Classes and What They Do**
  - User: Provides account level information including level, wins, losses and games played for both quick and competitive play. 
  - AllHeroes: Provides aggregate information for all heroes, eliminations, deaths, objective times and such. Quick and competitive play options.
  - Hero: Provides information based on hero.


# **Usage**

The wrapper uses a number of utilties to make life easier. URL formatting and requests are handled inside the classes. The user has two calls to worry about, create and get. **Super important note... All responses are strings.**

# **User Class**
The user class provides information about the user, including games played, wins, losses, etc.

The User class, like all classes provided are declared with a completion block. It is suggested to not use data from the created object unless the object is created successfully.
```swift
let user = User(ID: "foo_ID007", platform: .psn, region: .us, completion: {(success, error) in })
// Here check the value of both success and error.
// If the retrieval was unsuccessful, success will be false, error will be != nil
// and any calls to get will return nil
```
Any network related errors will be reported in error. Any errors with the request will also be reported.
Enumerations are provided by the class for both platform and region. The only string is the user ID.

```swift
// With your newly created user object the following is used to retrieve data
print(user.get(.name)) // prints "foo_ID007"
print(user.get(.level)) // prints "10"
print(user.get(.rank)) // prints "54"
...
```

# **AllHeroes Class**
AllHeroes works the same as User except it takes one more additional input for the mode. Both quick and competitive play are supported. 

```Swift
let allHeroes : AllHeroes!

allHeroes = AllHeroes(ID: "foo_ID00", platform: .psn, region: .us, mode: .quick, completion: {(success, error) in })
// Here check the value of both success and error.
// If the retrieval was unsuccessful, success will be false, error will be != nil
// and any calls to get will return nil
```

# **Hero Class**
As you can guess Hero works the same as User and AllHeroes except for...well...one more input parameter. The framework currently supports all heroes. Information retrieved here includes but not limited too, eliminations, deaths, weapon accuracy, and medals.

```Swift
let hero : Hero!

hero = Hero(ID: "foo_ID00", platform: .psn, region: .us, mode: .quick, hero: .Hanzo, completion: {(success, error) in })
```

# **Notes**

 1. All responses are Strings.
 2. The framework guards against timed out and bad network calls and will report an error. Always check the success and error fields
 3. The framework guards against entire blank responses (for example a competitive mode request is made for a hero that has no competitive stats for a given user) and will report an error however individual fields being blank are not guarded against. As with any async request always protect yourself.
 4. There is currently an issue with the API that forces XBL players to be Global region. The framework handles this however if you find that XBL requests are no longer working this is mostly likely why.

# **Tests**

Framework is tested for the API calls and that each value in Enum is non null. This not not guarentee that each value will have what you want though. For example some fields may be "" and suggest that you guard against that.

# **TODO**

 1. Achievements call
 2. Playtime call
 3. Hero specific info

# **License**
----
MIT

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [lootbox]: <https://lootbox.eu>


