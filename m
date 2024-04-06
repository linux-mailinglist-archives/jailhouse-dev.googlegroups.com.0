Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBLFQY6YAMGQE2COIU7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBE789ADA5
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Apr 2024 01:18:06 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dc3645a6790sf5546182276.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Apr 2024 16:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712445485; x=1713050285; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AZouTfRac042oIQMzPCU0LnTMb6obNpG8V9GGExDxR4=;
        b=uKC5eMsTI09m3mLv3GVDi9pUEnx6PiSf4ePiem13dx3yFWxJ/j8gwcMOG1ij2DWrhJ
         CB+kp4WImpM1/9fmG1acELIxqOY/zQAjeCU8j2hR+8HPZxtzeXcrUwjtNmmwTJkhGlOF
         APsX/lE+6ChgarYGptriYnw1/VVoVXwZbHhuEvm5TBWL2p/9vpuPJwDVKPvlyLoiP7dr
         QG7YIolyG2lIV3aBgcd95HNzxQo3VaU29DyEkiqRHbImbPBGUvqP2WEfZh23v0jHwYdR
         9XkySHe8rvT5x9DKQxbb0MX9zH4H9KZGg5DTcR9kUbWJCWeone3LbZZqyFVBphUImvJY
         i5YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712445485; x=1713050285; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZouTfRac042oIQMzPCU0LnTMb6obNpG8V9GGExDxR4=;
        b=IxAFYf0hpVEfBtfRviU/gowLHonKqBt1EYhpY7/CKW2JG8GZrhq4+ggXBvSukj1QcT
         dkPwsOJfXHUQhbOuCPKqqcEYIrljELAdCqYADjSV+IFW6MbC+9s1eQ18D92kIw+T7NAH
         3Xjv1/B5geX0vX4WrAz0QpelszrvDZUKwsSZNnkt0+EG5dbf/jDFOZnyRRdizFB/195I
         A5+bdmo70eloZbqMCCIbRHt95JGqvZrpB5QtsPuZqvFoKFyiL9tvEDG12WYjWfqpwSvE
         fXs5pkwcoVnSf96kOBWK3bjr0DNWkYnE9bkZAmSQXD7cJgGQilxBJCVXWks/4Kl+j4mG
         jY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712445485; x=1713050285;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AZouTfRac042oIQMzPCU0LnTMb6obNpG8V9GGExDxR4=;
        b=EP6TWlIQl4ZxZkIX75aHqIa2m0Vv0x2x6kRQtUO9GvDFsfrOZY6pehY1mC+xWOfgpH
         Hvwf/EDKulP6nwu2/+cSQu74rtq/qWI/qUnqpfXjWB7Lqg7Yc6Ti8aM7dkPiMgyor2vL
         +O8xgjom8MiEVgpQOvfHi6YiicA/tGAwH2EoxHcKfptkwYzUsoG696fgJksHwmHQpA4Y
         BqeJ0e2fCMTSwy9j3rwZbjQW+3vPpJhjOznwuBkB8M/kWyRkCMyVGv7azqDmoWU4/UdD
         y6PyrGsUxKmg2/BKaP87W/7tIZV8wHlBWS9nWWSXRk2EYzluFfeaiKWL2pyPFwGRXhjV
         ZHvg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUnxbz+xvLzv5R8/DEAwsRWwcfXkvohZMKcfS9uXTNtIuB9b0Z/6TnN+NcD9joSqFiTDMkmG2jyjvLPUqJ+XmfU9wWpSKVZjPR0Cug=
X-Gm-Message-State: AOJu0YyDlnn2vZXHiD17ya8qESG9nHUH0ztbDya7vCewKx1X8Jcb4C8e
	CWK7hf+kThWOAuRViNOQXR6faUJ1vJQrLJurpiS1Swil+jmTTfZg
