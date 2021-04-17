Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBC6Y5KBQMGQE5OEI47A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E343362EE7
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 11:36:12 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id t14-20020adff04e0000b0290103307c23e1sf5821602wro.8
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 02:36:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618652171; cv=pass;
        d=google.com; s=arc-20160816;
        b=MOqRDTv0UyRKV2tAKhbApYh8lTJ6GWyuRHpxexmIivbxjhZcbyOWVhTe9vTKh3/uRY
         Uov/NadGXGTGbfZ/GsBbiw93NKlfOyio78ehG0yu6j6JIIY8oDAFfPuIgJmvG39iQg0g
         Us2WY73Yh9NAy+IMBARJ+DMiaeAd6+UXUvgWfykdGGo6CTIpE6jzPO8k3CLsIUVOF9lb
         Ae1r6FIt/RhzoNQdboupA4LVrDHLEwMkdrDpMICFWFEecnttu34TJu+t1YOgJlE38wSQ
         7O67P5rQHsAr2puSopkHbkGHK5ItZax4RhdrBTb8TP4x2lyjqxN1mkGlYEM85tzA8+Ci
         H1ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=tBQRWvWb10AuVyRtvKeq1pq1a0+utLi9M/t+5wbfFn0=;
        b=iJfq8Y6gmgExtEaOSG31DDtt3+NGRAfyHYS3ad1N5M6CVJbywzWhCG7PGQr4h2xqLo
         DcRk1vc7Zed3C9Hid9FmUWDcjt/TbKWFzKcrZTo7DcWiW5uTwUZF3g6YO21mS3AkscQW
         kgNESIlzY0UpAVzDaJcNp+CWs8+UtM4oG+IF+wrm80fhCChLoLUjZpvW3C5tXucr2O9w
         ihkM+aB6GWdiCG98Ik7Zrn0l3QQSh3/FNFlyCwJE33Nhx+jol8cxmAYEbUcQzRjlLf/h
         xo2swJMl5z4gbHKIaRGKOI2GaN8TtVltD0LLOcz+khnrpKshSW5AlVM0B82/CnIfhF10
         Ppig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=jzGAVnP5;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tBQRWvWb10AuVyRtvKeq1pq1a0+utLi9M/t+5wbfFn0=;
        b=Sv329rFqANuz/06RNdUTDD8qw9YW+ImJLATFx8iLFCi66UsfpqdDipZ306i1hG7RnY
         bZ71b+uPmOUDTzyanoumvu75oBal7hrGPyN0DYr2bvbspFKT4gTB2d8M/sMDErFcKL9H
         yZzoaCUAqxpY+TfUrFuVWxvNxGJXZe+08/NO79c9XnOuMP++PenrzQlbMz2VZtkwCI8B
         Dl8vHxGCscju39bKDvAqBXswXhP55WSmFEzppQR3sDNTHo2o0m2XIb79UVv9WfO4FmaY
         NCqd5fhguwIvyh6e6KGfU2tz+oUw22YrDz60bbsu0E66SxZkNq0iDaEhYrO7LLNsIsvf
         u7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tBQRWvWb10AuVyRtvKeq1pq1a0+utLi9M/t+5wbfFn0=;
        b=m/TP0nJ20vWvvjYCOA+94M8tFQ9zwcjk8yRWsmMp7AjuWcwVySUDWvtio4BjM8I1Wt
         ei0/L3LM5Z9qtyCK/9cEcKdn6dNwvG5MGKUhsSBftmlqI7SrKj40Yry1g3GCpEW7m6Qr
         yzmNKgi9KP6AOHl21dkryNl9yLeHHNrei1+RD6P6RAP8MUluG/0LwYopYf13CAVgbk2d
         RX7dD15Li5gnQEpzy9mVjIL6E0QH0IZ2arA7FZmCXevc0eLmTcOMFRJFOLz//OS5Mn4V
         RIPzsdh3lmygrN66R9dc9wdihOP9mu5LspmyIJYGFRPEny65KFUJ+c3CVUigkE+bt/zK
         zVOQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ShJN9sRq2tI7r3Ii7qaEvnLs12tLKoVl+L6s3o1nzdgYrG1sA
	r+jBpcXfBF7MWuknSd6rzoM=
