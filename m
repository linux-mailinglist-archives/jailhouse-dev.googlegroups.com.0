Return-Path: <jailhouse-dev+bncBCDJXM4674ERB2VDUXYQKGQEXBXO26I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADE1462F8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jan 2020 08:57:31 +0100 (CET)
Received: by mail-ot1-x339.google.com with SMTP id p13sf1132815oto.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jan 2020 23:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pfe6uCmevWuF94JYx1zu1p7qS2nrugU0ygHHkwo4f8w=;
        b=SfjR//pJnuuHB3bm52fdQNN+gfMOyuefX5pQwMUiGxY+DY2nKfNdYBAMMAMdfyeQmB
         wuWRVQX2YIXeWV9sfWuR6EFn1SiBNGvA/SnIOp7JwqcWv12ytMoR7x0xRcT8EveqemOC
         Czy38pRytTsLWHFIfE+i4hhFFDgK8jhzHeh11Sf5lkBLulmv6xx9CWEDEuTvfHPknAYV
         2FdjgJyZ8YOo45xlEhsEsB7G9Noz8cL2Z22ELYGsy5JD0Hr2ysU6r01C07xfYKD+hBnY
         hxv4uL3J7ONkePrIqmvTaFFhVEFyEZk3eLpPEcCgini4lNTYjVLFDY+pRN8yCqgOOaYt
         Sy3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pfe6uCmevWuF94JYx1zu1p7qS2nrugU0ygHHkwo4f8w=;
        b=tinIcMTIE6IpxXWO6+MNODcP4HPT1r+6IGxX3R2pel8bBbBx6M0ZvT8qyO7LqUxqCf
         8nKtmtM58UqlSyfOZXKURQWXy0uqRnZfEfYDGns1AklXx3BjjXta62ZkT/vad1Wn3Hab
         3WQZrQtJxXAk5qN1yB4YT7Om/aPOO5CYa6QNi4xdlBGeV15CcVN3mDJ0dzt2TlWmF3MP
         HNj+4tOsZ23j7t/JCTVqjVye7SRlHOG3Hwk6A3Zpk3bt3689Sqyv/Ev/EYhz5ldvLMjS
         KWRavYFltzLAM46Ocq0r+BkY3E3zkCcBU6EY5N165GjIqxV0U8Oq+kEx5nTvoxjVh1lL
         NgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pfe6uCmevWuF94JYx1zu1p7qS2nrugU0ygHHkwo4f8w=;
        b=LEnIX9yhQev+v6Edod+2ycxBFOHfFg/Si9YRkvO896Vh86DAkQRCLUDbx3iIWOKN00
         RE36mSXc/OgRXyjRxRGP4S4d3X9NZ4ykseXxjZ3nVBJD6ol9GgTijRj+dmnTIyfZ2ASV
         /L3ndKfCHR943qSB1jxRzNAjMQGsNTffLPRjAlxMKHkxWHv/kalyrX//Sz4kGiKKz7Pi
         /cBQJU8V9XoBuHseMnwZ0ls07Us397cVAicVryKJVdKqyTl/OX7v/hCCrJoPFWwZIYUK
         ZULXfR8INHa0aBX5at4L51v+P3AH3Bv5wKbjvd1kS3WnMIIEOyOfcsTzYwdW6KU9VOdK
         eM/A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVTY5NmrHgmhPckAiMe7dpJP64E8tIF1jAm2hhmNYg9WVP71noi
	jm65hJmvPMDTP+jNOVRD57E=
X-Google-Smtp-Source: APXvYqyQOuHKfyLftDK22TZCVZ5riH3EZTf4FRApTc3Ns4acuTEwSILFlvh25MaR2Hd0UKbGKbRpxg==
X-Received: by 2002:a9d:4f0a:: with SMTP id d10mr10546962otl.85.1579766250929;
        Wed, 22 Jan 2020 23:57:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:40e:: with SMTP id 14ls7502470oie.4.gmail; Wed, 22 Jan
 2020 23:57:30 -0800 (PST)
X-Received: by 2002:aca:5608:: with SMTP id k8mr9837643oib.88.1579766250213;
        Wed, 22 Jan 2020 23:57:30 -0800 (PST)
Date: Wed, 22 Jan 2020 23:57:29 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
In-Reply-To: <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2749_433490410.1579766249538"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_2749_433490410.1579766249538
Content-Type: multipart/alternative; 
	boundary="----=_Part_2750_1998359085.1579766249538"

------=_Part_2750_1998359085.1579766249538
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Ralf, Henning,


