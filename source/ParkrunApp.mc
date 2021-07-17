using Toybox.Application as App;
using Toybox.System;

class ParkrunApp extends App.AppBase {
    private var _athleteId;

    function initialize() {
        App.AppBase.initialize();
    }

    function onStart(state) {
        _athleteId = "A" + App.Properties.getValue("athleteId");
    }

    function getInitialView() {
        return [new ParkrunView(_athleteId)];
    }
    
    function getGlanceView() {
    	return [new ParkrunGlanceView(_athleteId)];
    }
}