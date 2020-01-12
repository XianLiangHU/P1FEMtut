function [ quad_w, quad_xy ] = quad_rule ( quad_num )
% function [ quad_w, quad_xy ] = quad_rule ( quad_num )
% remember to multiply the area of the master element, whic is 0.5 !!
% 
%% QUAD_RULE sets the quadrature rule for assembly.
%
%  Discussion:
%
%    The quadrature rule is given for a reference element, points (X,Y) such that
%
%      0 <= X,
%      0 <= Y, and
%      X + Y <= 1.
%
%      ^
%    1 | *
%      | |\
%    Y | | \
%      | |  \
%    0 | *---*
%      +------->
%        0 X 1
%
%    The rules have the following precision:
%
%    QUAD_NUM  Precision
%
%     1        1
%     3        2
%     4        3
%     6        4
%     7        5
%     9        6
%    13        7
%
%   73        20    % add by Xian-Liang Hu
%
%  Modified:
%
%    17 July 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer QUAD_NUM, the number of quadrature nodes.
%    Legal values are 1, 3, 4, 6, 7, 9, 13.
%
%    Output, real QUAD_W(QUAD_NUM), the quadrature weights.
%
%    Output, real QUAD_XY(2,QUAD_NUM), the quadrature nodes.
%
  if ( quad_num == 1 )

    quad_xy = [ 1.0 / 3.0, 1.0 / 3.0 ];

    quad_w = 1.0;

  elseif ( quad_num == 3 )

    quad_xy = [ ...
      0.5, 0.0; ...
      0.5, 0.5; ...
      0.0, 0.5 ];

    quad_w = 1.0 / 3.0;

  elseif ( quad_num == 4 )

    a =   6.0;
    b =  10.0;
    c =  18.0;
    d =  25.0;
    e = -27.0;
    f =  30.0;
    g =  48.0;

    quad_xy = [ ...
      b, b; ...
      c, a; ...
      a, c; ...
      a, a ] / f;

    quad_w = [ e, d, d, d ]' / g;

  elseif ( quad_num == 6 )

    a = 0.816847572980459;
    b = 0.091576213509771;
    c = 0.108103018168070;
    d = 0.445948490915965;
    v = 0.109951743655322;
    w = 0.223381589678011;

    quad_xy = [ 
      a, b; ...
      b, a; ...
      b, b; ...
      c, d; ...
      d, c; ...
      d, d ];

    quad_w = [ v, v, v, w, w, w ]';

  elseif ( quad_num == 7 )

    a = 1.0 / 3.0;
    b = ( 9.0 + 2.0 * sqrt ( 15.0 ) ) / 21.0;
    c = ( 6.0 -       sqrt ( 15.0 ) ) / 21.0;
    d = ( 9.0 - 2.0 * sqrt ( 15.0 ) ) / 21.0;
    e = ( 6.0 +       sqrt ( 15.0 ) ) / 21.0;
    u = 0.225;
    v = ( 155.0 - sqrt ( 15.0 ) ) / 1200.0;
    w = ( 155.0 + sqrt ( 15.0 ) ) / 1200.0;

    quad_xy = [ ...
      a, a; ...
      b, c; ...
      c, b; ...
      c, c; ...
      d, e; ...
      e, d; ...
      e, e ];

    quad_w = [ u, v, v, v, w, w, w ]';

  elseif ( quad_num == 9 )

    a = 0.124949503233232;
    b = 0.437525248383384;
    c = 0.797112651860071;
    d = 0.165409927389841;
    e = 0.037477420750088;

    u = 0.205950504760887;
    v = 0.063691414286223;

    quad_xy = [ ...
      a, b; ...
      b, a; ...
      b, b; ...
      c, d; ...
      c, e; ...
      d, c; ...
      d, e; ...
      e, c; ...
      e, d ];

    quad_w = [ u, u, u, v, v, v, v, v, v ]';

  elseif ( quad_num == 13 )

    h = 1.0 / 3.0;
    a = 0.479308067841923;
    b = 0.260345966079038;
    c = 0.869739794195568;
    d = 0.065130102902216;
    e = 0.638444188569809;
    f = 0.312865496004875;
    g = 0.048690315425316;
    
    w = -0.149570044467670;
    t =  0.175615257433204;
    u =  0.053347235608839;
    v =  0.077113760890257;

    quad_xy = [ 
      h, h; ...
      a, b; ...
      b, a; ...
      b, b; ...
      c, d; ...
      d, c; ...
      d, d; ...
      e, f; ...
      e, g; ...
      f, e; ...
      f, g; ...
      g, e; ...
      g, f ];

    quad_w = [ w, t, t, t, u, u, u, v, v, v, v, v, v ]';
    
  else

