//
// Copyright 2015-2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi as Ui;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Application as App;

const START = 104;
const STOP = 106;

const PATTERNS = [
	[2, 1, 2, 2, 2, 2],   // 0
	[2, 2, 2, 1, 2, 2],   // 1
	[2, 2, 2, 2, 2, 1],   // 2
	[1, 2, 1, 2, 2, 3],   // 3
	[1, 2, 1, 3, 2, 2],   // 4
	[1, 3, 1, 2, 2, 2],   // 5
	[1, 2, 2, 2, 1, 3],   // 6
	[1, 2, 2, 3, 1, 2],   // 7
	[1, 3, 2, 2, 1, 2],   // 8
	[2, 2, 1, 2, 1, 3],   // 9
	[2, 2, 1, 3, 1, 2],   // 10
	[2, 3, 1, 2, 1, 2],   // 11
	[1, 1, 2, 2, 3, 2],   // 12
	[1, 2, 2, 1, 3, 2],   // 13
	[1, 2, 2, 2, 3, 1],   // 14
	[1, 1, 3, 2, 2, 2],   // 15
	[1, 2, 3, 1, 2, 2],   // 16
	[1, 2, 3, 2, 2, 1],   // 17
	[2, 2, 3, 2, 1, 1],   // 18
	[2, 2, 1, 1, 3, 2],   // 19
	[2, 2, 1, 2, 3, 1],   // 20
	[2, 1, 3, 2, 1, 2],   // 21
	[2, 2, 3, 1, 1, 2],   // 22
	[3, 1, 2, 1, 3, 1],   // 23
	[3, 1, 1, 2, 2, 2],   // 24
	[3, 2, 1, 1, 2, 2],   // 25
	[3, 2, 1, 2, 2, 1],   // 26
	[3, 1, 2, 2, 1, 2],   // 27
	[3, 2, 2, 1, 1, 2],   // 28
	[3, 2, 2, 2, 1, 1],   // 29
	[2, 1, 2, 1, 2, 3],   // 30
	[2, 1, 2, 3, 2, 1],   // 31
	[2, 3, 2, 1, 2, 1],   // 32
	[1, 1, 1, 3, 2, 3],   // 33
	[1, 3, 1, 1, 2, 3],   // 34
	[1, 3, 1, 3, 2, 1],   // 35
	[1, 1, 2, 3, 1, 3],   // 36
	[1, 3, 2, 1, 1, 3],   // 37
	[1, 3, 2, 3, 1, 1],   // 38
	[2, 1, 1, 3, 1, 3],   // 39
	[2, 3, 1, 1, 1, 3],   // 40
	[2, 3, 1, 3, 1, 1],   // 41
	[1, 1, 2, 1, 3, 3],   // 42
	[1, 1, 2, 3, 3, 1],   // 43
	[1, 3, 2, 1, 3, 1],   // 44
	[1, 1, 3, 1, 2, 3],   // 45
	[1, 1, 3, 3, 2, 1],   // 46
	[1, 3, 3, 1, 2, 1],   // 47
	[3, 1, 3, 1, 2, 1],   // 48
	[2, 1, 1, 3, 3, 1],   // 49
	[2, 3, 1, 1, 3, 1],   // 50
	[2, 1, 3, 1, 1, 3],   // 51
	[2, 1, 3, 3, 1, 1],   // 52
	[2, 1, 3, 1, 3, 1],   // 53
	[3, 1, 1, 1, 2, 3],   // 54
	[3, 1, 1, 3, 2, 1],   // 55
	[3, 3, 1, 1, 2, 1],   // 56
	[3, 1, 2, 1, 1, 3],   // 57
	[3, 1, 2, 3, 1, 1],   // 58
	[3, 3, 2, 1, 1, 1],   // 59
	[3, 1, 4, 1, 1, 1],   // 60
	[2, 2, 1, 4, 1, 1],   // 61
	[4, 3, 1, 1, 1, 1],   // 62
	[1, 1, 1, 2, 2, 4],   // 63
	[1, 1, 1, 4, 2, 2],   // 64
	[1, 2, 1, 1, 2, 4],   // 65
	[1, 2, 1, 4, 2, 1],   // 66
	[1, 4, 1, 1, 2, 2],   // 67
	[1, 4, 1, 2, 2, 1],   // 68
	[1, 1, 2, 2, 1, 4],   // 69
	[1, 1, 2, 4, 1, 2],   // 70
	[1, 2, 2, 1, 1, 4],   // 71
	[1, 2, 2, 4, 1, 1],   // 72
	[1, 4, 2, 1, 1, 2],   // 73
	[1, 4, 2, 2, 1, 1],   // 74
	[2, 4, 1, 2, 1, 1],   // 75
	[2, 2, 1, 1, 1, 4],   // 76
	[4, 1, 3, 1, 1, 1],   // 77
	[2, 4, 1, 1, 1, 2],   // 78
	[1, 3, 4, 1, 1, 1],   // 79
	[1, 1, 1, 2, 4, 2],   // 80
	[1, 2, 1, 1, 4, 2],   // 81
	[1, 2, 1, 2, 4, 1],   // 82
	[1, 1, 4, 2, 1, 2],   // 83
	[1, 2, 4, 1, 1, 2],   // 84
	[1, 2, 4, 2, 1, 1],   // 85
	[4, 1, 1, 2, 1, 2],   // 86
	[4, 2, 1, 1, 1, 2],   // 87
	[4, 2, 1, 2, 1, 1],   // 88
	[2, 1, 2, 1, 4, 1],   // 89
	[2, 1, 4, 1, 2, 1],   // 90
	[4, 1, 2, 1, 2, 1],   // 91
	[1, 1, 1, 1, 4, 3],   // 92
	[1, 1, 1, 3, 4, 1],   // 93
	[1, 3, 1, 1, 4, 1],   // 94
	[1, 1, 4, 1, 1, 3],   // 95
	[1, 1, 4, 3, 1, 1],   // 96
	[4, 1, 1, 1, 1, 3],   // 97
	[4, 1, 1, 3, 1, 1],   // 98
	[1, 1, 3, 1, 4, 1],   // 99
	[1, 1, 4, 1, 3, 1],   // 100
	[3, 1, 1, 1, 4, 1],   // 101
	[4, 1, 1, 1, 3, 1],   // 102
	[2, 1, 1, 4, 1, 2],   // 103
	[2, 1, 1, 2, 1, 4],   // 104
	[2, 1, 1, 2, 3, 2],   // 105
	[2, 3, 3, 1, 1, 1, 2, 0]   // 106
];