X-Google-Smtp-Source: ABdhPJx1xfKI+Ydc7h5qvRqqNS9S3X1bFj1mfsswr0/OEG5RwhRytgHQO3fKWAKFgDQupNEtEalmsQ==
X-Received: by 2002:a05:6000:2c4:: with SMTP id o4mr3418747wry.232.1618652171708;
        Sat, 17 Apr 2021 02:36:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6804:: with SMTP id w4ls1419127wru.2.gmail; Sat, 17 Apr
 2021 02:36:10 -0700 (PDT)
X-Received: by 2002:a5d:4312:: with SMTP id h18mr3484746wrq.193.1618652170893;
        Sat, 17 Apr 2021 02:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618652170; cv=none;
        d=google.com; s=arc-20160816;
        b=seBaU7RdCP2jytaPiM14b31GgC58eB6VCbkWHeJ8Ab2uEh5nB4CiOHQinoTKMEucWn
         Ky2dTUfW+PCvsHXpJo/N04nk43a4d7vOMm/L0rQInDhh7EX9CgY5nALgmx1kC/tjIj4A
         r3K4Mv3tzKHEOHADzGe9ApVpDBe+2trQtjXUKEIGB5h83/8wtuQ0eaEolyBsq5qW2iD+
         FR4Q3ATvavqChpYX3CdFCri5QSShI8wRAjBIyn7sHJUKG031l5S7OxZK+NM6kR12PqqM
         nxI+X57C/K4epShnfT2q/qkwOoHcmfj9Tnb1od4O9XiAd6mxudk8CukrMYcON/B9NsSf
         nGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ux0x9XLFeHCEOGQPgsdGC1l08JnpY9LvfWxGzUrzLkI=;
        b=tQ443YRNwfM2ICIZJEs4LT/RzZJ9fiwoWVq6ubrlkdQxmUKxBlHoen4OIJbkUbc+hu
         +Ua1Gzg4iHyi0/O5SPp2XIPG7LcRPW6/5zd7hcr0rwtpEKH4XuvMpGcRB070hsqCk/tP
         7FNJKjr2wtVh2wMvQ2B9Lfg5a1uVBr3Rv78BeqtOUQDLzvVMOP++/4chIAgkhusVqnil
         /dUEqXIcU7JBAl/4AdtI++6C2aS0IzsK7SFDbsYygUU0o9HccEw0/wHmxd7YCjuTM2Wc
         M8C1rY3zG/01ZgceXkjG7WXbR07jqtp2ahKzUoeQKyDZkhT2gSOVxQnH+CG+acwfY8Zz
         u4Bg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=jzGAVnP5;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id c6si429677wmr.2.2021.04.17.02.36.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 02:36:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0McWj6-1lGAWI1Lvc-00HcK7; Sat, 17
 Apr 2021 11:36:10 +0200
Subject: Re: [PATCH V2 4/4] arm64: imx8m: correct pci domain
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: jailhouse-dev@googlegroups.com, Peng Fan <peng.fan@nxp.com>
References: <20210330105658.16676-1-peng.fan@oss.nxp.com>
 <20210330105658.16676-4-peng.fan@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <5df1659c-3eff-6444-c028-569d50bb695b@web.de>
