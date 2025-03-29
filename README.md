
# ContriBoot
Contriboot is a contribution graph that us programmers all well know and love. Quickly and easily spawn contributions graphs of your like wherever you want in your apps. I've added a lot of customizability so make sure to check out the test app if you want to see examples of how to use and configure in your app.

[Access Test App](https://github.com/mazefest/MooCal/wiki/Accessing-the-Test-App)

# Requirements

| Platforms    | Minimum Swift Version |
|--------------|-----------------------|
| iOS 16+      | 5.9                   |

# Getting Started

### Swift Package Manager
1. in XCode go to `File` -> `Add Package Dependencies...`

<img src="ReadMeResources/Integration/SPM_Instructions_1.png" width="300" alt="">

2. In the searchbar paste the github url `[https://github.com/mazefest/MooCal](https://github.com/mazefest/ContriBoot)` and select `Add Package`.
   
<img src="ReadMeResources/Integration/SPM_Instructions_2.png" width="500" alt="">

Now you can import ContriBoot and use the library where ever you like.

# Integration

### 1. Import ContriBoot

Import ContriBoot inside of the desired file you are wanting to implement Contriboot's features.

```swift
import ContriBoot
````

### 2. Setup Your Data

First thing we are going to need to do is make your data models able to work with `ContriBoot` do this by making your model conform to `Contributable`.

```swift
struct YourDataModel: Contributable {
var workout: String
var date: Date // <-- needed for coforming to Contributable
}
```
Now your data can be used with `ContriBoot`

## 3. Making the Graph
Now we just need to pass in your data
```swift
  ContriBootYearGraph(items: [YourDataModel])
```
This will give you the default Contribution graph, as shown below.



```
