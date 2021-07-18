using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.System;
using Toybox.WatchUi as Ui;

const ATHLETE_ID_NUMBER_OF_DIGITS = 7;

class AthleteIdPicker extends Ui.Picker {
    function initialize() {
        var athleteId = App.Properties.getValue(ATHLETE_ID);
        var pattern = [
            new Ui.Text({
                :text => "A",
                :font => Gfx.FONT_LARGE,
                :locX => Ui.LAYOUT_HALIGN_CENTER,
                :locY => Ui.LAYOUT_VALIGN_CENTER,
            }),
        ];
        for (var i = 1; i <= ATHLETE_ID_NUMBER_OF_DIGITS; i++) {
            pattern.add(new AthleteIdPickerFactory(athleteId / Math.pow(10, ATHLETE_ID_NUMBER_OF_DIGITS - i).toNumber() % 10));
        }
        var settings = {
            :title => new Ui.Text({
                :text => Rez.Strings.athleteId,
                :font => Gfx.FONT_LARGE,
                :locX => Ui.LAYOUT_HALIGN_CENTER,
                :locY => Ui.LAYOUT_VALIGN_CENTER,
            }),
            :pattern => pattern,
        };
        Ui.Picker.initialize(settings);
    }
}

class AthleteIdPickerDelegate extends Ui.PickerDelegate {
    function initialize() {
        Ui.PickerDelegate.initialize();
    }

    function onAccept(values){
        var athleteId = 0;
        for (var i = 1; i <= ATHLETE_ID_NUMBER_OF_DIGITS; i++) {
            athleteId += values[i] * Math.pow(10, ATHLETE_ID_NUMBER_OF_DIGITS - i).toNumber();
        }
        App.Properties.setValue(ATHLETE_ID, athleteId);
        Ui.popView(Ui.SLIDE_RIGHT);
        return true;
    }

    function onCancel() {
        Ui.popView(Ui.SLIDE_RIGHT);
        return true;
    }
}

class AthleteIdPickerFactory extends Ui.PickerFactory {
    var _start;

    function initialize(start) {
        Ui.PickerFactory.initialize();
        
        _start = start;
    }

    public function getDrawable(index, selected) {
        var value = getValue(index);
        return new Ui.Text({
            :text => value.format("%d"),
            :font => selected
                ? Gfx.FONT_NUMBER_THAI_HOT
                : Gfx.FONT_NUMBER_HOT,
            :locX => Ui.LAYOUT_HALIGN_CENTER,
            :locY => Ui.LAYOUT_VALIGN_CENTER
        });
    }

    public function getValue(index) {
        return (_start + index) % 10;
    }

    public function getSize() {
        return 10;
    }
}
