[identifier "i", identifier "Int", identifier "arr"[identifier "i"] == identifier "a"]
// Generated by flintc


var totalValue_Wei: int;

var receivedValue_Wei: int;

var sentValue_Wei: int;

type Address = int;

procedure {:inline 10} send(address: Address, wei: int)
  // Pre Conditions
  
// #MARKER# 6544372813494344928
requires ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Post Conditions
  
// #MARKER# 2608974691980448960
ensures ((rawValue_Wei[wei] == 0));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
modifies rawValue_Wei;
{
// Local variable declarations


// send's implementation

// #MARKER# 2608974691980448960
rawValue_Wei[wei] := 0;
// #MARKER# 2608974691980448960
}

function power(n: int, e: int) returns (result: int);

axiom (forall n: int :: (power(n, 0) == 1));

axiom (forall n: int, e: int :: (((e > 0) && ((e mod 2) == 0)) ==> (power(n, e) == (power(n, (e div 2)) * power(n, (e div 2))))));

axiom (forall n: int, e: int :: (((e > 0) && ((e mod 2) == 1)) ==> (power(n, e) == ((power(n, ((e - 1) div 2)) * power(n, ((e - 1) div 2))) * n))));

var nextInstance_Wei: int;

var rawValue_Wei: [int]int;

procedure {:inline 10} setRawValueInt_Wei(struct_instance_setRawValueInt_Wei_Su76OOoep1: int, value_setRawValueInt_Wei: int) returns ( result_variable_setRawValueInt_Wei_yhLGCPD4Vi: int)
  // Pre Conditions
  
// #MARKER# -3506632638733014505
requires (((struct_instance_setRawValueInt_Wei_Su76OOoep1 < nextInstance_Wei) && (struct_instance_setRawValueInt_Wei_Su76OOoep1 >= 0)));
// #MARKER# -484016684236748542
requires ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
requires ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Post Conditions
  
// #MARKER# -532282456519145403
ensures ((rawValue_Wei[struct_instance_setRawValueInt_Wei_Su76OOoep1] == value_setRawValueInt_Wei));
// #MARKER# 5074060099631592924
ensures ((result_variable_setRawValueInt_Wei_yhLGCPD4Vi == value_setRawValueInt_Wei));
// #MARKER# -484016684236748542
ensures ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
modifies rawValue_Wei;
{
// Local variable declarations


// setRawValueInt_Wei's implementation

// #MARKER# 4575017687460265014
rawValue_Wei[struct_instance_setRawValueInt_Wei_Su76OOoep1] := value_setRawValueInt_Wei;
// #MARKER# -8212698385712821778
result_variable_setRawValueInt_Wei_yhLGCPD4Vi := rawValue_Wei[struct_instance_setRawValueInt_Wei_Su76OOoep1];
// #MARKER# -8212698385712821778
return;
// #MARKER# -3506632638733014505
}

procedure {:inline 10} getRawValue_Wei(struct_instance_getRawValue_Wei_erDqwiAeHG: int) returns ( result_variable_getRawValue_Wei_C0iJC3fnyS: int)
  // Pre Conditions
  
// #MARKER# -1738583773570056174
requires (((struct_instance_getRawValue_Wei_erDqwiAeHG < nextInstance_Wei) && (struct_instance_getRawValue_Wei_erDqwiAeHG >= 0)));
// #MARKER# -484016684236748542
requires ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
requires ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Post Conditions
  
// #MARKER# -9136097508901472450
ensures ((result_variable_getRawValue_Wei_C0iJC3fnyS == rawValue_Wei[struct_instance_getRawValue_Wei_erDqwiAeHG]));
// #MARKER# -484016684236748542
ensures ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
{
// Local variable declarations


// getRawValue_Wei's implementation

// #MARKER# 4247667097237208671
result_variable_getRawValue_Wei_C0iJC3fnyS := rawValue_Wei[struct_instance_getRawValue_Wei_erDqwiAeHG];
// #MARKER# 4247667097237208671
return;
// #MARKER# -1738583773570056174
}

procedure {:inline 10} transfer$inoutWeiInt_Wei(struct_instance_transfer$inoutWeiInt_Wei_Z91prGSXlT: int, source_transfer$inoutWeiInt_Wei: int, amount_transfer$inoutWeiInt_Wei: int)
  // Pre Conditions
  
// #MARKER# 5724162828431341664
requires ((source_transfer$inoutWeiInt_Wei < nextInstance_Wei));
// #MARKER# 5724162828431341664
requires (((source_transfer$inoutWeiInt_Wei < nextInstance_Wei) && (source_transfer$inoutWeiInt_Wei >= 0)));
// #MARKER# -1446273890310787622
requires (((struct_instance_transfer$inoutWeiInt_Wei_Z91prGSXlT < nextInstance_Wei) && (struct_instance_transfer$inoutWeiInt_Wei_Z91prGSXlT >= 0)));
// #MARKER# -484016684236748542
requires ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
requires ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Post Conditions
  
