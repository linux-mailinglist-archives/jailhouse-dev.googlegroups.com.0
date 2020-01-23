Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBX4WU3YQKGQEGIZA4BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FB3146778
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jan 2020 13:02:40 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id j23sf954848lji.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jan 2020 04:02:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579780960; cv=pass;
        d=google.com; s=arc-20160816;
        b=OTy6u+3YKNSObELD+GeNnUyjL9pIwjkgGrw49ZC90So/jRMkN9eSHmCqwg1hddU8vb
         U44Tb4kBcDge/COOhdSa9E42xV/lKZ6Ze0r081mf9ipAoDGlu5mPFcp6c4X/ZAp2UZt9
         v3K+XBfNKdixIpAfDzTgFIJ7M+Vquh4E335JHH+xFtawWR4pJOaCnX8BKLfCLKrnFmmR
         lQncomXVIdH2vAmLO8JHzyZL+iIUut5v9DdZoEgZ8wpZPFxNBoig13M2YUpFlBgr3cAJ
         79q4yvYVf2aJ9vk/ut60WFdKRWov1H7ZYhS/RGhCLcMX97nqRnPe8civrxRyNtaeoU6K
         z+OA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=21IINS/GUCu9kvu2CTDbHyHm7odgNRv377aQtYihtrg=;
        b=JaYRKwl4GJSeZAhZWW4MboEA4TZa8vxEBp6ASmUOTw/XrdwAJJqyCgJaFBqjdaRGJU
         HEVvZOuB/j5n1B1MY3DbUZPhVAUumAOapfajMjnv4oVBBGv7PKCbsW2oTxxTJzmdzgR8
         2kwMoA1QT1hTFrgb9VF9patZKHJFr4EKkjIYQ7MDvkSbGGQ7EkSZy+AiNbHOoMedgXnd
         ae0IzEezgB/9DWT5cakk9tNi90tPV6oEo4aHoQh0+gXfbvL5EP0lHlJI/LugQWNXEbC+
         FJ/uOr9hPrmIXpi8gKZlehvYCcFfLNl5iDyRgr25zRBO63gBn6jfTHWvNVNrqKB9K595
         MfXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BORgHO+3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=21IINS/GUCu9kvu2CTDbHyHm7odgNRv377aQtYihtrg=;
        b=DAeJE/vV4Jp6oLoxs1Whb+ncTtY/0crF188z173RnWLR99vRXnGAh5C6h3MwswYQj8
         jsTBsAHTYJ6ciC63OFLDd0ZpiCMy3DA2GSzzq2N4W1CSAG/JOWL4pWAGQ6hLYtA3qmuv
         JOfXRm6ThBMwIn6wIcRgERoxwaWAKRgYK8toD17nm1UltYbfL9B46K0cbMN2/WIIWvcw
         raScmKrI9RPV6G2b5c7gaPlvgii5K87hfpbjdBBoOwNSGS3H0e3VoKmLen2NLsU+UVNB
         pZt1aTk7xM5ojQ4VjenNtlQiWWv9KTMB0kFqP6/5dUwQr2VL9kPWl1oIgaI5gLf/w2/u
         FAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=21IINS/GUCu9kvu2CTDbHyHm7odgNRv377aQtYihtrg=;
        b=jKNdZZYznHqdAAEFdd4mpr4gS2iv2kNwefWZy8PAVmCs0X2JdjBe/F/hUb/Xz2lrGq
         HXSPXtG5jLnHcsxru+p3/l+BsAmrZ1EgdQ6By3HKD45ONuOPjyihrEtWxbtdzIbbtUVf
         nr53+qGrLNgqU38DCnwuuQehpM1NDQoJvqpaUEabBJdyEAoRoJ6yOAFYewwWC+/Urby6
         r7cvbvEKzs81Q6qboa/bFVVhvAVscK2ds08px8QLOTwDrOp8qstN5b5MFfig6SnkTKE+
         tclL1gPvMi/wNRG43fSCSJBtJNsnYk/PX1GCivxLF65smkhuYbSQLyBn+dqb5ayHIeoa
         fM5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX2XfYHs+147ejpAn3WwEsUMi/Nk5pb2gGbY724JwLzcBe8JES6
	pUm6o51U4JTm79z3Yh91w5o=
