Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBOE4XLYQKGQEF6P6GJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id A86A6149F25
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 08:16:08 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id 90sf5655664wrq.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jan 2020 23:16:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580109368; cv=pass;
        d=google.com; s=arc-20160816;
        b=kZzMW1KXh4dKu7gnWTimFVjzgOTUtIW5lS2IvI+iUxBhDn9CWpTBAwHeAyAfSp8K4q
         Z+PG95ycuX+WZnBhByWzXvZUAlERUcC2GO2UHMD0OH5MYye1boWxRdmyD8QmMA3ldLUm
         OW25e2VsGddfVrsIVyaB+k03Fbfax9jpvpff+wGtWpznpxtgy6NyOBa7Ali5zxmXrtMI
         Kpu+s7qGuyJSAgR+jp+yfSHTyzLqbZvAtYXXrTfOhayMLVE/9XZM57bLRArVfZJDIZYJ
         EjDJ1Qq+0zsetFLySCbfK5+e5tUSDrx4xQ2QYJvLtlREg/nseYXjuhA5OVTbmeYNEFaY
         OWmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=vHWuqN7QGlRaW86pZvC/QsAfUjhuLzrwrokVCosLxr8=;
        b=YU3VuKm4I1+d7R+Q6pcu3NGSR1KIqTVDvqrbecEw9sUhfw6lVaicmAUosYZtoTRcLB
         fh6l6833mmzmftA98LalCrdwD7uWbf5M2ufr0ZZmKVQ4KcwI8Yns1w0mprbAfN2Pamql
         X0lE11TOxxsR9kbRyd8QaK913UFsT/tfLvORNqXi9QKes0rckZw2MrNf32jUR65YndMp
         zBcYlcwhgeMCoCv/Qfkle/HQuVyIai0/hcmPcHXX0EQSezTX79wGFQgbTI1oN6TosZ9J
         FqbtWN9kEz889knBfVFKbPWUF1VdBybWEZ3z9nQtFC25SL6m44JKvp/sY7tZWkAmkq0u
         m7Rw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vHWuqN7QGlRaW86pZvC/QsAfUjhuLzrwrokVCosLxr8=;
        b=llnN2XKazdBKEJfSfePAIuw6nb+UbCAsiudc22OMD3tHPwvLlJpaUdx4eNXainWRS3
         K8765SFVnC1MPB6MRBnOfXJS1V75zSRrTjHrFwdUxLCNykUefYa7P/YTzOBjQuLwoQB5
         MTKphkDzcqXNIk4T2a6MWsIEAg39kmaYLuDvqq3M040zKC3JuX5g/h0/JSC3/TczDc/W
         pqBpyHikneEbANGKNUpdY2Pvhqb46ZlSRH/rRdgYH1KHceWGRqvYIWDJHQ5Wsbmv1E5B
         SHwXEnZ+9njEcP3MhwpRSHcnv66XkY04r95gQdX5VuSPRjqvqFafvSjb9houys6kOpoq
         Ilww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vHWuqN7QGlRaW86pZvC/QsAfUjhuLzrwrokVCosLxr8=;
        b=bJDSBV5Ag3ZRMQSm7l0CCY7pAD3OW2osoGQ3PUYee6RI8DXhLUcBlqEK53xUHRIgZw
         aUBGO2APx+XBsc4bhObhF7wxDws1nocUbGQvkJzP84TZKEwmT52XOPi86yr5KI69E5tt
         9EvJ41NoxVWnff86kUhaT4rzbGGMtKZQRoQdqXL7/CGm75wZVIBtLUljMyCvj1Z80CKs
         pisazQlD02gnn3tQlOjk3w6/3XznKdpv5kiLh20xxul8JGTE3uL9sMHJ3S/6dQi5w5wK
         /DfcKSYeFR/eGAcxPIULpzsqf7Kvt7cHFEhyGoIs4FW6+X02Q3nOzZuvnM+YyLwSzNYI
         Lm/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXQUufq1UUPwLW9A9a2IyEEnj9ypTXQ3GKlntiHtUUYnwJcf8A6
	bcvRB7maP900c4idRQTpz18=