// #MARKER# -484016684236748542
ensures ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
modifies rawValue_Wei;
{
// Local variable declarations

var v_xQLmlN30Ji: int;
var v_BOrFWLE4Rb: int;
var v_BtqffXARLR: int;
var v_1Cxrcalpzw: int;
var v_lSjOkmSHwa: int;
var unused1_transfer$inoutWeiInt_Wei: int;
var unused2_transfer$inoutWeiInt_Wei: int;

// transfer$inoutWeiInt_Wei's implementation

// #MARKER# 3722678256237369477
call v_lSjOkmSHwa :=  getRawValue_Wei(source_transfer$inoutWeiInt_Wei);
// #MARKER# -7969413514742600262
if ((v_lSjOkmSHwa < amount_transfer$inoutWeiInt_Wei)) {
  
// #MARKER# -1740381050585037709
assume (false);
  // #MARKER# -7969413514742600262
} else {
  
  // #MARKER# -7969413514742600262
}
// #MARKER# -6086834100354640088
call v_BOrFWLE4Rb :=  getRawValue_Wei(source_transfer$inoutWeiInt_Wei);
// #MARKER# -480959040721161073
call v_1Cxrcalpzw :=  setRawValueInt_Wei(source_transfer$inoutWeiInt_Wei, (v_BOrFWLE4Rb - amount_transfer$inoutWeiInt_Wei));
// #MARKER# -8645903123379757024
unused1_transfer$inoutWeiInt_Wei := v_1Cxrcalpzw;
// #MARKER# 5527828449228412598
call v_BtqffXARLR :=  getRawValue_Wei(struct_instance_transfer$inoutWeiInt_Wei_Z91prGSXlT);
// #MARKER# 1987921001197329042
call v_xQLmlN30Ji :=  setRawValueInt_Wei(struct_instance_transfer$inoutWeiInt_Wei_Z91prGSXlT, (v_BtqffXARLR + amount_transfer$inoutWeiInt_Wei));
// #MARKER# 4378210032731545511
unused2_transfer$inoutWeiInt_Wei := v_xQLmlN30Ji;
// #MARKER# -1446273890310787622
}

procedure {:inline 10} transfer$inoutWei_Wei(struct_instance_transfer$inoutWei_Wei_ThwCMSzLj4: int, source_transfer$inoutWei_Wei: int)
  // Pre Conditions
  
// #MARKER# -6726970953833437233
requires ((source_transfer$inoutWei_Wei < nextInstance_Wei));
// #MARKER# -6726970953833437233
requires (((source_transfer$inoutWei_Wei < nextInstance_Wei) && (source_transfer$inoutWei_Wei >= 0)));
// #MARKER# -6854682943200952932
requires (((struct_instance_transfer$inoutWei_Wei_ThwCMSzLj4 < nextInstance_Wei) && (struct_instance_transfer$inoutWei_Wei_ThwCMSzLj4 >= 0)));
// #MARKER# -484016684236748542
requires ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
requires ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Post Conditions
  
// #MARKER# -484016684236748542
ensures ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
modifies rawValue_Wei;
{
// Local variable declarations

var v_YqUDT1zCVG: int;

// transfer$inoutWei_Wei's implementation

// #MARKER# 7398310683918395634
call v_YqUDT1zCVG :=  getRawValue_Wei(source_transfer$inoutWei_Wei);
// #MARKER# 3869925955367118003
call  transfer$inoutWeiInt_Wei(struct_instance_transfer$inoutWei_Wei_ThwCMSzLj4, source_transfer$inoutWei_Wei, v_YqUDT1zCVG);
// #MARKER# -6854682943200952932
}

procedure {:inline 10} initInt_Wei(unsafeRawValue_initInt_Wei: int) returns ( result_variable_initInt_Wei_Zqk7nLJP5d: int)
  // Pre Conditions
  
// #MARKER# -484016684236748542
requires ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
requires ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Post Conditions
  
