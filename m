Return-Path: <jailhouse-dev+bncBCV335GORINBBWGCUSAAMGQELQOE3CA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id C67E32FE2F8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 21 Jan 2021 07:38:16 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id k67sf475464wmk.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 20 Jan 2021 22:38:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611211096; cv=pass;
        d=google.com; s=arc-20160816;
        b=avHx0aEUNohkxHFSDlFJts32MJZ3EkkFASeKGqTlL90L+5fOyeHeGc0Fm2uQb2SIMO
         jZIsqgpOoxY84tc3/mA6xKAxO9QOgzie+2vWB9Dk0ClwdW1FylqpOU18S+DrWq4mqsIE
         PQMhRIdasrRre+7BO/k/WHTC+K0+uN1VzaHIbP3DH0VP3hG45jdMR7tFU5STsd1VQR/h
         8Sz/MdsxLcls/NvkK5IvEyCAhBalYPKR9ckEgSSy5NQyMj3CcrI21CFSVuPZ4WFY4fY/
         63jAT3HUSr31V/cV9tOEek1cJ0q0nIkAFxFD4pOzx47EF1UivjwBySoiWzxWPeSRTAPG
         SDyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=QS/1t+BHoJzov4GcMLCqLmbWX2BsTR8E4L3LKvj6XLM=;
        b=XEDpO+JsOL9Z2f5UMyMP/jyDt3TWZ7qWYxSoJw6EG8IXs9CPb/Acp5Yus8dXl6Xw5Y
         RzUaedeR6ND1OmgPgm6pNIhAcCo+lwWc7ZUceKdnSGDgH4BSkqZuJhPAFbTIuNbduI9s
         SM9n3X3rLWPj/kE/9fcunKpz7+nU52bckcIv0cW7U2KhxPgdVwZEym28A4GvmuI7/s3c
         GDUUuLoYTR8LaP//fcNNT/RXvonvPsMyZwWC/xq1cb8zFWKDSWAujDZu7I3bC0ig3pdd
         HGpJ0asla/moA2coRo7e+U8BDBOJLSls56/pD/WQFWtAhHOOrIITL1F959XkB1aItIda
         fvoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KwOcoY7d;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::12c as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QS/1t+BHoJzov4GcMLCqLmbWX2BsTR8E4L3LKvj6XLM=;
        b=kQYIY+fpV7fXv6O6HjMeTgjCGk2fJGVxNNyFYeYjP4lelb+f1Jc6ANrTaj/O4XOQR8
         ZPaYFux01ASWC+ik8BhvsMLx5b5h7Gy0esBFhnZyFtjRbCuebXZJ1M6gNjLce0KfWI9a
         7x3JXeSs5nLFCf8HvNCF1Bf15+eowg9sqgIljs1nKeGOLWYBSOP7S6iXAPu5edES48Zm
         +TeTDvWZ0kJFmVK0zJWR52bnUySsyB988VQHt1jvurCiw10JEq7KqjSboTZNznOVXPRc
         U98CKt6a+ZyVfWXUsaNmKDBUqEbmpgtVMC4pxZx7LCDAQGDc3l/6KZKIWRQGnCBwEz6V
         XJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QS/1t+BHoJzov4GcMLCqLmbWX2BsTR8E4L3LKvj6XLM=;
        b=jEe183q1mXJDjafZT/0OX83FCxkiPyq9v0DzTaNnAE1lH9V7Dccb54W9t8Xm5WlbiY
         DS/KW9/Z6YcWzZ1Dyi29AtjvOioNSv8iGi6SVPCH5L+SsNHTjF1lJu8qTSrxSexqAerA
         NZ2umBd9JWEVIjvd+vqiJLa2YbNEVHKlbFsDaCmx6qMcMqKwlWBsp5J7oHszUZ4QqjTF
         3KIM21dAcNS0VQ67FKuo2zo/W1dckBcpD7PXy4z2pGrKMHxX0sctLblolFHWiCIbsUfz
         nuMUQYUzx09HFGj5ZBt3if/q4ElwvaALPYLYm1qA4fPapgB/PCdLzNL3/aekBXFr4D4n
         fU1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ywKdYwaraLljO2eEZd79W2BNFCXM+MOcxb6Onj60nq7XSrhhr
	4bQ3rjgd50yifEq8gP/cARo=
