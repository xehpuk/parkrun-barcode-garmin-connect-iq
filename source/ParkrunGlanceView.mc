using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

(:glance)
class ParkrunGlanceView extends Ui.GlanceView {
    private var _athleteId;

    function initialize(athleteId) {
        Ui.GlanceView.initialize();

        _athleteId = athleteId;
    }

    function onUpdate(dc) {
        var barcodeBmp = drawBarcodeToBitmap(_athleteId, dc.getHeight());
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
        dc.clear();
        dc.drawBitmap((dc.getWidth() - barcodeBmp.getDc().getWidth()) / 2, 0, barcodeBmp);
    }
}