X-Google-Smtp-Source: APXvYqyR36nzLyzc/L1+b/xXrblyW3sRjNX9pHcHJILlr2Za92dbeYWe9CADKIBY8ynsDlE/wwVnFA==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr11287599wmg.147.1580109368346;
        Sun, 26 Jan 2020 23:16:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c3d1:: with SMTP id d17ls6109348wrg.10.gmail; Sun, 26
 Jan 2020 23:16:07 -0800 (PST)
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr20560891wrp.182.1580109367668;
        Sun, 26 Jan 2020 23:16:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580109367; cv=none;
        d=google.com; s=arc-20160816;
        b=LS/PNfzPn/hM7jlHynRU2lsdp3tSFNA3/p+HDsIrPDiCtRlQWLx3Q8Y+Szjkh/fSbq
         5WHRIAIxRdV/iQpcm7dwWMV8LiuHFcPV0O/Shl1LvFuQ4HGMzXXnK4tBbjHjlbur0l8+
         VEV+Rm4i9aI9qRKn4br6Kvb2TW4oE+EVg4y+py/ADOeEmrXONWmZXRVMX5dfyXXzX9kl
         ALf3rzUA3kpWDu6mDoYJ3o8wnFn+ae8m05zPHixe/vXbMRcqgWp+KcsLd2qEMMekbQCN
         SW7bqNEzsR6DwIg4/hjuMZ2ltOTRTzKPcj/F9rqsKP3UoE4Es8Qw9G5yw5y5llp2v7ik
         wa8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=diG5CBCxUBd4CrurBkE55rMgwcTC8yLOZ7Y6JezA0bo=;
        b=UfDwAagwobtX84RegRXkAiPyXqN/X3FH92maNQjeHzYq5k5+uCY/ECZRGXbtJcl0tv
         Bhq3oxfiuofpxSpLQ+e6kfIBN9hJOHZMt/5pC3y/L10EfaC3BiiiC1dC1bV8+ZKA7sHP
         pKnhG0m0Z/9+9nZgpH+zn3fs70pKlim8rQQFZJaATaUrLYQTa+4NI5FA6p3NOGPXu/oc
         pzay53t+TfyYA2I0JzUMwr8xY0X53ol3vjkHQbXZ6cX13ny+huRzCwfcYmvol0NdbGmw
         Cd3zQwx9msOT9Y5u5DzyWKGd2kShcvtgZROI3+uVQu0zsXh4XXbZdiceonBieKo4yeOJ
         CzJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y13si455118wrs.0.2020.01.26.23.16.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jan 2020 23:16:07 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00R7G6Ug001495
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2020 08:16:06 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.35.223])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00R7G6ta019574;
	Mon, 27 Jan 2020 08:16:06 +0100
Date: Mon, 27 Jan 2020 08:16:02 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Michael Hinton <michael.g.hinton@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
Message-ID: <20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
In-Reply-To: <5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
	<20200120144629.201f3081@md1za8fc.ad001.siemens.net>
	<b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
	<20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
	<5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On Sat, 25 Jan 2020 23:07:53 -0800
Michael Hinton <michael.g.hinton@gmail.com> wrote:

> Hi Henning,
>=20
> On Thursday, January 23, 2020 at 5:15:08 AM UTC-7, Henning Schild
> wrote:
> >
> > Thanks,=20
> >
> > that is a lot of information. I would say that is CPU and memory
> > bound work. It should not cause exits at all, maybe a few for
> > getting the input in and the output out. reading ivshmem should not
> > trap, =20
>=20
>  So IVSHMEM won't trap/cause a vmexit? What are the other potential
> causes for traps, then? My inmate doesn't access any other resources.
> =20
>=20
> > writing=20
> > output to a console should be avoided within the measured time.=20
> > =20
> Before starting this thread, I found that I accidentally did do this,
> and after removing the console print, I shaved 300 ms off the inmate
> time. But I don't see any more prints that could happen.
>=20
> This is how I measure the workload in the inmate:=20
> https://github.com/hintron/jailhouse/blob/ba0c5f9cc28edf43ab6970cdaddafea=
77dd07b4c/inmates/demos/x86/mgh-demo.c#L1117-L1121
> I then print the cycle count and divide it by 3,700,000 manually to
> get the total duration to avoid overflows and truncations.
> =20
>=20
> > If you need to use something that traps, see if you can "batch"
> > things. I.e. do not read/write in byte-chunks.   =20
>=20
> For truly memory bound applications the mapping of the memory
> matters.=20
> > The bigger the pages in the pagetable (and the nested pagetable)
> > the better. You might be able to read performance counters and look
> > at TLB misses.=20
> > =20
> I'll need to look into that.
>  =20
>=20
> > Not sure what Jailhouse exactly does to mitigate Spectre etc. but
> > these mitigations often have a severe effect on "memory
> > performance".=20
> >
> > I would for sure have a look at aligning the CFLAGS used for the
> > Linux application and the inmate.=20
> > =20
> Ok, I'll double check CFLAGS as well. I'm now using the exact same
> object files for the workload functions, but the discrepancy got
> worse :D=20
>=20
> > The first things to compare is "native Linux", "root cell Linux
> > under jailhouse" and "non-root cell Linux under jailhouse". If the
> > third is better than your inmate, your inmates environment is
> > likely the cause.=20
> Yes, I've been looking at those three cases, and Linux under
> Jailhouse is only 30 ms slower than Linux not under Jailhouse, while
> both of those are way faster than the inmate. So that tells me that
> there is something going wrong with the inmate.

Ok, so we are just looking for differences between the inmate and the
linux as non-root cell, because the jailhouse/virtualization overhead
is acceptable or known.

In that case a memory bound workload boils down to the mapping and the
tlb misses or CAT. And cpu bound could be an issue with the FPU. If your
binary uses FPU instructions but is able to fall back to soft-fpu, you
should check which path it takes in the inmate.

Henning

