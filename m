Return-Path: <jailhouse-dev+bncBD7236HKXYJRBTMB4P4AKGQEX4ZCVIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7DD22A287
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jul 2020 00:42:22 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id g17sf2438965qvw.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 15:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ccC81rvFllTcCRyEKjmdWQwGU8ilLtNtNqQbFBUSCMs=;
        b=PpECPZBWNazDz67dDTGFymEvht/E7EYNCuAgBJXDarGs44MABV+IC9yLRhtDJ7kPSS
         2a8Fy9DuAm91bJGVhpIG3kxWMyQloUSm/iMGLCgRogJvwV1e7Q2pTDw1+jwy3pAMeIrD
         OmanGTXIh8TI7+h2Q1a4RUHYXwbxhWbuL02jcG56azMtLuwbOWTY5QJDDP7ln0Q76tzH
         FJ73+BxG3bVk+KZDxSS1PYkQB86wwGX4trJuD2lusagXoiRjpZkHvh3+87n+i+kwu5da
         0s11s9UrpmNx+fgk3FVCGJq3cimamQDiRegU4mRhbXf6LNQpzGHjEMxj/2DC3C0caJdD
         3C4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ccC81rvFllTcCRyEKjmdWQwGU8ilLtNtNqQbFBUSCMs=;
        b=ETvDoamdwvc89jMnCY8OhISa8rzw4EJCV7FeNfWd10w9jIu05mXgjq5pvw4/pz2oom
         iJ0VfhQEDoOPquDp02hdf/vwkER/dCiNDAG2su2L61GwjsfsMja7egmr4QClMXaZAgxj
         EyHdQCq9RnGrRaBNX7PlFw0V6UFcdxhp7Hl543s9Ax1A8tz92Ws4+tz1kFNkrY9YGFDp
         GVDaKctIVt4YSOETpCfiNReH1jgGbwvl62hi+z421Zbr1nKXGRKsrloeou9RUqxkKavW
         94qEraiVjrtyDE68NG3f1yZMmihjDvejlE8PJf/d/WS5EIVaZi2HTpd2n/elOtkRmcoh
         /c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ccC81rvFllTcCRyEKjmdWQwGU8ilLtNtNqQbFBUSCMs=;
        b=fMW7ro9ECPWmrfMRsC2Y/1oBu2oAM7yyfy/2hv4QXYYiuo2Nb/mNCPdsBWNpGJbojp
         qXnQlPjxnD+4WTUnI6oJxFi/NSGxeTTr4iSG2NteS9KJe2w1yk01RRY/fcRLbxHsf661
         nPTq6tCOZSPA2LVPebt1pfuvIRUdDzVmmPsnf6ZTiZNQjWxQ4U5ErAnZ69YMjobORd1p
         ybE8ksxgM7//cwHXCY/A9GhZIrI4y6EkR+t9wmraNU+D16KaoFE/Kztca5Ru6GfHp5Kp
         LVQB+7WPikSyeSGFhNcAMR51hxBDmZ7gnf6Oiv64p2dbHmup2Z9I+k9xh7peVKeR6AVS
         ISFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531FkVlgopwWxiCWk3H8x9m+Kn1xNi5w9/DvsBBSx09L8YAtTacP
	z4fWIpoWiXDaI2ZHztO77SM=
X-Google-Smtp-Source: ABdhPJwNcXPeTYiXrlVrfdEg4jlHqFz9GhNosUJS/YuAjVKXTZW6aHxxqZnugvrci6ZnTvzmlogpmQ==
X-Received: by 2002:ad4:45a2:: with SMTP id y2mr2225871qvu.187.1595457741574;
        Wed, 22 Jul 2020 15:42:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:2343:: with SMTP id i3ls1477419qtc.8.gmail; Wed, 22 Jul
 2020 15:42:21 -0700 (PDT)
X-Received: by 2002:ac8:51d3:: with SMTP id d19mr1600726qtn.151.1595457740847;
        Wed, 22 Jul 2020 15:42:20 -0700 (PDT)
Date: Wed, 22 Jul 2020 15:42:20 -0700 (PDT)
From: "contact....@gmail.com" <contact.thorsten@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ac8480df-0064-4059-8940-c5915d66de9dn@googlegroups.com>
In-Reply-To: <15788c10-ef19-0fa7-ece9-97c3ed78ce52@siemens.com>
References: <8b1bf245-4bef-4ca8-9ffc-0dcb66dca9ccn@googlegroups.com>
 <15788c10-ef19-0fa7-ece9-97c3ed78ce52@siemens.com>
Subject: Re: ivshmem-net no going lower_up in root-cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_18_1709309532.1595457740092"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_18_1709309532.1595457740092
Content-Type: multipart/alternative; 
	boundary="----=_Part_19_1472215722.1595457740092"

