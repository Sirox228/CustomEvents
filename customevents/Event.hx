package customevents;

import Reflect as Ref;
import haxe.Constraints.Function;
import haxe.Exception;

class Event<T> { // T must be $Type -> $Type or function($name:$Type):$Type
	
	public function new() {
		if (!Std.isOfType(T, Function)) {
			throw new Exception("type of customevents.Event must be function");
		}
		trace("new Event successful");
	}
	
	public function createEvent(event:String) {
		if (!Ref.hasField(this, event)) {
			Ref.setProperty(this, event, event);
		}
	}
	
	public function addEventCallback(callback:T, event:String) {
		if (!Ref.hasField(this, event)) {
			throw new Exception("no such event, use createEvent to add one");
		} else {
			Ref.setProperty(this, event + "callback", callback);
		}
	}
	
	public function trigger(event:String, args:Array<Dynamic>):Dynamic {
		if (Ref.hasField(this, event) && Ref.hasField(this, event + "callback")) {
			return Ref.callMethod(this, Ref.getProperty(event + "callback"), args);
		} else {
			if (!Ref.hasField(this, event) && Ref.hasField(this, event + "callback")) {
				throw new Exception("no such event, use createEvent to add one");
			} else if (!Ref.hasField(this, event + "callback") && Ref.hasField(this, event)) {
				throw new Exception("no such event, use addEventCallback to add one");
			} else {
				throw new Exception("no such event and callback, use createEvent, then addEventCallback to add them");
			}
		}
		return "haxe is monkey and won't compile without this 'return', even though i have 'else' for my if";
	}
}