Thanks for the quick response, and sorry for the delay.

Here=E2=80=99s my setup: I=E2=80=99ve got a 6-core Intel x86-64 CPU running=
 Kubuntu 19.10.=20
I have an inmate that is given a single core and runs a single-threaded=20
workload. For comparison, I also run the same workload in Linux under=20
Jailhouse.

For a SHA3 workload with the same 20 MiB input, the root Linux cell (and no=
=20
inmate running) takes about 2 seconds, while the inmate (and an idle root=
=20
cell) takes about 2.8 seconds. That is a worrisome discrepancy, and I need=
=20
to understand why it=E2=80=99s 0.8 s slower.

This is the SHA3 workload:=20
https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac79=
f4a1cde/inmates/lib/mgh-sha3.c#L185-L208

This is the Linux wrapper for the SHA3 workload:=20
https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac79=
f4a1cde/mgh/workloads/src/sha3-512.c#L166-L168

This is the inmate program calling the SHA3 workload:=20
https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac79=
f4a1cde/inmates/demos/x86/mgh-demo.c#L370-L379

You can see that the inmate and the Linux wrapper both execute the same=20
function, sha3_mgh(). It's the same C code.

The other workloads I run are intentionally more memory intensive. They see=
=20
a much worse slowdown. For my CSB workload, the root cell takes only 0.05 s=
=20
for a 20 MiB input, while the inmate takes 1.48 s (30x difference). And for=
=20
my Random Access workload, the root cell takes 0.08 s while the inmate=20
takes 3.29 s for a 20 MiB input (40x difference).

Here are the root and inmate cell configs, respectively:

https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac79=
f4a1cde/configs/x86/bazooka-root.c

https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac79=
f4a1cde/configs/x86/bazooka-inmate.c

I did do some modifications to Jailhouse with VMX and the preemption timer,=
=20
but any slowdown that I may have inadvertently introduced should apply=20
equally to the inmate and root cell.

It=E2=80=99s possible that I am measuring the duration of the inmate incorr=
ectly.=20
But the number of vmexits I measure for the inmate and root seem to roughly=
=20
correspond with the duration. I also made sure to avoid tsc_read_ns() by=20
instead recording the TSC cycles and deriving the duration by dividing by=
=20
3,700,000,000 (the unchanging TSC frequency of my processor). Without this,=
=20
the time recorded would overflow after something like 1.2 seconds.


I'm wondering if something else is causing unexpected delays: using=20
IVSHMEM, memory mapping extra memory pages and using it to hold my input,=
=20
printing to a virtual console in addition to a serial console, disabling=20
hardware p-states, turbo boost in the root cell, maybe the workload code is=
=20
being compiled to different instructions for the inmate vs. Linux, etc.

Sorry for all the detail, but I am grasping at straws at this point. Any=20
ideas at what I could look into are appreciated.=20

Thanks,
Michael

On Monday, January 20, 2020 at 6:46:32 AM UTC-7, Henning Schild wrote:
>
> On Sun, 19 Jan 2020 23:45:46 -0800=20
> Michael Hinton <michael...@gmail.com <javascript:>> wrote:=20
>
> > Hello,=20
> >=20
> > I have found that running code in an inmate is a lot slower than=20
> > running that same code in the root cell on my x86 machine. I am not=20
> > sure why.=20
>
> Can you elaborate on "code" and "a lot"? Maybe roughly tell us what=20
> your testcase does and how severe your slowdown is. Synthetic=20
> microbenchmark to measure context switching ?=20
>
> As Ralf already said, anything causing "exits" can be subject to=20
> slowdown. But that should be roughly the same for the root cell or any=20
> non-root cell, is it truly the "same" code?=20
>
> And of cause anything accessing shared resources can be slowed down by=20
> the sharing. Caches/buses ... but i would not expect "a lot".=20
>
> regards,=20
> Henning=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b258dc63-26a9-4eff-852a-23d72d2e3258%40googlegroups.com.

------=_Part_2750_1998359085.1579766249538
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"docs-internal-guid-ebdf743d-7fff-9db3-7760-e25=
9ebc81a59"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif=
; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric:=
 normal; font-variant-east-asian: normal; vertical-align: baseline; white-s=
pace: pre-wrap;">Ralf, Henning,</span></p><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; =
font-family: Nunito, sans-serif; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;"><br></span></p><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0); =
background-color: transparent; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; vertical-align: baseline; white-space: pre-wrap;">Thanks=
 for the quick response, and sorry for the delay.</span></p><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0);=
 background-color: transparent; font-variant-numeric: normal; font-variant-=