X-Google-Smtp-Source: ABdhPJwcuRUUyIV+PYPc0Nt1jKH1g0HPteAekL7C8r18qn0hCoe+dc1Pv3cH9hmu1XiASsNxUKUDxg==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr7506167wme.188.1611211096537;
        Wed, 20 Jan 2021 22:38:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c8c8:: with SMTP id f8ls362334wml.3.gmail; Wed, 20 Jan
 2021 22:38:15 -0800 (PST)
X-Received: by 2002:a1c:2287:: with SMTP id i129mr7305548wmi.109.1611211095679;
        Wed, 20 Jan 2021 22:38:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611211095; cv=none;
        d=google.com; s=arc-20160816;
        b=au6//mT+EJgiCUpDI1QPvWzc8Dki+yx5fJAWHXgfYxQMsBZ+0UpomNpdeRw/tlmjlg
         hqeLi6z4gTJImO8o4UXseqEMqJffzXKzsXjUW0xDjvdGVVtTCwY4LDBOC6hTdGyEu/vj
         Ci6pE58ur8MUE7POeatMFHwXmMNnV80Oh1m0YLkGcx4G6b6b5URuHlbZ4V0v6ZIjTs9T
         dOPX6nuB9Hrn+z320oybc4XUDMNl1EYVQ6LA8b2y0qp1vDmBU8aA4qPeFnSW3cOcCjjy
         IMTbnASuxqyjDc2JDxMK712UMa+5ABW3/UW5lpRo5+3LB+b1BnC8+PvMLq7C45059irk
         dAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WBRsRNU7LnF/xQbDce69ifrtwUsYWgnw9uRzWF7kPOg=;
        b=A0G+x/X9Mecq3N1BXvdg8G4ZrAdPOMdpT3bgignboR+znXEvTEgm7j/d7864b9uMhG
         6mSv1TAZkXUXQVBPhwnEqAQy1maXIoj/drY61j6OwIyJTfmAeG3jKS+6WdIwv4W9EH2+
         JDnOKFLwJIzen2TY65usNlOiehbAKQYu2rN6oMRwAnN4Ns2gE0LAk06w+03yUg+pQtIr
         vuqUVw94M71BovpFz5w6v7Yk/sApZpYy/7IT6HZfM7jK+M8Fp1ecOk7Ql5r23V+Ell5O
         oyrVxDtQ3hsfhDdS2E4NmXxIgBPgrnaYhs+88cuZqia0cIrQii01uAIiiy3+hDr1bhX/
         0jlA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KwOcoY7d;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::12c as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com. [2a00:1450:4864:20::12c])
        by gmr-mx.google.com with ESMTPS id y1si245469wrl.4.2021.01.20.22.38.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 22:38:15 -0800 (PST)
Received-SPF: pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::12c as permitted sender) client-ip=2a00:1450:4864:20::12c;
Received: by mail-lf1-x12c.google.com with SMTP id o13so1025897lfr.3
        for <jailhouse-dev@googlegroups.com>; Wed, 20 Jan 2021 22:38:15 -0800 (PST)
X-Received: by 2002:a19:ef0b:: with SMTP id n11mr5502453lfh.172.1611211095029;
 Wed, 20 Jan 2021 22:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20200807030632.28259-1-peng.fan@nxp.com> <891d13c9-6845-ef65-36db-4327d6736361@siemens.com>
 <AM5PR0402MB275606FED01836E49F644C2E88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EC86B40254F8CC07A1FF88A30@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3125cc07-ff98-2427-2c9c-56c94588f97c@siemens.com> <a7c570ee-7860-f1ea-60bd-3fb17c6d1751@oth-regensburg.de>
 <DB6PR0402MB276015BA5191EA1010D6D8DA88A10@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB276015BA5191EA1010D6D8DA88A10@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Thu, 21 Jan 2021 07:38:03 +0100
