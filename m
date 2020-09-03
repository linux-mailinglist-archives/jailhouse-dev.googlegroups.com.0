Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBNWPYT5AKGQEDKARMBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x138.google.com (mail-il1-x138.google.com [IPv6:2607:f8b0:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7165325C80B
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Sep 2020 19:28:24 +0200 (CEST)
Received: by mail-il1-x138.google.com with SMTP id g188sf2857220ilh.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 10:28:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599154103; cv=pass;
        d=google.com; s=arc-20160816;
        b=tWlLWJT8h2t6H3gM5hWb3GHH4zK9TF4Hz2Ubd7E/BRXFXP2Atiwn6JShF2Vatv27D3
         nZxdXU8Q55EUEUMZczMxD+LEeibBE9O2+HlbedsYs4dkAaupscHHpL2//x1JgoIJVhb+
         2HoZ+X3zsUq5w9r1arBJ9Q2KV7bykNOlYOC0nyInCyh1vgL9n0RMGfaIHG0mEsHn98bT
         ntvRdQrmK1ZHlVQ2hQbHwcmED/PzAT7n5dIiUakpYKPEwjq2LXfC9Z01RuIj7b7s+h0J
         oBA5VdKr1p2OysfTRcAL2VO+vfJ6vG6eNT0y4fuCukMQcmm5MpbsriMqdtJwl3JldSCu
         YaaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=CLXO+7YSHh11027MhD46hFgYzjmQqPyPFHg9Ts5SdRc=;
        b=Wzet5KepHDvYQMSAa9aPg9TvN4nPu92paKehR9qzLwsWEvU5o0QyJE411kp1abdQJH
         cdTte+9HRu6l6VsTAgvIU7FP1Ci6/UwSMyJzfSQWqMhboJW7o3kpn6d20WIcISTfQkhu
         4JjkM1gVoax4xqqsqiwzyBTE9Trdxd9M0uZwsGD15CER7UvEJjYi/HfQpFqT+qa//uLs
         VfuP0cESADVnlD/Y/knUSxJdH7EbAM43yIVPoDUodWzjeUAFhApIRvrLxE16Cxwl1PH7
         Rho24MfvPmv0uENIdAcEkUEIMr5Pn5IFaxemkKvofljFjB9hkRHYgAiY8u4EbI0OUPdT
         8+Iw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RDxVFb1r;
       spf=pass (google.com: domain of stranzjanmarc@gmail.com designates 2607:f8b0:4864:20::336 as permitted sender) smtp.mailfrom=stranzjanmarc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CLXO+7YSHh11027MhD46hFgYzjmQqPyPFHg9Ts5SdRc=;
        b=T0sP+oK1bHY21n6YVlMnMI8TWSChZhiTC8zJACQzCsKi65Q88bAClwLEPEiZt0Ti8n
         v89ZeCfNiuEXjbjqbabF6oZOR6WFAeT0dDF96w4WPyL/fP2lxqClUtPvTxGcKGDmmbmA
         rlVaJudosTj/Erd0vJBvlJuUyCJpf0bRy/xpO+6yBSrRidsHai7eEi/C0VpWEkzFfXVZ
         DkEWEgync6bpK88g5SES3wZnLxQrUp8Cgy3bIeMdNyezRSKkdB19lk0/HOapBpoe3gwK
         MvJhgoJ2DmYWTRWAn5Nn6PffA4an1rVKX//SwQqCY+SSyLSuOQSFIIckT3CcxxG5q2IF
         Jlfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CLXO+7YSHh11027MhD46hFgYzjmQqPyPFHg9Ts5SdRc=;
        b=rWi/AlAx3BszWWQ+1Sp1B2aN/Q6XTBvgBU9mNdzkMoCK92c6qpBgDy1jEfFfIT6FCM
         gnMV1llTF66SqTRE93FylJnULudENDWqa/J6nQ1tPsIvBDXxxy6Jo4Lsrd3XuMD4MvSB
         KkpB3uFReWBSYQJoMTm8bM9GeqH4qqTTjRZbuMi1W3p2Aj3a23zVoj/7Wd8q1P6DbAhk
         OiQL4R4F2GDfbaD/lyP7GCLYO57/SprDQ0HEKW3gmhRc1oHKwdm+3FUQGcTAReblRHh1
         aaOL0i9yfKgXuwVGlLzSxWDWuYLPQqln9VFEHPHtko0iiZL4/WnBqS4nchhRM+P7JvZP
         DMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CLXO+7YSHh11027MhD46hFgYzjmQqPyPFHg9Ts5SdRc=;
        b=W95Ci4/twtMzW2zumu8bqDQAI57h2frXVrqWwyLS4qKyu+sgHFHGM4i46FrnWDlmH6
         nmOKtQz0LR5No+VSsotCA8Mv6VYpOv3W7S7ckwvh6hgqRcJzcbbpEW0B03HXiIc3uVFQ
         9pNOUW0+EddNvrxFhGXQdbElTO1NODyGiX+qUmmPkoBdW72/1eWL5m/fcNvpyxP5apEA
         34sfXZx233TG3jdga0W30usH2xZUzLMdxN6P5AD5yb+s31Md7r1zdNj7Yq8xyqv+NgtU
         sHqAE/GU/HFe0NNOLBmAcME4YA5XNfKQgUMwO54lhgmLEsJr712bJowswp/iNUQknala
         teaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533yPxrpdg+M2iCrRehJqTeOSWno9uRM0Rx9tNpGe3dMWRYGlfum
	NTLrUXJH9Nk17rekSPjumnQ=
X-Google-Smtp-Source: ABdhPJxx759btmOgiNvPqpVwvELeGUO8tXg09/nU+XFTLDnXdFY8yn70T0s16cD7WJ/jvljPYiinhA==
X-Received: by 2002:a92:d1cd:: with SMTP id u13mr4067758ilg.120.1599154103095;
        Thu, 03 Sep 2020 10:28:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:2c90:: with SMTP id s138ls1138883ios.6.gmail; Thu, 03
 Sep 2020 10:28:22 -0700 (PDT)
X-Received: by 2002:a05:6602:2e87:: with SMTP id m7mr4003666iow.106.1599154102536;
        Thu, 03 Sep 2020 10:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599154102; cv=none;
        d=google.com; s=arc-20160816;
        b=YmZ+DtphL2WeVAHKW+iPQg6iUYht5SqbQw52nqn2K/I6SU8FfJEZMOTi9LK1bZTRL3
         s0ooigzf+QXCTc4KM9/7lRwXUs8pJIyvJMoLUfqVLSo57yeaY6JTwafvKyAiYXu33bqF
         vYdyPgrPNBtI02P7zmc3kGoXx2zICNU8vVP63rbS7g0cvUSQGNaD4RRolw+Crri9i9TJ
         6C5PmvLJ1OCs1fr1jXRDGf/qoJkV9YYP/ivE4ySEOvtKQy3mRPHC7B5K886qyj3rnDWN
         5476UsBOU0vtn6wzJLHFAc5bnO0UKWZRhRRoL8bJuNavlciH88OoYnlgKcvRu+L6M4oL
         j8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uBscgKP0CKqxchA3ufPxb/GKX4V42mGvKZqQ46ulfZg=;
        b=UVTzfwccsOhVDv7fFbzZK6vfaueQSdHThg9moMJeIYreXaO6nf6r0J+MEknEmBM9rG
         A4ppGOAKiyVsvgjI76J3A6/9ihPrhyNY5/cs+2CP44eHtuRusxQv8U4BkS8/bFOpjdIf
         OWoRh/Z6EIH+0LMXU+oCf+UNZ+bFDUwGBoyRskEaGtE7TMVrnI7imXtuhmA7b3AlHH2a
         sAfXNywuhJQeDQ/NfNgF+eOaCfoTmMY8iz4JRyoMvHVx3dsrfiCLy6906BQ3c8/jMS++
         OcQ85SQsY3jBgsJ8QYvxMx4uzainsnPohQXhTIs/jTP/C4O0gNULRxzJHsz29eZYMu/x
         yfbw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RDxVFb1r;
       spf=pass (google.com: domain of stranzjanmarc@gmail.com designates 2607:f8b0:4864:20::336 as permitted sender) smtp.mailfrom=stranzjanmarc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com. [2607:f8b0:4864:20::336])
        by gmr-mx.google.com with ESMTPS id f80si265376ilf.3.2020.09.03.10.28.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 10:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of stranzjanmarc@gmail.com designates 2607:f8b0:4864:20::336 as permitted sender) client-ip=2607:f8b0:4864:20::336;
