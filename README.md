# NZLib
### The Utilities class for iOS Developer to be use very easy.
###Alert Util
> Show alert view
```objective-c
[AlertUtil alertWithMessage:@"Message" clickHandler:^(NSInteger buttonNumber) {
    // Do something when clicked on button.
}];
```
> Show alert view with title
```objective-c
[AlertUtil alertWithTitle:@"Title" message:@"Message" clickHandler:^(NSInteger buttonNumber) {
    // Do something when clicked on button.    
}];
```
> Show alert view with other button
```objective-c
[AlertUtil addMoreButton:@[@"Button1",@"Button2",@"Button3"]];
[AlertUtil alertWithMessage:@"Message" clickHandler:^(NSInteger buttonNumber) {
    // Do something when clicked on button.
}];
```
> Show alert view without cancel button.
```objective-c
[AlertUtil disableCancelButton:YES];
[AlertUtil alertWithMessage:@"Message" clickHandler:^(NSInteger buttonNumber) {
    // Do something when clicked on button.
}];
```