X-Google-Smtp-Source: AGHT+IFi1Zz0M7k/dSOU8RUi518AxlUqBknQpZIzQLylOq63+MIShv7O5i09keHXBSo7/D87UmEjIw==
X-Received: by 2002:a05:6902:1b10:b0:dd0:c2a:26f9 with SMTP id eh16-20020a0569021b1000b00dd00c2a26f9mr5070398ybb.27.1712445485078;
        Sat, 06 Apr 2024 16:18:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7145:0:b0:dcd:a08f:c83f with SMTP id m66-20020a257145000000b00dcda08fc83fls1543115ybc.1.-pod-prod-08-us;
 Sat, 06 Apr 2024 16:18:03 -0700 (PDT)
X-Received: by 2002:a05:690c:d0c:b0:617:cbcf:8233 with SMTP id cn12-20020a05690c0d0c00b00617cbcf8233mr1426570ywb.2.1712445483326;
        Sat, 06 Apr 2024 16:18:03 -0700 (PDT)
Date: Sat, 6 Apr 2024 16:18:02 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8bdc0366-2905-4cae-8e6f-24a929f8facen@googlegroups.com>
In-Reply-To: <DU0PR04MB9417FCA05F9B24C45D99EF15888DA@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <AQHaLM9+zakaMEzIfEymK85zNsSHVbClRY0wgAAEcACAAUOO4A==>
 <DU0PR04MB9417D1CFA35D02279D40EA6A888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <22a09591-024f-4a02-a18f-793094d81d45@tum.de>
 <DU0PR04MB9417F5A4D0C801E59F32E6F2888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <70769d2b-d476-4b2c-bcae-104b27628695@tum.de>
 <DU0PR04MB9417FCA05F9B24C45D99EF15888DA@DU0PR04MB9417.eurprd04.prod.outlook.com>
