Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBYE767YAKGQEO3L6CEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id DCED613AC4F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 15:27:44 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id t4sf3616662wmf.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 06:27:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579012064; cv=pass;
        d=google.com; s=arc-20160816;
        b=ygq0gpWCt9TcEE0nH3yA+DhN0RGX34pwWFDu1WrgQQozA6sMMXH/e9i4nOkVva6gAB
         SzsyZOiNHsKwVxCXr8sFH01wvOW/RiR4gDkoF1+hl7h8dnjn67WGbIOlvRGXLSHo2oEu
         C1pPynIf75bvCrxEZpBucSe6YYlk6TolEOr+2HpdsMQpDCRIE6x8JZmCdVuvi6eY/PaC
         eikBtb09xWPiUorU90ohLOQ3myX2+X9GLT7Rg7d+4C/dEHY4XtTA7MxBj7dVGV0R7d59
         B+u0pBWqtVHmVXS8ktkGcINMMx5yrmwcGr+boTFsQFjrqD++unRVHOSgkY1Fvfihyb5D
         BIGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=5dhlmHnnDQ+DCkM/79OMXVhZxplLOqNwId59vf6+tH8=;
        b=WGLYCFUgkgAbxJkKi3OLa7jez6/nmKguLcA1LRUinqsFQFA5nSCZQfJOvnkYXjoDdU
         pdkdPb9QfCSMuenH+640pBuzJs3I+TdcRvue0TRWq378BYgv/sthQ0PXpF3SMR9Q7zQC
         Q1d5ltzaXEbfhgGJXYTAHhzD1jz/SU84QZSEfHph7qKV9J5yzVmcxIdLo0YEDs33stD5
         WRldlt0qR159UGKTVXTZUHuOXQKPy3UscGfV8Cjh+eg7fng/oFVqOJuTCjO2NmHr1Qvv
         lx8MX1P1RQ5emdM0m36QZnY1oh2X2R8+8C+4DAVaPgUHy7sB7ksWAj/JX8PMzxnPK6/y
         CpPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=DJwHoLG0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5dhlmHnnDQ+DCkM/79OMXVhZxplLOqNwId59vf6+tH8=;
        b=bBwRF/ZwAp9KlsyOVkZKRE+JC9eQplS0b/9ebBPh3akBuIjzOuNz2Kw3kXMWoGmnZi
         Yndk7xFe7NWhmQLlayj1q1ALSpHCOKI2HPJEKh1xlRav7cbvMQ/c3E1BFGcVUUc0CpHn
         zab8IqltygbDZlL3YWKwAtZuxY3nBc90PVr45GLoOAwsDRu+hwdiZvuag+56U2edamqE
         J+fY9SlB6SSIOM7e1EoCa7E4m6MYY/7nFIzu6xo51jEN7PLSScwLh2RgCLH5vZrQ+Xr/
         j+aPKD7JhDLQGKZzWLMacD/pt4q1QHXN0F48cXt2e30O6KTqts4xc9j7iss9A1ikIDJF
         N1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5dhlmHnnDQ+DCkM/79OMXVhZxplLOqNwId59vf6+tH8=;
        b=gCWklIQ49bYmCgtwpIMzKK6HCddTeQtmY/e5vtKVPib7FcPKpY9Nj7Cg5gfP9/Pgik
         RX64/gKYH+v0s1YzkZNuBJTsCoLqJMjjf9MDY8nRR0YaHPTLJfYhuNXJwy1gVKrQveWX
         if866EU8v5qoIFPoX/CLTorOZ9dKsGpTZzZBv/qUfMak7HVCxXHvA81Zkj5XGcWk8+EU
         VnX03N6mJOGHKWYgV/qo5BvtYP5XZqigDZsgN6o3ZjKQuGkvnzLVeiotUGbkSsbItcN7
         CvHSWzry9WpOTn61pbaKswg9vPyqX5f2ATL/R2kgXe+r2KMY7QYTrlUBjtontbPmLkpA
         uE9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXgZDfhVDIxk2OjGepJkmDfgRKZVFzYzwa+cSH1jut9irMTG3bU
	JpjmRPn6TV4wAbjbQaYdQJw=