> Thanks for the help,
> -Michael
>=20
> Henning=20
> >
> > On Wed, 22 Jan 2020 23:57:29 -0800=20
> > Michael Hinton <michael...@gmail.com <javascript:>> wrote:=20
> > =20
> > > Ralf, Henning,=20
> > >=20
> > >=20
> > > Thanks for the quick response, and sorry for the delay.=20
> > >=20
> > > Here=E2=80=99s my setup: I=E2=80=99ve got a 6-core Intel x86-64 CPU r=
unning
> > > Kubuntu 19.10. I have an inmate that is given a single core and
> > > runs a single-threaded workload. For comparison, I also run the
> > > same workload in Linux under Jailhouse.=20
> > >=20
> > > For a SHA3 workload with the same 20 MiB input, the root Linux
> > > cell (and no inmate running) takes about 2 seconds, while the
> > > inmate (and an idle root cell) takes about 2.8 seconds. That is a
> > > worrisome discrepancy, and I need to understand why it=E2=80=99s 0.8 =
s
> > > slower.=20
> > >=20
> > > This is the SHA3 workload:=20
> > >  =20
> > https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8=
ac79f4a1cde/inmates/lib/mgh-sha3.c#L185-L208
> >  =20
> > >=20
> > > This is the Linux wrapper for the SHA3 workload:=20
> > >  =20
> > https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8=
ac79f4a1cde/mgh/workloads/src/sha3-512.c#L166-L168
> >  =20
> > >=20
> > > This is the inmate program calling the SHA3 workload:=20
> > >  =20
> > https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8=
ac79f4a1cde/inmates/demos/x86/mgh-demo.c#L370-L379
> >  =20
> > >=20
> > > You can see that the inmate and the Linux wrapper both execute
> > > the same function, sha3_mgh(). It's the same C code.=20
> > >=20
> > > The other workloads I run are intentionally more memory
> > > intensive. They see a much worse slowdown. For my CSB workload,
> > > the root cell takes only 0.05 s for a 20 MiB input, while the
> > > inmate takes 1.48 s (30x difference). And for my Random Access
> > > workload, the root cell takes 0.08 s while the inmate takes 3.29
> > > s for a 20 MiB input (40x difference).=20
> > >=20
> > > Here are the root and inmate cell configs, respectively:=20
> > >=20
> > >  =20
> > https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8=
ac79f4a1cde/configs/x86/bazooka-root.c
> >  =20
> > >=20
> > >  =20
> > https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8=
ac79f4a1cde/configs/x86/bazooka-inmate.c
> >  =20
> > >=20
> > > I did do some modifications to Jailhouse with VMX and the
> > > preemption timer, but any slowdown that I may have inadvertently
> > > introduced should apply equally to the inmate and root cell.=20
> > >=20
> > > It=E2=80=99s possible that I am measuring the duration of the inmate=
=20
> > > incorrectly. But the number of vmexits I measure for the inmate
> > > and root seem to roughly correspond with the duration. I also
> > > made sure to avoid tsc_read_ns() by instead recording the TSC
> > > cycles and deriving the duration by dividing by 3,700,000,000
> > > (the unchanging TSC frequency of my processor). Without this, the
> > > time recorded would overflow after something like 1.2 seconds.=20
> > >=20
> > >=20
> > > I'm wondering if something else is causing unexpected delays:
> > > using IVSHMEM, memory mapping extra memory pages and using it to
> > > hold my input, printing to a virtual console in addition to a
> > > serial console, disabling hardware p-states, turbo boost in the
> > > root cell, maybe the workload code is being compiled to different
> > > instructions for the inmate vs. Linux, etc.=20
> > >=20
> > > Sorry for all the detail, but I am grasping at straws at this
> > > point. Any ideas at what I could look into are appreciated.=20
> > >=20
> > > Thanks,=20
> > > Michael=20
> > >=20
> > > On Monday, January 20, 2020 at 6:46:32 AM UTC-7, Henning Schild
> > > wrote:  =20
> > > >=20
> > > > On Sun, 19 Jan 2020 23:45:46 -0800=20
> > > > Michael Hinton <michael...@gmail.com <javascript:>> wrote:=20
> > > >    =20
> > > > > Hello,=20
> > > > >=20
> > > > > I have found that running code in an inmate is a lot slower
> > > > > than running that same code in the root cell on my x86
> > > > > machine. I am not sure why.    =20
> > > >=20
> > > > Can you elaborate on "code" and "a lot"? Maybe roughly tell us
> > > > what your testcase does and how severe your slowdown is.
> > > > Synthetic microbenchmark to measure context switching ?=20
> > > >=20
> > > > As Ralf already said, anything causing "exits" can be subject
> > > > to slowdown. But that should be roughly the same for the root
> > > > cell or any non-root cell, is it truly the "same" code?=20
> > > >=20
> > > > And of cause anything accessing shared resources can be slowed
> > > > down by the sharing. Caches/buses ... but i would not expect "a
> > > > lot".=20
> > > >=20
> > > > regards,=20
> > > > Henning=20
> > > >    =20
> > >  =20
> >
> > =20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20200127081602.08ea3fd6%40md1za8fc.ad001.siemens.net.
