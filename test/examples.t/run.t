Remember that you can update the test's output by using 'dune promote'.
  $ touist --solve --sat sat_sudoku.touist
  0 p(3,3,4)
  1 p(1,4,3)
  0 p(3,1,1)
  0 p(4,2,1)
  1 p(2,2,1)
  0 p(3,2,2)
  0 p(1,4,2)
  0 p(1,1,4)
  1 p(2,4,2)
  0 p(1,2,3)
  1 p(1,3,1)
  0 p(2,3,1)
  0 p(4,1,3)
  1 p(1,1,2)
  0 p(3,2,1)
  0 p(4,3,4)
  0 p(2,3,3)
  0 p(2,4,3)
  0 p(4,3,2)
  1 p(3,1,4)
  1 p(2,3,4)
  0 p(4,1,2)
  0 p(4,3,1)
  0 p(3,4,2)
  0 p(2,2,4)
  0 p(1,2,2)
  0 p(4,2,4)
  0 p(2,1,2)
  0 p(4,4,3)
  1 p(4,4,4)
  0 p(2,2,3)
  0 p(3,2,4)
  0 p(3,4,4)
  0 p(1,3,4)
  0 p(3,1,2)
  1 p(1,2,4)
  0 p(1,3,2)
  0 p(3,1,3)
  0 p(2,1,4)
  0 p(3,3,3)
  0 p(1,1,1)
  0 p(4,2,3)
  0 p(1,4,1)
  1 p(4,3,3)
  0 p(1,3,3)
  0 p(2,1,1)
  0 p(4,4,2)
  0 p(1,4,4)
  0 p(3,3,1)
  1 p(3,4,1)
  0 p(4,1,4)
  0 p(2,2,2)
  0 p(1,2,1)
  1 p(3,3,2)
  0 p(2,3,2)
  1 p(4,1,1)
  1 p(2,1,3)
  1 p(4,2,2)
  0 p(3,4,3)
  0 p(2,4,4)
  0 p(4,4,1)
  1 p(3,2,3)
  0 p(1,1,3)
  0 p(2,4,1)

  $ touist --solve --smt QF_BV sat_sudoku.touist
  0 p(1,2,3)
  0 p(2,1,2)
  1 p(1,4,3)
  0 p(4,4,3)
  0 p(4,3,4)
  1 p(4,2,2)
  0 p(3,4,3)
  0 p(4,2,1)
  1 p(2,4,2)
  0 p(4,4,2)
  1 p(3,2,3)
  0 p(1,3,2)
  0 p(4,3,2)
  1 p(3,1,4)
  1 p(1,3,1)
  0 p(4,1,3)
  1 p(3,3,2)
  0 p(1,3,4)
  0 p(3,1,3)
  0 p(4,3,1)
  0 p(2,1,1)
  0 p(1,4,1)
  0 p(1,1,4)
  1 p(1,2,4)
  0 p(3,1,1)
  1 p(4,3,3)
  0 p(3,3,4)
  0 p(1,4,2)
  0 p(2,4,3)
  1 p(2,3,4)
  1 p(1,1,2)
  0 p(3,2,4)
  0 p(2,2,2)
  0 p(3,3,1)
  1 p(2,2,1)
  0 p(4,4,1)
  1 p(4,1,1)
  0 p(2,2,4)
  0 p(1,1,1)
  0 p(3,3,3)
  0 p(3,2,1)
  0 p(4,2,3)
  0 p(4,1,2)
  0 p(2,4,4)
  0 p(3,2,2)
  0 p(2,4,1)
  0 p(1,4,4)
  0 p(1,2,2)
  0 p(3,4,2)
  0 p(2,3,3)
  0 p(2,1,4)
  1 p(2,1,3)
  1 p(4,4,4)
  0 p(2,3,1)
  0 p(2,2,3)
  0 p(1,2,1)
  0 p(1,1,3)
  1 p(3,4,1)
  0 p(3,1,2)
  0 p(1,3,3)
  0 p(4,2,4)
  0 p(4,1,4)
  0 p(3,4,4)
  0 p(2,3,2)

  $ touist --solve --smt QF_BV sat_sudoku.touist
  0 p(1,2,3)
  0 p(2,1,2)
  1 p(1,4,3)
  0 p(4,4,3)
  0 p(4,3,4)
  1 p(4,2,2)
  0 p(3,4,3)
  0 p(4,2,1)
  1 p(2,4,2)
  0 p(4,4,2)
  1 p(3,2,3)
  0 p(1,3,2)
  0 p(4,3,2)
  1 p(3,1,4)
  1 p(1,3,1)
  0 p(4,1,3)
  1 p(3,3,2)
  0 p(1,3,4)
  0 p(3,1,3)
  0 p(4,3,1)
  0 p(2,1,1)
  0 p(1,4,1)
  0 p(1,1,4)
  1 p(1,2,4)
  0 p(3,1,1)
  1 p(4,3,3)
  0 p(3,3,4)
  0 p(1,4,2)
  0 p(2,4,3)
  1 p(2,3,4)
  1 p(1,1,2)
  0 p(3,2,4)
  0 p(2,2,2)
  0 p(3,3,1)
  1 p(2,2,1)
  0 p(4,4,1)
  1 p(4,1,1)
  0 p(2,2,4)
  0 p(1,1,1)
  0 p(3,3,3)
  0 p(3,2,1)
  0 p(4,2,3)
  0 p(4,1,2)
  0 p(2,4,4)
  0 p(3,2,2)
  0 p(2,4,1)
  0 p(1,4,4)
  0 p(1,2,2)
  0 p(3,4,2)
  0 p(2,3,3)
  0 p(2,1,4)
  1 p(2,1,3)
  1 p(4,4,4)
  0 p(2,3,1)
  0 p(2,2,3)
  0 p(1,2,1)
  0 p(1,1,3)
  1 p(3,4,1)
  0 p(3,1,2)
  0 p(1,3,3)
  0 p(4,2,4)
  0 p(4,1,4)
  0 p(3,4,4)
  0 p(2,3,2)

  $ touist --solve --qbf sat_sudoku.touist
  1 p(4,4,4)
  0 p(2,2,2)
  0 p(3,2,2)
  0 p(1,1,3)
  0 p(1,2,3)
  1 p(1,3,1)
  0 p(2,1,4)
  0 p(3,4,2)
  0 p(3,4,4)
  0 p(2,3,3)
  0 p(3,1,1)
  0 p(2,3,2)
  0 p(2,1,1)
  0 p(1,3,2)
  0 p(3,2,4)
  0 p(4,2,3)
  1 p(2,2,1)
  0 p(3,3,1)
  0 p(1,2,2)
  0 p(2,4,1)
  0 p(4,1,3)
  0 p(2,2,3)
  0 p(1,1,1)
  1 p(4,1,1)
  0 p(3,1,3)
  0 p(4,1,4)
  0 p(3,3,4)
  0 p(4,4,1)
  0 p(4,4,3)
  0 p(4,2,4)
  0 p(2,4,4)
  0 p(1,2,1)
  0 p(1,4,4)
  1 p(1,4,3)
  1 p(2,3,4)
  0 p(4,4,2)
  0 p(1,3,3)
  0 p(3,4,3)
  0 p(2,1,2)
  0 p(4,2,1)
  1 p(2,4,2)
  0 p(1,1,4)
  1 p(4,3,3)
  0 p(3,2,1)
  0 p(1,4,1)
  1 p(1,2,4)
  0 p(2,2,4)
  0 p(4,3,2)
  0 p(4,1,2)
  0 p(4,3,4)
  1 p(2,1,3)
  1 p(3,3,2)
  0 p(1,3,4)
  1 p(4,2,2)
  1 p(3,2,3)
  1 p(3,1,4)
  1 p(1,1,2)
  0 p(2,4,3)
  0 p(3,1,2)
  0 p(4,3,1)
  0 p(3,3,3)
  0 p(1,4,2)
  1 p(3,4,1)
  0 p(2,3,1)

  $ touist --qbf --solve qbf_allumettes2.touist
  ? tour_de_0(5)
  ? reste(2,0)
  ? reste(0,1)
  ? prend(4,2)
  ? reste(0,3)
  ? reste(5,3)
  ? reste(1,3)
  ? tour_de_0(1)
  ? tour_de_0(2)
  ? reste(3,1)
  ? reste(4,4)
  ? reste(0,0)
  ? reste(3,0)
  ? reste(5,2)
  ? reste(0,4)
  ? reste(5,0)
  ? reste(4,3)
  ? reste(2,4)
  0 prend(0,2)
  ? tour_de_0(4)
  ? prend(2,2)
  ? reste(3,4)
  ? reste(2,3)
  ? reste(4,1)
  ? prend(1,2)
  ? prend(3,2)
  ? 0_a_perdu
  ? reste(5,1)
  ? reste(1,1)
  ? reste(1,0)
  ? tour_de_0(3)
  ? reste(1,2)
  ? reste(2,1)
  ? reste(0,2)
  ? reste(3,2)
  ? tour_de_0(0)
  ? reste(4,0)
  ? reste(3,3)
  ? reste(1,4)
  ? reste(4,2)
  ? reste(2,2)

  $ touist --solve --smt QF_IDL smt_takuzu4x4.touist
  0 x(4,4)
  1 x(1,2)
  1 x(4,2)
  1 x(3,3)
  0 x(1,1)
  0 x(3,2)
  0 x(3,1)
  1 x(4,1)
  0 x(2,3)
  0 x(1,4)
  1 x(3,4)
  1 x(1,3)
  0 x(4,3)
  1 x(2,4)
  1 x(2,1)
  0 x(2,2)