using Toybox.Application as App;
using Toybox.System;
using Toybox.WatchUi as Ui;

const ATHLETE_ID = "athleteId";

class ParkrunApp extends App.AppBase {
    private var _athleteId;

    function initialize() {
        App.AppBase.initialize();
    }

    function onStart(state) {
        _athleteId = "A" + App.Properties.getValue(ATHLETE_ID);
    }

    function getInitialView() {
        return [
            new ParkrunView(_athleteId),
            new MainDelegate(),
        ];
    }

    function getGlanceView() {
        return [
            new ParkrunGlanceView(_athleteId),
        ];
    }

    // triggered by settings change in GCM
    function onSettingsChanged() {
        // TODO redraw barcode
        Ui.requestUpdate();
    }
}
