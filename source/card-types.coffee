
module.exports = [
  {
    name: "visa",
    pattern: /^4/,
    length: 16
  }
  {
    name: "mastercard",
    pattern: /^5[0-5]/,
    length: 16
  }
  {
    name: "dinersclub",
    pattern: /^3[0689]/,
    length: 14
  }
  {
    name: "discover",
    pattern: /^6([045]|22)/,
    length: 16
  }
  {
    name: "jcb",
    pattern: /^35/,
    length: 16
  }
];
