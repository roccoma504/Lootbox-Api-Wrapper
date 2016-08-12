# Lootbox-Api-Wrapper For Swift

[![Build Status](https://travis-ci.org/roccoma504/Lootbox-Api-Wrapper.svg?branch=master)](https://travis-ci.org/roccoma504/Lootbox-Api-Wrapper) [![codecov](https://codecov.io/gh/roccoma504/Lootbox-Api-Wrapper/branch/master/graph/badge.svg)](https://codecov.io/gh/roccoma504/Lootbox-Api-Wrapper)

The Wrapper is built with Swift 2.3 and is a wrapper for the Lootbox API found here [lootbox]. The API provides users with data corresponding to HeroWatch stats. This Wrapper is no way affliated with Blizzard.

# Goal

Goal of the Wrapper is to support Swift developers to retrieve OverWatch stats more easily. The wrapper provides data for the following

# Classes and What They Do
  - User: Provides account level information including level, wins, losses and games played for both quick and competitive play. 


# Usage

The wrapper uses a number of utilties to make life easier. URL formatting and requests are handled inside the classes. The user has two calls to worry about, create and get.

# User Class
The user class provides information about the user, including games played, wins, losses, etc.

Ther User class, like all classes provided are declared with a completion block. It is suggested to not use data from the created object unless the object is created successfully.
```swift
let user = User(ID: "foo_ID007", platform: .psn, region: .us) { (success, error) in 
// Here check the value of both success and error.
// If the retrieval was unsuccessful, success will be false, error will be != nil
// and any calls to get will return nil
}
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
All responses are strings.

License
----

MIT

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [lootbox]: <https://lootbox.eu>


