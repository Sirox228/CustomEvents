# CustomEvents
A library for creating your own custom events

# Example of usage
```haxe
//import class
import customevents.Event;

//setup variables
var something:String = "";
var text:String = "abcdefghijklmnopqrstuvwxyz";
var event:Event<String->String>;

public function new() {
    event = new Event<String->String>();
}

//setup event
event.createEvent("EVENT_PARSE");
event.addEventCallback(function(str:String) {
        var tmp:String = str;
        tmp = tmp.substr(2, 3); //just an example
        return tmp;
    }, "EVENT_PARSE");

//trigger event
something = event.trigger("EVENT_PARSE", [text]); // if your event not returns anything, you can trigger it without putting result into variable
trace(something); // this would return "cde" to console
```