Message-ID: <CAHFG_=WYmObmcGbwn3sZ+vFnXgpZHoXh=_hkhs6Gs7c007U+Fw@mail.gmail.com>
Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
To: Peng Fan <peng.fan@nxp.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Angelo Ruocco <angelo.ruocco.90@gmail.com>, "lokeshvutla@ti.com" <lokeshvutla@ti.com>, 
	"nikhil.nd@ti.com" <nikhil.nd@ti.com>, 
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000fa4eb305b9635030"
X-Original-Sender: francois.ozog@linaro.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linaro.org header.s=google header.b=KwOcoY7d;       spf=pass
 (google.com: domain of francois.ozog@linaro.org designates
 2a00:1450:4864:20::12c as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
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

--000000000000fa4eb305b9635030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

the current state of the EFI interface in U-Boot allows to think of a
portable way to reach your goal on U-Boot and EDK2 and across
architectures.

Is there a special requirement that made you go the really bare metal way ?
For example you can think to do it as an Arm Trusted Firmware BL33 payload
to avoid the cost of U-Boot itself. In that case though, you would need to
prepare hardware that is not handled by any Linux driver (for instance
SERDES adaptation to current board wiring and connectors).

Cheers

FF

On Thu, 21 Jan 2021 at 01:56, Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
> >
> > On 1/19/21 10:48 AM, Jan Kiszka wrote:
> > > On 19.01.21 09:48, Peng Fan wrote:
> > >> All,
> > >>
> > >>> Subject: RE: [PATCH 00/10] ARM64: boot jailhouse before root cell
> > >>> Linux
> > >>
> > >>
> > >> I wanna restart this topic and hope we could move forward to land
> > >> this feature in Jailhouse mainline.
> > >>
> > >> The initial thread:
> > >> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
gro
> > >>
> > ups.google.com%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4&amp;data=3D04%7
> > C01
> > >> %7Cpeng.fan%40nxp.com%7Ce99f4eb319194a5c16b708d8bc6a0d65%7C
> > 686ea1d3bc
> > >>
> > 2b4c6fa92cd99c5c301635%7C0%7C0%7C637466510971068028%7CUnknow
> > n%7CTWFpb
> > >>
> > GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> > 6Mn
> > >>
> > 0%3D%7C1000&amp;sdata=3Dckwld2q5WaXdTjFZgKupN0brisxgyNdu1hiMplrdnj
> > k%3D&
> > >> amp;reserved=3D0
> > >>
> > >> Angelo also post a Linux-less RFC mail:
> > >> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
gro
> > >>
> > ups.google.com%2Fg%2Fjailhouse-dev%2Fc%2FgctNUieKd8Q%2Fm%2FekSKq
> > Ba2BQ
> > >>
> > AJ&amp;data=3D04%7C01%7Cpeng.fan%40nxp.com%7Ce99f4eb319194a5c16b
> > 708d8bc
> > >>
> > 6a0d65%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637466510
> > 97106802
> > >>
> > 8%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> > LCJBTiI
> > >>
> > 6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJDEBgtW8bOeqjI5m1bK2
> > q5DdGCbi
> > >> pkgK2EX3gfQiOkA%3D&amp;reserved=3D0
> > >>
> > >> I propose a IRC[1] discuss in Germany UTC + 1 (10:00am); China UTC +
> > >> 8(17:00pm) in Jan/22. If you need the other timeslot, please raise,
> > >> then I try to find one that make all happy.
> > >
> > > I'm already blocked (up to 11:30 local time) on the 22nd. If we are
> > > looking for a morning slot in European time: 25th before 11am or 26th
> > > before 1pm.
> >
> > 22nd won't work for me, 25th or 26th would both be fine.
>
> Then let's choose 25th, UTC + 1(9:00 am); UTC + 8 (16:00pm).
> 1 hour should be enough for the discussion.
>
> Thanks,
> Peng.
>
>
> >
> >   Ralf
> >
> > >
> > > Jan
> > >
> > >>
> > >> [1]
> > >>
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fweb
> > >>
> > chat.freenode.net%2F%23jailhouse&amp;data=3D04%7C01%7Cpeng.fan%40nx
> > p.co
> > >>
> > m%7Ce99f4eb319194a5c16b708d8bc6a0d65%7C686ea1d3bc2b4c6fa92cd99
> > c5c3016
> > >>
> > 35%7C0%7C0%7C637466510971068028%7CUnknown%7CTWFpbGZsb3d8ey
> > JWIjoiMC4wL
> > >>
> > jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am
> > p;sdat
> > >>
> > a=3DyVeutdslxmRixs2jiUvPqkW3l7Xf9OSF7q0P%2B%2Bo1xDc%3D&amp;reserv
> > ed=3D0
> > >>
> > >> Thanks,
> > >> Peng.
> > >>
> > >>>
> > >>>> Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell
> > >>>> linux
> > >>>>
> > >>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> > >>>>> From: Peng Fan <peng.fan@nxp.com>
> > >>>>>
> > >>>>> This patchset is to support boot jailhouse before Linux.
> > >>>>> The previous RFC patchset:
> > >>>>> https://gr
> > >>>>> ou
> > >>>>>
> > >>>>
> > >>>
> > ps.google.com%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4%2Fm%2FBBmGI_s
> > >>>> pIQAJ
> > >>>>>
> > >>>>
> > >>>
> > &amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7Cfd19d34344a04a8e00690
> > >>>> 8d83dca6
> > >>>>>
> > >>>>
> > >>>
> > d2b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637327286910
> > >>>> 022610&am
> > >>>>>
> > >>>>
> > >>>
> > p;sdata=3DLWalmGgc5itX1A9VYPlJHE8zRst1XiL2lSilgI2z%2F4U%3D&amp;reserv
> > >>>> ed=3D
> > >>>>> 0
> > >>>>>
> > >>>>> Patch 1~6 is to create an new folder libbaremetal to hold files
> > >>>>> that could shared between inmates and new bootloader.
> > >>>>>
> > >>>>> Patch 9 is the central part to boot jailhouse with a baremetal
> > >>>>> bootloader, which only support ARM64 + GIC_V3 now. It will use
> > >>>>> psci to power up secondary cores, do GIC_V3 dist initialization,
> > >>>>> Then kick inmate cell.
> > >>>>>
> > >>>>> Images/cells loading is done by U-Boot bootm command to boot a fi=
t
> > >>> image.
> > >>>>>
> > >>>>> Patch 10 is to support using jailhouse userspace tool even boot
> > >>>>> jailhouse before linux, just do as "insmod jailhouse.ko
> > >>>>> early_loader=3D1", then it will bypass fw loading and etc, but se=
tup
> > >>>> information for linux usage.
> > >>>>>
> > >>>>
> > >>>> I'm missing the big picture description here:
> > >>>>  - how is the memory structure that the boot loader needs to set u=
p?
> > >>>
> > >>> Nothing special, just put the cells/inmates to the fit file, as
> 8mm.its.
> > >>>
> > >>>>  - how is the handover between loader and root linux?
> > >>>
> > >>> Nothing special, the boot args are reserved when U-Boot kick the
> > >>> loader, the loader will pass the args to Linux after jailhouse
> initialization
> > done.
> > >>>
> > >>>>  - how are things configured?
> > >>>>
> > >>>> From a first glance at the code, it seems a lot of things are stil=
l
> > >>>> hard-coded, likely imx8-specific. That may mean we need to work on
> > >>>> the user story further.
> > >>>
> > >>> I use bootloader/include/config.h to define some addresses. Since I
> > >>> using Fit image, do you think it is good to parse fit image to get
> out the
> > info?
> > >>> This will need porting code from U-Boot or write from scratch.
> > >>>
> > >>>>
> > >>>> Also, a qemu-arm64 target would be good.
> > >>>
> > >>> Per my understanding, qemu-arm64 to run jailhouse not have U-Boot.
> > >>> I need to let U-Boot boot Linux, then could add the feature.
> > >>>
> > >>> Regards,
> > >>> Peng.
> > >>>
> > >>>>
> > >>>> Jan
> > >>>>
> > >>>> --
> > >>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> > >>>> Competence Center Embedded Linux
> > >>>
> > >>> --
> > >>> You received this message because you are subscribed to the Google
> > >>> Groups "Jailhouse" group.
> > >>> To unsubscribe from this group and stop receiving emails from it,
> > >>> send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> > >>> To view this discussion on the web visit https://groups
> > >>> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FAM5PR0402MB275606F
> > ED0
> > >>>
> > 1836E49F644C2E88450%2540AM5PR0402MB2756.eurprd04.prod.outlook.co
> > >>>
> > m&amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7Caa5cbde61bf944b03f45
> > >>>
> > 08d83dcbd646%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> > >>>
> > 327292966107007&amp;sdata=3DC7kgZJYMLzHTCwhP6cCjub7x0K0raYBc%2F3I
> > >>> bwqI%2BRZw%3D&amp;reserved=3D0.
> > >
> > >
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276015BA5191EA=
1010D6D8DA88A10%40DB6PR0402MB2760.eurprd04.prod.outlook.com
> .
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Linaro Edge & Fog Computi=
ng Group*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAHFG_%3DWYmObmcGbwn3sZ%2BvFnXgpZHoXh%3D_hkhs6Gs7c007U%2BFw%4=
0mail.gmail.com.

--000000000000fa4eb305b9635030
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peng,<div><br></div><div>the current state of the EFI i=
nterface in U-Boot allows to think of a portable way to reach your goal on =
U-Boot and EDK2 and across architectures.=C2=A0</div><div><br></div><div>Is=
 there a special requirement that made you go the really bare metal way ? F=
or example you can think to do it as an Arm Trusted Firmware BL33 payload t=
o avoid the cost of U-Boot itself. In that case though, you would need to p=
repare hardware that is not handled by any Linux driver (for instance SERDE=
S adaptation to current board wiring and connectors).</div><div><br></div><=
div>Cheers</div><div><br></div><div>FF</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 21 Jan 2021 at 01:56, P=
eng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com">peng.fan@nxp.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">&gt; Subject: Re: [PATCH 00/10] ARM64: boot =
jailhouse before root cell linux<br>
&gt; <br>
&gt; On 1/19/21 10:48 AM, Jan Kiszka wrote:<br>
&gt; &gt; On 19.01.21 09:48, Peng Fan wrote:<br>
&gt; &gt;&gt; All,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; Subject: RE: [PATCH 00/10] ARM64: boot jailhouse before r=
oot cell<br>
&gt; &gt;&gt;&gt; Linux<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I wanna restart this topic and hope we could move forward to =
land<br>
&gt; &gt;&gt; this feature in Jailhouse mainline.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The initial thread:<br>
&gt; &gt;&gt; <a href=3D"https://eur01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fgro" rel=3D"noreferrer" target=3D"_blank">https://eur01.s=
afelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgro</a><br>
&gt; &gt;&gt;<br>
&gt; <a href=3D"http://ups.google.com" rel=3D"noreferrer" target=3D"_blank"=
>ups.google.com</a>%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4&amp;amp;data=3D04=
%7<br>
&gt; C01<br>
&gt; &gt;&gt; %7Cpeng.fan%<a href=3D"http://40nxp.com" rel=3D"noreferrer" t=
arget=3D"_blank">40nxp.com</a>%7Ce99f4eb319194a5c16b708d8bc6a0d65%7C<br>
&gt; 686ea1d3bc<br>
&gt; &gt;&gt;<br>
&gt; 2b4c6fa92cd99c5c301635%7C0%7C0%7C637466510971068028%7CUnknow<br>
&gt; n%7CTWFpb<br>
&gt; &gt;&gt;<br>
&gt; GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI<br>
&gt; 6Mn<br>
&gt; &gt;&gt;<br>
&gt; 0%3D%7C1000&amp;amp;sdata=3Dckwld2q5WaXdTjFZgKupN0brisxgyNdu1hiMplrdnj=
<br>
&gt; k%3D&amp;<br>
&gt; &gt;&gt; amp;reserved=3D0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Angelo also post a Linux-less RFC mail:<br>
&gt; &gt;&gt; <a href=3D"https://eur01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fgro" rel=3D"noreferrer" target=3D"_blank">https://eur01.s=
afelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgro</a><br>
&gt; &gt;&gt;<br>
&gt; <a href=3D"http://ups.google.com" rel=3D"noreferrer" target=3D"_blank"=
>ups.google.com</a>%2Fg%2Fjailhouse-dev%2Fc%2FgctNUieKd8Q%2Fm%2FekSKq<br>
&gt; Ba2BQ<br>
&gt; &gt;&gt;<br>
&gt; AJ&amp;amp;data=3D04%7C01%7Cpeng.fan%<a href=3D"http://40nxp.com" rel=
=3D"noreferrer" target=3D"_blank">40nxp.com</a>%7Ce99f4eb319194a5c16b<br>
&gt; 708d8bc<br>
&gt; &gt;&gt;<br>
&gt; 6a0d65%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637466510<br>
&gt; 97106802<br>
&gt; &gt;&gt;<br>
&gt; 8%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi<br>
&gt; LCJBTiI<br>
&gt; &gt;&gt;<br>
&gt; 6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DJDEBgtW8bOeqjI5m1bK2<br=
>
&gt; q5DdGCbi<br>
&gt; &gt;&gt; pkgK2EX3gfQiOkA%3D&amp;amp;reserved=3D0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I propose a IRC[1] discuss in Germany UTC + 1 (10:00am); Chin=
a UTC +<br>
&gt; &gt;&gt; 8(17:00pm) in Jan/22. If you need the other timeslot, please =
raise,<br>
&gt; &gt;&gt; then I try to find one that make all happy.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m already blocked (up to 11:30 local time) on the 22nd. If =
we are<br>
&gt; &gt; looking for a morning slot in European time: 25th before 11am or =
26th<br>
&gt; &gt; before 1pm.<br>
&gt; <br>
&gt; 22nd won&#39;t work for me, 25th or 26th would both be fine.<br>
<br>
Then let&#39;s choose 25th, UTC + 1(9:00 am); UTC + 8 (16:00pm).<br>
1 hour should be enough for the discussion.<br>
<br>
Thanks,<br>
Peng.<br>
<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Ralf<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Jan<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; [1]<br>
&gt; &gt;&gt;<br>
&gt; <a href=3D"https://eur01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fweb" rel=3D"noreferrer" target=3D"_blank">https://eur01.safelinks.=
protection.outlook.com/?url=3Dhttps%3A%2F%2Fweb</a><br>
&gt; &gt;&gt;<br>
&gt; <a href=3D"http://chat.freenode.net" rel=3D"noreferrer" target=3D"_bla=
nk">chat.freenode.net</a>%2F%23jailhouse&amp;amp;data=3D04%7C01%7Cpeng.fan%=
40nx<br>
&gt; <a href=3D"http://p.co" rel=3D"noreferrer" target=3D"_blank">p.co</a><=
br>
&gt; &gt;&gt;<br>
&gt; m%7Ce99f4eb319194a5c16b708d8bc6a0d65%7C686ea1d3bc2b4c6fa92cd99<br>
&gt; c5c3016<br>
&gt; &gt;&gt;<br>
&gt; 35%7C0%7C0%7C637466510971068028%7CUnknown%7CTWFpbGZsb3d8ey<br>
&gt; JWIjoiMC4wL<br>
&gt; &gt;&gt;<br>
&gt; jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;am<br=
>
&gt; p;sdat<br>
&gt; &gt;&gt;<br>
&gt; a=3DyVeutdslxmRixs2jiUvPqkW3l7Xf9OSF7q0P%2B%2Bo1xDc%3D&amp;amp;reserv<=
br>
&gt; ed=3D0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thanks,<br>
&gt; &gt;&gt; Peng.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Subject: Re: [PATCH 00/10] ARM64: boot jailhouse befo=
re root cell<br>
&gt; &gt;&gt;&gt;&gt; linux<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On 07.08.20 05:06, <a href=3D"mailto:peng.fan@nxp.com=
" target=3D"_blank">peng.fan@nxp.com</a> wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; From: Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp=
.com" target=3D"_blank">peng.fan@nxp.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; This patchset is to support boot jailhouse before=
 Linux.<br>
&gt; &gt;&gt;&gt;&gt;&gt; The previous RFC patchset:<br>
&gt; &gt;&gt;&gt;&gt;&gt; <a href=3D"https://gr" rel=3D"noreferrer" target=
=3D"_blank">https://gr</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; ou<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; <a href=3D"http://ps.google.com" rel=3D"noreferrer" target=3D"_blank">=
ps.google.com</a>%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4%2Fm%2FBBmGI_s<br>
&gt; &gt;&gt;&gt;&gt; pIQAJ<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &amp;amp;data=3D02%7C01%7Cpeng.fan%<a href=3D"http://40nxp.com" rel=3D=
"noreferrer" target=3D"_blank">40nxp.com</a>%7Cfd19d34344a04a8e00690<br>
&gt; &gt;&gt;&gt;&gt; 8d83dca6<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; d2b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637327286910<br>
&gt; &gt;&gt;&gt;&gt; 022610&amp;am<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; p;sdata=3DLWalmGgc5itX1A9VYPlJHE8zRst1XiL2lSilgI2z%2F4U%3D&amp;amp;res=
erv<br>
&gt; &gt;&gt;&gt;&gt; ed=3D<br>
&gt; &gt;&gt;&gt;&gt;&gt; 0<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Patch 1~6 is to create an new folder libbaremetal=
 to hold files<br>
&gt; &gt;&gt;&gt;&gt;&gt; that could shared between inmates and new bootloa=
der.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Patch 9 is the central part to boot jailhouse wit=
h a baremetal<br>
&gt; &gt;&gt;&gt;&gt;&gt; bootloader, which only support ARM64 + GIC_V3 now=
. It will use<br>
&gt; &gt;&gt;&gt;&gt;&gt; psci to power up secondary cores, do GIC_V3 dist =
initialization,<br>
&gt; &gt;&gt;&gt;&gt;&gt; Then kick inmate cell.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Images/cells loading is done by U-Boot bootm comm=
and to boot a fit<br>
&gt; &gt;&gt;&gt; image.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Patch 10 is to support using jailhouse userspace =
tool even boot<br>
&gt; &gt;&gt;&gt;&gt;&gt; jailhouse before linux, just do as &quot;insmod j=
ailhouse.ko<br>
&gt; &gt;&gt;&gt;&gt;&gt; early_loader=3D1&quot;, then it will bypass fw lo=
ading and etc, but setup<br>
&gt; &gt;&gt;&gt;&gt; information for linux usage.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; I&#39;m missing the big picture description here:<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 - how is the memory structure that the boot loa=
der needs to set up?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Nothing special, just put the cells/inmates to the fit fi=
le, as 8mm.its.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 - how is the handover between loader and root l=
inux?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Nothing special, the boot args are reserved when U-Boot k=
ick the<br>
&gt; &gt;&gt;&gt; loader, the loader will pass the args to Linux after jail=
house initialization<br>
&gt; done.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 - how are things configured?<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; From a first glance at the code, it seems a lot of th=
ings are still<br>
&gt; &gt;&gt;&gt;&gt; hard-coded, likely imx8-specific. That may mean we ne=
ed to work on<br>
&gt; &gt;&gt;&gt;&gt; the user story further.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I use bootloader/include/config.h to define some addresse=
s. Since I<br>
&gt; &gt;&gt;&gt; using Fit image, do you think it is good to parse fit ima=
ge to get out the<br>
&gt; info?<br>
&gt; &gt;&gt;&gt; This will need porting code from U-Boot or write from scr=
atch.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Also, a qemu-arm64 target would be good.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Per my understanding, qemu-arm64 to run jailhouse not hav=
e U-Boot.<br>
&gt; &gt;&gt;&gt; I need to let U-Boot boot Linux, then could add the featu=
re.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Regards,<br>
&gt; &gt;&gt;&gt; Peng.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Jan<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt;&gt; Siemens AG, Corporate Technology, CT RDA IOT SES-DE C=
orporate<br>
&gt; &gt;&gt;&gt;&gt; Competence Center Embedded Linux<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; You received this message because you are subscribed to t=
he Google<br>
&gt; &gt;&gt;&gt; Groups &quot;Jailhouse&quot; group.<br>
&gt; &gt;&gt;&gt; To unsubscribe from this group and stop receiving emails =
from it,<br>
&gt; &gt;&gt;&gt; send an email to <a href=3D"mailto:jailhouse-dev%2Bunsubs=
cribe@googlegroups.com" target=3D"_blank">jailhouse-dev+unsubscribe@googleg=
roups.com</a>.<br>
&gt; &gt;&gt;&gt; To view this discussion on the web visit <a href=3D"https=
://groups" rel=3D"noreferrer" target=3D"_blank">https://groups</a><br>
&gt; &gt;&gt;&gt; .<a href=3D"http://google.com" rel=3D"noreferrer" target=
=3D"_blank">google.com</a>%2Fd%2Fmsgid%2Fjailhouse-dev%2FAM5PR0402MB275606F=
<br>
&gt; ED0<br>
&gt; &gt;&gt;&gt;<br>
&gt; 1836E49F644C2E88450%<a href=3D"http://2540AM5PR0402MB2756.eurprd04.pro=
d.outlook.co" rel=3D"noreferrer" target=3D"_blank">2540AM5PR0402MB2756.eurp=
rd04.prod.outlook.co</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; m&amp;amp;data=3D02%7C01%7Cpeng.fan%<a href=3D"http://40nxp.com" rel=
=3D"noreferrer" target=3D"_blank">40nxp.com</a>%7Caa5cbde61bf944b03f45<br>
&gt; &gt;&gt;&gt;<br>
&gt; 08d83dcbd646%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637<br>
&gt; &gt;&gt;&gt;<br>
&gt; 327292966107007&amp;amp;sdata=3DC7kgZJYMLzHTCwhP6cCjub7x0K0raYBc%2F3I<=
br>
&gt; &gt;&gt;&gt; bwqI%2BRZw%3D&amp;amp;reserved=3D0.<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" tar=
get=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/DB6PR0402MB276015BA5191EA1010D6D8DA88A10%40DB6PR04=
02MB2760.eurprd04.prod.outlook.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276015BA5191EA1010=
D6D8DA88A10%40DB6PR0402MB2760.eurprd04.prod.outlook.com</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px" valign=
=3D"top"><img src=3D"https://drive.google.com/a/linaro.org/uc?id=3D0BxTAygk=
us3RgQVhuNHMwUi1mYWc&amp;export=3Ddownload" width=3D"96" height=3D"53"></td=
><td valign=3D"top"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0"=
><tbody><tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;=
;white-space:nowrap;font-size:9pt;padding-top:0px;color:rgb(87,87,87)" vali=
gn=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=A9d=C3=A9ri=
c Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0<i>=
Director Linaro Edge &amp; Fog Computing Group</i></td></tr><tr><td style=
=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;f=
ont-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a=
 value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><=
br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87)=
;text-decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0=
<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td=
></tr></tbody></table></td></tr></tbody></table></div></div></div></div></d=
iv><div><div><br style=3D"font-size:small"></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAHFG_%3DWYmObmcGbwn3sZ%2BvFnXgpZHoXh%3D_hkhs6Gs7c=
007U%2BFw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CAHFG_%3DWYmObmcGbwn3sZ%2BvFnXgpZHo=
Xh%3D_hkhs6Gs7c007U%2BFw%40mail.gmail.com</a>.<br />

--000000000000fa4eb305b9635030--
