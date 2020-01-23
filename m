Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJE7U3YQKGQEP53ZGXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B091467CF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jan 2020 13:20:53 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id v10sf406498lfa.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jan 2020 04:20:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579782053; cv=pass;
        d=google.com; s=arc-20160816;
        b=HTdIBlQT9GpCPHccTJPWRmXl7UXKa6r2LfcfYY7lNg84aC3cXGqYGc9kNAYa71Dvu/
         34tl+mEbUIwC64p9moBBMB6pJ1xlqflxK0b0OVsP7DzyEWKbqt0IpT6VWp+Stnjd2N1q
         ru5HH2i7S6yrJ+Io0+xDnLT+ADk1rMB6Bo4zLxRoWpGIrDPbjL0XapfbCm5E/CHvPfro
         CBiBVjvFGxvWmRa0qe1QQfuknAXrRnyHQ2ayZ9VynyCLJf/ls6od0LW8YMJyWdI3Rxz5
         j0wJ8HtyMSvz0tO1+H91v/Qn8h/Vgl1GYQF/CQ7MopD+JUQr0xA/mayH5iuBzpmlozl6
         l7eQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=GxeX15o+OsgCbAlGiyYx1lh7N/qbeYOjnnt8xB2EIy8=;
        b=jJ3zSZYVOVMuselfFu3/EvOZdyUJ05ZWi06ggPB+Yoh4SqBYKx+fkt9XhmyuvM5Wna
         BnwOMKBo2RbDbhEbwOgMbdnQg6RBS29rxXN19exG12DtnB7ySnI0bHqAye/ATPz2m5wb
         2TkOoQlccrp0UoBboEASSAfqLvNdvC32dcWpIx2jCcX6kqqHtOlrrc6KppGbRxGjPihi
         Pes+x2MdIMpyNaiUUe+kI325RRGwRirXJ9MfWKw1NfmtXp5oyCpJq0q6O8ApUSkGDoOh
         PbwAbqvaix2wFGveNnXJshj/zwoe40ZW/nlu0Dycnzj/jdGsIN3A9SAmJF3tfOHLcnPQ
         KLug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BAoRmrLR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GxeX15o+OsgCbAlGiyYx1lh7N/qbeYOjnnt8xB2EIy8=;
        b=k8/KlDeJRE4ZBrw5SlzKwxkuQo4eZ0ojeE3dwBBtkj3ctxULanZEYjhBaVj28HwT4A
         jvphi9yd4KrZ9DZjw+3Gzzu2JZDTLdFC/0rAE0r9tXv1uiM/KkuQvg8b7j1Nkpf2KF4C
         wGU48uspeuyMNYUQy4ip+XA4B9FEyuNum/wmi06CMT7vQ7oEpxpHflF3Z4wlj47HieVr
         IFvGkGysUG/pxj/dW+sSCSx+EPEuJLzz9u7sk5ah8vhd7ey0w8kn9Uao2v1U99ZUROis
         pOnkr+NewvGqlCad4hNMf65lXxihKfbhaBYrIVQMcRoAMowWJVxUFuzK0arVUV38C/Iw
         6/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GxeX15o+OsgCbAlGiyYx1lh7N/qbeYOjnnt8xB2EIy8=;
        b=TEjpH3V9GU7/lJb5Mir8CmJ+haEEI6R+6TGBoPLd0buos9NF9VOU9HYRKCAkWLLCjB
         6fTjTk9ZHquTM8YPMM252lRIqScnOuDBqnmbGCtEKyJJ8VDO8pcxCYcU+lPa273m8dqf
         EQycoqgcFwSrONprc4m/Wq9FjZlwfTDKuQ7kMogYSGY/Yt9uI8K8xLoU+TdkG6wppPcX
         qRH6Wu6gAjbck9WMdqwnQcHLvvR48+tcxVsAdqnM9OV7lfmWrMBNE56EbmiSeV1IjMJg
         862Oxnyxqelco2CsLaAAoMREzChh4Z9cPNRpjWZlY+hzzpOBcEy6ACFmsb3LO7Ar5Nu3
         jh9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVS6cVx0u2lvhdUfPbwqPCVY+GH8HNy3qLH9c36GBFCiqANsfQq
	m2R/5ES2sRlXWSEC7xvmizc=
