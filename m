Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBOVFYX5AKGQETHHE7ZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53a.google.com (mail-pg1-x53a.google.com [IPv6:2607:f8b0:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id C263025CA70
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Sep 2020 22:31:55 +0200 (CEST)
Received: by mail-pg1-x53a.google.com with SMTP id n32sf2457370pgb.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 13:31:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599165114; cv=pass;
        d=google.com; s=arc-20160816;
        b=x7FZgRQS5d8Vj7FYIez5hBEdyEwoDA/QmJ6y7oFqD+TclmLUf6hR/rTYwItrx7ogGK
         1LEZflbil93ZItL8yhD9nH4GDDD2lcF5njoAG9T5mg9UoLZQ7BrM6mMUO8vy+YjJllDI
         pA/upw12IYSOCCIKzO8+b10GqBHc1vYTvxkoXzAD5GiVpvOFMpduFTGlzJlz7x2oMfSl
         Qa5EcAVCYu8l2cQ2gIQH+B3yl10FMI2RxLBTXj5XQvvhUDa5jMnUe6crf7jAFZvyAX3p
         WGN0yfVtQQAUqO/E7gdCGTYzyyIo96uxFoUirUqfY1ne/taTkcTVjpUjg7DCTSVgp8HM
         5chA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=Dw62doJY6Di4igIsj2tvmIpD6qvSGxfjRHjuqlCPpyY=;
        b=mt2xqdTj2AQ5/TGm7yTzzNv3+OGTJh4lpLBiOaHkci109rFz3/bs7PUE4FIlx7v3Wz
         pw6h5SlZLxBxx7oePR0dwrAUxOHyDUp4rKmepHPfKFT7Ze1+P8oM2ORD4PixDPyLiGtx
         znSZtSgd+X+FSnW8lKMurH7qVYdkGhlMrAuaTpZ8C3zrxWsQPa6ANcMOKP6uwrTgHs54
         H/OvLC8eGevq+cTR6OxIIiQQZ0s5uqTDUurnvhtB+XEEL30qoTou23q3b0v/qgPkB32H
         B6hR+ICnYyyqdM0kJO1nrcxfkJoaZNcAQeJAU4DanB9gl7CvRJpvH5crjOGkfl3J6Vgo
         NVyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GGGZ2Wyw;
       spf=pass (google.com: domain of stranzjanmarc@gmail.com designates 2607:f8b0:4864:20::c2c as permitted sender) smtp.mailfrom=stranzjanmarc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Dw62doJY6Di4igIsj2tvmIpD6qvSGxfjRHjuqlCPpyY=;
        b=qSsQhXKQwnSuTK08oRr42tPHJco46eq5uo4JGb8LvgZfH4BsoEyh2AkmDfHUohIt55
         VuN3MVWbDns+kLVURGzRwDlBAoP08IDWziVKMMkICxib/ENWutvA2U89nAbtPYOP8Psk
         BK43DU/1lsDJ1nuuudyjdVG1w6bkQZ8Yzo9A+Vbx10sMtbARQQMZT9VdiDe/dZhIrgBc
         KbRHTyIyKq7psqyXEnP/2gM1OC6LiHeZaL+OzeqJNV31SMsD0TrIOla/UlrHT0/I1Rue
         K/Qmqk60WU0NN92aHe4KvUhwths7TWBvrfB8SoTTzBB4OCa1YoXRGr2PIqxm7+nbdkpp
         qPYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Dw62doJY6Di4igIsj2tvmIpD6qvSGxfjRHjuqlCPpyY=;
        b=MeTEhifSTsx9l+sSYTd1koDhILVSSuTHjJ75yufOCrX/C6KzBzxbcSPLULvOOWVMYN
         Tw5uykU7K3bnjzR+FPBTQnaaz6vP2LEsQpf2k9OGPoARYS4TtAtDe8WsqWPuFCK4Ct/l
         uLHUSrIog5NiPktSq4MqjbxlsXqUgSj24/1y+t5vAf/oSw6SxWn1738t2NH/Uqw2GxEw
         hZvcQZw+WRDfXmZ1XLakjd2winpgDZ3w5I+yALnJP7VmMcOvnT2BnuvuFnO2gM4BcySz
         +QmipaQ6qNY8T58SqgqmML397RP90nqnZjgPfwagguoIFQ7fFstcKTL0se3RQIGuoddE
         ZOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Dw62doJY6Di4igIsj2tvmIpD6qvSGxfjRHjuqlCPpyY=;
        b=fBc3vHvbRUZtzkpn9tbuDclYNouyQawbPHbgL2Q3ZwqWFbM8UguR6m76B/uciBnUt2
         6eHAIJbgvta7R5gKdWOxc2D3BaDTuJ1eKaMH0YcQT9Cpi2rOy+gc6CGd8FXSqOduuD+V
         9C0/tWaRG4CiyTvxyhR6LMP/O1B2nd9ThgH4h439bnedom2FYz6VF8Ors/tpxTT1wXvk
         KWbdqgbohrCHfo74MDewRUuw3PjsLwdpcc7BrmAReA8uUEgCpfGd964cjpplJ0xr8woP
         BTjgEBbXH1cd9dGYz/q5q1Wz63IOjjZMWwd0pcb5vFLv2JjUvy3PV5WpSY1MHl8THgD/
         FpDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530On5IwwWrnciDC46wQj8Mad+oHVA7plXhZRkf4JnnrNH/FDpH3
	n31FJzZhpDUcCp8I3/afeZ0=
X-Google-Smtp-Source: ABdhPJwgfVC0fxdET8AGEcAhQwD5hiH2mFEh58r55MPOykFW5UmcHNQg3mXMZVAHJb3ifljhDTSnfg==
X-Received: by 2002:a65:6707:: with SMTP id u7mr4304311pgf.449.1599165114525;
        Thu, 03 Sep 2020 13:31:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:9d90:: with SMTP id f16ls2833055pfq.9.gmail; Thu, 03 Sep
 2020 13:31:53 -0700 (PDT)
X-Received: by 2002:a63:1a05:: with SMTP id a5mr4596038pga.145.1599165113826;
        Thu, 03 Sep 2020 13:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599165113; cv=none;
        d=google.com; s=arc-20160816;
        b=googOg9fB/l9eAW686ttx1bh4wrmpzJKAdL0+aBiCIE+CWVoIa3lFDr44uT/hUfIgv
         qUZubem+a9r2CALkpfOgDa99YKljoZt9OXGzdy2eoUuE2CRIMkrYzhHQb6CVN8JvFE0o
         +BkSd3ac4/7UvlapYfh7GbCxlyKDsnvgNhVMcbjbHz/ZcYHQwrmeA0B03EbCovAM3f2v
         niozjNBKUQ59ENOxzvgG4eNRhWDeTOy1ikFUmfu5NJ9rMnuuh2ZT+PJfRQKS6aBvzGXh
         C7W9HS6VUvf8E2iX1whwZMsF2YdMm9VcvHEbMp0RmiMoA6PDj9nD71rEem9sQ5dQcgf7
         JGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AcPzcxCfucZN7TJJ92+b+J2sJAhPgSC9PHa28GBVuyM=;
        b=y22CMGLiZje9sDTwGekGaePChfI2/QUGd07Wb+ncVmZ3pBixVixY+Ref/Ag8LTiG3O
         3vLApMpBDiGztCIejgaET/CKVNGP9pZxwhKooErp685o1ZKokT0/AZ5YSDuKMKMUnX44
         IdhrHFqDc3pdLMI1WXN+2Elsq0eE+O4vcYtApV+bpekO3tvh3uZDO262Hb+95Vi4D6s3
         4LCmS1qkrB0zNMR89SxsTHxVufuc1yeUtGkeyIAuPMMpoIGyumzr3NdvkMvw2edmv+0Q
         ZbL0QLsnRoxafloXvQ5PyzAIRrrTPEZ02pgSJr/W/nr5UnbsPpUu6M3ZQRY1Qqtckzyz
         Bekg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GGGZ2Wyw;
       spf=pass (google.com: domain of stranzjanmarc@gmail.com designates 2607:f8b0:4864:20::c2c as permitted sender) smtp.mailfrom=stranzjanmarc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com. [2607:f8b0:4864:20::c2c])
        by gmr-mx.google.com with ESMTPS id d60si490061pjk.0.2020.09.03.13.31.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 13:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of stranzjanmarc@gmail.com designates 2607:f8b0:4864:20::c2c as permitted sender) client-ip=2607:f8b0:4864:20::c2c;