Subject: Re: str wzr, [x1, #16]! triggers EL2 unhandled data abort
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_289812_248728775.1712445482672"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_289812_248728775.1712445482672
Content-Type: multipart/alternative; 
	boundary="----=_Part_289813_1311545918.1712445482672"

------=_Part_289813_1311545918.1712445482672
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

On Wednesday, December 13, 2023 at 4:22:49=E2=80=AFAM UTC+1 Peng Fan wrote:

> > Subject: Re: str wzr, [x1, #16]! triggers EL2 unhandled data abort
> >=20
> > Hi Peng,
> >=20
> > Am 12.12.23 um 08:52 schrieb Peng Fan:
> > > Hi Alex,
> > >
> > >> Subject: Re: str wzr, [x1, #16]! triggers EL2 unhandled data abort
> > >>
> > >> Hi Peng,
> > >>
> > >> Am 12.12.23 um 03:42 schrieb Peng Fan:
> > >>> Hi All,
> > >>>
> > >>>
> > >>> I am running jailhouse on i.MX9 Cortex-A55, and meet an issue.
> > >>> " str wzr, [x1, #16]! " this instruction in EL0 triggers unhanlded
> > >>> Data abort in EL2, with ISS is data abort, ISV is 0.
> > >>>
> > >>> I am not sure why this instruction trigger DC with ISV 0.
> > >>> Any ideas are appreciated.
> > >>>
> > >>> Thanks,
> > >>> Peng.
> > >>
> > >> The Arm architecture cannot provide all information in ISS for
> > >> instructions that also update the base register.
> > >
> > > Does ARM architecture TRM note this? Would you please share me the
> > > Chapter?
> >=20
> > In my old version of the Arm ARM it's noted in Section D7.2.27 "ESR_ELx=
,
> > Exception Syndrome Register (ELx)" in the description of the ISV bit:
> > > Instruction syndrome valid ...
> > > This bit is 0 for all faults reported in ESR_EL2 except the following
> > > stage 2
> > aborts:
> > > =E2=80=A2 AArch64 loads and stores ... and excluding those with write=
back.
> >=20
> >=20
> > >> You need to change the code sequence to:
> > >> str wzr, [x1, #16]
> > >> add x1, x1, #16
> > >
> > > Hmm, but gcc generates "str wzr, [x1, #16]!" from c code.
> > >
> > > This should be common issue I think.
> >=20
> > Yes, and I remember that there was some discussion on this on the LKML
> > years ago. The raw accessors in Linux like __raw_writel() enforce the=
=20
> simple
> > load/store forms to aid virtualization-
>
> Thanks very much, I will try this.
>
> Thanks,
> Peng.
>
> >=20
> > Best regards
> > Alex
> >=20
> >=20
> > >
> > > Thanks,
> > > Peng.
> > >
> > >>
> > >>
> > >> Best regards
> > >> Alex
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8bdc0366-2905-4cae-8e6f-24a929f8facen%40googlegroups.com.

------=_Part_289813_1311545918.1712445482672
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Wednesday, December 13, 2023 at 4:22:49=E2=80=AFAM UTC+1 Peng Fan wrote:<b=
r/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">&gt; Subject: =
Re: str wzr, [x1, #16]! triggers EL2 unhandled data abort
<br>&gt;=20
<br>&gt; Hi Peng,
<br>&gt;=20
<br>&gt; Am 12.12.23 um 08:52 schrieb Peng Fan:
<br>&gt; &gt; Hi Alex,
<br>&gt; &gt;
<br>&gt; &gt;&gt; Subject: Re: str wzr, [x1, #16]! triggers EL2 unhandled d=
ata abort
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; Hi Peng,
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; Am 12.12.23 um 03:42 schrieb Peng Fan:
<br>&gt; &gt;&gt;&gt; Hi All,
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; I am running jailhouse on i.MX9 Cortex-A55, and meet =
an issue.
<br>&gt; &gt;&gt;&gt; &quot; str     wzr, [x1, #16]! &quot; this instructio=
n in EL0 triggers unhanlded
<br>&gt; &gt;&gt;&gt; Data abort in EL2, with ISS is data abort, ISV is 0.
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; I am not sure why this instruction trigger DC with IS=
V 0.
<br>&gt; &gt;&gt;&gt; Any ideas are appreciated.
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; Thanks,
<br>&gt; &gt;&gt;&gt; Peng.
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; The Arm architecture cannot provide all information in IS=
S for
<br>&gt; &gt;&gt; instructions that also update the base register.
<br>&gt; &gt;
<br>&gt; &gt; Does ARM architecture TRM note this? Would you please share m=
e the
<br>&gt; &gt; Chapter?
<br>&gt;=20
<br>&gt; In my old version of the Arm ARM it&#39;s noted in Section D7.2.27=
 &quot;ESR_ELx,
<br>&gt; Exception Syndrome Register (ELx)&quot; in the description of the =
ISV bit:
<br>&gt; &gt; Instruction syndrome valid ...
<br>&gt; &gt; This bit is 0 for all faults reported in ESR_EL2 except the f=
ollowing
<br>&gt; &gt; stage 2
<br>&gt; aborts:
<br>&gt; &gt; =E2=80=A2 AArch64 loads and stores ... and excluding those wi=
th writeback.
<br>&gt;=20
<br>&gt;=20
<br>&gt; &gt;&gt; You need to change the code sequence to:
<br>&gt; &gt;&gt;   str     wzr, [x1, #16]
<br>&gt; &gt;&gt;   add     x1, x1, #16
<br>&gt; &gt;
<br>&gt; &gt; Hmm, but gcc generates &quot;str wzr, [x1, #16]!&quot; from c=
 code.
<br>&gt; &gt;
<br>&gt; &gt; This should be common issue I think.
<br>&gt;=20
<br>&gt; Yes, and I remember that there was some discussion on this on the =
LKML
<br>&gt; years ago. The raw accessors in Linux like __raw_writel() enforce =
the simple
<br>&gt; load/store forms to aid virtualization-
<br>
<br>Thanks very much, I will try this.
<br>
<br>Thanks,
<br>Peng.
<br>
<br>&gt;=20
<br>&gt; Best regards
<br>&gt; Alex
<br>&gt;=20
<br>&gt;=20
<br>&gt; &gt;
<br>&gt; &gt; Thanks,
<br>&gt; &gt; Peng.
<br>&gt; &gt;
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; Best regards
<br>&gt; &gt;&gt; Alex
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8bdc0366-2905-4cae-8e6f-24a929f8facen%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/8bdc0366-2905-4cae-8e6f-24a929f8facen%40googlegroups.co=
m</a>.<br />

------=_Part_289813_1311545918.1712445482672--

------=_Part_289812_248728775.1712445482672--
