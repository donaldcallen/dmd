/*
TEST_OUTPUT:
---
fail_compilation/iconv_interface_array.d(45): Error: function `iconv_interface_array.testA(I1[4] arr)` is not callable using argument types `(C[4])`
fail_compilation/iconv_interface_array.d(45):        cannot pass argument `arr` of type `C[4]` to parameter `I1[4] arr`
fail_compilation/iconv_interface_array.d(46): Error: function `iconv_interface_array.testB(I2[4] arr)` is not callable using argument types `(C[4])`
fail_compilation/iconv_interface_array.d(46):        cannot pass argument `arr` of type `C[4]` to parameter `I2[4] arr`
fail_compilation/iconv_interface_array.d(47): Error: function `iconv_interface_array.testC(I3[4] arr)` is not callable using argument types `(C[4])`
fail_compilation/iconv_interface_array.d(47):        cannot pass argument `arr` of type `C[4]` to parameter `I3[4] arr`
---
*/

interface I1 { int a(int); }
interface I2 { int b(int); }
interface I3 { int c(int); }

class C : I1, I2, I3
{
    int a(int i) { return 1 * i; }
    int b(int i) { return 2 * i; }
    int c(int i) { return 3 * i; }
}

void testA(I1[4] arr)
{
    foreach (uint idx, obj; arr)
        assert(obj.a(idx) == 1 * idx);
}

void testB(I2[4] arr)
{
    foreach (idx, obj; arr)
        assert(obj.b(cast(int) idx) == 2 * idx);
}

void testC(I3[4] arr)
{
    foreach (idx, obj; arr)
        assert(obj.c(cast(int) idx) == 3 * idx);
}

void main()
{
    C[4] arr = [ new C, new C, new C, new C ];
    testA(arr);
    testB(arr);
    testC(arr);
}
