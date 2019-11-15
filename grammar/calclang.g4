grammar calclang;

import macro;

exp     : basic_exp;

basic_exp : numexp OP_L1 numexp;