X-Google-Smtp-Source: APXvYqzdaiiS6zCCy6PG0cXxAlHCcFaaKlWntYvWu1jPKFh1Nqc7J9Qf4CUIlk8vYoyxYymhZEO1eQ==
X-Received: by 2002:a19:cc11:: with SMTP id c17mr1589003lfg.161.1579780960182;
        Thu, 23 Jan 2020 04:02:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d90:: with SMTP id c16ls825819ljj.1.gmail; Thu, 23 Jan
 2020 04:02:39 -0800 (PST)
X-Received: by 2002:a2e:a48a:: with SMTP id h10mr22275042lji.254.1579780959420;
        Thu, 23 Jan 2020 04:02:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780959; cv=none;
        d=google.com; s=arc-20160816;
        b=XMYHvXVWOCKGXUxusAWipx/pnQ6D8fy0i1wHf0wAOeJkGD57S65mdh1GArK5+WHQLb
         IEIZZS0nDhF08nYodtAxeYRmSght+FuYFOq1TEKSjreSabKB9ZnXJjhzNRZw9/YhrNfl
         FjDZNvVWd9EWf/NqsUdvK7dD204uDUyRN0AdP/pa+Rz7WPsaSWUdvRQ6+G5uZJjUofEC
         nPGpK4ASRVGcsVTp1LRPPEK2IFzEx2Tlnzl2hQCmdLn3kihm5axa4AIS6wCyKYKtNulb
         J3e44kuvhL6oyCxKo2qaPzn38hUwG1esfprrSCX8ExsZMcXer/dT2z+LFG0pq6G1mPyS
         RbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=ovGXRrvEOSipJ1nHdSlH0YAJlMFlOhUtRchMNsNFzLg=;
        b=j0wnqJ/Qx6994g/Ls75LRJDSHHfFxVVClpEpyql4UR8eqKiLftw618dUgQTEwkO/O/
         vQyr7N33sk340gmoPHXQNj8b0JK5XgM/MJJm+04tWJRTWjirJiKWWKi4o671C27sVfrm
         jGoPRN2IhBXXFVtRjbvzafHR66NqufSsStcm/otBGVn3KZOpvjXRe3EPyvE2C9ya2+oA
         6h4fx2eZ73n0DJIwfbCAlAM0usGNc+w2HxHQUAa6ZP45i6azwfm/7ZAsZ9Cumr3Am6o6
         m+6niwE9wbiDZgPKfs/u9ot+H1dptKzgx6wiIZDS+GAwfkGMnHlI4H54DhQuVmioGIj+
         154Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BORgHO+3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id u5si99207lfm.0.2020.01.23.04.02.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jan 2020 04:02:39 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 483LW23BZfzy6m;
	Thu, 23 Jan 2020 13:02:38 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 23 Jan
 2020 13:02:38 +0100
Subject: Re: Difference in execution duration between root cell and inmate for
 same code
To: Michael Hinton <michael.g.hinton@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <1c6fd98d-5f05-eb49-5780-273387eae195@oth-regensburg.de>
Date: Thu, 23 Jan 2020 13:02:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BORgHO+3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Michael,

On 23/01/2020 08:57, Michael Hinton wrote:
> Ralf, Henning,
>=20
>=20
> Thanks for the quick response, and sorry for the delay.
>=20
>=20
> Here=E2=80=99s my setup: I=E2=80=99ve got a 6-core Intel x86-64 CPU runni=
ng Kubuntu
> 19.10. I have an inmate that is given a single core and runs a
> single-threaded workload. For comparison, I also run the same workload
> in Linux under Jailhouse.

What CPU exactly?

>=20
>=20
> For a SHA3 workload with the same 20 MiB input, the root Linux cell (and
> no inmate running) takes about 2 seconds, while the inmate (and an idle
> root cell) takes about 2.8 seconds. That is a worrisome discrepancy, and
> I need to understand why it=E2=80=99s 0.8 s slower.

What about CPU power features? cpufreq? turbo boost? ...

>=20
>=20
> This is the SHA3 workload:
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/inmates/lib/mgh-sha3.c#L185-L208
>=20
>=20
> This is the Linux wrapper for the SHA3 workload:
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/mgh/workloads/src/sha3-512.c#L166-L168
>=20
>=20
> This is the inmate program calling the SHA3 workload:
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/inmates/demos/x86/mgh-demo.c#L370-L379