Date: Sat, 17 Apr 2021 11:36:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210330105658.16676-4-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:ri9EgDVT3ypXW0gsnX8h/KksTCV5rgubEfH2WKav/zxhuK57vV2
 N9AefM6e69LJrFLb2WuogazOl0zM83EGJ1cxtJwXWr3N/GUCQNeE07HryXWDXvyXG4S+d25
 /CKCRnV442w7jWlkZTC+yQA18ceEy7dKxwzCJmYYmvOXjxpFLJxaPsm1MwLojsWn3rKxnTH
 /w4NiEeZYf3dLB9SRZmJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S/ZUzsdPpK0=:sJ9QopIS53PHFmDUiX2tMO
 boVoORwwXBdScY7ffflTdCnLFNFhTSIQHZITcv+sOCCDvrZ/ATI0y2gnClRY96yLtPXr0t5bu
 vAM0M+MVUHcrli1SScDrtqEfmV7f+s9qTmJi3lgdqF7fCXt7ivZp+lJbfd1agmjiNHWTeNU+i
 tQdAlisrGyGXV5IvIu+4jr0D61Cy8t5lY2DduThlcjwO7GgzNkGgTFjNKdebER4O5q/YxVVWa
 AkXJ9P9dzthpA0srNSTksGFGofkR75dTI0V8g6oGEQDfUSki9Kb8S5BFO8NqXtSy3r7sfiB8H
 85chGyeGBRDAKrBHMANG3wMrzkAjoNCRq7VorRbqTv9/qTyIZAUFzqsIQ1/UD7COTlnAdHYTm
 clWCBSJXAl2WvpuMA1nDo4H+MvsUw1bd6/G6FSn1yBNBPbxKCL3hd6ubarwL+NbmveUksTzrK
 6qwsli3zVKAcAzc89Q0fpLOij0CJU6TQrVLwqE0Q9N1GBgYM+Gbq+kvTWHbK7l+ZxWPqeoIf4
 fdMBDYISh9OQBvgErMlT0e4CNker2zx/rtcUcNvUAQdB2UsSXJII4QsUAq4Ok6WcS3aHyOeVh
 /5Yq2K687UO2QcZKk1+7BXiTsMMTvQykLILsJKmlLFh86W967GCoti/oeEGt+gIDStsJVy4w6
 KcSa+5TuKKM0lqYt8l8D+q7xoyo8uPEbgiyL25+5w31q2APVdGbrO2NNh4/gk4hnYt4Cy3qQh
 ekMdR84Fg/camnqJejj3YyHi+MAGKzyZ4nKG4YEb/YN8tQAl1bS7YQCSa0xJZqHVdjw9/470A
 z9tFYe9/I2S/84B39fFe4JCl0T2fkHJzIQpCo6kab3VJ15i+Ywu0Cy6f9TRS0OEEZqRyntQBW
 C4Tl0u2cZ0RzMlegvEEg5jrz3xoIFjyEIWwBQYRvq9Iru/2wqB+dUgNuvT3SbKOhSLJGhrg+T
 GYd/5PlVvlwNbHo5oFuMl2mI4cA/dL0MG4kdjab/nNVuYDrZZAzB67Blb/4tiQOj2ZDF1jqoG
 R2Cg1o5G1LGjWH3MWRdz4N/D9xEpH1pNSHJLNWH5/Ld5LNrHihcSLs/kDEm3RepmArpnqPEG6
 UIRVdLDr6jEuEyDLheFDrE9cT1gcJOWAt/jvt+UWW+Flt+gjNzkwrFqpGyB5Ykozruu1XsDTo
 K0eo6SRBepo/OjrEAQRNqzcAUTE+83rbWg7qHMz/lZe9F/7DDSDO5F1iQD/itINoIvyyU=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=jzGAVnP5;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 30.03.21 12:56, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> After linux moved to use linux,pci-domain, we update to
