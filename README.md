This code can test approximate measurement invariance(Alignment).

See here for more detail on "Alignment"(in Mplus).

https://www.statmodel.com/Alignment.shtml

----------------------------------------------------------------------------------------------------------------------------------------

Analysis using this code yields the same results as Mplus with the same input data.

The differences between Mplus alignment and my code are,
1) Some of the details of the alignment algorithm are not shown. (ex. sample weight, variable standardization)
2) Mplus alignment can only use raw data as input data (not summary data).
   But, my code can analyze summary data as input.
3) Mplus alignment can only analysis simple structure model(without cross-loading).

Because of these differences, this code can analysis second-order model.

I have implemented this while studying my master's thesis.

See here for more detail.

http://www.riss.kr/link?id=T15073557

----------------------------------------------------------------------------------------------------------------------------------------
