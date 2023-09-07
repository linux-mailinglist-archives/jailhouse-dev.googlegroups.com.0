Return-Path: <jailhouse-dev+bncBCPOLQPRTECBBZN64STQMGQEGZC56ZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1040.google.com (mail-pj1-x1040.google.com [IPv6:2607:f8b0:4864:20::1040])
	by mail.lfdr.de (Postfix) with ESMTPS id B9170796E3F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Sep 2023 02:55:03 +0200 (CEST)
Received: by mail-pj1-x1040.google.com with SMTP id 98e67ed59e1d1-26d5970cbdbsf601843a91.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 Sep 2023 17:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1694048102; x=1694652902; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VXBLXY85WANdVypdTwW4WaN/NWlNu5vWD6IakSc8GrM=;
        b=KRAYiwqs9gKWzm2cDA0QDzdQ/F7Tjza+MYyZmg1L9Mv77jZakM99d8d8Bdw61Eov5V
         u4O9NrbZGpIIq6yP7dPYQ2pPNWr/QxwghpBlEnIRXJ8WTjlSbp9pt7i69cNyOj9A17en
         r30akuhOkDIV01Yrv0NhrwJvp89xdeAw5sZ6aOv8zpPiKaQB6OjXEQhpP2tJm83n5AHv
         cl1NuOZJE8KtTIxi7Eahqol1jRT3/tp1U/E+p9SBA3eFQ2pHJquxs51E1Ysv1gbC/0el
         /HMqfkJJ/3q83XlaCOzHRhHYBpg/hu1hfAOYOtc60IVz0GxHH08ACP6KT6FgJi16JO9Y
         96sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694048102; x=1694652902; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXBLXY85WANdVypdTwW4WaN/NWlNu5vWD6IakSc8GrM=;
        b=E7Ha91yI/bec0zlVbcXgvFnE+2CMgqQRm3DGAv1rlOnkraMcqm3pJ+26tCRINHMPkm
         Ga199HXrHDyBqo2LuAylFLvf+8+HlcJ4tzNLk4kOVtkOT80l4BDIgVqbIF515nvd2lzr
         TKRHuFxc1aD6KauImi/i1VC8t8/ljZ6TbHCX+YUV7IkRYOaWTHADTNq9HZXskKz7rVN5
         fIYGiYMyYmOoJM+tMYfHEosgDRA/CIYk4QCxclrdQA0EFP6uWXjIq/4zlUGbJrBUgPAW
         MNTry4xUwdxVSws4lrNb8ak4YnnuWiskhDcw5wjTeMShBQK6ySYLC0pYjQv+brx0XrBp
         FKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694048102; x=1694652902;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VXBLXY85WANdVypdTwW4WaN/NWlNu5vWD6IakSc8GrM=;
        b=l8RIo1HYPIqxE9JQxQMKY0rYXLSTAKsqP6FECDYlHDzWgzUVV+GJXxe9FJqYPiuFTo
         IoAgVZvtTvdJAoczd+kyv77pFMyH4Av3elQ7ZdMIc55fuFKjTMgX5C5u01P/8/TB694p
         fxnXgAfVShCOy4LTwurco+xOJqwc4m3tRZeOIFn+dVpsoOK2s+p1hJIP3na41GleqV2Z
         Fdc3/FwFIC74F6OitUSqYXZFu6uupvXierlRG04NauGsXMOcf0kw70gf4+vqSBJ2OOmm
         Oy7nyhrgdirjkPUrjYNtKulvJqvAuDob9WY0Wz39XpZypzLI4j4ccOLLrLRH3qYKI74h
         G9lw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxicJTu0GvfP6Vx4qw93CVz+NCVlrW/HOSmLflzPY+wkVF3E1gC
	mI5uwHgsLYmNBXGvH3QRE4o=
X-Google-Smtp-Source: AGHT+IHzsIYrRwkG72ev9vFEnjm+GuMIT6TLy+JeklCi1fxweZW1bbdRqePT2jw/Uae4amj2JUoOCQ==
X-Received: by 2002:a17:90a:aa94:b0:271:c2fd:721b with SMTP id l20-20020a17090aaa9400b00271c2fd721bmr16325062pjq.18.1694048101922;
        Wed, 06 Sep 2023 17:55:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:1882:b0:268:14f6:5312 with SMTP id
 mn2-20020a17090b188200b0026814f65312ls6213639pjb.2.-pod-prod-08-us; Wed, 06
 Sep 2023 17:55:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1258:b0:26f:7521:25bc with SMTP id gx24-20020a17090b125800b0026f752125bcmr4267472pjb.0.1694048100380;
        Wed, 06 Sep 2023 17:55:00 -0700 (PDT)
