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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Parsa Hejabi/Documents/Digital System Design/Assignments/HW9/BaseProcessor/ALU.vhd";
extern char *IEEE_P_0774719531;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_0774719531_sub_2698824431_2162500114(char *, char *, char *, char *, char *);
char *ieee_p_0774719531_sub_767668596_2162500114(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1306069469_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_3798478767_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_43738421_503743352(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t5[16];
    char t11[16];
    char t15[16];
    char t17[16];
    char t25[16];
    char t27[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t13;
    char *t14;
    char *t16;
    char *t18;
    char *t19;
    int t20;
    char *t21;
    char *t23;
    char *t24;
    char *t26;
    char *t28;
    char *t29;
    int t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned char t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;

LAB0:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 7124U);
    t3 = (t0 + 7264);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 2;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (2 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_p_0774719531_sub_2698824431_2162500114(IEEE_P_0774719531, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB2:    t40 = (t0 + 4216);
    *((int *)t40) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 7267);
    t13 = (t0 + 1032U);
    t14 = *((char **)t13);
    t16 = ((IEEE_P_2592010699) + 4024);
    t18 = (t17 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 0;
    t19 = (t18 + 4U);
    *((int *)t19) = 0;
    t19 = (t18 + 8U);
    *((int *)t19) = 1;
    t20 = (0 - 0);
    t9 = (t20 * 1);
    t9 = (t9 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t9;
    t19 = (t0 + 7092U);
    t13 = xsi_base_array_concat(t13, t15, t16, (char)97, t7, t17, (char)97, t14, t19, (char)101);
    t21 = (t0 + 7268);
    t23 = (t0 + 1192U);
    t24 = *((char **)t23);
    t26 = ((IEEE_P_2592010699) + 4024);
    t28 = (t27 + 0U);
    t29 = (t28 + 0U);
    *((int *)t29) = 0;
    t29 = (t28 + 4U);
    *((int *)t29) = 0;
    t29 = (t28 + 8U);
    *((int *)t29) = 1;
    t30 = (0 - 0);
    t9 = (t30 * 1);
    t9 = (t9 + 1);
    t29 = (t28 + 12U);
    *((unsigned int *)t29) = t9;
    t29 = (t0 + 7108U);
    t23 = xsi_base_array_concat(t23, t25, t26, (char)97, t21, t27, (char)97, t24, t29, (char)101);
    t31 = ieee_p_0774719531_sub_767668596_2162500114(IEEE_P_0774719531, t11, t13, t15, t23, t25);
    t32 = (t11 + 12U);
    t9 = *((unsigned int *)t32);
    t33 = (1U * t9);
    t34 = (17U != t33);
    if (t34 == 1)
        goto LAB5;

LAB6:    t35 = (t0 + 4344);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    memcpy(t39, t31, 17U);
    xsi_driver_first_trans_fast(t35);
    goto LAB2;

LAB5:    xsi_size_not_matching(17U, t33, 0);
    goto LAB6;

}

static void work_a_0832606739_3212880686_p_1(char *t0)
{
    char t24[16];
    char t43[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    int t17;
    char *t18;
    int t20;
    char *t21;
    int t23;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned char t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t44;
    unsigned char t45;

LAB0:    t1 = (t0 + 3400U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 7269);
    t5 = xsi_mem_cmp(t2, t3, 3U);
    if (t5 == 1)
        goto LAB5;

LAB13:    t6 = (t0 + 7272);
    t8 = xsi_mem_cmp(t6, t3, 3U);
    if (t8 == 1)
        goto LAB6;

LAB14:    t9 = (t0 + 7275);
    t11 = xsi_mem_cmp(t9, t3, 3U);
    if (t11 == 1)
        goto LAB7;

LAB15:    t12 = (t0 + 7278);
    t14 = xsi_mem_cmp(t12, t3, 3U);
    if (t14 == 1)
        goto LAB8;

LAB16:    t15 = (t0 + 7281);
    t17 = xsi_mem_cmp(t15, t3, 3U);
    if (t17 == 1)
        goto LAB9;

LAB17:    t18 = (t0 + 7284);
    t20 = xsi_mem_cmp(t18, t3, 3U);
    if (t20 == 1)
        goto LAB10;

LAB18:    t21 = (t0 + 7287);
    t23 = xsi_mem_cmp(t21, t3, 3U);
    if (t23 == 1)
        goto LAB11;

LAB19:
LAB12:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4408);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 16U);
    xsi_driver_first_trans_fast(t2);

LAB4:    xsi_set_current_line(50, ng0);

LAB35:    t2 = (t0 + 4232);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB36;

LAB1:    return;
LAB5:    xsi_set_current_line(51, ng0);
    t25 = (t0 + 1032U);
    t26 = *((char **)t25);
    t25 = (t0 + 7092U);
    t27 = (t0 + 1192U);
    t28 = *((char **)t27);
    t27 = (t0 + 7108U);
    t29 = ieee_p_2592010699_sub_3798478767_503743352(IEEE_P_2592010699, t24, t26, t25, t28, t27);
    t30 = (t24 + 12U);
    t31 = *((unsigned int *)t30);
    t32 = (1U * t31);
    t33 = (16U != t32);
    if (t33 == 1)
        goto LAB21;

LAB22:    t34 = (t0 + 4408);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    memcpy(t38, t29, 16U);
    xsi_driver_first_trans_fast(t34);
    goto LAB4;

LAB6:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 7092U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 7108U);
    t7 = ieee_p_2592010699_sub_1306069469_503743352(IEEE_P_2592010699, t24, t3, t2, t6, t4);
    t9 = (t24 + 12U);
    t31 = *((unsigned int *)t9);
    t32 = (1U * t31);
    t33 = (16U != t32);
    if (t33 == 1)
        goto LAB23;

LAB24:    t10 = (t0 + 4408);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 16U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB7:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 7092U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 7108U);
    t7 = ieee_p_2592010699_sub_43738421_503743352(IEEE_P_2592010699, t24, t3, t2, t6, t4);
    t9 = (t24 + 12U);
    t31 = *((unsigned int *)t9);
    t32 = (1U * t31);
    t33 = (16U != t32);
    if (t33 == 1)
        goto LAB25;

LAB26:    t10 = (t0 + 4408);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 16U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB8:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7108U);
    t4 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t24, t3, t2);
    t6 = (t24 + 12U);
    t31 = *((unsigned int *)t6);
    t32 = (1U * t31);
    t33 = (16U != t32);
    if (t33 == 1)
        goto LAB27;

