Return-Path: <jailhouse-dev+bncBCV335GORINBBGXWYLZQKGQEG7IDIYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 280201882A6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Mar 2020 12:57:15 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id t10sf4262142wrp.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Mar 2020 04:57:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584446235; cv=pass;
        d=google.com; s=arc-20160816;
        b=f6HgQaQDSmB747aq5pavW6XrK1Qd2n5PjrgEEEzrmD8hKT1RlLIhm/aJmqYpZiPk3l
         ivCSRbqrjqmFbvd7LWvrxE9qrYvQb1F0bhfSlxrf4aQLWk1K6C6xtACNNI/IY6TwoYTH
         7YiVhjAOJTmwY5WFqwh7N7EieBiLIsdy4q+HPY3qFByDYK3io68quxYVSyGyqocHZBqZ
         V2gxV7J1DzrXgljsBBn21W6x7hYa0pZpgxXWFhyFoB0Mn5o8YlwXoW/TQStqK2p66+yT
         C3ZW7LaQXqx0agPzs8tTcJ2ZVjk3tlVu30TNztH4XpwTXmVsLFb12DKTQKcSOucedfGH
         R69w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=joGcDYVupJg/Aw0oO1nh40mP+CIM1/rE586xfzNMJHY=;
        b=tkqa8bDy3p9cAtNAy/XNi85gkVpNsRYrHymEsa7Iij8sKdiWtATxj/GtB/pZMBAHZC
         ku5E1gIFLl22jQad7jHqWzC+ri972U4bw1laERKZvRi4NcHiantiiCSqiau4uH89H5bh
         tYCXffNmf5vWKb+yiPTvNrj11VqBwYDCBNZ7KdTjeEuHKBNxHmGp9W3x4e8KaC+OHTH1
         5yKdBGZ6+coYKb1fwLlgsvbb0rnpb1TV4nYozXja+tMo166JBD7jFu86JI7CTm8yQawW
         em2jwSS+NmnXAjRgf+l3VWHAfM1VSgd3VP6F1+xS48tixHiAER2NUnweHSfOj2a9/ptb
         uZpg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UavIghhi;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::144 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=joGcDYVupJg/Aw0oO1nh40mP+CIM1/rE586xfzNMJHY=;
        b=SIC4O5dmK1WaoOW8JBh21LIbO/UX8qAPrl5duFBnScYyX+P6RogBHoN0yN7En8zEQV
         dkK1N+Im7QuIrGayQjyhULXEwRLu7OqH4EqhdDVAxJGavYUIwmWMCAsO8PZNPCxc4jc4
         UaFcbxSg7IstKJPIZYgSt3zQ2pYmATijcfgG4NzEeMtP4dNC6idPBOQVpuoN8Uyao9yk
         5dD94tO14EPWTH7Hx9qo6DFgpJ3baLcdIb2FsOC6264EeWTeEPEPLof+u/cbAh6Rp6Zt
         vQfLcYXDW8KuOgtYbllFmAn4pw4dksTp/OHEJMgSfccBQlUmU5djXbQE93DWRul9IPaP
         VQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=joGcDYVupJg/Aw0oO1nh40mP+CIM1/rE586xfzNMJHY=;
        b=QVuPx8yoTha0UH8Lx6NCXuFB9O+rKM+rqrLgzyVuF0coADybB/6gv2fC2bnHNblltq
         QbIOSz/htoaND9MTPyBtjchjjaL3X/B/3YCo5va3Pvyhrf0s42DkI8B/Ex3VDWToDVCc
         Pgkf8qo2tHAzQxdTp8owJHQ8H4oHze1i1HbbyZtt4CoM1ICHxO0z8ClzMrcrEvLoI0cK
         qhZpw+JfdJwYGA9vJ0aP8TQDLZOA7O7FqqliiUaqmmgoToscu6DXNtVBPff9fsa9iZfr
         EtGLsOGDF1aB37XzmHp4nUTLtTQG9rvBL9b6vQ++g3nDj0aK771hdpF5pg+D9JAykno9
         BWZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3Pbdc9DMktdRgBQXkphm4tW4/qOzp4/sFvXEwMepO45Hbf4wg5
	0H0UN2Flo1J/kAfv+dZX2oc=