X-Google-Smtp-Source: APXvYqxzMpbG8pFSHONDX97KC/nbKC1r2nmTXLOGIDnsNVehD6DZaG9YaUs5ZdyM4V7z8y1tboAacw==
X-Received: by 2002:a19:c014:: with SMTP id q20mr4678081lff.209.1579782053022;
        Thu, 23 Jan 2020 04:20:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c507:: with SMTP id w7ls4422577lfe.1.gmail; Thu, 23 Jan
 2020 04:20:52 -0800 (PST)
X-Received: by 2002:a19:888:: with SMTP id 130mr4678996lfi.167.1579782052390;
        Thu, 23 Jan 2020 04:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579782052; cv=none;
        d=google.com; s=arc-20160816;
        b=ify6zx+osyh66tPJURaCCzWXYI2mvPa/H56Y9VJRK8RRV6T9jKCcMuY3iqUlKB630J
         2PaSe1DQ+Vh8ghFi41Z5uQEApUMneqAHLb4+JLNceAeKrZF6QWZUmFL+kcD+s3qxiPw8
         Yt0quJqJeoxtTllnVqsY+EnnRtaxtus/1aWJw57mOSHIaf9TtetUra9VzZyw7ylT8hom
         iVq7IZKz1+3jWZGb4nOvd2+4ApXzpgNM6NFUbYSqPPS5Z9BhJPpDeEz48cEyb92w4EAE
         6oL/+RdDcWRvbkXUIImGiwdfSHG7DujF4xeKI7Gu75uoe6hTwyyrRSg03IvNWfNDCNhB
         SlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=it6qeE8PC6AgK5D4I0g1JWiGWmL7jh5AYLxQlxgW79A=;
        b=Zy2m49CWD+3ND2oJf5dMDvjj28J5BXPz3eZUd/KByITe6jMCGN6bAOREMmsSsKREV3
         8na/FUrYenEL9swWv5s8IwEL8lklXTc2VsK6zfB5ywDg3yhrAeC1BJ2vCLohBQECTpOQ
         x68XkRECrli45xN3x7sBMSZLzuqiqNQlTnD4CySHNJr4TS6FHUErlVPhUI1wykUQbPrc
         ujzSh71mYL6kJfMC7I1kfCkAQeVxYyQyf6cbEQL/ebTzseHcWZiSSXsZaYlsqWyMZHqw
         6i5XEzFCcPAxZ3V0zRDefkmo9iMB4LAvezafA7s8TShkblO8kB6K3e+/hVVp1jK2H+U/
         uB8g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BAoRmrLR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id o193si73989lff.4.2020.01.23.04.20.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jan 2020 04:20:52 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 483Lw3431rzy1q;
	Thu, 23 Jan 2020 13:20:51 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 23 Jan
 2020 13:20:51 +0100
Subject: Re: Difference in execution duration between root cell and inmate for
 same code
To: Henning Schild <henning.schild@siemens.com>, Michael Hinton
	<michael.g.hinton@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
 <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
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
Message-ID: <701bb65f-a45a-8f01-1cdd-55682c8fa626@oth-regensburg.de>
Date: Thu, 23 Jan 2020 13:20:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BAoRmrLR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 23/01/2020 13:15, Henning Schild wrote:
> Thanks,
>=20
> that is a lot of information. I would say that is CPU and memory bound
> work. It should not cause exits at all, maybe a few for getting the
> input in and the output out. reading ivshmem should not trap, writing
> output to a console should be avoided within the measured time.
> If you need to use something that traps, see if you can "batch" things.
> I.e. do not read/write in byte-chunks.
>=20
> For truly memory bound applications the mapping of the memory matters.
> The bigger the pages in the pagetable (and the nested pagetable) the
> better. You might be able to read performance counters and look at TLB
> misses.

Good point. But I guess that can't explain 40x slowdown.

> Not sure what Jailhouse exactly does to mitigate Spectre etc. but these
> mitigations often have a severe effect on "memory performance".

On x86: Nothing that would affect inmates in their execution.

  Ralf