LAB28:    t7 = (t0 + 4408);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 16U);
    xsi_driver_first_trans_fast(t7);
    goto LAB4;

LAB9:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t5 = (15 - 15);
    t31 = (t5 * -1);
    t32 = (1U * t31);
    t39 = (0 + t32);
    t2 = (t3 + t39);
    t33 = *((unsigned char *)t2);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t40 = (15 - 15);
    t41 = (t40 * 1U);
    t42 = (0 + t41);
    t4 = (t6 + t42);
    t9 = ((IEEE_P_2592010699) + 4024);
    t10 = (t43 + 0U);
    t12 = (t10 + 0U);
    *((int *)t12) = 15;
    t12 = (t10 + 4U);
    *((int *)t12) = 1;
    t12 = (t10 + 8U);
    *((int *)t12) = -1;
    t8 = (1 - 15);
    t44 = (t8 * -1);
    t44 = (t44 + 1);
    t12 = (t10 + 12U);
    *((unsigned int *)t12) = t44;
    t7 = xsi_base_array_concat(t7, t24, t9, (char)99, t33, (char)97, t4, t43, (char)101);
    t44 = (1U + 15U);
    t45 = (16U != t44);
    if (t45 == 1)
        goto LAB29;

LAB30:    t12 = (t0 + 4408);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    memcpy(t18, t7, 16U);
    xsi_driver_first_trans_fast(t12);
    goto LAB4;

LAB10:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t31 = (15 - 14);
    t32 = (t31 * 1U);
    t39 = (0 + t32);
    t2 = (t3 + t39);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t5 = (15 - 15);
    t40 = (t5 * -1);
    t41 = (1U * t40);
    t42 = (0 + t41);
    t4 = (t6 + t42);
    t33 = *((unsigned char *)t4);
    t9 = ((IEEE_P_2592010699) + 4024);
    t10 = (t43 + 0U);
    t12 = (t10 + 0U);
    *((int *)t12) = 14;
    t12 = (t10 + 4U);
    *((int *)t12) = 0;
    t12 = (t10 + 8U);
    *((int *)t12) = -1;
    t8 = (0 - 14);
    t44 = (t8 * -1);
    t44 = (t44 + 1);
    t12 = (t10 + 12U);
    *((unsigned int *)t12) = t44;
    t7 = xsi_base_array_concat(t7, t24, t9, (char)97, t2, t43, (char)99, t33, (char)101);
    t44 = (15U + 1U);
    t45 = (16U != t44);
    if (t45 == 1)
        goto LAB31;

LAB32:    t12 = (t0 + 4408);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    memcpy(t18, t7, 16U);
    xsi_driver_first_trans_fast(t12);
    goto LAB4;

LAB11:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t31 = (16 - 15);
    t32 = (t31 * 1U);
    t39 = (0 + t32);
    t2 = (t3 + t39);
    t4 = (t0 + 4408);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    goto LAB4;

LAB20:;
LAB21:    xsi_size_not_matching(16U, t32, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(16U, t32, 0);
    goto LAB24;

LAB25:    xsi_size_not_matching(16U, t32, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(16U, t32, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(16U, t44, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(16U, t44, 0);
    goto LAB32;

LAB33:    t3 = (t0 + 4232);
    *((int *)t3) = 0;
    goto LAB2;

LAB34:    goto LAB33;

LAB36:    goto LAB34;

}

static void work_a_0832606739_3212880686_p_2(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 7124U);
    t3 = (t0 + 7290);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 2;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (2 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_p_0774719531_sub_2698824431_2162500114(IEEE_P_0774719531, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB2:    t21 = (t0 + 4248);
    *((int *)t21) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 1992U);
    t11 = *((char **)t7);
    t12 = (16 - 16);
    t9 = (t12 * -1);
    t13 = (1U * t9);
    t14 = (0 + t13);
    t7 = (t11 + t14);
    t15 = *((unsigned char *)t7);
    t16 = (t0 + 4472);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t15;
    xsi_driver_first_trans_fast_port(t16);
    goto LAB2;

}

static void work_a_0832606739_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(62, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 4536);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4264);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0,(void *)work_a_0832606739_3212880686_p_1,(void *)work_a_0832606739_3212880686_p_2,(void *)work_a_0832606739_3212880686_p_3};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