// #MARKER# -2163417238979730679
ensures ((nextInstance_Wei == (old(nextInstance_Wei) + 1)));
// #MARKER# -484016684236748542
ensures ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
modifies nextInstance_Wei;
modifies rawValue_Wei;
modifies totalValue_Wei;
{
// Local variable declarations

var struct_instance_initInt_Wei_OnXtKP0DgI: int;

// initInt_Wei's implementation

// #MARKER# -2163417238979730679
struct_instance_initInt_Wei_OnXtKP0DgI := nextInstance_Wei;
// #MARKER# -2163417238979730679
nextInstance_Wei := (nextInstance_Wei + 1);
// #MARKER# 2608974691980448960
rawValue_Wei[struct_instance_initInt_Wei_OnXtKP0DgI] := 0;
// #MARKER# -7707892650026580624
if ((!(unsafeRawValue_initInt_Wei == 0))) {
  
// #MARKER# 5427791518663306538
assume (false);
  // #MARKER# -7707892650026580624
} else {
  
  // #MARKER# -7707892650026580624
}
// #MARKER# -7740908639149968192
rawValue_Wei[struct_instance_initInt_Wei_OnXtKP0DgI] := unsafeRawValue_initInt_Wei;
// #MARKER# -2163417238979730679
result_variable_initInt_Wei_Zqk7nLJP5d := struct_instance_initInt_Wei_OnXtKP0DgI;
// #MARKER# -2163417238979730679
totalValue_Wei := (totalValue_Wei + unsafeRawValue_initInt_Wei);
// #MARKER# -2163417238979730679
}

procedure {:inline 10} initBoolInt_Wei(youAreTheCompiler_initBoolInt_Wei: bool, unsafeRawValue_initBoolInt_Wei: int) returns ( result_variable_initBoolInt_Wei_3aagrqNrGo: int)
  // Pre Conditions
  
// #MARKER# -484016684236748542
requires ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
requires ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Post Conditions
  
// #MARKER# 2320951291204162405
ensures ((nextInstance_Wei == (old(nextInstance_Wei) + 1)));
// #MARKER# -484016684236748542
ensures ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
modifies nextInstance_Wei;
modifies rawValue_Wei;
{
// Local variable declarations

var struct_instance_initBoolInt_Wei_QfZbVcMBVO: int;

// initBoolInt_Wei's implementation

// #MARKER# 2320951291204162405
struct_instance_initBoolInt_Wei_QfZbVcMBVO := nextInstance_Wei;
// #MARKER# 2320951291204162405
nextInstance_Wei := (nextInstance_Wei + 1);
// #MARKER# 2608974691980448960
rawValue_Wei[struct_instance_initBoolInt_Wei_QfZbVcMBVO] := 0;
// #MARKER# 8926129328569135427
if ((youAreTheCompiler_initBoolInt_Wei == false)) {
  
// #MARKER# -3398862342136735600
assume (false);
  // #MARKER# 8926129328569135427
} else {
  
  // #MARKER# 8926129328569135427
}
// #MARKER# -6248338115578401175
rawValue_Wei[struct_instance_initBoolInt_Wei_QfZbVcMBVO] := unsafeRawValue_initBoolInt_Wei;
// #MARKER# 2320951291204162405
result_variable_initBoolInt_Wei_3aagrqNrGo := struct_instance_initBoolInt_Wei_QfZbVcMBVO;
// #MARKER# 2320951291204162405
}

procedure {:inline 10} init$inoutWeiInt_Wei(source_init$inoutWeiInt_Wei: int, amount_init$inoutWeiInt_Wei: int) returns ( result_variable_init$inoutWeiInt_Wei_T8kXZDY7cy: int)
  // Pre Conditions
  
// #MARKER# -8430979766374376725
requires ((source_init$inoutWeiInt_Wei < nextInstance_Wei));
// #MARKER# -8430979766374376725
requires (((source_init$inoutWeiInt_Wei < nextInstance_Wei) && (source_init$inoutWeiInt_Wei >= 0)));
// #MARKER# -484016684236748542
requires ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
requires ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Post Conditions
  
// #MARKER# -8688177217223442772
ensures ((nextInstance_Wei == (old(nextInstance_Wei) + 1)));
// #MARKER# -484016684236748542
ensures ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
modifies nextInstance_Wei;
modifies rawValue_Wei;
{
// Local variable declarations

var struct_instance_init$inoutWeiInt_Wei_AFDN6UKheT: int;

// init$inoutWeiInt_Wei's implementation

// #MARKER# -8688177217223442772
struct_instance_init$inoutWeiInt_Wei_AFDN6UKheT := nextInstance_Wei;
// #MARKER# -8688177217223442772
nextInstance_Wei := (nextInstance_Wei + 1);
// #MARKER# 2608974691980448960
rawValue_Wei[struct_instance_init$inoutWeiInt_Wei_AFDN6UKheT] := 0;
// #MARKER# -1536386432558451263
call  transfer$inoutWeiInt_Wei(struct_instance_init$inoutWeiInt_Wei_AFDN6UKheT, source_init$inoutWeiInt_Wei, amount_init$inoutWeiInt_Wei);
// #MARKER# -8688177217223442772
result_variable_init$inoutWeiInt_Wei_T8kXZDY7cy := struct_instance_init$inoutWeiInt_Wei_AFDN6UKheT;
// #MARKER# -8688177217223442772
}