Received: by mail-oo1-xc2c.google.com with SMTP id r4so1107984ooq.7
        for <jailhouse-dev@googlegroups.com>; Thu, 03 Sep 2020 13:31:53 -0700 (PDT)
X-Received: by 2002:a4a:6255:: with SMTP id y21mr3242169oog.19.1599165113216;
 Thu, 03 Sep 2020 13:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de> <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com> <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com> <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com> <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com> <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
In-Reply-To: <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
Date: Thu, 3 Sep 2020 22:31:38 +0200
Message-ID: <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
Subject: Re: Build jailhouse on embedded target
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="00000000000082b1a905ae6ea4b6"
X-Original-Sender: stranzjanmarc@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=GGGZ2Wyw;       spf=pass
 (google.com: domain of stranzjanmarc@gmail.com designates 2607:f8b0:4864:20::c2c
 as permitted sender) smtp.mailfrom=stranzjanmarc@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000082b1a905ae6ea4b6
Content-Type: text/plain; charset="UTF-8"

Ok, thanks!

Is it possible to get a kernel configuration (for Linux Kernel 5.4.x) from
you?
It would be very usefull for me in order to find a "right" konfiguration
needed for jailhouse.

Best regards
Jan.


Jan Kiszka <jan.kiszka@siemens.com> schrieb am Do., 3. Sep. 2020, 20:42:

