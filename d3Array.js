[[1, 2, 3], [101, 2, 1, 10], [2, 1]].reduce(function(p, v){ return d3.set(p).add(v); })

[[1, 2, 3], [101, 2, 1, 10], [2, 1]].reduce(function(p, v){ return p.filter(function(pd){ return v.some( function(vd){ return pd == vd; }); }); });