>=20
> I would for sure have a look at aligning the CFLAGS used for the Linux
> application and the inmate.
>=20
> The first things to compare is "native Linux", "root cell Linux under
> jailhouse" and "non-root cell Linux under jailhouse". If the third is
> better than your inmate, your inmates environment is likely the cause.
>=20
> Henning
>=20
> On Wed, 22 Jan 2020 23:57:29 -0800
> Michael Hinton <michael.g.hinton@gmail.com> wrote:
>=20
>> Ralf, Henning,
>>
>>
>> Thanks for the quick response, and sorry for the delay.
>>
>> Here=E2=80=99s my setup: I=E2=80=99ve got a 6-core Intel x86-64 CPU runn=
ing Kubuntu
>> 19.10. I have an inmate that is given a single core and runs a
>> single-threaded workload. For comparison, I also run the same
>> workload in Linux under Jailhouse.
>>
>> For a SHA3 workload with the same 20 MiB input, the root Linux cell
>> (and no inmate running) takes about 2 seconds, while the inmate (and
>> an idle root cell) takes about 2.8 seconds. That is a worrisome
>> discrepancy, and I need to understand why it=E2=80=99s 0.8 s slower.
>>
>> This is the SHA3 workload:=20
>> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8a=
c79f4a1cde/inmates/lib/mgh-sha3.c#L185-L208
>>
>> This is the Linux wrapper for the SHA3 workload:=20
>> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8a=
c79f4a1cde/mgh/workloads/src/sha3-512.c#L166-L168
>>
>> This is the inmate program calling the SHA3 workload:=20
>> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8a=
c79f4a1cde/inmates/demos/x86/mgh-demo.c#L370-L379
>>
>> You can see that the inmate and the Linux wrapper both execute the
>> same function, sha3_mgh(). It's the same C code.
>>
>> The other workloads I run are intentionally more memory intensive.
>> They see a much worse slowdown. For my CSB workload, the root cell
>> takes only 0.05 s for a 20 MiB input, while the inmate takes 1.48 s
>> (30x difference). And for my Random Access workload, the root cell
>> takes 0.08 s while the inmate takes 3.29 s for a 20 MiB input (40x
>> difference).
>>
>> Here are the root and inmate cell configs, respectively:
>>
>> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8a=
c79f4a1cde/configs/x86/bazooka-root.c
>>
>> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8a=
c79f4a1cde/configs/x86/bazooka-inmate.c
>>
>> I did do some modifications to Jailhouse with VMX and the preemption
>> timer, but any slowdown that I may have inadvertently introduced
>> should apply equally to the inmate and root cell.
>>
>> It=E2=80=99s possible that I am measuring the duration of the inmate
>> incorrectly. But the number of vmexits I measure for the inmate and
>> root seem to roughly correspond with the duration. I also made sure
>> to avoid tsc_read_ns() by instead recording the TSC cycles and
>> deriving the duration by dividing by 3,700,000,000 (the unchanging
>> TSC frequency of my processor). Without this, the time recorded would
>> overflow after something like 1.2 seconds.
>>
>>
>> I'm wondering if something else is causing unexpected delays: using=20
>> IVSHMEM, memory mapping extra memory pages and using it to hold my
>> input, printing to a virtual console in addition to a serial console,
>> disabling hardware p-states, turbo boost in the root cell, maybe the
>> workload code is being compiled to different instructions for the
>> inmate vs. Linux, etc.
>>
>> Sorry for all the detail, but I am grasping at straws at this point.
>> Any ideas at what I could look into are appreciated.=20
>>
>> Thanks,
>> Michael
>>
>> On Monday, January 20, 2020 at 6:46:32 AM UTC-7, Henning Schild wrote:
>>>
>>> On Sun, 19 Jan 2020 23:45:46 -0800=20
>>> Michael Hinton <michael...@gmail.com <javascript:>> wrote:=20
>>> =20
>>>> Hello,=20
>>>>
>>>> I have found that running code in an inmate is a lot slower than=20
>>>> running that same code in the root cell on my x86 machine. I am
>>>> not sure why.  =20
>>>
>>> Can you elaborate on "code" and "a lot"? Maybe roughly tell us what=20
>>> your testcase does and how severe your slowdown is. Synthetic=20
>>> microbenchmark to measure context switching ?=20
>>>
>>> As Ralf already said, anything causing "exits" can be subject to=20
>>> slowdown. But that should be roughly the same for the root cell or
>>> any non-root cell, is it truly the "same" code?=20
>>>
>>> And of cause anything accessing shared resources can be slowed down
>>> by the sharing. Caches/buses ... but i would not expect "a lot".=20
>>>
>>> regards,=20
>>> Henning=20
>>> =20
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/701bb65f-a45a-8f01-1cdd-55682c8fa626%40oth-regensburg.de.
