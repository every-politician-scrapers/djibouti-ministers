// wd create-entity create-office.js "Minister for X"
const fs = require('fs');
let rawmeta = fs.readFileSync('meta.json');
let meta = JSON.parse(rawmeta);

module.exports = (labelFR, labelEN) => {
  claims = {
    P31:   { value: 'Q294414' }, // instance of: public office
    P279:  { value: 'Q83307'  }, // subclas of: minister
    P17:   { value: meta.country ? meta.country.id : meta.jurisdiction.id },
    P1001: { value: meta.jurisdiction.id },
    P361:  { value: meta.cabinet.parent }
  }

  return {
    type: 'item',
    labels: {
      en: labelEN,
      fr: labelFR,
    },
    descriptions: {
      en: `cabinet position in ${meta.jurisdiction.name}`,
    },
    claims: claims
  }
}
