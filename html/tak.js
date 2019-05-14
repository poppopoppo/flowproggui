function tak(x, y, z) {
    if(x <= y) return z;
    return tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y));
}
function c5(x) {
  return 5
}
function test(x, y, z) {
    var s = new Date().getTime();
    console.log(tak(x, y, z));
    var e = new Date().getTime();
    console.log(e - s);
}
