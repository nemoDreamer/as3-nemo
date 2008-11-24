package nemo.events {
  
  import flash.events.Event;

  public class myMedia extends Event {

    //--------------------------------------
    // CLASS CONSTANTS
    //--------------------------------------

    // status
    public static const PLAYING : String   = 'playing';
    public static const PAUSED : String    = 'paused';
    public static const STOPPED : String   = 'stopped';
    public static const BUFFERING : String = 'buffering';
    public static const BUFFERED : String  = 'buffered';
    public static const FINISHED : String  = 'finished';
    public static const COMPLETE : String  = 'complete';
    // event
    public static const STATUS_CHANGE : String   = 'MediaStatusChange';

    //--------------------------------------
    //  CONSTRUCTOR
    //--------------------------------------

    public function myMedia(type:String, bubbles:Boolean = false, cancelable:Boolean = false){
      super(type, bubbles, cancelable);
    }
  }

}