Date: Wed, 6 Sep 2023 17:54:59 -0700 (PDT)
From: bot crack <unintialized@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c2ec035d-3139-4090-a84d-ca1859706953n@googlegroups.com>
In-Reply-To: <556c7680-b856-4791-a782-e42b05540ae2@oth-regensburg.de>
References: <4edd4683-c693-4cad-aca7-53605eef02f3n@googlegroups.com>
 <556c7680-b856-4791-a782-e42b05540ae2@oth-regensburg.de>
Subject: Re: How to add new system register macro definition in arm64?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_67924_1611719935.1694048099295"
X-Original-Sender: unintialized@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_67924_1611719935.1694048099295
Content-Type: multipart/alternative; 
	boundary="----=_Part_67925_418981772.1694048099295"

------=_Part_67925_418981772.1694048099295
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
1.     #define arm_read_sysreg_64(op1, crm, val) \
asm volatile ("mrrc p15, "#op1", %Q0, %R0, "#crm"\n" \
: "=3Dr" ((u64)(val)))   The assembly of this macro should be *"mrrc p15,=
=20
"#op1", %Q0, %R0,"*

2.   But aarch64 does not use the cp15 register, I disassembled=20
inmates/lib/arm-common/timing.o(arm_read_sysreg(CNTPCT_EL0, pct64);) and=20
the instruction was displayed as *"MRS X0, #3, c14, c0, #1" ,*And the=20
instruction "*mrrc p15*" cannot be found in it.


On Wednesday, September 6, 2023 at 10:14:30=E2=80=AFPM UTC+8 Ralf Ramsauer =
wrote:

>
>
> On 06/09/2023 03:40, bot crack wrote:
> > Hi
> >=20
> > 1. I want to add some register definitions.
> > 2. I want to know why #define CNTPCT_EL0 SYSREG_64(0, c14) in arm64
> > *has only two arguments*, but it can be expanded into assembly "MRS
> > X0, #3, c14, c0, #1"
>
> oh yeah, that's finest macro magic!
>
>
> #define CNTPCT_EL0 SYSREG_64(0, c14)
>
> #define SYSREG_64(...) 64, __VA_ARGS__
>
> leads to the equivalent:
>
> #define CNTPCT_EL0 64, 0, c14
>
> Usage of CNTPCT_EL0:
>
> arm_read_sysreg(CNTPCT_EL0, pct64);
>
> with
>
> #define arm_read_sysreg(...) _arm_read_sysreg(__VA_ARGS__)
>
> So here, we, in fact, have
>
> _arm_read_sysreg(64, 0, c14, pct64)
>
> Which is defined as:
>
> #define _arm_read_sysreg(size, ...) arm_read_sysreg_ ## size(__VA_ARGS__)
>
> So we get
>
> arm_read_sysreg_64(0, c14, pct64)
>
> which is defined as:
>
> #define arm_read_sysreg_64(op1, crm, val) \
> asm volatile ("mrrc p15, "#op1", %Q0, %R0, "#crm"\n" \
> : "=3Dr" ((u64)(val)))
>
> The rest is done by the assembler.
>
>
>
> > 3. I didn=E2=80=99t understand the definition in
> > inmates/lib/arm64/include/asm/sysregs.h because I couldn=E2=80=99t find=
 how
> > to expand the macro definition SYSREG_64
>
> #define SYSREG_64(...) 64, __VA_ARGS__
>
> SYSREG_64(1,2,foo) =3D> 64, 1, 2, foo
>
> These can be used as arguments in further macros.
>
>
> > 4. For example, I want to add a new CNTVCT_EL0 (op0=3D0b11, op1=3D0b011=
,
> > CRn=3D0b1110, CRm=3D0b0, op2=3Db010) register. How should I do it?
>
> I don't know, but have a look at the Linux kernel to see how others did=
=20
> it in a pretty similar way:
>
>
> https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/vdso/=
cp15.h#L32
>
> HTH,
>
> Ralf
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c2ec035d-3139-4090-a84d-ca1859706953n%40googlegroups.com.

------=_Part_67925_418981772.1694048099295
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div>1.=C2=A0 =C2=A0 =C2=A0#define arm_read_sysreg_64(op1, cr=
m, val) \<br />asm volatile ("mrrc p15, "#op1", %Q0, %R0, "#crm"\n" \<br />=
: "=3Dr" ((u64)(val)))=C2=A0 =C2=A0The assembly of this macro should be <b>=
<font color=3D"#ff0000">"mrrc p15, "#op1", %Q0, %R0,"</font></b><br /><font=
 color=3D"#ff0000"><b><br /></b></font>2.=C2=A0 =C2=A0But aarch64 does not =
