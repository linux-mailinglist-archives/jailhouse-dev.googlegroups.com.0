Return-Path: <jailhouse-dev+bncBCDJXM4674ERBZM76LYQKGQEL5WTYUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 917C9154ECC
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Feb 2020 23:15:02 +0100 (CET)
Received: by mail-oi1-x23a.google.com with SMTP id 10sf85625oir.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Feb 2020 14:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/oPSGsDJBdWuYS59GJDPHEThejHs/BYfdme2jPgmxl0=;
        b=qDxEuc/ZwkeRSlVNqNkLitVIgTR1XmbfKXDI9kHRpTGeAJQs46VAqalz/4jZ5rnN9+
         SbAD3sVRDcC3/xympsrhdcClqrhkX1krmY2bkkDSdu1cKMR3z0PszIspAFH4NK7h+vKP
         Lc7Hr+DquBHiitp881q6oe7tWFwuD2Z0/9KpzAH7Z6rsGuWM86BbzfG5wh8rlyRaIUf2
         FLCHtcyypgtAT1WF3kke6lsocs4Keqd8TCb+1oCwfnTifkDijM4TR0ZKJEHpHqWFLcQM
         vdWxHYxeaLaPTQ8zBAZNY2XE/Jfof6B17CT0C/56pQ2c1UFguw1dFuPP8fKx2i43rPyD
         JzVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/oPSGsDJBdWuYS59GJDPHEThejHs/BYfdme2jPgmxl0=;
        b=kgDk3LNE9tj3C5j0gANjQBYGO9zkV8EDesG+Q/xhsVADiV1oTRanRr1YtYjapArCEa
         IN7w6iHImT3eJ2bNqNKExpb2LBznCawrQiTDjpPmw9Jct04B/rqDV+VeJZE9BSnzUugv
         vERGYCtXD+psqjjh94QuGHKKMkzRUFsvphvxHxzg3sH49s5v4S3JVXI6iPok6NJAkgoI
         llbpmObDppklliUSVIpvz+2sQgmFXOkAkE5GesSzsAkvZAXs01Tlj/5tPPx4DnHZecV6
         1gDeaYZ0KBnVQul4EqO0A5K7AaEgvNZwaU5B95gvIGG8asY0kpKC+cY97aRyBMlopV42
         psCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/oPSGsDJBdWuYS59GJDPHEThejHs/BYfdme2jPgmxl0=;
        b=dQucQ9PsvJZ86+qmPFXO3aWNGKGMTYAulR0URMBgW3DMCaLHYNkyfDqC4m3qnpoJbp
         r5fTBNuDy+vAzbmLbLKt95Zl9rR62X9iQVIdW0ARymedgqJdbhbssAu+YDsyFIFUivDp
         2uod8HRYRWptplykGwDVrWw3pYHKOdq4WA00Gj1sMglcsSPGGGXVo1Mu3kCQCFYnuFAG
         ZOOMS2iql1tf/31j7kWqmeSa8DnF8bKFlUA1jMtS7VYosGdgaPtekVI6VIIfy92OJKPH
         r+AGmP4SjHdxashVP4srrhsci7oPZhBYbJyGnKGqfxEKKVmJlTrfby7OEAXMkTb691IW
         CqnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWAokY7l0mFkp763YCy6an4IA6ryUlIj6pYnHCo/Wv1f15/I8FG
	PWuKuLYbmZpbjAK0w75imMg=
X-Google-Smtp-Source: APXvYqyc9Omjg+dQ7Djj3ibFzTQA5/wXbIDs2ag6ZxKyyneX8/zJDMms3zBHOIJrhvWsGdv4PCjDrg==
X-Received: by 2002:a05:6830:1d8d:: with SMTP id y13mr231241oti.344.1581027301464;
        Thu, 06 Feb 2020 14:15:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7281:: with SMTP id t1ls2286979otj.7.gmail; Thu, 06 Feb
 2020 14:15:00 -0800 (PST)
X-Received: by 2002:a9d:4d17:: with SMTP id n23mr231843otf.85.1581027300798;
        Thu, 06 Feb 2020 14:15:00 -0800 (PST)
Date: Thu, 6 Feb 2020 14:15:00 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8c4969cc-6165-42bb-9647-b19966635742@googlegroups.com>
In-Reply-To: <8e62e937-be43-4c10-721c-78f2b11a5eb1@siemens.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
 <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
 <5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
 <20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
 <96056326-0700-4779-b1b8-3b0df7134a73@googlegroups.com>
 <9c6c6364-c7a6-f2a4-507a-b5a9b1f6b8b3@siemens.com>
 <3d7d68d7-b54d-4610-b50d-528c1c2be781@googlegroups.com>
 <8e62e937-be43-4c10-721c-78f2b11a5eb1@siemens.com>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_117_1069798187.1581027300172"
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

