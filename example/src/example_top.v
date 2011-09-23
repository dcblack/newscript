// Project: winnie
// Design:  example
// FILE:   ABOUT_example.txt
/*/////////////////////////////////////////////////////////////////////////
Widgets Inc. PROPRIETARY AND CONFIDENTIAL
Copyright 2010 Widgets Inc..

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

/*/////////////////////////////////////////////////////////////////////////
// {:LONG_DESCRIPTION:}
//
// Author :       {:AUTHOR:}
// Contact info : {:EMAIL:}
///////////////////////////////////////////////////////////////////////////
// Version control information
//
// $Source$
// $Id$
// $Revision$
///////////////////////////////////////////////////////////////////////////
//
// This is the top-level harness that connects the DUT to the test.

module example_top;
  // Declare registers and wires
  wire [1-1:0] clk;
  wire [1-1:0] data_in;
  wire [1-1:0] data_out;

  // Instantiate and connect DUT to TEST
  widget2_rtl the_dut
  ( .clk(clk)
  , .data_in(data_in)
  , .data_out(data_out)
  );

  basic_test the_test
  ( .clk(clk)
  , .data_in(data_in)
  , .data_out(data_out)
  );

endmodule
