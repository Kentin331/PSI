/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/qmouret/Documents/4A/PSI_ARCHIMAT/Data_Memory.vhd";
extern char *IEEE_P_3499444699;



static void work_a_1632567566_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    int t12;
    int t13;
    char *t14;
    char *t15;
    unsigned char t16;
    char *t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1632U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3584);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 1512U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)2);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB18;

LAB20:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)2);
    if (t3 != 0)
        goto LAB21;

LAB23:
LAB22:
LAB19:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1672U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(45, ng0);
    t4 = (t0 + 8288);
    *((int *)t4) = 0;
    t11 = (t0 + 8292);
    *((int *)t11) = 255;
    t12 = 0;
    t13 = 255;

LAB11:    if (t12 <= t13)
        goto LAB12;

LAB14:    goto LAB9;

LAB12:    xsi_set_current_line(46, ng0);
    t14 = (t0 + 8296);
    t16 = (8U != 8U);
    if (t16 == 1)
        goto LAB15;

LAB16:    t17 = (t0 + 8288);
    t18 = *((int *)t17);
    t19 = (t18 - 0);
    t20 = (t19 * 1);
    t21 = (8U * t20);
    t22 = (0U + t21);
    t23 = (t0 + 3664);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t14, 8U);
    xsi_driver_first_trans_delta(t23, t22, 8U, 0LL);

LAB13:    t2 = (t0 + 8288);
    t12 = *((int *)t2);
    t4 = (t0 + 8292);
    t13 = *((int *)t4);
    if (t12 == t13)
        goto LAB14;

LAB17:    t18 = (t12 + 1);
    t12 = t18;
    t5 = (t0 + 8288);
    *((int *)t5) = t12;
    goto LAB11;

LAB15:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB16;

LAB18:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1992U);
    t5 = *((char **)t2);
    t2 = (t0 + 1032U);
    t8 = *((char **)t2);
    t2 = (t0 + 6112U);
    t12 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t8, t2);
    t13 = (t12 - 0);
    t20 = (t13 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t12);
    t21 = (8U * t20);
    t22 = (0 + t21);
    t11 = (t5 + t22);
    t14 = (t0 + 3728);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    t23 = (t17 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t11, 8U);
    xsi_driver_first_trans_fast_port(t14);
    goto LAB19;

LAB21:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t2 = (t0 + 1032U);
    t8 = *((char **)t2);
    t2 = (t0 + 6112U);
    t12 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t8, t2);
    t13 = (t12 - 0);
    t20 = (t13 * 1);
    t21 = (8U * t20);
    t22 = (0U + t21);
    t11 = (t0 + 3664);
    t14 = (t11 + 56U);
    t15 = *((char **)t14);
    t17 = (t15 + 56U);
    t23 = *((char **)t17);
    memcpy(t23, t5, 8U);
    xsi_driver_first_trans_delta(t11, t22, 8U, 0LL);
    goto LAB22;

}


extern void work_a_1632567566_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1632567566_3212880686_p_0};
	xsi_register_didat("work_a_1632567566_3212880686", "isim/test_processor_isim_beh.exe.sim/work/a_1632567566_3212880686.didat");
	xsi_register_executes(pe);
}
