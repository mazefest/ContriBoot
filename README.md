
<p align="center">
<img src="ReadMeResources/ReadME-app_banner.png" width="400" alt="">
</p>

# ContriBoot
ContriBoot brings the classic contribution graph we all know and love into your app with ease. You can drop one in wherever you need it, and there’s plenty of flexibility to make it your own. If you’re curious about how to use or tweak it, the test app has a bunch of examples to check out. [Access Test App](https://github.com/mazefest/ContriBootExampleApp)

<p align="center">
  <img src="ReadMeResources/ReadMe-main_example.gif" width="200" style="margin: 0 10px;" alt="">
  <img src="ReadMeResources/ReadMe-main_3.png" width="200" style="margin: 0 10px;" alt="">
  <img src="ReadMeResources/ReadMe-main_2.png" width="200" style="margin: 0 10px;" alt="">
  <img src="ReadMeResources/ReadMe-main_1.png" width="200" style="margin: 0 10px;" alt="">
</p>

# Requirements

| Platforms    | Minimum Swift Version |
|--------------|-----------------------|
| iOS 16+      | 5.9                   |

# Getting Started

### Swift Package Manager
1. in XCode go to `File` -> `Add Package Dependencies...`

<img src="ReadMeResources/ReadMe-adding_package_1.png" width="400" alt="">

2. In the searchbar paste the github url `(https://github.com/mazefest/ContriBoot)](https://github.com/mazefest/ContriBootExampleApp)` and select `Copy Dependency`.
   
<img src="ReadMeResources/ReadMe-adding_package_2.png" width="400" alt="">

Now you can import ContriBoot and use the library whereever you like.

# Integration

### 1. Import ContriBoot

Import ContriBoot inside of the desired file you are wanting to implement Contriboot's features.

```swift
import ContriBoot
````

### 2. Setup Your Data

The first step is to update your data models to work with `ContriBoot` by making them conform to the `Contributable` protocol. The only required parameter is a `date: Date` var.

```swift
struct YourDataModel: Contributable {
var workout: String
var date: Date // <-- needed for coforming to Contributable
}
```
Now your data can be used with `ContriBoot`

## 3. Making the Graph
Now we just need to pass in your data into the `ContriBootYearGraph`.

```swift
List {
  ContriBootYearGraph(items: [YourDataModel])
}
```

This will give you the default Contribution graph, as shown below.

<img src="ReadMeResources/ReadMe-default_contribution_graph.png" width="200" alt="">

# Different Stlyes
Now you can configure the graph to look anyway you like. There are currently 3 available styles. You can apply the styles to the `ContriBootYearGraph` by modifying it with the `.style(_ ContributeStyle)` function.

## BinaryContributeStyle
Contribution colors will be colored if there is more than one contirbution for that specific date. You can also configure
`BinaryContributeStyle(color: Color, absentColor: Color, cornerRadius: Double)`
color: `Color` -> Color of the squares with contributions.
absentColor: `Color` -> Color of squares with `0` contributions.
cornerRadius: `Double` -> Corner radius for contribution squares.
```
List {
   Section {
      ContriBootYearGraph(items: data)
         .contributeStyle(BinaryContributeStyle()) // <- HERE
   }
                
   Section {
      ContriBootYearGraph(items: data)
         .contributeStyle(BinaryContributeStyle(color: .pink))
   }
}
```

<img src="ReadMeResources/ReadMe-binary_example.png" width="200" alt="">

## GradientContributeStyle
Contibution will be colored with an opacity value based off the max contirbution count in the year.
`GradientContributeStyle(color: Color, absentColor: Color, cornerRadius: Double)`
color: `Color` -> Color of the squares with contributions.
absentColor: `Color` -> Color of squares with `0` contributions.
cornerRadius: `Double` -> Corner radius for contribution squares.
```
List {
   Section {
      ContriBootYearGraph(items: data)
         .contributeStyle(GradientContributeStyle()) // <- Here
   }
                
   Section {
      ContriBootYearGraph(items: data)
         .contributeStyle(GradientContributeStyle(color: .pink))
   }
}
```
<img src="ReadMeResources/ReadMe-gradient_example.png" width="200" alt="">

## CustomContributeStyle
You are in control, you have to do all the work now.

When using `CustomContributeStyle(customView: () -> some View)` you will have to provide the view yourself inside the completion handler. You will be given the number of contributions for the day the view is drawing and can make decisions on what view should be displayed.

```
Section {
    ContriBootYearGraph(items: data)
       .contributeStyle(CustomContributeStyle({ contributions in // <- Your custom implementation here
           if contributions.count > 0 {
               Image(systemName: "checkmark.circle.fill")
                   .bold()
                   .foregroundStyle(Color.green)
           } else {
               ContributionSquareView(color: Color.gray.opacity(0.33))
           }
       }))
}
```
<img src="ReadMeResources/ReadMe-custom_example.png" width="200" alt="">

You can also go crazy with it, as seen above.

### Example App
For other example of configuring the conrtibution graph in an actual app check out the test app. [HERE](https://github.com/mazefest/ContriBootExampleApp)
