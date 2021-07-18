using Toybox.System;
using Toybox.WatchUi as Ui;

class MainDelegate extends Ui.BehaviorDelegate {
    function initialize() {
        Ui.BehaviorDelegate.initialize();
    }

    function onSelect() {
        Ui.pushView(new AthleteIdPicker(), new AthleteIdPickerDelegate(), Ui.SLIDE_LEFT);
        return true;
    }
}