------=_Part_117_1069798187.1581027300172
Content-Type: multipart/alternative; 
	boundary="----=_Part_118_716668414.1581027300173"

------=_Part_118_716668414.1581027300173
Content-Type: text/plain; charset="UTF-8"

On Thursday, February 6, 2020 at 12:23:47 PM UTC-7, Jan Kiszka wrote:

> On 06.02.20 20:15, Michael Hinton wrote: 
> > Hi Jan, 
> > 
> > On Thursday, February 6, 2020 at 12:06:05 PM UTC-7, Jan Kiszka wrote: 
> > 
> >     On 06.02.20 20:00, Michael Hinton wrote: 
> >     > map_range((char *)MGH_HEAP_BASE, MGH_HEAP_SIZE, MAP_UNCACHED); 
> > 
> >     Why are you mapping your RAM uncached? That's (roughly) only needed 
> for 
> >     MMIO. 
> > 
>
> > 
> > I see that it sets the PG_PCD argument to the page table entry in 
> > map_range(). What does that do? 
>
> That controls caching on page-level granularity. 
>
> > 
> > Should I set it to MAP_UNCACHED and see if that helps with performance? 
>
> MAP_CACHED. When it's uncached, every memory access will hit the RAM. 
> That is... not very fast. 
>
> Jan 
>

Switching to MAP_CACHED worked! My inmate now runs 100 ms faster than the 
same workload in the root cell. The inmate went from 2.8 s down to 1.1 
seconds with that change.

> I guess I was copying the other map_range() call used to set up the 
> > IVSHMEM from the ivshmem demo. So I have no particular reason. 
> The ivshmem demo is doing that only for the MMIO register region, not 
> the shared memory is later maps. 


Running the workload directly on input in shared memory with IVSHMEM is 
super slow, so I'm wondering if the data portion is indeed UNCACHED, 
contrary to what you say. Or maybe there is some other bottleneck. I will 
try to investigate that some more (maybe I will change it to CACHED as well 
and see what happens). But at any rate, for my purposes, I can always copy 
the data out of IVSHMEM into the cached memory region for now now.

Thanks,
Michael
 

> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8c4969cc-6165-42bb-9647-b19966635742%40googlegroups.com.

------=_Part_118_716668414.1581027300173
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Thursday, February 6, 2020 at 12:23:47 PM UTC-7, J=
an Kiszka wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 0=
6.02.20 20:15, Michael Hinton wrote:
<br>&gt; Hi Jan,
<br>&gt;=20
<br>&gt; On Thursday, February 6, 2020 at 12:06:05 PM UTC-7, Jan Kiszka wro=
te:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 06.02.20 20:00, Michael Hinton wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; map_range((char *)MGH_HEAP_BASE, MGH_HEAP_SIZE,=
 MAP_UNCACHED);
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Why are you mapping your RAM uncached? That&#39;s (r=
oughly) only needed for
<br>&gt; =C2=A0 =C2=A0 MMIO.
<br>&gt; <br>
<br>&gt;=20
<br>&gt; I see that it sets the PG_PCD argument to the page table entry in
<br>&gt; map_range(). What does that do?
<br>
<br>That controls caching on page-level granularity.
<br>
<br>&gt;=20
<br>&gt; Should I set it to MAP_UNCACHED and see if that helps with perform=
ance?
<br>
<br>MAP_CACHED. When it&#39;s uncached, every memory access will hit the RA=
M.
<br>That is... not very fast.
<br>
<br>Jan
<br></blockquote><div><br></div><div>Switching to MAP_CACHED worked! My inm=
ate now runs 100 ms faster than the same workload in the root cell. The inm=
ate went from 2.8 s down to 1.1 seconds with that change.</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">&gt; I guess I=
 was copying the other map_range() call used to set up the=C2=A0<br>&gt; IV=
SHMEM from the ivshmem demo. So I have no particular reason.=C2=A0<br>The i=
vshmem demo is doing that only for the MMIO register region, not=C2=A0<br>t=
he shared memory is later maps.=C2=A0</blockquote><div><br></div><div>Runni=
ng the workload directly on input in shared memory with IVSHMEM is super sl=
ow, so I&#39;m wondering if the data portion is indeed UNCACHED, contrary t=
o what you say. Or maybe there is some other bottleneck. I will try to inve=
stigate that some more (maybe I will change it to CACHED as well and see wh=
at happens). But at any rate, for my purposes, I can always copy the data o=
ut of IVSHMEM into the cached memory region for now now.</div><div><br></di=
v><div>Thanks,</div><div>Michael</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc s=
olid;padding-left: 1ex;">--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8c4969cc-6165-42bb-9647-b19966635742%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/8c4969cc-6165-42bb-9647-b19966635742%40googlegroups.com<=
/a>.<br />

------=_Part_118_716668414.1581027300173--

------=_Part_117_1069798187.1581027300172--
