// Type your code here, or load an example.
int tak(int x,int y,int z) {
if (y<x) 
    return tak(tak(x-1, y, z), tak(y-1, z, x), tak(z-1, x, y));
  else return z;} 
int main () { 
     tak(22,11,0);
}