procedure {:inline 10} init$inoutWei_Wei(source_init$inoutWei_Wei: int) returns ( result_variable_init$inoutWei_Wei_lOoHLoLqJU: int)
  // Pre Conditions
  
// #MARKER# -1860016370114175399
requires ((source_init$inoutWei_Wei < nextInstance_Wei));
// #MARKER# -1860016370114175399
requires (((source_init$inoutWei_Wei < nextInstance_Wei) && (source_init$inoutWei_Wei >= 0)));
// #MARKER# -484016684236748542
requires ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
requires ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Post Conditions
  
// #MARKER# -2324245010589670505
ensures ((nextInstance_Wei == (old(nextInstance_Wei) + 1)));
// #MARKER# -484016684236748542
ensures ((nextInstance_Wei >= 0));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
modifies rawValue_Wei;
modifies nextInstance_Wei;
{
// Local variable declarations

var struct_instance_init$inoutWei_Wei_rZdjfat64z: int;

// init$inoutWei_Wei's implementation

// #MARKER# -2324245010589670505
struct_instance_init$inoutWei_Wei_rZdjfat64z := nextInstance_Wei;
// #MARKER# -2324245010589670505
nextInstance_Wei := (nextInstance_Wei + 1);
// #MARKER# 2608974691980448960
rawValue_Wei[struct_instance_init$inoutWei_Wei_rZdjfat64z] := 0;
// #MARKER# -6795393604740171980
call  transfer$inoutWei_Wei(struct_instance_init$inoutWei_Wei_rZdjfat64z, source_init$inoutWei_Wei);
// #MARKER# -2324245010589670505
result_variable_init$inoutWei_Wei_lOoHLoLqJU := struct_instance_init$inoutWei_Wei_rZdjfat64z;
// #MARKER# -2324245010589670505
}

var caller_Test: Address;

var size_0_arr_Test: int;

var arr_Test: [int]int;

var numWrites_Test: int;

var stateVariable_Test: int;

procedure {:inline 10} init_Test()
  // Pre Conditions
  
// #MARKER# -484016684236748542
requires ((nextInstance_Wei >= 0));
  // Post Conditions
  
// #MARKER# -484016684236748542
ensures ((nextInstance_Wei >= 0));
// #MARKER# -503242973655547174
ensures ((size_0_arr_Test == numWrites_Test));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
modifies numWrites_Test;
modifies size_0_arr_Test;
modifies arr_Test;
modifies stateVariable_Test;
modifies sentValue_Wei;
modifies totalValue_Wei;
modifies receivedValue_Wei;
{
// Local variable declarations

var lit_cwMstom3D4: [int]int;
var size_0_lit_cwMstom3D4: int;

// init_Test's implementation

// #MARKER# 4360439619496398930
totalValue_Wei := 0;
// #MARKER# 4360439619496398930
sentValue_Wei := 0;
// #MARKER# 4360439619496398930
receivedValue_Wei := 0;
// #MARKER# -5923640055160824755
assume ((size_0_arr_Test >= 0));
// #MARKER# 2608974691980448960
numWrites_Test := 0;
// #MARKER# -928938075670249298
size_0_lit_cwMstom3D4 := 0;
// #MARKER# -1572548186981839354
arr_Test := lit_cwMstom3D4;
// #MARKER# -1572548186981839354
size_0_arr_Test := size_0_lit_cwMstom3D4;
// #MARKER# 4360439619496398930
}

procedure {:inline 10} addInt_Test(a_addInt_Test: int)
  // Pre Conditions
  
// #MARKER# -484016684236748542
requires ((nextInstance_Wei >= 0));
// #MARKER# -503242973655547174
requires ((size_0_arr_Test == numWrites_Test));
// #MARKER# 6544372813494344928
requires ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Post Conditions
  
// #MARKER# -2366029235000280100
ensures ((numWrites_Test == (old(numWrites_Test) + 1)));
// #MARKER# 6733810719892473033
ensures ((exists i: int :: (arr_Test[i] == a_addInt_Test)));
// #MARKER# -484016684236748542
ensures ((nextInstance_Wei >= 0));
// #MARKER# -503242973655547174
ensures ((size_0_arr_Test == numWrites_Test));
// #MARKER# 6544372813494344928
ensures ((totalValue_Wei == (receivedValue_Wei - sentValue_Wei)));
  // Modifies
  
modifies size_0_arr_Test;
modifies numWrites_Test;
modifies arr_Test;
{
// Local variable declarations


// addInt_Tes