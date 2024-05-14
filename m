Return-Path: <jailhouse-dev+bncBCMZLOEWZYNBBH6SRWZAMGQEZOMH7YY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ED68C5745
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 May 2024 15:37:38 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id 2adb3069b0e04-5236c5cec7dsf745865e87.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 May 2024 06:37:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1715693857; cv=pass;
        d=google.com; s=arc-20160816;
        b=N0/apZs42dbU4/i5pmaUH8H8zwhv5xPOK/s0PSrilgeLxKhSxzeaFVoI4Umb5s3/Db
         MVY7xDpVGYjkh6t8kBCl/z8BFV6QFy9JUAmbddnzfi8CXCed9/lVw+7l19j1ULvk1kIc
         yLlsznr1vFdpDbXsVQM2EOqs5d0pzDNdZlXnSAFIKQHsORjoTUMAJr/qY7I1uVzrpNNj
         O8wlt1IjJtY6hjL/n78YGyKZeuzqRphBy4MLHqoO/EL3sI/HSk8WJcqhTOmEHhQm5zYO
         uI3aTA+uMUlmntsbEh+SAL6BX0+OHAvQ0HWKqvQI6qBuJPoOVY1Fc3jCctj4ORvFFt4M
         jVnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=TP9OFnojSOJwS65f/b8ZgooRAAdmi2C6s1GWLoitZ3Q=;
        fh=fAWLzr89it70OgEouWi46WDK3eL5TcJ1G//jqXpc7s8=;
        b=FnkeX4+NQSVhD1zZlXjYRY8Oc28eWsfKxt4CilmMDaeDZPu/eJgX9T+YurZi1O9SN1
         SZBOobx+k5FvEwiYRnp17LUY620ROA9Vc/C+KmDsGNYFp8yw26EoIY4N0mOtmvw4hIdH
         TenW5AeoYDCARr4bV7GRfy8PALcQVl2pOrpR1E48GTLWj94Im0aroOSGnnh+uh51MAgT
         K2fcqr1pj1GU0aHxgsNz1G6t1QWLIRzOVqE9e4dBxrzFnV78igvPxASZcLA+m44xe+8E
         xlO2Fn4E8nXhWo7RYzfxlrNu7uxaahRXPGBzBK7WvKXc2u1eOpkwevNHzSLzeGVSc2sa
         v71g==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jtrmb50D;
       spf=pass (google.com: domain of saftab.rashid@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=saftab.rashid@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1715693857; x=1716298657; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TP9OFnojSOJwS65f/b8ZgooRAAdmi2C6s1GWLoitZ3Q=;
        b=Jh/bCoOub2hxQSLqCq6TQvqGhqwRDtpk2RR5WJWkevCXiaMkQbWmfhjtzng9NvlJPL
         HUHcHW7d6IQkZanvoXlNLPTk9l0+wECD1M2Y9XEggCVEBeVBylUKHpISr2OMUTjh04vZ
         AaPyBGcnbkYmuucIMnsPmgT4jmxNfVp62FpiUzQFm7KEfDD/+sN/ooZIXON/bbpt5x8s
         hOZ1OLNCR8VbFsewutIftyYx/+QoubaazZuMlDbsK5M0wGVbkdHZtuRVp2pXyuJeQbjl
         oLRBe5RXbRLCYeqHPu4DqsVtydGJCRwwSVuIMlGi5kKbpl6hrGLq0kCCU9GM1orHjOTs
         KnHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715693857; x=1716298657; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TP9OFnojSOJwS65f/b8ZgooRAAdmi2C6s1GWLoitZ3Q=;
        b=HT6OEHDLbXT8rDsCQNz4Ekip/q+Ygws2IXiJFIC00E15aggVlWYiajJC5s1STxAWZN
         3ag/UgGUTo165EQoFIzQr/V+lK+dcVBp0ERPscabUW9h6ubZ8N+wnGHug+e6sI8HYnzN
         Z3etBcoFJNyKYJgHVaKfs5qEWsDUv7/Z8SMuFKlCtJYTP8AzjdnWo43ufYvaqtY6Ld+/
         vMh4Ik6EjND5mF2byHbc0lVtz61zz5umPNJlK+3pyN5WfBjXUK/KkuIfNT3fR1rG0onR
         +i16g2i8eFBpQ28I0BNBJP6lz//7eMtYP2w287Zm4xIrkrbx4Sqxnt4X33ynpDESXJjE
         hBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715693857; x=1716298657;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP9OFnojSOJwS65f/b8ZgooRAAdmi2C6s1GWLoitZ3Q=;
        b=nfHDS06cwNn6NUyD1bh7SydaeKiDoBE0320H7etzKlaviRT3OxiFm6yZRpP6+6aAZL
         aDUkUqXJv4aN+cSA2pPkGy4J1fvTyafrb6WgoFT1LGTRc2clnfQ8KqCV6W+176Qo5S95
         uxR2qPtfMh+lxAnlxKq3XvSiZ/DrupOsLeSlMqPa4L5w/xFeFyFzVO93nwdp3hbET9Ur
         iLywNj1pgEzZRxglDgJm1UNh7kg/6RaqdykoszWQdve0nf+zoR8LdzVHqSZXCkZ7p+gO
         i5cE6kk+InvmEvY0i7ykWquXPKKr8zDItDlO3o1C3X9b+/092d6ZX4bEkpmJcZFtfn54
         d9TQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCWLXguvbmWfnAxM5wSeu7M9qH1RT8W1bdtyuA7jkVpqmqq9GAy2QXfIG2scVkCpvBA5y6CzIUaXTU6IZMDuiZoWleDmg1Bvag4vd1U=
X-Gm-Message-State: AOJu0YxnInIF2vOCkULbfrLVsIH5tW0cG1e3YBYBm9Ci1SAqvKkcY2tq
	loRui9TxgqaQ90qEjMzfCBzYf5BGpbqmjPLnlyfSbwFJNnDru9dX
X-Google-Smtp-Source: AGHT+IHQJjSrVqWNVX4N4mKAhV9aSviG9c+VMOxC9IZItpAEC5y/U9sPiWO/+YN/sNy0+jxK/GBXzw==
X-Received: by 2002:ac2:550a:0:b0:519:611f:df49 with SMTP id 2adb3069b0e04-52210277efbmr9847114e87.69.1715693855979;
        Tue, 14 May 2024 06:37:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3e17:b0:51d:4506:9289 with SMTP id
 2adb3069b0e04-521e303333bls463796e87.0.-pod-prod-08-eu; Tue, 14 May 2024
 06:37:33 -0700 (PDT)
X-Received: by 2002:a19:6410:0:b0:51b:ce76:7813 with SMTP id 2adb3069b0e04-522102779cfmr10337778e87.58.1715693852728;
        Tue, 14 May 2024 06:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715693852; cv=none;
        d=google.com; s=arc-20160816;
        b=yi3jcFlWiZg7BFThjUv7fQq3chEYenODUrXOkpmTzeo5AukhRYUb1jZuUWjdscZiMO
         oTaG98UJyWjmc5mtTT/rT1Ys1S8Wt+r/xJDgCijkHG6dRA/cPXHh1mE3RJEKI1nrZL9K
         l8ltBCkQBKKXdshyjV5q+Kvc7Mbeh4I6JAhAIL5ZlKhQMMor0JFK1f4t8tJIqQzaVJ6/
         Ppkso1VS7DIsm/27kv6OB3yvw4EflKfq6hUGrtJESyHE/FAiiHBnKF/d6SI4pB+DjS5L
         WdjIfd/2tuc1Siu3t4oKJTsy4cHT/HqjobtRyFKUFOpULS6sYIAObcQxpsf1KFZBErQ3
         LFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ggk+LNUN3d/cNZGTYonB1b2fkmhwH9ePFP7uTiyzI+w=;
        fh=qihoVELKM8GSiNd+2WbxRHwuNXvygbPbTWYNWGsAvGU=;
        b=roZ2CFlMOJ8JHrFEWtpRqm+Fd/X9jcM96nCKeMxnsLtW64m28KhRQIBcMTBQD28vVS
         /UKNvFbyIBTVfCTM8zFhkzQUU16KRyF578ve79aTWaMxBjB5GKyflRK85XPKV+Q3jnRy
         oUUb9ugdUszSqU+DjaxPr98Qa+UeF3yh6HXDRrflM1VXveywsOzaBNxqdL9sxFE+2ECw
         UI9LakW/J6IazKNaDSg/BQJ7wiVReABUJ0HS+YILDAz5a7gEr9aurFidsc2lyqKGEMXo
         EPcBEmX6+Uaf/r8hO454Ttft+Lk0/3ePrSxXkFtwE3SCpnQuOMLsHs/qpm1TrgpT6mEB
         fHgw==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jtrmb50D;
       spf=pass (google.com: domain of saftab.rashid@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=saftab.rashid@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com. [2a00:1450:4864:20::52f])
        by gmr-mx.google.com with ESMTPS id 2adb3069b0e04-521f318b27esi363576e87.0.2024.05.14.06.37.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 06:37:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of saftab.rashid@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) client-ip=2a00:1450:4864:20::52f;
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5708d8beec6so137693a12.0
        for <jailhouse-dev@googlegroups.com>; Tue, 14 May 2024 06:37:32 -0700 (PDT)
