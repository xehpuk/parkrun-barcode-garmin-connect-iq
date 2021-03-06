using Toybox.Graphics as Gfx;

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

(:glance)
function drawBarcodeToBitmap(athleteId, barcodeHeight) {
    var bytes = athleteId.toUtf8Array();
    var byteLength = bytes.size();
    var result = new[byteLength + 3];
    result[0] = START;
    for(var i = 0; i < byteLength; i++) {
        var byte = bytes[i];
        result[i + 1] = byte >= 32
            ? byte - 32
            : byte + 64;
    }
    var checksum = START;
    for (var i = 1; i < byteLength + 1; i++) {
        checksum += i * result[i];
    }
    result[byteLength + 1] = checksum % 103;
    result[byteLength + 2] = STOP;

    var size = result.size();
    var barcodeWidth = 11 * size + 2;
    var bmp = new Gfx.BufferedBitmap({
        :width => barcodeWidth,
        :height => barcodeHeight,
        :palette => [Gfx.COLOR_BLACK, Gfx.COLOR_WHITE],
    });
    var dc = bmp.getDc();
    dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
    dc.clear();
    var x = dc.getWidth() / 2 - barcodeWidth / 2;

    for (var c = 0; c < size; c++) {
        var code = result[c];
        var bars = code != STOP ? 6 : 8;

        for (var b = 0; b < bars; b += 2) {
            var barWidth = PATTERNS[code][b];
            var spaceWidth = PATTERNS[code][b + 1];

            dc.fillRectangle(x, 0, barWidth, barcodeHeight);

            x += barWidth + spaceWidth;
        }
    }
    return bmp;
}