X-Google-Smtp-Source: ADFU+vtocMQ07462aSPIBJaUri0lCYMrXHT21opcjeFoLXUliJOz/LQeXbLkzKDMB9Gdc4M7l0cf2A==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr5428305wru.137.1584446234749;
        Tue, 17 Mar 2020 04:57:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f3ca:: with SMTP id g10ls11016578wrp.11.gmail; Tue, 17
 Mar 2020 04:57:14 -0700 (PDT)
X-Received: by 2002:a5d:5089:: with SMTP id a9mr5828469wrt.187.1584446233949;
        Tue, 17 Mar 2020 04:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584446233; cv=none;
        d=google.com; s=arc-20160816;
        b=uSfv1eyNy2aDIXkh4fiKaU1rCb9cn5J8K7tQghZcPb9q0nL0EIv1TUoo9PYkaxaDUj
         XDvDUMvHtx9HfJzDLuevQH1cVaPq3Y4rQAx+yaqZOgBnva2e+sKoQlAwJpdR0GYiGelx
         BVBybq62aGoInJ0gFMLmb8qukOg0eWyiSu+CG59iP2LXTX0oVYgqsKF6PA1zza9shEP2
         dXwYnusvJmvaUutAx+i8Z+q0kE6tZxpGuyinu3+GVes/HTOXiegC/RMKkNW3vSBonmj/
         +sdmmsYmjl4fOVXMIx0kTkcF0yQ2yijSxn80Xw4RFGPGrGrEdGgLAVYjpyXspQu42onc
         28Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gwYr4eOyCTi3XdF6C/Nesh5PY9O6+EDNJlcwAPGEFP4=;
        b=ZCRYBwED9QZi6Y+bLEOLqlHviDjBi1oZ+fzYyl8G3qFeHacvw7C6qDMVZsnadkyJNK
         KsWvbKZAkqAkQOJTmwcn8wahqohc687vsimuXRY63yY/aaQYPGzAYO/DiDjvkJwDGaXI
         M7Rqfqdwefl32WXJU65Kb9xSJ5I09oX1X8YjW+6gPDy0AEjnfibH/hgh/2UQ+d/0gpK6
         IwOEE/J9qfHqmlFAaBlvQwxhWq2pvdiN5UQrMSP/6s/bL5PIZL5m5dB0TuJYoL5qFCEt
         IEziSFQwuyMHCR2Frb2nem48XILyfRVQ96gvDycP3MAIPYlzTUKTZaXjhMA99zTcPlxL
         BI3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UavIghhi;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::144 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com. [2a00:1450:4864:20::144])
        by gmr-mx.google.com with ESMTPS id c187si112683wme.1.2020.03.17.04.57.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 04:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::144 as permitted sender) client-ip=2a00:1450:4864:20::144;
Received: by mail-lf1-x144.google.com with SMTP id c20so16943707lfb.0
        for <jailhouse-dev@googlegroups.com>; Tue, 17 Mar 2020 04:57:13 -0700 (PDT)
X-Received: by 2002:a19:5e06:: with SMTP id s6mr2797195lfb.154.1584446233181;
 Tue, 17 Mar 2020 04:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200305093950.848-1-peng.fan@nxp.com> <be1e8e77-522b-0238-0031-3254eea4678d@ti.com>
 <AM0PR04MB448105AD6E53770A3BED0E5B88E20@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CADiTV-0DiAqxF0RvQ4xSfTOO-4hkRUyC-BiS5omDr1Y+P3ZEHA@mail.gmail.com> <81f9a1c9-a4c2-ff0c-f387-90c959da9313@siemens.com>