------=_Part_19_1472215722.1595457740092
Content-Type: text/plain; charset="UTF-8"


Jan schrieb am Dienstag, 21. Juli 2020 um 15:40:30 UTC+2:

> On 21.07.20 13:30, Thorsten wrote: 
> > I have a an ivshmem-net defined between the root cell and the first 
> > non-root Linux, and another one between the first NR-Linux and a second 
> > NR-Linux. The second one between the NR-Ls is working smoothly fine. 
> > 
> > However, I cannot get the first one up. Jailhouse-console-ivshmem says 
> > the cells are connected, In Linux the device comes up fine with mem and 
> > alike, but the stats stay at zero, no carrier detected. I have checked 
> > the configs to my best knowledge, mem-regions + devices look right. 
>
> Sounds a lot like an IRQ delivery issue. You can check that via 
> /proc/interrupts. At the point both peers are up, they should also see 
> config IRQs (first vector). If not, check if you have assigned the right 
> IOMMU ID to the virtual PCI device in the root cell (use ID 1 if none or 
> 0 was used so far). See also 
> jailhouse-images/recipes-jailhouse/jailhouse/files/nuc6cay.c. 
>

Thanks, you're spot-on right, but the problem persists. Partially.
I tried quite few variations of the configuration, but there are no MSIs 
for virtual PCI devices in the root cell (/proc/interrupts as the 
indicator). One thing that I noticed, no matter how I set the the 
iommu-value for the root cell [0,1], the int-signalling in the NR-cells 
always worked.
I finally resorted to a different box having a similar processor (Atom 
E3930 2-core vs E3950 4-core in the problem-box) and it worked there as 
expected by setting iommu to 1. So I am still lost about the cause. The two 
systems are sufficiently different boards to spot an obvious difference.

At this point, this problem is not a show-stopper for my trial application, 
as the "beef" runs in the NR-cells. -- I can go on looking further into the 
issue, if it is of interest.

cheers,
Thorsten

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ac8480df-0064-4059-8940-c5915d66de9dn%40googlegroups.com.

------=_Part_19_1472215722.1595457740092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Jan s=
chrieb am Dienstag, 21. Juli 2020 um 15:40:30 UTC+2:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid r=
gb(204, 204, 204); padding-left: 1ex;">On 21.07.20 13:30, Thorsten wrote:
<br>&gt; I have a an ivshmem-net defined between the root cell and the firs=
t=20
<br>&gt; non-root Linux, and another one between the first NR-Linux and a s=
econd=20
<br>&gt; NR-Linux. The second one between the NR-Ls is working smoothly fin=
e.
<br>&gt;=20
<br>&gt; However, I cannot get the first one up. Jailhouse-console-ivshmem =
says=20
<br>&gt; the cells are connected, In Linux the device comes up fine with me=
m and=20
<br>&gt; alike, but the stats stay at zero, no carrier detected. I have che=
cked=20
<br>&gt; the configs to my best knowledge, mem-regions + devices look right=
.
<br>
<br>Sounds a lot like an IRQ delivery issue. You can check that via=20
<br>/proc/interrupts. At the point both peers are up, they should also see=
=20
<br>config IRQs (first vector). If not, check if you have assigned the righ=
t=20
<br>IOMMU ID to the virtual PCI device in the root cell (use ID 1 if none o=
r=20
<br>0 was used so far). See also=20
<br>jailhouse-images/recipes-jailhouse/jailhouse/files/nuc6cay.c.
<br></blockquote><div><br></div><div>Thanks, you're spot-on right, but the =
problem persists. Partially.<br> I tried quite few variations of the config=
uration, but there are no MSIs for virtual PCI devices in the root cell (/p=
roc/interrupts as the indicator). One thing that I noticed, no matter how I=
 set the the iommu-value for the root cell [0,1], the int-signalling in the=
 NR-cells always worked.</div><div>I finally resorted to a different box ha=
ving a similar processor (Atom E3930 2-core vs E3950 4-core in the problem-=
box) and it worked there as expected by setting iommu to 1. So I am still l=
ost about the cause. The two systems are sufficiently different boards to s=
pot an obvious difference.</div><div><br></div><div>At this point, this pro=
blem is not a show-stopper for my trial application, as the "beef" runs in =
the NR-cells. -- I can go on looking further into the issue, if it is of in=
terest.</div><div><br></div><div>cheers,<br>Thorsten<br> </div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ac8480df-0064-4059-8940-c5915d66de9dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ac8480df-0064-4059-8940-c5915d66de9dn%40googlegroups.co=
m</a>.<br />

------=_Part_19_1472215722.1595457740092--

------=_Part_18_1709309532.1595457740092--
