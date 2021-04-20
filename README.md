# Khabar🗞
###### Mobile app for all your news needs.

------------



#### Platforms:  
`Android, iOS`

------------
Link???
------------
#### Description: 
- App Features:
	1. User can get current worldwide news.
	2. News for specific categories like `Business`,`Science` etc can be seen.
	3. One can also search for specific news
	4. News can be shared with others.
- This was made with the intension to learn to make http requests to the `api's` and display data accordingly . 
- I made use of `newsapi.org` to fetch the news data.
- The json looks something like this.
```dart
Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
```
- Made use of `Listviews`,`Gesture Detector`,`Web View`,and `Custom widgets`.
- App follows `Material Design` throught.
- Made use of `MVC` pattern.



------------

#### Packages Used:
`http: ^0.13.1`
`webview_flutter: ^2.0.2 `
`share: ^2.0.1`
###### For more info on packages visit [here](http://pub.dev "here")
------------

#### Installation:
- Install `Flutter` sdk
- Download the packages using `flutter pub get`
- Make your account on `NewsApi.org`, get the `api key`
- Add the api key in `lib/secret.dart`
- Fire up the emulator and you are good to go.

------------
#### Contributing:
Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are greatly appreciated.
1. Fork the Project
2. Create your Feature Branch (git checkout -b feature/AmazingFeature)
3. Commit your Changes (git commit -m 'Add some AmazingFeature')
4. Push to the Branch (git push origin feature/AmazingFeature)
5. Open a Pull Request

------------
#### References:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

------------


##### Thanks for Reading🙏🏻
##### Happy Coding😇



   