use the cp15 register, I disassembled inmates/lib/arm-common/timing.o(arm_r=
ead_sysreg(CNTPCT_EL0, pct64);) and the instruction was displayed as <b><fo=
nt color=3D"#ff0000">"MRS X0, #3, c14, c0, #1" ,</font></b>And the instruct=
ion "<b><font color=3D"#ff0000">mrrc p15</font></b>" cannot be found in it.=
<br /></div><div><div><div><br /></div></div><div><br /></div></div><div cl=
ass=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Wednesday, Se=
ptember 6, 2023 at 10:14:30=E2=80=AFPM UTC+8 Ralf Ramsauer wrote:<br/></div=
><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-lef=
t: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
<br>On 06/09/2023 03:40, bot crack wrote:
<br>&gt; Hi
<br>&gt;=20
<br>&gt;  1. I want to add some register definitions.
<br>&gt;  2. I want to know why #define CNTPCT_EL0 SYSREG_64(0, c14) in arm=
64
<br>&gt;     *has only two arguments*, but it can be expanded into assembly=
 &quot;MRS
<br>&gt;     X0, #3, c14, c0, #1&quot;
<br>
<br>oh yeah, that&#39;s finest macro magic!
<br>
<br>
<br>#define CNTPCT_EL0      SYSREG_64(0, c14)
<br>
<br>#define SYSREG_64(...)	64, __VA_ARGS__
<br>
<br>leads to the equivalent:
<br>
<br>#define CNTPCT_EL0	64, 0, c14
<br>
<br>Usage of CNTPCT_EL0:
<br>
<br>arm_read_sysreg(CNTPCT_EL0, pct64);
<br>
<br>with
<br>
<br>#define arm_read_sysreg(...) _arm_read_sysreg(__VA_ARGS__)
<br>
<br>So here, we, in fact, have
<br>
<br>_arm_read_sysreg(64, 0, c14, pct64)
<br>
<br>Which is defined as:
<br>
<br>#define _arm_read_sysreg(size, ...) arm_read_sysreg_ ## size(__VA_ARGS_=
_)
<br>
<br>So we get
<br>
<br>arm_read_sysreg_64(0, c14, pct64)
<br>
<br>which is defined as:
<br>
<br>#define arm_read_sysreg_64(op1, crm, val) \
<br>         asm volatile (&quot;mrrc     p15, &quot;#op1&quot;, %Q0, %R0, =
&quot;#crm&quot;\n&quot; \
<br>                         : &quot;=3Dr&quot; ((u64)(val)))
<br>
<br>The rest is done by the assembler.
<br>
<br>
<br>
<br>&gt;  3. I didn=E2=80=99t understand the definition in
<br>&gt;     inmates/lib/arm64/include/asm/sysregs.h because I couldn=E2=80=
=99t find how
<br>&gt;     to expand the macro definition SYSREG_64
<br>
<br>#define SYSREG_64(...) 64, __VA_ARGS__
<br>
<br>SYSREG_64(1,2,foo) =3D&gt; 64, 1, 2, foo
<br>
<br>These can be used as arguments in further macros.
<br>
<br>
<br>&gt;  4. For example, I want to add a new CNTVCT_EL0 (op0=3D0b11, op1=
=3D0b011,
<br>&gt;     CRn=3D0b1110, CRm=3D0b0, op2=3Db010) register. How should I do=
 it?
<br>
<br>I don&#39;t know, but have a look at the Linux kernel to see how others=
 did=20
<br>it in a pretty similar way:
<br>
<br><a href=3D"https://elixir.bootlin.com/linux/latest/source/arch/arm/incl=
ude/asm/vdso/cp15.h#L32" target=3D"_blank" rel=3D"nofollow" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://elixir.bootlin.=
com/linux/latest/source/arch/arm/include/asm/vdso/cp15.h%23L32&amp;source=
=3Dgmail&amp;ust=3D1694133776512000&amp;usg=3DAOvVaw0Ap0mBKIXBsa-UA2Wj8VrJ"=
>https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/vdso/c=
p15.h#L32</a>
<br>
<br>HTH,
<br>
<br>   Ralf
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c2ec035d-3139-4090-a84d-ca1859706953n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c2ec035d-3139-4090-a84d-ca1859706953n%40googlegroups.co=
m</a>.<br />

------=_Part_67925_418981772.1694048099295--

------=_Part_67924_1611719935.1694048099295--