SHA3 is only computationally 'expensive', right? So it's neither memory
intensive nor should it trap.

>=20
>=20
> You can see that the inmate and the Linux wrapper both execute the same
> function, sha3_mgh(). It's the same C code.
>=20
>=20
> The other workloads I run are intentionally more memory intensive. They
> see a much worse slowdown. For my CSB workload, the root cell takes only
> 0.05 s for a 20 MiB input, while the inmate takes 1.48 s (30x
> difference). And for my Random Access workload, the root cell takes 0.08
> s while the inmate takes 3.29 s for a 20 MiB input (40x difference).

Now this sounds pretty much like what I once had: too little caches for
the inmate.

BTW: For a sound comparison, you would need to take care to have a
comparable initial hardware state: E.g., you need to take care that
workloads in root-cell and non-root inmate are both either uncached or
cached when starting the code.

But that's fine tuning, and won't explain a 40x difference.

>=20
>=20
> Here are the root and inmate cell configs, respectively:
>=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/configs/x86/bazooka-root.c

I recommend to deactivate hyperthreading.

If your inmate just gets one sibling, the other one will still belong to
Linux, which could, in case of utilisation, steals a lot of power. So
either disable HT or assign both siblings to the inmate.

>=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/configs/x86/bazooka-inmate.c
>=20
>=20
> I did do some modifications to Jailhouse with VMX and the preemption
> timer, but any slowdown that I may have inadvertently introduced should
> apply equally to the inmate and root cell.
>=20
>=20
> It=E2=80=99s possible that I am measuring the duration of the inmate
> incorrectly. But the number of vmexits I measure for the inmate and root
> seem to roughly correspond with the duration. I also made sure to avoid

Yeah, I would also expect that: Your code only utilises memory + CPU,
almost no I/O.

> tsc_read_ns() by instead recording the TSC cycles and deriving the
> duration by dividing by 3,700,000,000 (the unchanging TSC frequency of
> my processor). Without this, the time recorded would overflow after
> something like 1.2 seconds.
>=20
>=20
> I'm wondering if something else is causing unexpected delays: using
> IVSHMEM, memory mapping extra memory pages and using it to hold my
> input, printing to a virtual console in addition to a serial console,
> disabling hardware p-states, turbo boost in the root cell, maybe the
> workload code is being compiled to different instructions for the inmate
> vs. Linux, etc.

The latter one: You definitely need to check that. If your Linux
compiler generates (e.g.) AVX code and your inmate.

You could also try to link the same library object to your target
binaries -- the build system is your friend.

>=20
>=20
> Sorry for all the detail, but I am grasping at straws at this point. Any
> ideas at what I could look into are appreciated.=20

Benchmarking is fun. Especially getting the hardware under control. :-)

  Ralf

>=20
>=20
> Thanks,
>=20
> Michael
>=20
> On Monday, January 20, 2020 at 6:46:32 AM UTC-7, Henning Schild wrote:
>=20
>     On Sun, 19 Jan 2020 23:45:46 -0800
>     Michael Hinton <michael...@gmail.com <javascript:>> wrote:
>=20
>     > Hello,
>     >
>     > I have found that running code in an inmate is a lot slower than
>     > running that same code in the root cell on my x86 machine. I am not
>     > sure why.
>=20
>     Can you elaborate on "code" and "a lot"? Maybe roughly tell us what
>     your testcase does and how severe your slowdown is. Synthetic
>     microbenchmark to measure context switching ?
>=20
>     As Ralf already said, anything causing "exits" can be subject to
>     slowdown. But that should be roughly the same for the root cell or an=
y
>     non-root cell, is it truly the "same" code?
>=20
>     And of cause anything accessing shared resources can be slowed down b=
y
>     the sharing. Caches/buses ... but i would not expect "a lot".
>=20
>     regards,
>     Henning
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/b258dc63-26a9-4eff-852a-2=
3d72d2e3258%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/b258dc63-26a9-4eff-852a-=
23d72d2e3258%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1c6fd98d-5f05-eb49-5780-273387eae195%40oth-regensburg.de.