X-Received: by 2002:a17:906:c45:b0:a5a:423:a69e with SMTP id
 a640c23a62f3a-a5a2d53ae73mr1160648766b.15.1715693851589; Tue, 14 May 2024
 06:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <1e39fb3a-f017-480d-aef7-2522a4735df0n@googlegroups.com>
 <3c397a1f-0ad9-46c9-a59a-021691b2b77c@oth-regensburg.de> <CAJtpjXjtf3vv-AAyXPQgt7P67r304skMUsmL+cusvkPNVS_LiA@mail.gmail.com>
 <72441d4a-85fa-4fb2-9fcb-7495852ff564@oth-regensburg.de> <CAJtpjXj7=La=WUJJ9BgY6K7OYVCoBEBwkxq9hDtA5+6De2mYEg@mail.gmail.com>
 <02e40eed-4a63-40c6-b103-2433964ca130@oth-regensburg.de> <CAJtpjXggv_tL59_Uh3oS0bAiJPGMoreUdozU6qkWtAqdg5j8VA@mail.gmail.com>
 <dc8df30b-6a23-4954-a0de-fb2077074e23@oth-regensburg.de> <CAJtpjXjN3MfvfJhGf8k=Dx08XoVx--bAkKqgOVDN2Jqz_OBR9w@mail.gmail.com>
 <d30a9764-585f-4189-9f0c-033ddc2e1e55@oth-regensburg.de>
