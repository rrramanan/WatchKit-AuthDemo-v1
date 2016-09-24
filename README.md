# WatchKit-AuthDemo-v1
watchOS 3 - User authentication watch app (Standalone) with Keychain Access

<B>Log In Steps</B>
<ul>
<li>Select Mail button to bring textinputcontroller & choose scribble to enter mail ID</li>
<li>Select Pass button to bring textinputcontroller & choose scribble to enter password</li>
<li>Tap save items switch to save login credentials</li>
<li>Select login button to authenticate</li>
<li>For quick testing I've added correct/incorrect credentials in textinputcontroller suggestions for mail/password</li>
<li>Correct credential test@mail.com/123-Ive@air.pod/456</li>
</ul>

![alt Tab](https://github.com/rrramanan/WatchKit-AuthDemo-v1/blob/master/homeScreen.png)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>

<B>After Login </B><br>
Correct authentication will bring table view enabled with item pagination. Tap a row to move next page & scroll vertical to view rest items. Enable item pagination in table's attributes inspector. Works only with segue.
<br><br>
<B>Logout</B><br>
Force touch in table view to bring logout option.