east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">Here=
=E2=80=99s my setup: I=E2=80=99ve got a 6-core Intel x86-64 CPU running Kub=
untu 19.10. I have an inmate that is given a single core and runs a single-=
threaded workload. For comparison, I also run the same workload in Linux un=
der Jailhouse.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: =
Nunito, sans-serif; color: rgb(0, 0, 0); background-color: transparent; fon=
t-variant-numeric: normal; font-variant-east-asian: normal; vertical-align:=
 baseline; white-space: pre-wrap;">For a SHA3 workload with the same 20 MiB=
 input, the root Linux cell (and no inmate running) takes about 2 seconds, =
while the inmate (and an idle root cell) takes about 2.8 seconds. That is a=
 worrisome discrepancy, and I need to understand why it=E2=80=99s 0.8 s slo=
wer.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sa=
ns-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-=
numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;=
 white-space: pre-wrap;">This is the SHA3 workload: </span><a href=3D"https=
://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac79f4a1c=
de/inmates/lib/mgh-sha3.c#L185-L208"><span style=3D"font-size: 11pt; font-f=
amily: Nunito, sans-serif; background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; text-decoration-line: underli=
ne; text-decoration-skip-ink: none; vertical-align: baseline; white-space: =
pre-wrap;">https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616=
a0f3df8ac79f4a1cde/inmates/lib/mgh-sha3.c#L185-L208</span></a></p><br><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; font-family: Nunito, sans-serif; color: rgb(0, =
0, 0); background-color: transparent; font-variant-numeric: normal; font-va=
riant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"=
>This is the Linux wrapper for the SHA3 workload: </span><a href=3D"https:/=
/github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac79f4a1cde=
/mgh/workloads/src/sha3-512.c#L166-L168"><span style=3D"font-size: 11pt; fo=
nt-family: Nunito, sans-serif; background-color: transparent; font-variant-=
numeric: normal; font-variant-east-asian: normal; text-decoration-line: und=
erline; text-decoration-skip-ink: none; vertical-align: baseline; white-spa=
ce: pre-wrap;">https://github.com/hintron/jailhouse/blob/76e6d446ca682f7367=
9616a0f3df8ac79f4a1cde/mgh/workloads/src/sha3-512.c#L166-L168</span></a></p=
><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; colo=
r: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: norma=
l; font-variant-east-asian: normal; vertical-align: baseline; white-space: =
pre-wrap;">This is the inmate program calling the SHA3 workload: </span><a =
href=3D"https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f=
3df8ac79f4a1cde/inmates/demos/x86/mgh-demo.c#L370-L379"><span style=3D"font=
-size: 11pt; font-family: Nunito, sans-serif; background-color: transparent=
; font-variant-numeric: normal; font-variant-east-asian: normal; text-decor=
ation-line: underline; text-decoration-skip-ink: none; vertical-align: base=
line; white-space: pre-wrap;">https://github.com/hintron/jailhouse/blob/76e=
6d446ca682f73679616a0f3df8ac79f4a1cde/inmates/demos/x86/mgh-demo.c#L370-L37=
9</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, s=
ans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant=
-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline=
; white-space: pre-wrap;">You can see that the inmate and the Linux wrapper=
 both execute the same function, sha3_mgh(). It&#39;s the same C code.</spa=
n></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif;=
 color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: =
normal; font-variant-east-asian: normal; vertical-align: baseline; white-sp=
ace: pre-wrap;">The other workloads I run are intentionally more memory int=
ensive. They see a much worse slowdown. For my CSB workload, the root cell =
takes only 0.05 s for a 20 MiB input, while the inmate takes 1.48 s (30x di=
fference). And for my Random Access workload, the root cell takes 0.08 s wh=
ile the inmate takes 3.29 s for a 20 MiB input (40x difference).</span></p>=
<br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;">Here are the root and inmate cell configs, respectively:</span></=
p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><a href=3D"https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679=
616a0f3df8ac79f4a1cde/configs/x86/bazooka-root.c"><span style=3D"font-size:=
 11pt; font-family: Nunito, sans-serif; background-color: transparent; font=