In-Reply-To: <81f9a1c9-a4c2-ff0c-f387-90c959da9313@siemens.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Tue, 17 Mar 2020 12:57:02 +0100
Message-ID: <CAHFG_=USXMmCJkvzrVf+QR0vLT1hJuQZYNcvnP7sHwiAWJWqRQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Alice Guo <alice.guo@nxp.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>, 
	Lokesh Vutla <lokeshvutla@ti.com>, Luca Miccio <206497@studenti.unimore.it>, 
	Marco Solieri <marco.solieri@unimore.it>, Peng Fan <peng.fan@nxp.com>, 
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000e5152a05a10ba26f"
X-Original-Sender: francois.ozog@linaro.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linaro.org header.s=google header.b=UavIghhi;       spf=pass
 (google.com: domain of francois.ozog@linaro.org designates
 2a00:1450:4864:20::144 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
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

--000000000000e5152a05a10ba26f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 mars 2020 =C3=A0 11:53, Jan Kiszka <jan.kiszka@siemens.com> a =
=C3=A9crit :

> Hi Angelo,
>
> please avoid top-posting on MLs.
>
> On 17.03.20 10:59, Angelo Ruocco wrote:
> > Hi all,
> >
> > This is some really interesting work, and we are planning to do some
> > tests here at the HiPeRT lab in Modena on some other GICv3 boards by
> > NXP.
>
> I thought there was already a hypervisor in your lab that does not
> "depend on Linux to boot and manage its VM"? ;)
>
> >
> > Regarding this, what is the long-term plan? Are you interested in a
> > collaboration for this to have a broader support, with more features
> > and be nearer to be production-ready?
>
> This approach clearly has a future in Jailhouse upstream once details
> such as the code duplication with the inmate library and the propagation
> (or lock-down) of root-cell functionality are clarified. In fact, I
> would like to see this pattern also on x86 and upcoming RISC-V.


A few years back I wanted to have Jailhouse start in the context of
https://www.linuxboot.org

LinuxBoot being the =E2=80=9Ccore cell=E2=80=9D (GIC, memory, console) then=
 a =E2=80=9Croot cell=E2=80=9D
would be fired up for virtio/qemu. Basically isolate the core cell even
further than the current root cell.


