Return-Path: <jailhouse-dev+bncBCPOLQPRTECBB36J4STQMGQEPPYXPXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x440.google.com (mail-pf1-x440.google.com [IPv6:2607:f8b0:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id B69FD796E7D
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Sep 2023 03:18:41 +0200 (CEST)
Received: by mail-pf1-x440.google.com with SMTP id d2e1a72fcca58-68a48df712bsf630407b3a.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 Sep 2023 18:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1694049520; x=1694654320; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2auBGsZdCZz7GaLh7z90TZasLByvP+j6yTWMBqOk3M=;
        b=dcrU33bvVCeQYuD4ANosgKN/npMq2E04+7ncGuSq+++cz5k/XxOrJXChmGMs67/xkB
         9zn/w5S1oNEprTc4rkmOWiz4P1YWNYPsZ6oVZOzPXVH8T0jdf3XcKi7z8xnt9sHwvXq3
         tE5mi894gVFH/jBOjxFPi4Nsqe9w1VtiydBR6K96jyXdCIX2dK/mg7Bsw2fLx5nNhzEL
         SZLRYjXHJeiVCJysenwBQq4H5ad+ZX2izo7+2HLsLsY3qLXsRAXv+aGh8t0EbRlMi8/j
         b+CeqtYU32O8f8+GafWW67xBf3kxYrJoIrWxqSlWEeFO0pAWkVteElqjTsxrfQPFEaqM
         pUXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694049520; x=1694654320; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2auBGsZdCZz7GaLh7z90TZasLByvP+j6yTWMBqOk3M=;
        b=lw3sq7ERpT26dLa3a0UwPazloAVq2zxxgIZaXCE7RsIlaxiO1JjqOEKjHCqxg9m1Q4
         53Htk0CxmWSx5ekK+I5PPU2C29oHGc1aIbE8j8VIA8CV3NmBsB9jhQbpYKyZPWJsHOUN
         NWoJIFsAGsWGH2mpeqxcPx9Rd+6eQuZ0F9RP63aCbZsEzb81ckvJyUbdIz1bSoZLtH59
         JqLFxWHHNBRNNrB7F6nKMhDj8AY+BZs8XEiocLhcrmI6gmncavBBQr6gh8oM6WVYwR6a
         UXCxq1pn+0u2sqFH/+aXWqly9gpQ/4kcSBNPLDjv0u5aUlXtgl+ziLw0Qs3oqpEdQK4z
         pUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694049520; x=1694654320;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2auBGsZdCZz7GaLh7z90TZasLByvP+j6yTWMBqOk3M=;
        b=WcXScI7g0dHeuwFnVE2ujlgMYa1u0BO7T4Ki3eWtmk6WC7JLJR8xhVuTWaq30M6WS5
         20cUksedgvZa6juYgjW0susPt2ARSwHrqOeSLG0Ww9qx92zXh06EDsebwmRq12e3iIC8
         qp/NbyMGyVZ0mnbHdghLOcQ4g1xmPLXe1RtW2NyKJ5zuDdDgTIUgUBFuxlqbjME9CScx
         LmCVKU+0GNlhpa1JevcLbzQfbqtwV+Ka+XO06r58JTiJZ0tcgn2dx90QQ284T5UxRoKN
         bfYSbUYIxvuNdH00zTaAzTdWptTieY5IEfM0BCykHG0mSoWdRQkoOpn1eo2SL88yjXYO
         hxIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yz2qtYqd0/DofVfhgpRcWz7YkOg0RKNsfXq1VoAPdR1mOq7IbT4
	zlz5Yvlct3oAahwJaJ+GVv8=
X-Google-Smtp-Source: AGHT+IEbmXI6XnZeZYKnW8mS0Nn2hNuDG+CmCVV6sQqBnvN1w1RhOfzE8dPoeVWYMFt/krJ9SKvLqw==
X-Received: by 2002:a05:6a20:918f:b0:137:74f8:62ee with SMTP id v15-20020a056a20918f00b0013774f862eemr22093245pzd.18.1694049520043;
        Wed, 06 Sep 2023 18:18:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:8f23:0:b0:68a:1ac5:1a87 with SMTP id y3-20020aa78f23000000b0068a1ac51a87ls6237232pfr.1.-pod-prod-07-us;
 Wed, 06 Sep 2023 18:18:38 -0700 (PDT)
X-Received: by 2002:aa7:88c7:0:b0:68a:fed3:823b with SMTP id k7-20020aa788c7000000b0068afed3823bmr7316790pff.6.1694049518700;
        Wed, 06 Sep 2023 18:18:38 -0700 (PDT)
Date: Wed, 6 Sep 2023 18:18:37 -0700 (PDT)
From: bot crack <unintialized@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <762514a6-309c-49ff-90f1-a0b57fd385c9n@googlegroups.com>
In-Reply-To: <c2ec035d-3139-4090-a84d-ca1859706953n@googlegroups.com>
References: <4edd4683-c693-4cad-aca7-53605eef02f3n@googlegroups.com>
 <556c7680-b856-4791-a782-e42b05540ae2@oth-regensburg.de>
 <c2ec035d-3139-4090-a84d-ca1859706953n@googlegroups.com>
Subject: Re: How to add new system register macro definition in arm64?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_32258_425925496.1694049517702"
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

------=_Part_32258_425925496.1694049517702
Content-Type: multipart/alternative; 
	boundary="----=_Part_32259_1478939500.1694049517702"

------=_Part_32259_1478939500.1694049517702
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is the macro "CNTPCT_EL0" a built-in gcc? Because I deleted all the=20
definitions of CNTPCT_EL0 in the project, it can still be compiled, and the=
=20
newly added register "CNTVCT_EL0" can be compiled without any definitions=
=20
and declarations. ?

On Thursday, September 7, 2023 at 8:54:59=E2=80=AFAM UTC+8 bot crack wrote:

> Hi,
> 1.     #define arm_read_sysreg_64(op1, crm, val) \
>
> asm volatile ("mrrc p15, "#op1", %Q0, %R0, "#crm"\n" \
> : "=3Dr" ((u64)(val)))   The assembly of this macro should be *"mrrc p15,=
=20
> "#op1", %Q0, %R0,"*
>
> 2.   But aarch64 does not use the cp15 register, I disassembled=20
> inmates/lib/arm-common/timing.o(arm_read_sysreg(CNTPCT_EL0, pct64);) and=
=20
> the instruction was displayed as *"MRS X0, #3, c14, c0, #1" ,*And the=20
> instruction "*mrrc p15*" cannot be found in it.
>
>
> On Wednesday, September 6, 2023 at 10:14:30=E2=80=AFPM UTC+8 Ralf Ramsaue=
r wrote:
>
>>
>>
>> On 06/09/2023 03:40, bot crack wrote:=20
>> > Hi=20
>> >=20
>> > 1. I want to add some register definitions.=20
>> > 2. I want to know why #define CNTPCT_EL0 SYSREG_64(0, c14) in arm64=20
>> > *has only two arguments*, but it can be expanded into assembly "MRS=20
>> > X0, #3, c14, c0, #1"=20
>>
>> oh yeah, that's finest macro magic!=20
>>
>>
>> #define CNTPCT_EL0 SYSREG_64(0, c14)=20
>>
>> #define SYSREG_64(...) 64, __VA_ARGS__=20
>>
>> leads to the equivalent:=20
>>
>> #define CNTPCT_EL0 64, 0, c14=20
>>
>> Usage of CNTPCT_EL0:=20
>>
>> arm_read_sysreg(CNTPCT_EL0, pct64);=20
>>
>> with=20
>>
>> #define arm_read_sysreg(...) _arm_read_sysreg(__VA_ARGS__)=20
>>
>> So here, we, in fact, have=20
>>
>> _arm_read_sysreg(64, 0, c14, pct64)=20
>>
>> Which is defined as:=20
>>
>> #define _arm_read_sysreg(size, ...) arm_read_sysreg_ ## size(__VA_ARGS__=
)=20
>>
>> So we get=20
>>
>> arm_read_sysreg_64(0, c14, pct64)=20
>>
>> which is defined as:=20
>>
>> #define arm_read_sysreg_64(op1, crm, val) \=20
>> asm volatile ("mrrc p15, "#op1", %Q0, %R0, "#crm"\n" \=20
>> : "=3Dr" ((u64)(val)))=20
>>
>> The rest is done by the assembler.=20
>>
>>
>>
>> > 3. I didn=E2=80=99t understand the definition in=20
>> > inmates/lib/arm64/include/asm/sysregs.h because I couldn=E2=80=99t fin=
d how=20
>> > to expand the macro definition SYSREG_64=20
>>
>> #define SYSREG_64(...) 64, __VA_ARGS__=20
>>
>> SYSREG_64(1,2,foo) =3D> 64, 1, 2, foo=20
>>
>> These can be used as arguments in further macros.=20
>>
>>
>> > 4. For example, I want to add a new CNTVCT_EL0 (op0=3D0b11, op1=3D0b01=
1,=20
>> > CRn=3D0b1110, CRm=3D0b0, op2=3Db010) register. How should I do it?=20
>>
>> I don't know, but have a look at the Linux kernel to see how others did=
=20
>> it in a pretty similar way:=20
>>
>>
>> https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/vdso=
/cp15.h#L32=20
>>
>> HTH,=20
>>
>> Ralf=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/762514a6-309c-49ff-90f1-a0b57fd385c9n%40googlegroups.com.

------=_Part_32259_1478939500.1694049517702
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is the macro "CNTPCT_EL0" a built-in gcc? Because I deleted all the definit=
ions of CNTPCT_EL0 in the project, it can still be compiled, and the newly =
added register "CNTVCT_EL0" can be compiled without any definitions and dec=
larations. ?<br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">On Thursday, September 7, 2023 at 8:54:59=E2=80=AFAM UTC+8 =
bot crack wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;"><div>Hi,</div><div>1.=C2=A0 =C2=A0 =C2=A0#define arm_read_sysreg_64(op1=
, crm, val) \</div><div><br>asm volatile (&quot;mrrc p15, &quot;#op1&quot;,=
 %Q0, %R0, &quot;#crm&quot;\n&quot; \<br></div><div>: &quot;=3Dr&quot; ((u6=
4)(val)))=C2=A0 =C2=A0The assembly of this macro should be <b><font color=
=3D"#ff0000">&quot;mrrc p15, &quot;#op1&quot;, %Q0, %R0,&quot;</font></b><b=
r><font color=3D"#ff0000"><b><br></b></font>2.=C2=A0 =C2=A0But aarch64 does=
 not use the cp15 register, I disassembled inmates/lib/arm-common/timing.o(=
arm_read_sysreg(CNTPCT_EL0, pct64);) and the instruction was displayed as <=
b><font color=3D"#ff0000">&quot;MRS X0, #3, c14, c0, #1&quot; ,</font></b>A=
nd the instruction &quot;<b><font color=3D"#ff0000">mrrc p15</font></b>&quo=
t; cannot be found in it.<br></div><div><div><div><br></div></div><div><br>=
</div></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_att=
r">On Wednesday, September 6, 2023 at 10:14:30=E2=80=AFPM UTC+8 Ralf Ramsau=
er wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
ude/asm/vdso/cp15.h#L32" rel=3D"nofollow" target=3D"_blank" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://elixir.bootlin.=
com/linux/latest/source/arch/arm/include/asm/vdso/cp15.h%23L32&amp;source=
=3Dgmail&amp;ust=3D1694135896592000&amp;usg=3DAOvVaw13mtwFOq_Sjo1ZxesEf44Z"=
>https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/vdso/c=
p15.h#L32</a>
<br>
<br>HTH,
<br>
<br>   Ralf
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/762514a6-309c-49ff-90f1-a0b57fd385c9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/762514a6-309c-49ff-90f1-a0b57fd385c9n%40googlegroups.co=
m</a>.<br />

------=_Part_32259_1478939500.1694049517702--

------=_Part_32258_425925496.1694049517702--