const HEIGHT = 50;

class WebRequestView extends Ui.View {
    hidden var mMessage = "Press menu button";
    hidden var codes;
    hidden var image;
	hidden var _athleteId;

    function initialize(athleteId) {
        Ui.View.initialize();

		_athleteId = athleteId;
    }

    // Load your resources here
    function onLayout(dc) {
        image = Ui.loadResource(Rez.Drawables.ParkrunLogo);

        var bytes = _athleteId.toUtf8Array();
        var size = bytes.size();
        var result = new[size + 3];
        result[0] = START;
        for(var i = 0; i < size; i++) {
            var byte = bytes[i];
            result[i + 1] = byte >= 32 ? byte - 32 : byte + 64;
        }
        var checksum = START;
        for (var i = 1; i < size + 1; i++) {
            checksum += i * result[i];
        }
        result[size + 1] = checksum % 103;
        result[size + 2] = STOP;
        
        codes = result;
        mMessage = bytes.toString() + "\n" + result.toString();
    }

    // Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.clear();
        // dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Graphics.FONT_MEDIUM, mMessage, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        // dc.drawBitmap(dc.getWidth()/2 - image.getWidth()/2, dc.getHeight()/2 - image.getHeight()/2, image);
        drawLogo(dc);
        drawBarcode(dc);
        drawId(dc);
    }

    function drawLogo(dc) {
        dc.drawBitmap(dc.getWidth() / 2 - image.getWidth() / 2, 10, image);
    }

    function drawBarcode(dc) {
        var size = codes.size();
        var barcodeWidth = 11 * size + 2;
        var x = dc.getWidth() / 2 - barcodeWidth / 2;
        var y = dc.getHeight() / 2;

        for (var c = 0; c < codes.size(); c++) {
            var code = codes[c];
            var bars = code != STOP ? 6 : 8;

            for (var b = 0; b < bars; b += 2) {
                var barWidth = PATTERNS[code][b];
                var spaceWidth = PATTERNS[code][b + 1];

                dc.fillRectangle(x, y, barWidth, HEIGHT);

                x += barWidth + spaceWidth;
            }
        }
    }

    function drawId(dc) {
        var y = dc.getHeight() / 2 + HEIGHT;
        dc.drawText(dc.getWidth() / 2, y, Graphics.FONT_SYSTEM_LARGE, _athleteId, Graphics.TEXT_JUSTIFY_CENTER);
    }

    // Called when this View is removed from the screen. Save the
    // state of your app here.
    function onHide() {
    }

    function onReceive(args) {
        if (args instanceof Lang.String) {
            mMessage = args;
        }
        else if (args instanceof Ui.BitmapResource) {
            image = args;
        }
        Ui.requestUpdate();
    }
}