> Jan
>
> >
> > Thanks,
> > Angelo
> >
> > 2020-03-05 13:39 GMT+01:00, Peng Fan <peng.fan@nxp.com>:
> >> ailhouse-dev@googlegroups.com
> >>> Cc: Alice Guo <alice.guo@nxp.com>
> >>> Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
> >>>
> >>>
> >>>
> >>> On 05/03/20 3:09 PM, peng.fan@nxp.com wrote:
> >>>> From: Peng Fan <peng.fan@nxp.com>
> >>>>
> >>>> This patchset tested on i.MX8MN arm64 with quad A53 cores
> >>>>
> >>>> Patch 1 is to align jailhouse_system. Since the loader not have MMU
> >>>> enabled, unaligned access will cause abort.
> >>>>
> >>>> Patch 2 is not that well orgnized. It does GICv3 initialization, SMP
> >>>> boot up. Then kick inmate cell and root cell.
> >>>> Some code are hardcoding for now.
> >>>>
> >>>> The boot log as below, you could see root linux and gic demo both
> >>>> running:
> >>>> root cell not able to manage inmate cell for now. But I think it cou=
ld
> >>>> be supported. intercell communication not aded currently.
> >>>>
> >>>>  From test log, linux root cell boot will cause large latency for
> >>>> gic-demo jitter.
> >>>>
> >>>> It maybe good to use cache color on ARMv8, but still have issues for
> >>>> root cell DMA without SMMU.
> >>>>
> >>>
> >>> [..snip..]
> >>>
> >>> Nice to see this being supported...!!!
> >>>
> >>>> Timer fired, jitter:    749 ns, min:    749 ns, max:   7999 ns
> >>>> [    0.127643] Detected VIPT I-cache on CPU1
> >>>> [    0.127671] GICv3: CPU1: found redistributor 1 region
> >>> 0:0x00000000388a0000
> >>>> [    0.127700] CPU1: Booted secondary processor 0x0000000001
> >>> [0x410fd034]
> >>>> [    0.159684] Detected VIPT I-cache on CPU2
> >>>> [    0.159700] GICv3: CPU2: found redistributor 2 region
> >>> 0:0x00000000388c0000
> >>>> [    0.159717] CPU2: Booted secondary processor 0x0000000002
> >>> [0x410fd034]
> >>>> [    0.191721] psci: failed to boot CPU3 (-1)
> >>>> [    0.227974] CPU3: failed to boot: -1
> >>>> [    0.231609] smp: Brought up 1 node, 3 CPUs
> >>>
> >>> Did not look closer but couple of questions:
> >>> - I guess the above CPU is given to inmate cell.
> >>
> >> Yes.
> >>
> >> We should be able to handle
> >>> this error gracefully rather than failure. Wondering how other
> >>> hypervisors
> >>> handle this.
> >>
> >> It is because dts file has 4 cpus, so it will surely fail.
> >>
> >> To XEN, xen will take over dtb, and runtime create a new dtb for dom0.
> >>
> >>> - What level of features supported when compared with type 2?
> >>
> >> Just a few in mind
> >> Fast inmate boot.
> >> Easy to support aarch32 root cell with aarch64 jailhouse
> >> Decouple Linux as root cell, so not a must to take Linux as root cell.
> >> Cache color would be possible for root cell
> >>
> >> Regards,
> >> Peng.
> >>
> >>
> >>
> >>>
> >>> Thanks and regards,
> >>> Lokesh
> >>
> >> --
> >> You received this message because you are subscribed to the Google
> Groups
> >> "Jailhouse" group.
> >> To unsubscribe from this group and stop receiving emails from it, send
> an
> >> email to jailhouse-dev+unsubscribe@googlegroups.com.
> >> To view this discussion on the web visit
> >>
> https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB448105AD6E53770A=
3BED0E5B88E20%40AM0PR04MB4481.eurprd04.prod.outlook.com
> .
> >>
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/81f9a1c9-a4c2-ff0c-f387-9=
0c959da9313%40siemens.com
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
jailhouse-dev/CAHFG_%3DUSXMmCJkvzrVf%2BQR0vLT1hJuQZYNcvnP7sHwiAWJWqRQ%40mai=
l.gmail.com.

--000000000000e5152a05a10ba26f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mar. 17 mars 2020 =C3=A0 11:53, Jan Kiszka &lt;<a h=
ref=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Angelo,<br>
<br>
please avoid top-posting on MLs.<br>
<br>
On 17.03.20 10:59, Angelo Ruocco wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; This is some really interesting work, and we are planning to do some<b=
r>
&gt; tests here at the HiPeRT lab in Modena on some other GICv3 boards by<b=
r>
&gt; NXP.<br>
<br>
I thought there was already a hypervisor in your lab that does not <br>
&quot;depend on Linux to boot and manage its VM&quot;? ;)<br>
<br>
&gt; <br>
&gt; Regarding this, what is the long-term plan? Are you interested in a<br=
>
&gt; collaboration for this to have a broader support, with more features<b=
r>
&gt; and be nearer to be production-ready?<br>
<br>
This approach clearly has a future in Jailhouse upstream once details <br>
such as the code duplication with the inmate library and the propagation <b=
r>
(or lock-down) of root-cell functionality are clarified. In fact, I <br>
would like to see this pattern also on x86 and upcoming RISC-V.</blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">A few years back I wanted to=
 have Jailhouse start in the context of <div><a href=3D"https://www.linuxbo=