> On 03.09.20 19:28, Jan-Marc Stranz wrote:
> > Thanks!
> >
> > Is the entry "intel_iommu=off" still needed for x86_64 targets?
>
> Yes, that applies to "running Jailhouse", just not to "checking hardware
> compatibility".
>
> Jan
>
> >
> > Best regards
> > Jan.
> >
> >
> > Jan Kiszka <jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>
> > schrieb am Do., 3. Sep. 2020, 19:01:
> >
> >     On 03.09.20 15:07, Jan-Marc Stranz wrote:
> >     > Hi Jan!
> >     >
> >     > I've moved to another target with "Intel Core i7-8559U".
> >     > This CPU supports "VT-x" and "VT-d".
> >     >
> >     > Doing a hardware check I get the following messages:
> >     >
> >     > Feature                         Availability
> >     > ------------------------------  ------------------
> >     > Number of CPUs > 1              ok
> >     > Long mode                       ok
> >     > Traceback (most recent call last):
> >     >   File "/usr/libexec/jailhouse/jailhouse-hardware-check", line
> 147, in
> >     > <module>
> >     >     iommu, _ = sysfs_parser.parse_dmar(pci_devices, ioapics,
> >     dmar_regions)
> >     >   File
> "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py",
> >     > line 377, in parse_dmar
> >     >     raise RuntimeError('DMAR region size cannot be identified.\n'
> >     > RuntimeError: DMAR region size cannot be identified.
> >     > Target Linux must run with Intel IOMMU enabled.
> >     >
> >     > I'm using Linux Kernel 5.4.61 with the patches and config options
> from
> >     > "jailhouse.cfg".
> >     >
> >     > The kernel command line contains "intel_iommu=off" (as specified
> under
> >     > "Software requirements" at https://github.com/siemens/jailhouse).
> >     > I've also tried "intel_iommu=on" but without success.
> >     >
> >     > What is the reason for this again?
> >
> >     I could be that your kernel does not support what is needed to check
> the
> >     hardware. It may still be fine to run Jailhouse. Do not invest too
> much
> >     into the checker - or use a regular distro kernel for the check
> (which
> >     may also partially fail these days due to CONFIG_STRICT_DEVMEM).
> >
> >     > It's very difficult (at least for me) to get jailhouse up and
> running.
> >
> >     Focus on the configuration, not the checking. In fact, the checker
> has a
> >     decreasing value because (x86) hardware shipped in 2020 has all
> features
> >     we need, practically always.
> >
> >     Jan
> >
> >     --
> >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >     Corporate Competence Center Embedded Linux
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-dev+unsubscribe@googlegroups.com
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> > To view this discussion on the web visit
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F%2BigLuoA3wSg4boAhxtuWQ%40mail.gmail.com
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F%2BigLuoA3wSg4boAhxtuWQ%40mail.gmail.com?utm_medium=email&utm_source=footer
> >.
>
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAOOGbpgwq0%3DB85FFAaPCGC%2BW3UsFYtp6ROAsCbUdD2%3Dg_Ak1kw%40mail.gmail.com.

--00000000000082b1a905ae6ea4b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, thanks!=C2=A0<div dir=3D"auto"><br></div><div dir=3D"=
auto">Is it possible to get a kernel configuration (for Linux Kernel 5.4.x)=
 from you?</div><div dir=3D"auto">It would be very usefull for me in order =
to find a &quot;right&quot; konfiguration needed for jailhouse.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Best regards</div><div dir=3D"auto"=
>Jan.</div><div dir=3D"auto"><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Jan Kiszka &lt;<a href=3D"mailto:jan=
.kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt; schrieb am Do., 3. Sep.=
 2020, 20:42:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 03.09.20 19:28, Ja=
n-Marc Stranz wrote:<br>
&gt; Thanks!=C2=A0<br>
&gt; <br>
&gt; Is the entry &quot;intel_iommu=3Doff&quot; still needed for x86_64 tar=
gets?<br>
<br>
Yes, that applies to &quot;running Jailhouse&quot;, just not to &quot;check=
ing hardware<br>
compatibility&quot;.<br>
<br>
Jan<br>
<br>
&gt; <br>
&gt; Best regards<br>
&gt; Jan.<br>
&gt; <br>
&gt; <br>
&gt; Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_bl=
ank" rel=3D"noreferrer">jan.kiszka@siemens.com</a> &lt;mailto:<a href=3D"ma=
ilto:jan.kiszka@siemens.com" target=3D"_blank" rel=3D"noreferrer">jan.kiszk=
a@siemens.com</a>&gt;&gt;<br>
&gt; schrieb am Do., 3. Sep. 2020, 19:01:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 03.09.20 15:07, Jan-Marc Stranz wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Jan!<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;ve moved to another target with &quot;In=
tel Core i7-8559U&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This CPU supports &quot;VT-x&quot; and &quot;V=
T-d&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Doing a hardware check I get the following mes=
sages:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Feature=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Availability<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ------------------------------=C2=A0 ---------=
---------<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Number of CPUs &gt; 1=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Long mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ok<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 File &quot;/usr/libexec/jailhouse/jailh=
ouse-hardware-check&quot;, line 147, in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0=C2=A0=C2=A0 iommu, _ =3D sysfs_parser.p=
arse_dmar(pci_devices, ioapics,<br>
&gt;=C2=A0 =C2=A0 =C2=A0dmar_regions)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 File &quot;/usr/lib/python3.7/site-pack=
ages/pyjailhouse/sysfs_parser.py&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; line 377, in parse_dmar<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0=C2=A0=C2=A0 raise RuntimeError(&#39;DMA=
R region size cannot be identified.\n&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; RuntimeError: DMAR region size cannot be ident=
ified.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Target Linux must run with Intel IOMMU enabled=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m using Linux Kernel 5.4.61 with the pat=
ches and config options from<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;jailhouse.cfg&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The kernel command line contains &quot;intel_i=
ommu=3Doff&quot; (as specified under<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;Software requirements&quot; at <a href=
=3D"https://github.com/siemens/jailhouse" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://github.com/siemens/jailhouse</a>).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;ve also tried &quot;intel_iommu=3Don&quo=
t; but without success.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; What is the reason for this again?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I could be that your kernel does not support what i=
s needed to check the<br>
&gt;=C2=A0 =C2=A0 =C2=A0hardware. It may still be fine to run Jailhouse. Do=
 not invest too much<br>
&gt;=C2=A0 =C2=A0 =C2=A0into the checker - or use a regular distro kernel f=
or the check (which<br>
&gt;=C2=A0 =C2=A0 =C2=A0may also partially fail these days due to CONFIG_ST=
RICT_DEVMEM).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; It&#39;s very difficult (at least for me) to g=
et jailhouse up and running.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Focus on the configuration, not the checking. In fa=
ct, the checker has a<br>
&gt;=C2=A0 =C2=A0 =C2=A0decreasing value because (x86) hardware shipped in =
2020 has all features<br>
&gt;=C2=A0 =C2=A0 =C2=A0we need, practically always.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Siemens AG, Corporate Technology, CT RDA IOT SES-DE=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Corporate Competence Center Embedded Linux<br>
&gt; <br>
&gt; -- <br>
&gt; You received this message because you are subscribed to the Google<br>
&gt; Groups &quot;Jailhouse&quot; group.<br>
&gt; To unsubscribe from this group and stop receiving emails from it, send=
<br>
&gt; an email to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups=
.com" target=3D"_blank" rel=3D"noreferrer">jailhouse-dev+unsubscribe@google=
groups.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.=
com" target=3D"_blank" rel=3D"noreferrer">jailhouse-dev+unsubscribe@googleg=
roups.com</a>&gt;.<br>
&gt; To view this discussion on the web visit<br>
&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CAOOGbpg5t1=
ykh1OaS_rKXMzfL2u9F%2BigLuoA3wSg4boAhxtuWQ%40mail.gmail.com" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/jailhou=
se-dev/CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F%2BigLuoA3wSg4boAhxtuWQ%40mail.gmail.c=
om</a><br>
&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CAOOGbp=
g5t1ykh1OaS_rKXMzfL2u9F%2BigLuoA3wSg4boAhxtuWQ%40mail.gmail.com?utm_medium=
=3Demail&amp;utm_source=3Dfooter" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://groups.google.com/d/msgid/jailhouse-dev/CAOOGbpg5t1ykh1OaS_r=
KXMzfL2u9F%2BigLuoA3wSg4boAhxtuWQ%40mail.gmail.com?utm_medium=3Demail&amp;u=
tm_source=3Dfooter</a>&gt;.<br>
<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAOOGbpgwq0%3DB85FFAaPCGC%2BW3UsFYtp6ROAsCbUdD2%3D=
g_Ak1kw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAOOGbpgwq0%3DB85FFAaPCGC%2BW3UsFYtp6=
ROAsCbUdD2%3Dg_Ak1kw%40mail.gmail.com</a>.<br />

--00000000000082b1a905ae6ea4b6--
