//
// Copyright 2015-2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.Application as App;
using Toybox.System;

class WebRequestApp extends App.AppBase {
    hidden var athleteId;

    function initialize() {
        App.AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
        athleteId = "A" + App.Properties.getValue("athleteId");
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [new WebRequestView(athleteId)];
    }
}