ot.org">https://www.linuxboot.org</a></div><div dir=3D"auto"><br></div>Linu=
xBoot being the =E2=80=9Ccore cell=E2=80=9D (GIC, memory, console) then a =
=E2=80=9Croot cell=E2=80=9D would be fired up for virtio/qemu. Basically is=
olate the core cell even further than the current root cell.</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><br>
Jan<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Angelo<br>
&gt; <br>
&gt; 2020-03-05 13:39 GMT+01:00, Peng Fan &lt;<a href=3D"mailto:peng.fan@nx=
p.com" target=3D"_blank">peng.fan@nxp.com</a>&gt;:<br>
&gt;&gt; <a href=3D"mailto:ailhouse-dev@googlegroups.com" target=3D"_blank"=
>ailhouse-dev@googlegroups.com</a><br>
&gt;&gt;&gt; Cc: Alice Guo &lt;<a href=3D"mailto:alice.guo@nxp.com" target=
=3D"_blank">alice.guo@nxp.com</a>&gt;<br>
&gt;&gt;&gt; Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 05/03/20 3:09 PM, <a href=3D"mailto:peng.fan@nxp.com" targe=
t=3D"_blank">peng.fan@nxp.com</a> wrote:<br>
&gt;&gt;&gt;&gt; From: Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" tar=
get=3D"_blank">peng.fan@nxp.com</a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This patchset tested on i.MX8MN arm64 with quad A53 cores<=
br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Patch 1 is to align jailhouse_system. Since the loader not=
 have MMU<br>
&gt;&gt;&gt;&gt; enabled, unaligned access will cause abort.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Patch 2 is not that well orgnized. It does GICv3 initializ=
ation, SMP<br>
&gt;&gt;&gt;&gt; boot up. Then kick inmate cell and root cell.<br>
&gt;&gt;&gt;&gt; Some code are hardcoding for now.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The boot log as below, you could see root linux and gic de=
mo both<br>
&gt;&gt;&gt;&gt; running:<br>
&gt;&gt;&gt;&gt; root cell not able to manage inmate cell for now. But I th=
ink it could<br>
&gt;&gt;&gt;&gt; be supported. intercell communication not aded currently.<=
br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 From test log, linux root cell boot will cause large=
 latency for<br>