In-Reply-To: <d30a9764-585f-4189-9f0c-033ddc2e1e55@oth-regensburg.de>
From: Syed Aftab Rashid <saftab.rashid@gmail.com>
Date: Tue, 14 May 2024 15:37:19 +0200
Message-ID: <CAJtpjXj2vfPc8RP1QzgHHato+y_qW4-k8xrSDjur2KJkcx_BGw@mail.gmail.com>
Subject: Re: [EXT] Re: Direct Interrupt Injection for x86
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/mixed; boundary="00000000000091719d06186a1a9a"
X-Original-Sender: saftab.rashid@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=Jtrmb50D;       spf=pass
 (google.com: domain of saftab.rashid@gmail.com designates 2a00:1450:4864:20::52f
 as permitted sender) smtp.mailfrom=saftab.rashid@gmail.com;       dmarc=pass
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

--00000000000091719d06186a1a9a
Content-Type: multipart/alternative; boundary="00000000000091719b06186a1a98"

--00000000000091719b06186a1a98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the response Ralf,

I came across a paper that compares the performance of a few static
partitioning hypervisors including Jailhouse. Probably, you are already
aware of it, the paper is available here. https://arxiv.org/pdf/2303.11186.

One interesting thing I noticed is that for ARM with direct interrupt
injection enabled, the interrupt latency for Jailhouse is around ~200ns
(please see the attached image). However, on my x86 system I am getting an
average latency of ~800ns (from the APIC demo example). I think the APIC
example is also doing the same thing as was done for the experiment in the
figure. Do you have any idea why there is such a difference between the
values for both cases? is it architecture specific?

