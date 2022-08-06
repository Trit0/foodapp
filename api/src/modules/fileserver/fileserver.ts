const fs = require('fs');
const path = require('path')

const fsPath = path.dirname(require.main?.filename ?? "") + '../assets';

const getZip = (name) => {
    const zipPath = fsPath + '/zip';
    const zip = findFile(zipPath, `${name}.zip`)
    return zip ? fs.readFileSync(zip) : null;
}

const findFile = (path, name) => {
    const dir = fs.opendirSync(path);
    let last;
    do {
        last = dir.readSync();
        if (last) {
            if (last.name === name) {
                dir.closeSync();
                return `${path}/${name}`;
            }
            if (last.isDirectory()){
                const val = findFile(`${path}/${last.name}`, name)
                if (val) {
                    dir.closeSync();
                    return val;
                }
            }
        }
    } while(last);
    dir.closeSync();
    return null;
}

module.exports = { getZip }