%    warning ('So High Precision, it is time consuming!' );
    
p=[0.33333333333333   0.33333333333333   0.03290633138892
   0.02078002585399   0.48960998707301   0.01033073189127
   0.48960998707301   0.48960998707301   0.01033073189127
   0.48960998707301   0.02078002585399   0.01033073189127
   0.09092621460422   0.45453689269789   0.02238724726302
   0.45453689269789   0.45453689269789   0.02238724726302
   0.45453689269789   0.09092621460422   0.02238724726302
   0.19716663870114   0.40141668064943   0.03026612586947
   0.40141668064943   0.40141668064943   0.03026612586947
   0.40141668064943   0.19716663870114   0.03026612586947
   0.48889669119381   0.25555165440310   0.03049096780220
   0.25555165440310   0.25555165440310   0.03049096780220
   0.25555165440310   0.48889669119381   0.03049096780220
   0.64584411569574   0.17707794215213   0.02415921274164
   0.17707794215213   0.17707794215213   0.02415921274164
   0.17707794215213   0.64584411569574   0.02415921274164
   0.77987789354410   0.11006105322795   0.01605080358680
   0.11006105322795   0.11006105322795   0.01605080358680
   0.11006105322795   0.77987789354410   0.01605080358680
   0.88894275149632   0.05552862425184   0.00808458026178
   0.05552862425184   0.05552862425184   0.00808458026178
   0.05552862425184   0.88894275149632   0.00808458026178
   0.97475627244554   0.01262186377723   0.00207936202748
   0.01262186377723   0.01262186377723   0.00207936202748
   0.01262186377723   0.97475627244554   0.00207936202748
   0.00361141784841   0.39575478735694   0.00388487690498
   0.39575478735694   0.60063379479464   0.00388487690498
   0.60063379479464   0.00361141784841   0.00388487690498
   0.39575478735694   0.00361141784841   0.00388487690498
   0.60063379479464   0.39575478735694   0.00388487690498
   0.00361141784841   0.60063379479464   0.00388487690498
   0.13446675453078   0.30792998388044   0.02557416061202
   0.30792998388044   0.55760326158878   0.02557416061202
   0.55760326158878   0.13446675453078   0.02557416061202
   0.30792998388044   0.13446675453078   0.02557416061202
   0.55760326158878   0.30792998388044   0.02557416061202
   0.13446675453078   0.55760326158878   0.02557416061202
   0.01444602577612   0.26456694840652   0.00888090357334
   0.26456694840652   0.72098702581736   0.00888090357334
   0.72098702581736   0.01444602577612   0.00888090357334
   0.26456694840652   0.01444602577612   0.00888090357334
   0.72098702581736   0.26456694840652   0.00888090357334
   0.01444602577612   0.72098702581736   0.00888090357334
   0.04693357883818   0.35853935220595   0.01612454676173
   0.35853935220595   0.59452706895587   0.01612454676173
   0.59452706895587   0.04693357883818   0.01612454676173
   0.35853935220595   0.04693357883818   0.01612454676173
   0.59452706895587   0.35853935220595   0.01612454676173
   0.04693357883818   0.59452706895587   0.01612454676173
   0.00286112035057   0.15780740596859   0.00249194181749
   0.15780740596859   0.83933147368084   0.00249194181749
   0.83933147368084   0.00286112035057   0.00249194181749
   0.15780740596859   0.00286112035057   0.00249194181749
   0.83933147368084   0.15780740596859   0.00249194181749
   0.00286112035057   0.83933147368084   0.00249194181749
   0.22386142409792   0.07505059697591   0.01824284011895
   0.07505059697591   0.70108797892617   0.01824284011895
   0.70108797892617   0.22386142409792   0.01824284011895
   0.07505059697591   0.22386142409792   0.01824284011895
   0.70108797892617   0.07505059697591   0.01824284011895
   0.22386142409792   0.70108797892617   0.01824284011895
   0.03464707481676   0.14242160111338   0.01025856373620
   0.14242160111338   0.82293132406986   0.01025856373620
   0.82293132406986   0.03464707481676   0.01025856373620
   0.14242160111338   0.03464707481676   0.01025856373620
   0.82293132406986   0.14242160111338   0.01025856373620
   0.03464707481676   0.82293132406986   0.01025856373620
   0.01016111929628   0.06549462808294   0.00379992885530
   0.06549462808294   0.92434425262078   0.00379992885530
   0.92434425262078   0.01016111929628   0.00379992885530
   0.06549462808294   0.01016111929628   0.00379992885530
   0.92434425262078   0.06549462808294   0.00379992885530
   0.01016111929628   0.92434425262078   0.00379992885530];

quad_xy = p(:,1:2);
quad_w = p(:,3);

  end