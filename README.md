# Unsplash Clone App

### Project Overview 
<img align="left" src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/appstore.png" width = 30 height = 30/>
UnsplashCloneApp is a dynamic application designed for users to explore and enjoy a wide range of high-quality images sourced from Unsplash. Utilizing the Unsplash API, the app provides a rich library of photos, collections, and user profiles, all accessible within a user-friendly interface. Integration with Firebase enhances the app's functionality, offering user authentication features such as login and registration, fostering a personalized experience. The app's design and functionality are aimed at promoting user interaction and engagement with the content.

### Key Features
- Extensive Image Library: Users have access to a vast collection of high-quality images from various photographers and creators hosted on Unsplash.
- Interactive Browsing: The app allows users to navigate through images, collections, and user profiles, offering an immersive exploration experience.
- User Authentication: With Firebase integration, users can register, log in, and manage their profiles, personalizing their interaction with the app.
- Content Discovery: Advanced search functionality enables users to discover images by topics, keywords, or creators, making it easy to find exactly what they're looking for.

### How to run?
```terminal
pod install
```
### Used framework.
- pod 'SDWebImage'
- pod 'DropDown'
- pod 'Firebase/Auth'
- pod 'Firebase/Firestore'
##### Then, you can start Xcode to run it

### Technical Approach
- MVVM Architecture: The app is structured around the Model-View-ViewModel pattern to enhance testability and maintainability.
- UI Design: A combination of collection and table views offers a rich and intuitive user interface, making news browsing a pleasant experience.
- Error Handling: The app features a custom error-handling framework, ensuring smooth operation and user-friendly error messages.
- Enhanced Accessibility: Recent updates have introduced new font options, allowing users to customize their reading experience.
- Communication Features: Integrated functionalities for emailing, messaging, and making calls support efficient user interactions and inquiries.
- Data Source: <b>Utilizing Rapid API for News Data:</b> The application retrieves its news content from a Rapid API endpoint, which provides a comprehensive and updated news feed.

### User Interface Insights
#### Main Screen
Main Screen: This is the gateway to the app's content, showcasing a collection view of trending images and a table view for targeted searches by keywords or topics. It also features a dedicated section for user authentication and profile management, facilitated by Firebase.
<p align="center">
  <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/mainScreen.gif" width = 200 height = 410/>
 <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/mainScreen1.gif" width = 200 height = 410
margin = 20/>
<img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/mainScreen1.png" width = 200 height = 410
margin = 20/>
<img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/licenseScreen.png" width = 200 height = 410/>
</p>

#### Details Screen
<div>Upon selecting an image from the app's diverse galleries, users are directed to the Details View. This feature is designed to showcase a larger, more detailed view of the chosen image, providing an immersive visual experience.</div>
<p align="center">
 <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/detailsScreen.png" width = 200 height = 410/>
 </p>

#### Search Image Screen   
<div>The Search Functionality is a cornerstone feature of the UnsplashCloneApp, offering users the flexibility to explore the vast Unsplash database with ease. Whether it's photos, user profiles, or curated collections, the Search Functionality empowers users to navigate the app's extensive content library using specific keywords. This tailored approach ensures that every search is as fruitful and relevant as possible, enhancing user engagement and content discoverability</div>
<p align="center">
   <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/collectionScreen.gif" width = 200 height = 410/>
 <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/searchScreen.png" width = 200 height = 410/>
 <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/searchScreen1.png" width = 200 height = 410/>
  <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/searchScreen2.png" width = 200 height = 410/>
 </p>

#### Image Picker Screen
<div>The Image Picker Feature is a personalized tool within the UnsplashCloneApp, enabling users to select and save their favorite images into a custom profile. This curated collection becomes a personal gallery, reflecting individual tastes and preferences. It's a space for users to return to, whether for inspiration, appreciation, or to simply relive the moments captured in their selected images.
</div>
<p align="center">
  <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/searchScreen.gif" width = 200 height = 410/>
  <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/collectionScreen.png" width = 200 height = 410/>
   <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/collectionScreen1.png" width = 200 height = 410/>
<p align="center">

#### Login and Register Screen
<div>A seamless User Authentication process is integral to the UnsplashCloneApp, facilitating a secure and personalized user experience. From initial registration to daily logins, this feature ensures that every user's data and personalized settings are protected and easily accessible. Leveraging Firebase's robust cloud services, the app offers a straightforward yet secure gateway for users to embark on their UnsplashCloneApp journey.</div>
<p align="center">
<img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/loginScreen.gif" width = 200 height = 410/>
<img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/loginScreen1.png" width = 200 height = 410/>
 <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/loginScreen2.png" width = 200 height = 410/>
 <img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/loginScreen3.png" width = 200 height = 410/>
<p align="center">

#### Firebase Store Integration
<div>At the heart of the UnsplashCloneApp's personalized experience is the Firebase Store Integration. This feature is crucial for storing and managing user information, from personal galleries curated through the Image Picker Feature to user credentials and preferences. The Firebase Store serves as a secure repository, ensuring that each user's data is safely stored and readily available whenever they access the app, enhancing both convenience and security.</div>
<p align="center">
<img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/dataSet1.png" width = 400 height = 410/>
<img src = "https://github.com/Ghostlun/UnsplashCloneApp/blob/master/UnsplashCloneApp/Resources/Github%20Resource/dataSet2.png" width = 400 height = 410/>
<p align="center">