&gt;&gt;&gt;&gt; gic-demo jitter.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It maybe good to use cache color on ARMv8, but still have =
issues for<br>
&gt;&gt;&gt;&gt; root cell DMA without SMMU.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [..snip..]<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Nice to see this being supported...!!!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Timer fired, jitter:=C2=A0 =C2=A0 749 ns, min:=C2=A0 =C2=
=A0 749 ns, max:=C2=A0 =C2=A07999 ns<br>
&gt;&gt;&gt;&gt; [=C2=A0 =C2=A0 0.127643] Detected VIPT I-cache on CPU1<br>
&gt;&gt;&gt;&gt; [=C2=A0 =C2=A0 0.127671] GICv3: CPU1: found redistributor =
1 region<br>
&gt;&gt;&gt; 0:0x00000000388a0000<br>
&gt;&gt;&gt;&gt; [=C2=A0 =C2=A0 0.127700] CPU1: Booted secondary processor =
0x0000000001<br>
&gt;&gt;&gt; [0x410fd034]<br>
&gt;&gt;&gt;&gt; [=C2=A0 =C2=A0 0.159684] Detected VIPT I-cache on CPU2<br>
&gt;&gt;&gt;&gt; [=C2=A0 =C2=A0 0.159700] GICv3: CPU2: found redistributor =
2 region<br>
&gt;&gt;&gt; 0:0x00000000388c0000<br>
&gt;&gt;&gt;&gt; [=C2=A0 =C2=A0 0.159717] CPU2: Booted secondary processor =
0x0000000002<br>
&gt;&gt;&gt; [0x410fd034]<br>
&gt;&gt;&gt;&gt; [=C2=A0 =C2=A0 0.191721] psci: failed to boot CPU3 (-1)<br=
>
&gt;&gt;&gt;&gt; [=C2=A0 =C2=A0 0.227974] CPU3: failed to boot: -1<br>
&gt;&gt;&gt;&gt; [=C2=A0 =C2=A0 0.231609] smp: Brought up 1 node, 3 CPUs<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Did not look closer but couple of questions:<br>
&gt;&gt;&gt; - I guess the above CPU is given to inmate cell.<br>
&gt;&gt;<br>
&gt;&gt; Yes.<br>
&gt;&gt;<br>
&gt;&gt; We should be able to handle<br>
&gt;&gt;&gt; this error gracefully rather than failure. Wondering how other=
<br>
&gt;&gt;&gt; hypervisors<br>
&gt;&gt;&gt; handle this.<br>
&gt;&gt;<br>
&gt;&gt; It is because dts file has 4 cpus, so it will surely fail.<br>
&gt;&gt;<br>
&gt;&gt; To XEN, xen will take over dtb, and runtime create a new dtb for d=
om0.<br>
&gt;&gt;<br>
&gt;&gt;&gt; - What level of features supported when compared with type 2?<=
br>
&gt;&gt;<br>
&gt;&gt; Just a few in mind<br>
&gt;&gt; Fast inmate boot.<br>
&gt;&gt; Easy to support aarch32 root cell with aarch64 jailhouse<br>
&gt;&gt; Decouple Linux as root cell, so not a must to take Linux as root c=
ell.<br>
&gt;&gt; Cache color would be possible for root cell<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Peng.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks and regards,<br>
&gt;&gt;&gt; Lokesh<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; You received this message because you are subscribed to the Google=
 Groups<br>
&gt;&gt; &quot;Jailhouse&quot; group.<br>
&gt;&gt; To unsubscribe from this group and stop receiving emails from it, =
send an<br>
&gt;&gt; email to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroup=
s.com" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br=
>
&gt;&gt; To view this discussion on the web visit<br>
&gt;&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04=
MB448105AD6E53770A3BED0E5B88E20%40AM0PR04MB4481.eurprd04.prod.outlook.com" =
rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/jail=
house-dev/AM0PR04MB448105AD6E53770A3BED0E5B88E20%40AM0PR04MB4481.eurprd04.p=
rod.outlook.com</a>.<br>
&gt;&gt;<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" tar=
get=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/81f9a1c9-a4c2-ff0c-f387-90c959da9313%40siemens.com=
" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/ja=
ilhouse-dev/81f9a1c9-a4c2-ff0c-f387-90c959da9313%40siemens.com</a>.<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px=
" valign=3D"top"><img src=3D"https://drive.google.com/a/linaro.org/uc?id=3D=
0BxTAygkus3RgQVhuNHMwUi1mYWc&amp;export=3Ddownload" width=3D"96" height=3D"=
53"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0" cellspaci=
ng=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans Ser=
if&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:rgb(87,87,8=
7)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=A9d=
=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)">|</span>=
=C2=A0<i>Director Linaro Edge &amp; Fog Computing Group</i></td></tr><tr><t=
d style=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:n=
owrap;font-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=
=C2=A0<a value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6=
485</a><br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(8=
7,87,87);text-decoration:none" target=3D"_blank">francois.ozog@linaro.org</=
a>=C2=A0<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ff=
ozog</td></tr></tbody></table></td></tr></tbody></table></div></div></div><=
/div></div><div><div><br style=3D"font-size:small"></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAHFG_%3DUSXMmCJkvzrVf%2BQR0vLT1hJuQZYNcvnP7sHwiAW=
JWqRQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAHFG_%3DUSXMmCJkvzrVf%2BQR0vLT1hJuQZYN=
cvnP7sHwiAWJWqRQ%40mail.gmail.com</a>.<br />

--000000000000e5152a05a10ba26f--