On Fri, May 3, 2024 at 5:31=E2=80=AFPM Ralf Ramsauer <
ralf.ramsauer@oth-regensburg.de> wrote:

> Hi,
>
> On 02/05/2024 15:45, Syed Aftab Rashid wrote:
>
> [snip]
>
> >      > I just wanted to understand what is the best possible jitter tha=
t
> >     I can
> >      > get with Jailhouse. We are working on a project that needs cycle
> >     times
> >      > between 1-2  microseconds. The bare metal implementation of a
> >     similar
> >      > application results in a much lower jitter ~50ns.
> >
> >     So the application does structurally the same like apic-demo?
> >     (i.e., full IRQ arrival and dispatching, "computational task" (i.e.=
,
> >     calculating jitter), return). 50ns are ~100 TSC cycles =E2=80=93 at=
hletic.
> >
> >     I really doubt those latencies are achievable with IRQs. With activ=
e
> >     waiting for events (i.e., active polling for interruption) - maybe.
> >
> >
> > Yes, it is a similar application implemented in bare metal code directl=
y
> > on the hardware. The jitter is even smaller with the max being 30ns.
>
> Interesting. W/o having the possibility to have a close look at this
> issue, I'd say that this comes from the additional need of hardware
> lookups through IRQ rerouting tables. I cannot say.
>
> [snip]
>
> >      > apic-demo doesn't seem to have much impact on the jitter. How is
> >     cache
> >      > allocated under Jailhouse house? What does a cache allocation of
> >     size 2
> >      > employ?
> >
> >     Cache allocation is only supported on Intel X86, where we have CAT,
> >     cache allocation technology.
> >
> >     I don't know precise details of cat (would have to look them up),
> >     but as
> >     far as I remember, assigning a size of 2 to a non-root-cell means
> that
> >     2MiB of L3$ are exclusively assigned to the non-root cell. (Look at
> the
> >     code, I'm not 100% sure).
> >
> >     Why do we do that? Neighbouring noise from other cells.
> >
> >     Just like the non-root cell might "disturb" itself, it's also
> possible
> >     that Linux, running aside of the non-root cell disturbes it: Imagin=
e
> >     Linux those heavy number crunching while the non-root cell waits fo=
r
> an
> >     IRQ. In that case, Linux will mess up caches of the non-root cell.
> >
> >     CAT prevents full cache pollution by ensuring that there is always =
a
> >     dedicated, but limited, amount of L3$ for the non-root cell.
> >
> >
> > Thanks for the explanation, I understand the idea of cache pollution. I=
t
> > is just that I don't see much impact with or without cache pollution on
> > the values I get for the jitter. Ideally, the jitter should be higher i=
f
> > I enable cache pollution and lower when I disable it. But, so far I am
> > not able to see that.
> >
> > Also, another question regarding direct interrupt injection, as we saw
> > that it is enabled by default. Can you tell me how can I disable it?
> > Again, this is just to see how it will impact the jitter if we have
> > direct interrupt injection disabled.
>
> There's no actual support for disabling this, it's used when being
> available. When Jailhouse tries to query the capability of IRQ remapping
> support during startup, you will have to mask out the bits that show
> support for it. I guess that should work.
>
>    Ralf
>


--=20
Best Regards,
Syed Aftab Rashid

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAJtpjXj2vfPc8RP1QzgHHato%2By_qW4-k8xrSDjur2KJkcx_BGw%40mail.=
gmail.com.

--00000000000091719b06186a1a98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the response Ralf, <br></div><div><br></di=
v><div>I came across a paper that compares the performance of a few static =
partitioning hypervisors including Jailhouse. Probably, you are already awa=
re of it, the paper is available here.=C2=A0<a href=3D"https://arxiv.org/pd=
f/2303.11186">https://arxiv.org/pdf/2303.11186</a>.</div><div><br></div><di=
v>One interesting thing I noticed is that for ARM with direct interrupt inj=
ection enabled, the interrupt latency for Jailhouse is around ~200ns (pleas=
e see the attached image). However, on my x86 system I am getting an averag=
e latency of ~800ns (from the APIC demo example). I think the APIC example =
is also doing the same thing as was done for the experiment in the figure. =
Do you have any idea why there is such a difference between the values for =
both cases? is it architecture specific?<br> </div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 3, 2024 at 5=
:31=E2=80=AFPM Ralf Ramsauer &lt;<a href=3D"mailto:ralf.ramsauer@oth-regens=
burg.de">ralf.ramsauer@oth-regensburg.de</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On 02/05/2024 15:45, Syed Aftab Rashid wrote:<br>
<br>
[snip]<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I just wanted to understand what is the best =
possible jitter that<br>
&gt;=C2=A0 =C2=A0 =C2=A0I can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; get with Jailhouse. We are working on a proje=
ct that needs cycle<br>
&gt;=C2=A0 =C2=A0 =C2=A0times<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; between 1-2=C2=A0 microseconds. The bare meta=
l implementation of a<br>
&gt;=C2=A0 =C2=A0 =C2=A0similar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; application results in a much lower jitter ~5=
0ns.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0So the application does structurally the same like =
apic-demo?<br>
&gt;=C2=A0 =C2=A0 =C2=A0(i.e., full IRQ arrival and dispatching, &quot;comp=
utational task&quot; (i.e.,<br>
&gt;=C2=A0 =C2=A0 =C2=A0calculating jitter), return). 50ns are ~100 TSC cyc=
les =E2=80=93 athletic.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I really doubt those latencies are achievable with =
IRQs. With active<br>
&gt;=C2=A0 =C2=A0 =C2=A0waiting for events (i.e., active polling for interr=
uption) - maybe.<br>
&gt; <br>
&gt; <br>
&gt; Yes, it is a similar application implemented in bare metal code direct=
ly <br>
&gt; on the hardware. The jitter is even smaller with the max being 30ns.<b=
r>
<br>
Interesting. W/o having the possibility to have a close look at this <br>
issue, I&#39;d say that this comes from the additional need of hardware <br=
>
lookups through IRQ rerouting tables. I cannot say.<br>
<br>
[snip]<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; apic-demo doesn&#39;t seem to have much impac=
t on the jitter. How is<br>
&gt;=C2=A0 =C2=A0 =C2=A0cache<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; allocated under Jailhouse house? What does a =
cache allocation of<br>
&gt;=C2=A0 =C2=A0 =C2=A0size 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; employ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Cache allocation is only supported on Intel X86, wh=
ere we have CAT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0cache allocation technology.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t know precise details of cat (would have=
 to look them up),<br>
&gt;=C2=A0 =C2=A0 =C2=A0but as<br>
&gt;=C2=A0 =C2=A0 =C2=A0far as I remember, assigning a size of 2 to a non-r=
oot-cell means that<br>
&gt;=C2=A0 =C2=A0 =C2=A02MiB of L3$ are exclusively assigned to the non-roo=
t cell. (Look at the<br>
&gt;=C2=A0 =C2=A0 =C2=A0code, I&#39;m not 100% sure).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Why do we do that? Neighbouring noise from other ce=
lls.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Just like the non-root cell might &quot;disturb&quo=
t; itself, it&#39;s also possible<br>
&gt;=C2=A0 =C2=A0 =C2=A0that Linux, running aside of the non-root cell dist=
urbes it: Imagine<br>
&gt;=C2=A0 =C2=A0 =C2=A0Linux those heavy number crunching while the non-ro=
ot cell waits for an<br>
&gt;=C2=A0 =C2=A0 =C2=A0IRQ. In that case, Linux will mess up caches of the=
 non-root cell.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0CAT prevents full cache pollution by ensuring that =
there is always a<br>
&gt;=C2=A0 =C2=A0 =C2=A0dedicated, but limited, amount of L3$ for the non-r=
oot cell.<br>
&gt; <br>
&gt; <br>
&gt; Thanks for the explanation, I understand the idea of cache pollution. =
It <br>
&gt; is just that I don&#39;t see much impact with or without cache polluti=
on on <br>
&gt; the values I get for the jitter. Ideally, the jitter should be higher =
if <br>
&gt; I enable cache pollution and lower when I disable it. But, so far I am=
 <br>
&gt; not able to see that.<br>
&gt; <br>
&gt; Also, another question regarding direct interrupt injection, as we saw=
 <br>
&gt; that it is enabled by default. Can you tell me how can I disable it? <=
br>
&gt; Again, this is just to see how it will impact the jitter if we have <b=
r>
&gt; direct interrupt injection disabled.<br>
<br>
There&#39;s no actual support for disabling this, it&#39;s used when being =
<br>
available. When Jailhouse tries to query the capability of IRQ remapping <b=
r>
support during startup, you will have to mask out the bits that show <br>
support for it. I guess that should work.<br>
<br>
=C2=A0 =C2=A0Ralf<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Best Regards,=C2=A0<div>Syed Aftab Rashid</div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAJtpjXj2vfPc8RP1QzgHHato%2By_qW4-k8xrSDjur2KJkcx_=
BGw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAJtpjXj2vfPc8RP1QzgHHato%2By_qW4-k8xrSDj=
ur2KJkcx_BGw%40mail.gmail.com</a>.<br />

--00000000000091719b06186a1a98--
--00000000000091719d06186a1a9a
Content-Type: image/png; name="Screenshot from 2024-05-14 15-22-48.png"
Content-Disposition: attachment; 
	filename="Screenshot from 2024-05-14 15-22-48.png"
Content-Transfer-Encoding: base64
Content-ID: <f_lw6fs39j0>
X-Attachment-Id: f_lw6fs39j0

iVBORw0KGgoAAAANSUhEUgAAApQAAAE7CAYAAABjbRGaAAAAi3pUWHRSYXcgcHJvZmlsZSB0eXBl
IGV4aWYAAHjaVY7dDYRACITftwpLGH4WlnLujCZ2cOUfK0bj9wADIcO07XfsbZkQtGn3YWGGREOD
PykGCgGIQbNnLa4ulIpzvOYmXMJiOPQ5VMWLLjZsd3W3bqutnO68iZyVBO28mmYzSjxGoagX8t7L
985WSf75HC0YZAWJxAAACgZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+Cjx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDQuNC4wLUV4aXYyIj4KIDxyZGY6
UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5z
IyI+CiAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgIHhtbG5zOmV4aWY9Imh0dHA6
Ly9ucy5hZG9iZS5jb20vZXhpZi8xLjAvIgogICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2Jl
LmNvbS90aWZmLzEuMC8iCiAgIGV4aWY6UGl4ZWxYRGltZW5zaW9uPSI2NjAiCiAgIGV4aWY6UGl4
ZWxZRGltZW5zaW9uPSIzMTUiCiAgIHRpZmY6SW1hZ2VXaWR0aD0iNjYwIgogICB0aWZmOkltYWdl
SGVpZ2h0PSIzMTUiCiAgIHRpZmY6T3JpZW50YXRpb249IjEiLz4KIDwvcmRmOlJERj4KPC94Onht
cG1ldGE+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAg
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
--00000000000091719d06186a1a9a--