-variant-numeric: normal; font-variant-east-asian: normal; text-decoration-=
line: underline; text-decoration-skip-ink: none; vertical-align: baseline; =
white-space: pre-wrap;">https://github.com/hintron/jailhouse/blob/76e6d446c=
a682f73679616a0f3df8ac79f4a1cde/configs/x86/bazooka-root.c</span></a></p><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><=
a href=3D"https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a=
0f3df8ac79f4a1cde/configs/x86/bazooka-inmate.c"><span style=3D"font-size: 1=
1pt; font-family: Nunito, sans-serif; background-color: transparent; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; text-decoration-li=
ne: underline; text-decoration-skip-ink: none; vertical-align: baseline; wh=
ite-space: pre-wrap;">https://github.com/hintron/jailhouse/blob/76e6d446ca6=
82f73679616a0f3df8ac79f4a1cde/configs/x86/bazooka-inmate.c</span></a></p><b=
r><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; color: =
rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; =
font-variant-east-asian: normal; vertical-align: baseline; white-space: pre=
-wrap;">I did do some modifications to Jailhouse with VMX and the preemptio=
n timer, but any slowdown that I may have inadvertently introduced should a=
pply equally to the inmate and root cell.</span></p><br><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fon=
t-size: 11pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0); backgro=
und-color: transparent; font-variant-numeric: normal; font-variant-east-asi=
an: normal; vertical-align: baseline; white-space: pre-wrap;">It=E2=80=99s =
possible that I am measuring the duration of the inmate incorrectly. But th=
e number of vmexits I measure for the inmate and root seem to roughly corre=
spond with the duration. </span><span style=3D"background-color: transparen=
t; color: rgb(0, 0, 0); font-family: Nunito, sans-serif; font-size: 11pt; w=
hite-space: pre-wrap;">I also made sure to avoid tsc_read_ns() by instead r=
ecording the TSC cycles and deriving the duration by dividing by 3,700,000,=
000 (the unchanging TSC frequency of my processor). Without this, the time =
recorded would overflow after something like 1.2 seconds.</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; font-family: Nunito, sans-serif; color: rgb(0, 0=
, 0); background-color: transparent; font-variant-numeric: normal; font-var=
iant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">=
<br></span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-s=
erif; color: rgb(0, 0, 0); background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">I&#39;m wondering if something else is causing unexpec=
ted delays: using IVSHMEM, memory mapping extra memory pages and using it t=
o hold my input, printing to a virtual console in addition to a serial cons=
ole, disabling hardware p-states, turbo boost in the root cell, maybe the w=
orkload code is being compiled to different instructions for the inmate vs.=
 Linux, etc.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nu=
nito, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-=
variant-numeric: normal; font-variant-east-asian: normal; vertical-align: b=
aseline; white-space: pre-wrap;">Sorry for all the detail, but I am graspin=
g at straws at this point. Any ideas at what I could look into are apprecia=
ted.=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nuni=
to, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-va=
riant-numeric: normal; font-variant-east-asian: normal; vertical-align: bas=
eline; white-space: pre-wrap;">Thanks,</span></p><div><span style=3D"font-s=
ize: 11pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0); background=
-color: transparent; font-variant-numeric: normal; font-variant-east-asian:=
 normal; vertical-align: baseline; white-space: pre-wrap;">Michael</span></=
div></span><br>On Monday, January 20, 2020 at 6:46:32 AM UTC-7, Henning Sch=
ild wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left:=
 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On Sun, 19 Jan 2020 =
23:45:46 -0800
<br>Michael Hinton &lt;<a href=3D"javascript:" target=3D"_blank" gdf-obfusc=
ated-mailto=3D"lxcgcW-SCQAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#=
39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#=
39;;return true;">michael...@gmail.com</a>&gt; wrote:
<br>
<br>&gt; Hello,
<br>&gt;=20
<br>&gt; I have found that running code in an inmate is a lot slower than
<br>&gt; running that same code in the root cell on my x86 machine. I am no=
t
<br>&gt; sure why.
<br>
<br>Can you elaborate on &quot;code&quot; and &quot;a lot&quot;? Maybe roug=
hly tell us what
<br>your testcase does and how severe your slowdown is. Synthetic
<br>microbenchmark to measure context switching ?
<br>
<br>As Ralf already said, anything causing &quot;exits&quot; can be subject=
 to
<br>slowdown. But that should be roughly the same for the root cell or any
<br>non-root cell, is it truly the &quot;same&quot; code?
<br>
<br>And of cause anything accessing shared resources can be slowed down by
<br>the sharing. Caches/buses ... but i would not expect &quot;a lot&quot;.
<br>
<br>regards,
<br>Henning
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b258dc63-26a9-4eff-852a-23d72d2e3258%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/b258dc63-26a9-4eff-852a-23d72d2e3258%40googlegroups.com<=
/a>.<br />

------=_Part_2750_1998359085.1579766249538--

------=_Part_2749_433490410.1579766249538--
