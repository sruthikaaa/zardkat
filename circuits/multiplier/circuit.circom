pragma circom 2.0.0;

/This circuit template checks that c is the multiplication of a and b./  

template Multiplier2 () {  
   signal input a;
   signal input b;

   signal x; //intermediates
   signal y;

   signal output Q;

   component ANDgate=AND();
   component ORgate=OR();
   component NOTgate=NOT();

   ANDgate.a <== a ;
   ANDgate.b <== b ;
   x <== ANDgate.out ;

   NOTgate.in <== b ;
   y <== NOTgate.out;

   ORgate.a <== x;
   ORgate.b <== y;
   Q <== ORgate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