X-Google-Smtp-Source: APXvYqx77FLe4USFcOh7ZZB2tV7Sf2afsku19hGiU0hK+OiBVxRBnaBnreUHaH3XJGNQo54PrQGqBA==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr25230160wrt.343.1579012064176;
        Tue, 14 Jan 2020 06:27:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fc89:: with SMTP id g9ls5680492wrr.5.gmail; Tue, 14 Jan
 2020 06:27:43 -0800 (PST)
X-Received: by 2002:adf:f847:: with SMTP id d7mr26101079wrq.35.1579012063375;
        Tue, 14 Jan 2020 06:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579012063; cv=none;
        d=google.com; s=arc-20160816;
        b=X4IKXHYIGE40h7kkGYV7nfJqD7VmoADqFH+XOraYNEnHCm0Fp57LV1mlwlvrInIi1i
         vaE7qEADbOzFo1F2mqYbYVjCjD8gvncJUtB5lAsw1HXeyFFTtmuAsOwv7PIPjV4EarpR
         bDuUceJDwBDv/8SeGcpP1oTHHD0VlVc/8yqWXu4voKrqMLYGwFmBXDctYkaldIWyiMKf
         PiZbXSRFU7FAaNHAsEc6e0fhWVY2TwaDU5jfhvMHJmE/yarPU0SQti5sywPRlKTNAwCc
         bwet5wIVn9CvEJlS8HBZyrQOHdmSUyj3I8bRO2yEX7Lsw7BJAVwFcczZyhjTMdg5gyJB
         WlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=JDuJ4Lg8+c6VaoDUDYnjzidHapBXQ8fPsB55eLbf15s=;
        b=AWJ1B9W1Rf2qkwb6/3YWLZtshiTsELnGfRtxPz8BOXDmZ6fXVsyyjOBxedNyOejM3w
         Yl4YLNSC/8xYHhsOA0u8GZdDKkmqTW1nMqvF3eh7Z1/xKcZ1rZWnkSdL795gqGw3A4Il
         Q8M3wYqBFKOVpQaT8DFb9WLQ9hM2pgJl9fGUW5eCQQvfW4pcbjFAuJl4opwplPzh4ul7
         GfNX16cp1KcB0GkJA3s4m4z6j+hhKgZpxLfPPZWlYyjdZFvSPEoQ3K5f/udR4LnzkLM9
         hPy+81xJPa38xoH/fsFLyDd7JVaADALxV8R+tfA5ZIDK36ZTWuZU+7O/7iv93cQvLbT7
         gj9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=DJwHoLG0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id x5si153732wmk.1.2020.01.14.06.27.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 06:27:43 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 47xt8b0SZGzxyr;
	Tue, 14 Jan 2020 15:27:43 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 14 Jan
 2020 15:27:42 +0100
Subject: Re: [PATCH 24/38] configs: Move ivshmem memory regions at array start
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
 <c7c9cc901548895d2ecb25387a4e3ebb764160af.1578313099.git.jan.kiszka@siemens.com>
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
Message-ID: <4cbf0eed-5e02-37ee-a8f9-073ec22d05e7@oth-regensburg.de>
Date: Tue, 14 Jan 2020 15:27:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <c7c9cc901548895d2ecb25387a4e3ebb764160af.1578313099.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=DJwHoLG0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 1/6/20 1:18 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Simplifies index calculation and reduces risk of errors. The only
> downside is that regions are no longer ordered according to their
> physical addresses.

We have 64 bit for flags. Instead of moving those memory regions to the
top, we could also use .flags as unique tags. We wouldn't have to care
any longer about there exact place inside the config.

I think of something like

/* IVSHMEM shared memory region */
JAILHOUSE_SHMEM_NET_REGIONS(0xc0fe, 0x7bf00000, 0),

[...]

.shmem_tag = 0xc0fe,

[...]

What do you think?

  Ralf

> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  configs/arm/bananapi-linux-demo.c             |  6 +++---
>  configs/arm/bananapi.c                        |  6 +++---
>  configs/arm/emtrion-rzg1e-linux-demo.c        |  6 +++---
>  configs/arm/emtrion-rzg1e.c                   |  6 +++---
>  configs/arm/emtrion-rzg1h-linux-demo.c        |  6 +++---
>  configs/arm/emtrion-rzg1h.c                   |  6 +++---
>  configs/arm/emtrion-rzg1m-linux-demo.c        |  6 +++---
>  configs/arm/emtrion-rzg1m.c                   |  6 +++---
>  configs/arm/jetson-tk1-linux-demo.c           |  6 +++---
>  configs/arm/jetson-tk1.c                      |  6 +++---
>  configs/arm/orangepi0-linux-demo.c            |  6 +++---
>  configs/arm/orangepi0.c                       |  6 +++---
>  configs/arm64/amd-seattle-linux-demo.c        |  6 +++---
>  configs/arm64/amd-seattle.c                   |  6 +++---
>  configs/arm64/espressobin-linux-demo.c        |  6 +++---
>  configs/arm64/espressobin.c                   |  6 +++---
>  configs/arm64/hikey-linux-demo.c              |  6 +++---
>  configs/arm64/hikey.c                         |  6 +++---
>  configs/arm64/jetson-tx1-linux-demo.c         |  6 +++---
>  configs/arm64/jetson-tx1.c                    |  7 +++----
>  configs/arm64/k3-am654-idk-linux-demo.c       |  6 +++---
>  configs/arm64/k3-am654-idk.c                  |  6 +++---
>  configs/arm64/macchiatobin-linux-demo.c       |  6 +++---
>  configs/arm64/macchiatobin.c                  |  6 +++---
>  configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  6 +++---
>  configs/arm64/miriac-sbc-ls1046a.c            |  6 +++---
>  configs/arm64/qemu-arm64-linux-demo.c         |  6 +++---
>  configs/arm64/qemu-arm64.c                    |  6 +++---
>  configs/arm64/ultra96-linux-demo.c            |  6 +++---
>  configs/arm64/ultra96.c                       |  6 +++---
>  configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 12 ++++++------
>  configs/arm64/zynqmp-zcu102-linux-demo.c      | 12 ++++++------
>  configs/arm64/zynqmp-zcu102.c                 | 12 ++++++------
>  configs/x86/ivshmem-demo.c                    | 18 +++++++++---------
>  configs/x86/linux-x86-demo.c                  |  6 +++---
>  configs/x86/qemu-x86.c                        | 22 +++++++++++-----------
>  36 files changed, 131 insertions(+), 132 deletions(-)
> 
> diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
> index 474ad6d1..a6714736 100644
> --- a/configs/arm/bananapi-linux-demo.c
> +++ b/configs/arm/bananapi-linux-demo.c
> @@ -52,6 +52,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* CCU (HACK) */ {
>  			.phys_start = 0x01c2006c,
>  			.virt_start = 0x01c2006c,
> @@ -81,8 +83,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -106,7 +106,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 4,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
> index 7f7393ff..3dd3a2a3 100644
> --- a/configs/arm/bananapi.c
> +++ b/configs/arm/bananapi.c
> @@ -70,6 +70,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  		/* SPI */ {
>  			.phys_start = 0x01c05000,
>  			.virt_start = 0x01c05000,
> @@ -182,8 +184,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -201,7 +201,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 16,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
> index 4dbaecff..5b24db92 100644
> --- a/configs/arm/emtrion-rzg1e-linux-demo.c
> +++ b/configs/arm/emtrion-rzg1e-linux-demo.c
> @@ -51,6 +51,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* RST, MODEMR */ {
>  			.phys_start = 0xe6160060,
>  			.virt_start = 0xe6160060,
> @@ -116,8 +118,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -155,7 +155,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 4,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
> index 744e7aeb..528b2f45 100644
> --- a/configs/arm/emtrion-rzg1e.c
> +++ b/configs/arm/emtrion-rzg1e.c
> @@ -70,6 +70,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  		/* CPG */ {
>  			.phys_start = 0xe6150000,
>  			.virt_start = 0xe6150000,
> @@ -196,8 +198,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -229,7 +229,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 16,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
> index b8b1c869..c971bcc0 100644
> --- a/configs/arm/emtrion-rzg1h-linux-demo.c
> +++ b/configs/arm/emtrion-rzg1h-linux-demo.c
> @@ -51,6 +51,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* RST, MODEMR */ {
>  			.phys_start = 0xe6160060,
>  			.virt_start = 0xe6160060,
> @@ -130,8 +132,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -169,7 +169,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 4,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
> index 95c21d67..c2b3e16a 100644
> --- a/configs/arm/emtrion-rzg1h.c
> +++ b/configs/arm/emtrion-rzg1h.c
> @@ -70,6 +70,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  		/* SYS-DMAC */ {
>  			.phys_start = 0xe6700000,
>  			.virt_start = 0xe6700000,
> @@ -322,8 +324,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -355,7 +355,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 16,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
> index 5e166fa5..1dc57b4c 100644
> --- a/configs/arm/emtrion-rzg1m-linux-demo.c
> +++ b/configs/arm/emtrion-rzg1m-linux-demo.c
> @@ -51,6 +51,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* RST, MODEMR */ {
>  			.phys_start = 0xe6160060,
>  			.virt_start = 0xe6160060,
> @@ -130,8 +132,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -169,7 +169,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 4,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
> index 41bccba9..21d05116 100644
> --- a/configs/arm/emtrion-rzg1m.c
> +++ b/configs/arm/emtrion-rzg1m.c
> @@ -70,6 +70,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  		/* Thermal Sensor */ {
>  			.phys_start = 0xe61f0000,
>  			.virt_start = 0xe61f0000,
> @@ -231,8 +233,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -264,7 +264,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 16,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
> index 1fe3636a..2e0a898c 100644
> --- a/configs/arm/jetson-tk1-linux-demo.c
> +++ b/configs/arm/jetson-tk1-linux-demo.c
> @@ -53,6 +53,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xfbf00000, 1),
>  		/* UART */ {
>  			.phys_start = 0x70006000,
>  			.virt_start = 0x70006000,
> @@ -77,8 +79,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0xfbf00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -109,7 +109,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
> index 187e82a2..18a36449 100644
> --- a/configs/arm/jetson-tk1.c
> +++ b/configs/arm/jetson-tk1.c
> @@ -74,6 +74,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xfbf00000, 0),
>  		/* PCIe */ {
>  			.phys_start = 0x01000000,
>  			.virt_start = 0x01000000,
> @@ -226,8 +228,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0xfbf00000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -253,7 +253,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 21,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
> index 7d3022a3..1b0a27f6 100644
> --- a/configs/arm/orangepi0-linux-demo.c
> +++ b/configs/arm/orangepi0-linux-demo.c
> @@ -50,6 +50,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 1),
>  		/* UART 0-3 */ {
>  			.phys_start = 0x01c28000,
>  			.virt_start = 0x01c28000,
> @@ -72,8 +74,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -97,7 +97,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
> index 5e654a01..441f211c 100644
> --- a/configs/arm/orangepi0.c
> +++ b/configs/arm/orangepi0.c
> @@ -67,6 +67,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 0),
>  		/* MMIO 1 (permissive) */ {
>  			.phys_start = 0x01c00000,
>  			.virt_start = 0x01c00000,
> @@ -123,8 +125,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -142,7 +142,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 8,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
> index df44b76e..b6c6b2e0 100644
> --- a/configs/arm64/amd-seattle-linux-demo.c
> +++ b/configs/arm64/amd-seattle-linux-demo.c
> @@ -47,6 +47,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x83e4000000, 1),
>  		/* UART */ {
>  			.phys_start = 0xe1010000,
>  			.virt_start = 0xe1010000,
> @@ -91,8 +93,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x83e4000000, 1),
>  		/* v2m */ {
>  			.phys_start = 0xe1180000,
>  			.virt_start = 0xe1180000,
> @@ -138,7 +138,7 @@ struct {
>  			.bdf = 0x0078,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>  			.num_msix_vectors = 1,
> -			.shmem_region = 6,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
> index dd22b324..37cbb91a 100644
> --- a/configs/arm64/amd-seattle.c
> +++ b/configs/arm64/amd-seattle.c
> @@ -64,6 +64,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x83e4000000, 0),
>  		/* gpio */ {
>  			.phys_start = 0xe0030000,
>  			.virt_start = 0xe0030000,
> @@ -176,8 +178,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x83e4000000, 0),
>  	},
>  	.irqchips = {
>  		/* GIC */ {
> @@ -216,7 +216,7 @@ struct {
>  			.bdf = 0x0078,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>  			.num_msix_vectors = 1,
> -			.shmem_region = 16,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
> index 87d0db41..dc12d2b3 100644
> --- a/configs/arm64/espressobin-linux-demo.c
> +++ b/configs/arm64/espressobin-linux-demo.c
> @@ -49,6 +49,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
>  		/* UART */ {
>  			.phys_start = 0xd0012000,
>  			.virt_start = 0xd0012000,
> @@ -71,8 +73,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -99,7 +99,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
> index e606beae..c9e62077 100644
> --- a/configs/arm64/espressobin.c
> +++ b/configs/arm64/espressobin.c
> @@ -68,6 +68,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
>  		/* MMIO (permissive) */ {
>  			.phys_start = 0xd0000000,
>  			.virt_start = 0xd0000000,
> @@ -89,8 +91,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region for 00:00.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -109,7 +109,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
> index 384f8be8..d6cc9f2d 100644
> --- a/configs/arm64/hikey-linux-demo.c
> +++ b/configs/arm64/hikey-linux-demo.c
> @@ -49,6 +49,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* UART 3 */ {
>  			.phys_start = 0xf7113000,
>  			.virt_start = 0xf7113000,
> @@ -71,8 +73,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -96,7 +96,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
> index 2e0ddc64..057dcd05 100644
> --- a/configs/arm64/hikey.c
> +++ b/configs/arm64/hikey.c
> @@ -67,6 +67,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  		/* MMIO (permissive) */ {
>  			.phys_start = 0xf4100000,
>  			.virt_start = 0xf4100000,
> @@ -95,8 +97,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -115,7 +115,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 4,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
> index aeed067a..b0518c4d 100644
> --- a/configs/arm64/jetson-tx1-linux-demo.c
> +++ b/configs/arm64/jetson-tx1-linux-demo.c
> @@ -58,6 +58,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x17bf00000, 1),
>  		/* UART */ {
>  			.phys_start = 0x70006000,
>  			.virt_start = 0x70006000,
> @@ -81,8 +83,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x17bf00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -113,7 +113,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
> index a525d2b8..60a8906d 100644
> --- a/configs/arm64/jetson-tx1.c
> +++ b/configs/arm64/jetson-tx1.c
> @@ -72,7 +72,8 @@ struct {
>  
>  
>  	.mem_regions = {
> -
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x17bf00000, 0),
>  		/* APE 1 */ {
>  			.phys_start = 0x00000000,
>  			.virt_start = 0x00000000,
> @@ -367,8 +368,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x17bf00000, 0),
>  	},
>  	.irqchips = {
>  		/* GIC */ {
> @@ -393,7 +392,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 42,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
> index 0c39dd29..d546add6 100644
> --- a/configs/arm64/k3-am654-idk-linux-demo.c
> +++ b/configs/arm64/k3-am654-idk-linux-demo.c
> @@ -54,6 +54,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 1),
>  		/* RAM load */ {
>  			.phys_start = 0x8FFFF0000,
>  			.virt_start = 0x0,
> @@ -70,8 +72,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region for 00:00.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 1),
>  		/* MCU UART0 */ {
>  			.phys_start = 0x40a00000,
>  			.virt_start = 0x40a00000,
> @@ -137,7 +137,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 2,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
> index 750657e8..4dea206a 100644
> --- a/configs/arm64/k3-am654-idk.c
> +++ b/configs/arm64/k3-am654-idk.c
> @@ -65,6 +65,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 0),
>  		/* RAM */ {
>  			.phys_start = 0x80000000,
>  			.virt_start = 0x80000000,
> @@ -79,8 +81,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region for 00:00.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 0),
>  		/* RAM. Reserved for inmates */ {
>  			.phys_start = 0x8E0000000,
>  			.virt_start = 0x8E0000000,
> @@ -211,7 +211,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 0x00,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 2,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
> index 629da548..9da732d9 100644
> --- a/configs/arm64/macchiatobin-linux-demo.c
> +++ b/configs/arm64/macchiatobin-linux-demo.c
> @@ -50,6 +50,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 1),
>  		/* UART */ {
>  			.phys_start = 0xf0512000,
>  			.virt_start = 0xf0512000,
> @@ -79,8 +81,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -107,7 +107,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 4,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
> index 12df0a7a..893b116d 100644
> --- a/configs/arm64/macchiatobin.c
> +++ b/configs/arm64/macchiatobin.c
> @@ -70,6 +70,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 0),
>  		/* MMIO (permissive) */ {
>  			.phys_start = 0xf0300000,
>  			.virt_start = 0xf0300000,
> @@ -98,8 +100,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region for 00:00.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -118,7 +118,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 4,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
> index cd60959c..71981611 100644
> --- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
> +++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
> @@ -51,6 +51,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 1),
>  		/* DUART1 */
>          	{
>  			.phys_start = 0x21c0000,
> @@ -82,8 +84,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_COMM_REGION,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 1),
>  	},
>  
>  	.irqchips = {
> @@ -119,7 +119,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 4,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
> index ce67cba1..1e3aa9c4 100644
> --- a/configs/arm64/miriac-sbc-ls1046a.c
> +++ b/configs/arm64/miriac-sbc-ls1046a.c
> @@ -72,6 +72,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 0),
>  		/* DDR memory controller */ {
>  			.phys_start = 0x01080000,
>  			.virt_start = 0x01080000,
> @@ -427,8 +429,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> -		/* IVSHMEM shared memory region for 00:00.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -454,7 +454,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = ARRAY_SIZE(config.mem_regions) - 1,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
> index 00cf6b99..e0c95039 100644
> --- a/configs/arm64/qemu-arm64-linux-demo.c
> +++ b/configs/arm64/qemu-arm64-linux-demo.c
> @@ -50,6 +50,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
>  		/* UART */ {
>  			.phys_start = 0x09000000,
>  			.virt_start = 0x09000000,
> @@ -72,8 +74,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -100,7 +100,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
> index 015f47d6..4b0826cd 100644
> --- a/configs/arm64/qemu-arm64.c
> +++ b/configs/arm64/qemu-arm64.c
> @@ -68,6 +68,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 0),
>  		/* MMIO (permissive) */ {
>  			.phys_start = 0x09000000,
>  			.virt_start = 0x09000000,
> @@ -82,8 +84,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region for 00:00.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 0),
>  		/* "physical" PCI ECAM */ {
>  			.phys_start = 0x4010000000,
>  			.virt_start = 0x4010000000,
> @@ -109,7 +109,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 2,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
> index 78262146..4aea2922 100644
> --- a/configs/arm64/ultra96-linux-demo.c
> +++ b/configs/arm64/ultra96-linux-demo.c
> @@ -49,6 +49,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* UART */ {
>  			.phys_start = 0xff010000,
>  			.virt_start = 0xff010000,
> @@ -71,8 +73,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -99,7 +99,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
> index c62c3a6b..ef49b824 100644
> --- a/configs/arm64/ultra96.c
> +++ b/configs/arm64/ultra96.c
> @@ -67,6 +67,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  		/* MMIO (permissive) */ {
>  			.phys_start = 0xfd000000,
>  			.virt_start = 0xfd000000,
> @@ -81,8 +83,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region for 00:00.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -101,7 +101,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 2,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
> index dfae6404..5248952d 100644
> --- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
> +++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
> @@ -50,6 +50,10 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:01.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 1),
> +		/* IVSHMEM shared memory region for 00:02.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 1),
>  		/* RAM */ {
>  			.phys_start = 0x800610000,
>  			.virt_start = 0,
> @@ -65,10 +69,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region for 00:01.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 1),
> -		/* IVSHMEM shared memory region for 00:02.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 1),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -95,7 +95,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 2,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> @@ -103,7 +103,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 2 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 1,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
> index de11c5c2..f9b804a4 100644
> --- a/configs/arm64/zynqmp-zcu102-linux-demo.c
> +++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
> @@ -49,6 +49,10 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 1),
> +		/* IVSHMEM shared memory region for 00:02.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 0),
>  		/* UART */ {
>  			.phys_start = 0xff010000,
>  			.virt_start = 0xff010000,
> @@ -71,10 +75,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region for 00:00.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 1),
> -		/* IVSHMEM shared memory region for 00:02.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 0),
>  		/* communication region */ {
>  			.virt_start = 0x80000000,
>  			.size = 0x00001000,
> @@ -101,7 +101,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> @@ -109,7 +109,7 @@ struct {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>  			.bdf = 2 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 4,
> +			.shmem_region = 1,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
> index d009b00d..efd81389 100644
> --- a/configs/arm64/zynqmp-zcu102.c
> +++ b/configs/arm64/zynqmp-zcu102.c
> @@ -70,6 +70,10 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region for 0001:00:00.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 0),
> +		/* IVSHMEM shared memory region for 0001:00:01.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 0),
>  		/* MMIO (permissive) */ {
>  			.phys_start = 0xfd000000,
>  			.virt_start = 0xfd000000,
> @@ -91,10 +95,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE,
>  		},
> -		/* IVSHMEM shared memory region for 0001:00:00.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 0),
> -		/* IVSHMEM shared memory region for 0001:00:01.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 0),
>  		/* PCI host bridge */ {
>  			.phys_start = 0x8000000000,
>  			.virt_start = 0x8000000000,
> @@ -120,7 +120,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> @@ -129,7 +129,7 @@ struct {
>  			.domain = 1,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_region = 4,
> +			.shmem_region = 1,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
> index c6c1f4c2..e53965ff 100644
> --- a/configs/x86/ivshmem-demo.c
> +++ b/configs/x86/ivshmem-demo.c
> @@ -50,6 +50,14 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		{
> +			.phys_start = 0x3f0f0000,
> +			.virt_start = 0x3f0f0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
>  		/* RAM */ {
>  			.phys_start = 0x3ee00000,
>  			.virt_start = 0,
> @@ -63,14 +71,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_COMM_REGION,
>  		},
> -		/* IVSHMEM shared memory region */
> -		{
> -			.phys_start = 0x3f0f0000,
> -			.virt_start = 0x3f0f0000,
> -			.size = 0x1000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> -				JAILHOUSE_MEM_ROOTSHARED,
> -		},
>  	},
>  
>  	.pio_regions = {
> @@ -85,7 +85,7 @@ struct {
>  			.bdf = 0x0e << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>  			.num_msix_vectors = 1,
> -			.shmem_region = 2,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  		},
>  	},
> diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
> index 6d076c67..70cfc4ad 100644
> --- a/configs/x86/linux-x86-demo.c
> +++ b/configs/x86/linux-x86-demo.c
> @@ -54,6 +54,8 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
>  		/* low RAM */ {
>  			.phys_start = 0x3a600000,
>  			.virt_start = 0,
> @@ -76,8 +78,6 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* IVSHMEM shared memory region */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
>  #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
>  		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
>  		{
> @@ -141,7 +141,7 @@ struct {
>  			.bdf = 0x0f << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>  			.num_msix_vectors = 1,
> -			.shmem_region = 3,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> index 2dcaa481..4aa789b1 100644
> --- a/configs/x86/qemu-x86.c
> +++ b/configs/x86/qemu-x86.c
> @@ -74,6 +74,15 @@ struct {
>  	},
>  
>  	.mem_regions = {
> +		/* IVSHMEM shared memory region (demo) */
> +		{
> +			.phys_start = 0x3f0f0000,
> +			.virt_start = 0x3f0f0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		/* IVSHMEM shared memory region (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
>  		/* RAM */ {
>  			.phys_start = 0x0,
>  			.virt_start = 0x0,
> @@ -171,15 +180,6 @@ struct {
>  			.size = 0x1000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
> -		/* IVSHMEM shared memory region (demo) */
> -		{
> -			.phys_start = 0x3f0f0000,
> -			.virt_start = 0x3f0f0000,
> -			.size = 0x1000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> -		},
> -		/* IVSHMEM shared memory region (networking) */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
>  	},
>  
>  	.irqchips = {
> @@ -277,7 +277,7 @@ struct {
>  			.bdf = 0x0e << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>  			.num_msix_vectors = 1,
> -			.shmem_region = 14,
> +			.shmem_region = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>  		},
> @@ -287,7 +287,7 @@ struct {
>  			.bdf = 0x0f << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>  			.num_msix_vectors = 1,
> -			.shmem_region = 15,
> +			.shmem_region = 1,
>  			.shmem_dev_id = 0,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4cbf0eed-5e02-37ee-a8f9-073ec22d05e7%40oth-regensburg.de.
