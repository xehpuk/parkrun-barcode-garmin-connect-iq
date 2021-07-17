using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System;
using Toybox.Application as App;

const BARCODE_HEIGHT = 50;
const LOGO_OFFSET = 10;

class ParkrunView extends Ui.View {
	private var _barcodeBmp;
    private var _logo;
	private var _athleteId;

    function initialize(athleteId) {
        Ui.View.initialize();

		_athleteId = athleteId;
    }

    function onLayout(dc) {
        _logo = Ui.loadResource(Rez.Drawables.ParkrunLogo);
        _barcodeBmp = drawBarcodeToBitmap(_athleteId, BARCODE_HEIGHT);
    }

    function onUpdate(dc) {
    	dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
    	dc.clear();
    	drawLogo(dc);
        drawBarcode(dc);
        drawId(dc);
    }

    function drawLogo(dc) {
        dc.drawBitmap(dc.getWidth() / 2 - _logo.getWidth() / 2, LOGO_OFFSET, _logo);
    }

    function drawBarcode(dc) {
        dc.drawBitmap((dc.getWidth() - _barcodeBmp.getDc().getWidth()) / 2, dc.getHeight() / 2, _barcodeBmp);
    }

    function drawId(dc) {
        var y = dc.getHeight() / 2 + BARCODE_HEIGHT;
        dc.drawText(dc.getWidth() / 2, y, Gfx.FONT_SYSTEM_LARGE, _athleteId, Gfx.TEXT_JUSTIFY_CENTER);
    }
}