> correct pci domain here to use a domain not used by pci hardware.
>
> i.MX8MQ: 2
> i.MX8MM: 1
> i.MX8MN: 0
> i.MX8MP: 2
>
> Working with NXP vendor tree is 5.10.
> Upstream tree only has i.MX8MQ pcie, since 5.11.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  configs/arm64/imx8mm-linux-demo.c  |  4 ++--
>  configs/arm64/imx8mm.c             |  6 +++---
>  configs/arm64/imx8mp-inmate-demo.c |  2 +-
>  configs/arm64/imx8mp-linux-demo.c  |  8 ++++----
>  configs/arm64/imx8mp.c             | 10 +++++-----
>  configs/arm64/imx8mq-linux-demo.c  |  4 ++--
>  configs/arm64/imx8mq.c             |  5 +++--
>  7 files changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
> index 196740cf..49272607 100644
> --- a/configs/arm64/imx8mm-linux-demo.c
> +++ b/configs/arm64/imx8mm-linux-demo.c
> @@ -145,7 +145,7 @@ struct {
>  	.pci_devices = {
>  		{ /* IVSHMEM 00:00.0 (demo) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 1,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
> @@ -155,7 +155,7 @@ struct {
>  		},
>  		{ /* IVSHMEM 00:01.0 (networking) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 1,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 5,
> diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
> index ebc2d294..acb9fd5e 100644
> --- a/configs/arm64/imx8mm.c
> +++ b/configs/arm64/imx8mm.c
> @@ -47,7 +47,7 @@ struct {
>  			.pci_mmconfig_base = 0xbb800000,
>  			.pci_mmconfig_end_bus = 0,
>  			.pci_is_virtual = 1,
> -			.pci_domain = 0,
> +			.pci_domain = 1,
>
>  			.arm = {
>  				.gic_version = 3,
> @@ -181,7 +181,7 @@ struct {
>  	.pci_devices = {
>  		{ /* IVSHMEM 0000:00:00.0 (demo) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 1,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
> @@ -191,7 +191,7 @@ struct {
>  		},
>  		{ /* IVSHMEM 0000:00:01.0 (networking) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 1,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 5,
> diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
> index 795c616f..127392df 100644
> --- a/configs/arm64/imx8mp-inmate-demo.c
> +++ b/configs/arm64/imx8mp-inmate-demo.c
> @@ -114,7 +114,7 @@ struct {
>  	.pci_devices = {
>  		{
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 2,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
> diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
> index 1e0a9f1c..22793c2a 100644
> --- a/configs/arm64/imx8mp-linux-demo.c
> +++ b/configs/arm64/imx8mp-linux-demo.c
> @@ -178,7 +178,7 @@ struct {
>  	.pci_devices = {
>  		{
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 2,
>  			.bdf = 2 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
> @@ -189,7 +189,7 @@ struct {
>  		},
>  		{
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 2,
>  			.bdf = 3 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 4,
> @@ -200,7 +200,7 @@ struct {
>  		},
>  		{ /* IVSHMEM 00:00.0 (demo) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 2,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 8,
> @@ -210,7 +210,7 @@ struct {
>  		},
>  		{ /* IVSHMEM 00:01.0 (networking) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 2,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 13,
> diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
> index 3f758980..9654a764 100644
> --- a/configs/arm64/imx8mp.c
> +++ b/configs/arm64/imx8mp.c
> @@ -42,7 +42,7 @@ struct {
>  			.pci_mmconfig_base = 0xfd700000,
>  			.pci_mmconfig_end_bus = 0,
>  			.pci_is_virtual = 1,
> -			.pci_domain = 1,
> +			.pci_domain = 2,
>
>  			.arm = {
>  				.gic_version = 3,
> @@ -199,7 +199,7 @@ struct {
>  	.pci_devices = {
>  		{
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 2,
>  			.bdf = 2 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
> @@ -210,7 +210,7 @@ struct {
>  		},
>  		{
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 2,
>  			.bdf = 3 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 4,
> @@ -221,7 +221,7 @@ struct {
>  		},
>  		{ /* IVSHMEM 0000:00:00.0 (demo) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 2,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 8,
> @@ -231,7 +231,7 @@ struct {
>  		},
>  		{ /* IVSHMEM 0000:00:01.0 (networking) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 2,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 13,
> diff --git a/configs/arm64/imx8mq-linux-demo.c b/configs/arm64/imx8mq-linux-demo.c
> index 1177f596..03e67a94 100644
> --- a/configs/arm64/imx8mq-linux-demo.c
> +++ b/configs/arm64/imx8mq-linux-demo.c
> @@ -136,7 +136,7 @@ struct {
>  	.pci_devices = {
>  		{ /* IVSHMEM 00:00.0 (demo) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 1,
> +			.domain = 2,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
> @@ -146,7 +146,7 @@ struct {
>  		},
>  		{ /* IVSHMEM 00:01.0 (networking) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 2,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 5,
> diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
> index 9f9c6071..145a36e4 100644
> --- a/configs/arm64/imx8mq.c
> +++ b/configs/arm64/imx8mq.c
> @@ -42,6 +42,7 @@ struct {
>  			.pci_mmconfig_base = 0xbfb00000,
>  			.pci_mmconfig_end_bus = 0,
>  			.pci_is_virtual = 1,
> +			.pci_domain = 2,
>
>  			.arm = {
>  				.gic_version = 3,
> @@ -161,7 +162,7 @@ struct {
>  	.pci_devices = {
>  		{ /* IVSHMEM 0000:00:00.0 (demo) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 2,
>  			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
> @@ -171,7 +172,7 @@ struct {
>  		},
>  		{ /* IVSHMEM 0000:00:01.0 (networking) */
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 0,
> +			.domain = 2,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 5,
>

Thanks, all applied.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5df1659c-3eff-6444-c028-569d50bb695b%40web.de.
