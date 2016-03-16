using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Math as Math;

class HuskiesView extends Ui.WatchFace {
    var image;

    function initialize() {
        WatchFace.initialize();
    }

    //! Load your resources here
    function onLayout(dc) {
        image = Ui.loadResource( Rez.Drawables.Logo );
    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        var time = Sys.getClockTime();

        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_WHITE );
        dc.clear();

        dc.drawBitmap( ( dc.getWidth() - image.getWidth() ) / 2,
                       ( dc.getHeight() - image.getHeight() - 13 ) / 2,
                       image);

        dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_BLACK );

        //time.hour = 0;
        //time.min = 0;

        var half_width = dc.getWidth() / 2;
        var half_height = dc.getHeight() / 2;

        var hour_cos = Math.cos( ((((3 - time.hour%12)*30) - (time.min*30/60)) * Math.PI * 2) / 360 );
        var hour_sin = Math.sin( ((((3 - time.hour%12)*30) - (time.min*30/60)) * Math.PI * 2) / 360 );
        var hour_x = half_width + ( (half_width-18) * hour_cos );
        var hour_y = half_height + ( -(half_height-18) * hour_sin );

        dc.setPenWidth(4);
        dc.drawCircle(hour_x, hour_y, 7);

        var min_cos = Math.cos( (((15-time.min) * 6) * Math.PI * 2) / 360 );
        var min_sin = Math.sin( (((15-time.min) * 6) * Math.PI * 2) / 360 );
        var min_x = half_width + ( (half_width-18) * min_cos );
        var min_y = half_height + ( -(half_height-18) * min_sin );

        dc.drawCircle(min_x, min_y, 13);

    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }

    //! The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    //! Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