Received: by mail-ot1-x336.google.com with SMTP id e23so3442047otk.7
        for <jailhouse-dev@googlegroups.com>; Thu, 03 Sep 2020 10:28:22 -0700 (PDT)
X-Received: by 2002:a9d:7a92:: with SMTP id l18mr2313929otn.89.1599154102218;
 Thu, 03 Sep 2020 10:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de> <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com> <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com> <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com> <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
In-Reply-To: <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
Date: Thu, 3 Sep 2020 19:28:07 +0200
Message-ID: <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
Subject: Re: Build jailhouse on embedded target
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000003433ae05ae6c14de"
X-Original-Sender: stranzjanmarc@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=RDxVFb1r;       spf=pass
 (google.com: domain of stranzjanmarc@gmail.com designates 2607:f8b0:4864:20::336
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

--0000000000003433ae05ae6c14de
Content-Type: text/plain; charset="UTF-8"

Thanks!

Is the entry "intel_iommu=off" still needed for x86_64 targets?

Best regards
Jan.


Jan Kiszka <jan.kiszka@siemens.com> schrieb am Do., 3. Sep. 2020, 19:01:

> On 03.09.20 15:07, Jan-Marc Stranz wrote:
> > Hi Jan!
> >
> > I've moved to another target with "Intel Core i7-8559U".
> > This CPU supports "VT-x" and "VT-d".
> >
> > Doing a hardware check I get the following messages:
> >
> > Feature                         Availability
> > ------------------------------  ------------------
> > Number of CPUs > 1              ok
> > Long mode                       ok
> > Traceback (most recent call last):
> >   File "/usr/libexec/jailhouse/jailhouse-hardware-check", line 147, in
> > <module>
> >     iommu, _ = sysfs_parser.parse_dmar(pci_devices, ioapics,
> dmar_regions)
> >   File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py",
> > line 377, in parse_dmar
> >     raise RuntimeError('DMAR region size cannot be identified.\n'
> > RuntimeError: DMAR region size cannot be identified.
> > Target Linux must run with Intel IOMMU enabled.
> >
> > I'm using Linux Kernel 5.4.61 with the patches and config options from
> > "jailhouse.cfg".
> >
> > The kernel command line contains "intel_iommu=off" (as specified under
> > "Software requirements" at https://github.com/siemens/jailhouse).
> > I've also tried "intel_iommu=on" but without success.
> >
> > What is the reason for this again?
>
> I could be that your kernel does not support what is needed to check the
> hardware. It may still be fine to run Jailhouse. Do not invest too much
> into the checker - or use a regular distro kernel for the check (which
> may also partially fail these days due to CONFIG_STRICT_DEVMEM).
>
> > It's very difficult (at least for me) to get jailhouse up and running.
>
> Focus on the configuration, not the checking. In fact, the checker has a
> decreasing value because (x86) hardware shipped in 2020 has all features
> we need, practically always.
>
> Jan
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F%2BigLuoA3wSg4boAhxtuWQ%40mail.gmail.com.

--0000000000003433ae05ae6c14de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thanks!=C2=A0<div dir=3D"auto"><br></div><div dir=3D=
"auto">Is the entry &quot;intel_iommu=3Doff&quot; still needed for x86_64 t=
argets?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards</di=
v><div dir=3D"auto">Jan.</div><br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@s=
iemens.com">jan.kiszka@siemens.com</a>&gt; schrieb am Do., 3. Sep. 2020, 19=
:01:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On 03.09.20 15:07, Jan-Marc St=
ranz wrote:<br>
&gt; Hi Jan!<br>
&gt; <br>
&gt; I&#39;ve moved to another target with &quot;Intel Core i7-8559U&quot;.=
<br>
&gt; This CPU supports &quot;VT-x&quot; and &quot;VT-d&quot;.<br>
&gt; <br>
&gt; Doing a hardware check I get the following messages:<br>
&gt; <br>
&gt; Feature=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Availability<br>
&gt; ------------------------------=C2=A0 ------------------<br>
&gt; Number of CPUs &gt; 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok<br>
&gt; Long mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok=
<br>
&gt; Traceback (most recent call last):<br>
&gt; =C2=A0 File &quot;/usr/libexec/jailhouse/jailhouse-hardware-check&quot=
;, line 147, in<br>
&gt; &lt;module&gt;<br>
&gt; =C2=A0=C2=A0=C2=A0 iommu, _ =3D sysfs_parser.parse_dmar(pci_devices, i=
oapics, dmar_regions)<br>
&gt; =C2=A0 File &quot;/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_p=
arser.py&quot;,<br>
&gt; line 377, in parse_dmar<br>
&gt; =C2=A0=C2=A0=C2=A0 raise RuntimeError(&#39;DMAR region size cannot be =
identified.\n&#39;<br>
&gt; RuntimeError: DMAR region size cannot be identified.<br>
&gt; Target Linux must run with Intel IOMMU enabled.<br>
&gt; <br>
&gt; I&#39;m using Linux Kernel 5.4.61 with the patches and config options =
from<br>
&gt; &quot;jailhouse.cfg&quot;.<br>
&gt; <br>
&gt; The kernel command line contains &quot;intel_iommu=3Doff&quot; (as spe=
cified under<br>
&gt; &quot;Software requirements&quot; at <a href=3D"https://github.com/sie=
mens/jailhouse" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git=
hub.com/siemens/jailhouse</a>).<br>
&gt; I&#39;ve also tried &quot;intel_iommu=3Don&quot; but without success.<=
br>
&gt; <br>
&gt; What is the reason for this again?<br>
<br>
I could be that your kernel does not support what is needed to check the<br=
>
hardware. It may still be fine to run Jailhouse. Do not invest too much<br>
into the checker - or use a regular distro kernel for the check (which<br>
may also partially fail these days due to CONFIG_STRICT_DEVMEM).<br>
<br>
&gt; It&#39;s very difficult (at least for me) to get jailhouse up and runn=
ing.<br>
<br>
Focus on the configuration, not the checking. In fact, the checker has a<br=
>
decreasing value because (x86) hardware shipped in 2020 has all features<br=
>
we need, practically always.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F%2BigLuoA3wSg4boAhxt=
uWQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F%2BigLuoA3w=
Sg4boAhxtuWQ%40mail.gmail.com</a>.<br />

--0000000000003433ae05ae6c14de--
