Return-Path: <jailhouse-dev+bncBCPOLQPRTECBBSWL4STQMGQE5EVXGMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63d.google.com (mail-pl1-x63d.google.com [IPv6:2607:f8b0:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 83671796E84
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Sep 2023 03:22:20 +0200 (CEST)
Received: by mail-pl1-x63d.google.com with SMTP id d9443c01a7336-1c0a90de7a2sf5908215ad.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 Sep 2023 18:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1694049739; x=1694654539; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zy5i9FvKTBU6gl7gbnovvEZbnpN4J9gEAfkrT8l67bE=;
        b=QWGjBUeAP27Hw3pKlkbvEjP66W1TCceXNxtXKJeird1iJhtDuZwmGe5gGz8Wu6oAsL
         Q/ig27kH29D1Sp8QZCvs9RcF1BWbRZOmNe156hQ5kIhOuFAamvVBe8c9YiC9HNjTAKpn
         fTPnGxDBhQRUhaiuK0XqYlHPKNVLVCP1/AlmMp8b5MyEFZC7aopBZyGHrsLEdSRxNHkI
         ju+gjHAMhFQT9El3dOri+ip2Adp3gYgp48Wa9q2J3h+8PLC549N4yTQ2DnUYFnJPve2z
         +wq8lJebwIuWUJyALxeASTRLbW0dAYoyfDMK1dnqpH73wOJMclMW3tdKK1gRFi7tcut+
         ZzBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694049739; x=1694654539; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy5i9FvKTBU6gl7gbnovvEZbnpN4J9gEAfkrT8l67bE=;
        b=FNBU5zpEH/xXxsI5v0SreLRjVwlU5ae67OYOMmJmQ8XM9hjwjymPVJQQ4i4/8sJtfj
         sBoeZZHLaeJjKQtDjCmrmnvhkYeOyMokmdYWEQ/0oOzJp9wvhz9W1QI4bsPB53y1KR/M
         aOBOgtX8vXp5/n6wTCggrqYkqa931g/Nl2EbUuawmUQZUdkk+HjRFedR+wHsNWETZLkx
         IihKEPtQWs4FYIB1FPWkXeuEcRUNN+2y0ls0YfgzzFdGlzLLhUDfXtuiwpS9xG/S8JKB
         0PB5KDugmRqNyqKhb/5NyHMd2mWea6cvdkLabo2lZBUmiWbp+5eqffEvur/YtbCKHE/k
         aNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694049739; x=1694654539;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zy5i9FvKTBU6gl7gbnovvEZbnpN4J9gEAfkrT8l67bE=;
        b=gOe9tlur5HDRNwAIz0h/CZNxVAP8tbx3PxPlhQNLbyBt6oUiN2LTv6C/KjfCn41nxq
         +kFjZPY7tz59JI55oeu1DZYgxoUwKVTRKZA0iFhtM9a+fnX+7wpOaFAS0H8L1L5wlW0g
         v6bBp6EpyMMsOC3sdNEhbnl3Bdx4+BMKOZKTNUchVCHjw6TVl51JhyjXbVtoj5yG0eHH
         VaFc/g+CBqhye4SiUuQZmWOThrylf7iZRjyNwF2OXGackXPW3nFJWz+g3kBGdlIsnmhI
         NnM+GXhIodpVnFe4NXoK0o3Vx343RdtfbdZnzdg8mpeAAxwNrLzKFCbs/Pk+aJzOZFgt
         +l3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yx0rPJtPeECN4RHY+Yqz6hTNJkU4iQb8YTKh92LFo2PJwspN/OF
	ary+BoAA627Rq7felGO0gW0=
X-Google-Smtp-Source: AGHT+IFRTG2G5+6PVah9EZr8HJDV2FOcvErcq3DnbWQsHDz6oF4y8P/4nZW7fdL1nPYruWnuWxo8VA==
X-Received: by 2002:a17:902:db06:b0:1bb:8f37:dd0b with SMTP id m6-20020a170902db0600b001bb8f37dd0bmr20931794plx.52.1694049738849;
        Wed, 06 Sep 2023 18:22:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:64d7:b0:1bd:f9f8:5de3 with SMTP id
 y23-20020a17090264d700b001bdf9f85de3ls5453040pli.0.-pod-prod-06-us; Wed, 06
 Sep 2023 18:22:17 -0700 (PDT)
X-Received: by 2002:a17:902:f948:b0:1b5:147f:d8d1 with SMTP id kx8-20020a170902f94800b001b5147fd8d1mr5223171plb.3.1694049737492;
        Wed, 06 Sep 2023 18:22:17 -0700 (PDT)
Date: Wed, 6 Sep 2023 18:22:16 -0700 (PDT)
From: bot crack <unintialized@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ab9c5395-a148-43e3-a074-3e7126728c93n@googlegroups.com>
In-Reply-To: <762514a6-309c-49ff-90f1-a0b57fd385c9n@googlegroups.com>
References: <4edd4683-c693-4cad-aca7-53605eef02f3n@googlegroups.com>
 <556c7680-b856-4791-a782-e42b05540ae2@oth-regensburg.de>
 <c2ec035d-3139-4090-a84d-ca1859706953n@googlegroups.com>
 <762514a6-309c-49ff-90f1-a0b57fd385c9n@googlegroups.com>
Subject: Re: How to add new system register macro definition in arm64?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_43348_2001811301.1694049736692"
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

------=_Part_43348_2001811301.1694049736692
Content-Type: multipart/alternative; 
	boundary="----=_Part_43349_1061529469.1694049736692"

------=_Part_43349_1061529469.1694049736692
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

arm_read_sysreg(CNTPCT_EL0, pct64);

----->#define arm_read_sysreg(sysreg, val) \
asm volatile ("mrs %0,  "__stringify(sysreg)"\n" : "=3Dr" ((val)))

        ---------> asm volatile ("mrs %0,  " CNTPCT_EL0  "\n" : "=3Dr"=20
((val)))

                  ---------> After compiling with gcc    : * "MRS X0, #3,=
=20
c14, c0, #1"*


I guess it should be like this?
On Thursday, September 7, 2023 at 9:18:37=E2=80=AFAM UTC+8 bot crack wrote:

> Is the macro "CNTPCT_EL0" a built-in gcc? Because I deleted all the=20
> definitions of CNTPCT_EL0 in the project, it can still be compiled, and t=
he=20
> newly added register "CNTVCT_EL0" can be compiled without any definitions=
=20
> and declarations. ?
>
> On Thursday, September 7, 2023 at 8:54:59=E2=80=AFAM UTC+8 bot crack wrot=
e:
>
>> Hi,
>> 1.     #define arm_read_sysreg_64(op1, crm, val) \
>>
>> asm volatile ("mrrc p15, "#op1", %Q0, %R0, "#crm"\n" \
>> : "=3Dr" ((u64)(val)))   The assembly of this macro should be *"mrrc p15=
,=20
>> "#op1", %Q0, %R0,"*
>>
>> 2.   But aarch64 does not use the cp15 register, I disassembled=20
>> inmates/lib/arm-common/timing.o(arm_read_sysreg(CNTPCT_EL0, pct64);) and=
=20
>> the instruction was displayed as *"MRS X0, #3, c14, c0, #1" ,*And the=20
>> instruction "*mrrc p15*" cannot be found in it.
>>
>>
>> On Wednesday, September 6, 2023 at 10:14:30=E2=80=AFPM UTC+8 Ralf Ramsau=
er wrote:
>>
>>>
>>>
>>> On 06/09/2023 03:40, bot crack wrote:=20
>>> > Hi=20
>>> >=20
>>> > 1. I want to add some register definitions.=20
>>> > 2. I want to know why #define CNTPCT_EL0 SYSREG_64(0, c14) in arm64=
=20
>>> > *has only two arguments*, but it can be expanded into assembly "MRS=
=20
>>> > X0, #3, c14, c0, #1"=20
>>>
>>> oh yeah, that's finest macro magic!=20
>>>
>>>
>>> #define CNTPCT_EL0 SYSREG_64(0, c14)=20
>>>
>>> #define SYSREG_64(...) 64, __VA_ARGS__=20
>>>
>>> leads to the equivalent:=20
>>>
>>> #define CNTPCT_EL0 64, 0, c14=20
>>>
>>> Usage of CNTPCT_EL0:=20
>>>
>>> arm_read_sysreg(CNTPCT_EL0, pct64);=20
>>>
>>> with=20
>>>
>>> #define arm_read_sysreg(...) _arm_read_sysreg(__VA_ARGS__)=20
>>>
>>> So here, we, in fact, have=20
>>>
>>> _arm_read_sysreg(64, 0, c14, pct64)=20
>>>
>>> Which is defined as:=20
>>>
>>> #define _arm_read_sysreg(size, ...) arm_read_sysreg_ ##=20
>>> size(__VA_ARGS__)=20
>>>
>>> So we get=20
>>>
>>> arm_read_sysreg_64(0, c14, pct64)=20
>>>
>>> which is defined as:=20
>>>
>>> #define arm_read_sysreg_64(op1, crm, val) \=20
>>> asm volatile ("mrrc p15, "#op1", %Q0, %R0, "#crm"\n" \=20
>>> : "=3Dr" ((u64)(val)))=20
>>>
>>> The rest is done by the assembler.=20
>>>
>>>
>>>
>>> > 3. I didn=E2=80=99t understand the definition in=20
>>> > inmates/lib/arm64/include/asm/sysregs.h because I couldn=E2=80=99t fi=
nd how=20
>>> > to expand the macro definition SYSREG_64=20
>>>
>>> #define SYSREG_64(...) 64, __VA_ARGS__=20
>>>
>>> SYSREG_64(1,2,foo) =3D> 64, 1, 2, foo=20
>>>
>>> These can be used as arguments in further macros.=20
>>>
>>>
>>> > 4. For example, I want to add a new CNTVCT_EL0 (op0=3D0b11, op1=3D0b0=
11,=20
>>> > CRn=3D0b1110, CRm=3D0b0, op2=3Db010) register. How should I do it?=20
>>>
>>> I don't know, but have a look at the Linux kernel to see how others did=
=20
>>> it in a pretty similar way:=20
>>>
>>>
>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/vds=
o/cp15.h#L32=20
>>>
>>> HTH,=20
>>>
>>> Ralf=20
>>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ab9c5395-a148-43e3-a074-3e7126728c93n%40googlegroups.com.

------=_Part_43349_1061529469.1694049736692
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

arm_read_sysreg(CNTPCT_EL0, pct64);<div><br /><div>-----&gt;#define arm_rea=
d_sysreg(sysreg, val) \<br /><span style=3D"white-space: pre;">	</span>asm =
volatile ("mrs<span style=3D"white-space: pre;">	</span>%0, =C2=A0"__string=
ify(sysreg)"\n" : "=3Dr" ((val)))</div><div><br /></div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ---------&gt;

asm volatile ("mrs<span style=3D"white-space: pre;">	</span>%0, =C2=A0"

CNTPCT_EL0=C2=A0 "\n" : "=3Dr" ((val)))</div><div><br /></div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ---------&gt; After=
 compiling with gcc=C2=A0 =C2=A0 :=C2=A0<b><font color=3D"#ff0000"> "MRS X0=
, #3, c14, c0, #1"</font></b></div><div><br /><br /></div><div>I guess it s=
hould be like this?<br /></div></div><div class=3D"gmail_quote"><div dir=3D=
"auto" class=3D"gmail_attr">On Thursday, September 7, 2023 at 9:18:37=E2=80=
=AFAM UTC+8 bot crack wrote:<br/></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;">Is the macro &quot;CNTPCT_EL0&quot; a built-in gcc? Because=
 I deleted all the definitions of CNTPCT_EL0 in the project, it can still b=
e compiled, and the newly added register &quot;CNTVCT_EL0&quot; can be comp=
iled without any definitions and declarations. ?<br><br><div class=3D"gmail=
_quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursday, September 7, 20=
23 at 8:54:59=E2=80=AFAM UTC+8 bot crack wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div>Hi,</div><div>1.=C2=A0 =C2=A0 =C2=A0#define=
 arm_read_sysreg_64(op1, crm, val) \</div><div><br>asm volatile (&quot;mrrc=
 p15, &quot;#op1&quot;, %Q0, %R0, &quot;#crm&quot;\n&quot; \<br></div><div>=
: &quot;=3Dr&quot; ((u64)(val)))=C2=A0 =C2=A0The assembly of this macro sho=
uld be <b><font color=3D"#ff0000">&quot;mrrc p15, &quot;#op1&quot;, %Q0, %R=
0,&quot;</font></b><br><font color=3D"#ff0000"><b><br></b></font>2.=C2=A0 =
=C2=A0But aarch64 does not use the cp15 register, I disassembled inmates/li=
b/arm-common/timing.o(arm_read_sysreg(CNTPCT_EL0, pct64);) and the instruct=
ion was displayed as <b><font color=3D"#ff0000">&quot;MRS X0, #3, c14, c0, =
#1&quot; ,</font></b>And the instruction &quot;<b><font color=3D"#ff0000">m=
rrc p15</font></b>&quot; cannot be found in it.<br></div><div><div><div><br=
></div></div><div><br></div></div><div class=3D"gmail_quote"><div dir=3D"au=
to" class=3D"gmail_attr">On Wednesday, September 6, 2023 at 10:14:30=E2=80=
=AFPM UTC+8 Ralf Ramsauer wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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
=3Dgmail&amp;ust=3D1694136000155000&amp;usg=3DAOvVaw2iKVv23-Tpqr8Sg65OCeSt"=
>https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/vdso/c=
p15.h#L32</a>
<br>
<br>HTH,
<br>
<br>   Ralf
<br></blockquote></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ab9c5395-a148-43e3-a074-3e7126728c93n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ab9c5395-a148-43e3-a074-3e7126728c93n%40googlegroups.co=
m</a>.<br />

------=_Part_43349_1061529469.1694049736692--

------=_Part_43348_2001811301.1694049736692--
