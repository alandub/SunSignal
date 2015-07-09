
SerialIO.list() @=> string list[];

SinOsc  piano => NRev rvrb => ResonZ rez => LPF low => Gain inGain;
SinOsc piano2 => NRev rvrb2 => ResonZ rez2 => LPF low2 => dac;

70 => low.freq;
70 => low2.freq;

[50, Math.random2(2, 60),57,Math.random2(2, 60),50] @=> int A[];
[55, Math.random2(2, 100),62,Math.random2(2, 40),50] @=> int b[];

  Shakers shak => ResonZ rez3 => dac;
        //22 => shak.preset;
       // 0.7 => master.gain;





0.09::second => dur h;
Math.random2f(0.01, 0.9)::second => dur q;
[q,q,q,h,q,q,h,q] @=> dur myDurs[];

Delay d[7]; //delay of arrays

inGain => d[0];
inGain => d[1];
inGain => d[2];
inGain => d[3];
inGain => d[4];
inGain => d[5];
inGain => d[6];

0.4::second => d[0].max => d[0].delay; 
0.8::second => d[1].max => d[1].delay; 
0.16::second => d[2].max => d[2].delay; 
0.32::second => d[3].max => d[3].delay; 
0.64::second => d[4].max => d[4].delay; 
0.70::second => d[5].max => d[5].delay; 
1::second => d[6].max => d[6].delay; 

d[0] => d[0] => dac;
d[0] => d[1] => dac;
d[0] => d[2] => dac;
d[0] => d[3] => dac;
d[0] => d[4] => dac;
d[0] => d[5] => dac;
d[0] => d[6] => dac;

0.6 => d[0].gain => d[1].gain => d[2].gain => d[3].gain;       // feedback

///////////////
for(int i; i < list.cap(); i++)
{
    chout <= i <= ": " <= list[i] <= IO.newline();
}

0 => int device;
if(me.args()) me.arg(0) => Std.atoi => device;

SerialIO cereal;
cereal.open(device, SerialIO.B9600, SerialIO.ASCII);

while(true)
{
    cereal.onInts(4) => now;
    cereal.getInts() @=> int ints[];
    chout <= "ints: ";
   for(int i; i < ints.cap(); i++)
    {
        chout <= ints[i] <= " ";
  
        [ints[0], ints[1], ints[2], ints[3]] @=> int A[];
        for( 0 => int b; b < A.cap(); b++)
    
{

while(true)
{
    cereal.onInts(4) => now;
    cereal.getInts() @=> int ints[];
    chout <= "ints: ";
   for(int i; i < ints.cap(); i++)
    {
        chout <= ints[i] <= " ";
  
        [ints[0], ints[1], ints[2], ints[3]] @=> int A[];
        for( 0 => int b; b < A.cap(); b++) 
    
{
       
  Std.ftom(A[b]*10) => piano.freq;
    50 => low.freq;
    0.4 => piano.gain;
    
0.01::ms => now;
    /////////////////////////////////////shakers
           if( (A[b])> 250 )
                    {
                        
                  for( 0 => int i; i < (A[b]/70); i++)
{      
                        
                    i    => shak.preset;
          i => shak.objects;
            Math.random2f(0.0, 1.0) => shak.decay;
            (A[b]) => shak.energy;   

                    } 
    
    
    
                }
    }
}
    chout <= IO.newline();
}
}
}
}