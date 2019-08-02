Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXG6SHVAKGQEYHBXPSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5797FF51
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 19:14:05 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id y15sf47421569edu.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 10:14:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564766045; cv=pass;
        d=google.com; s=arc-20160816;
        b=lJtUcxiJRHLr8LfPzbnWtxXdrWq5a92AAvHjngn/vIAhLzpqr2AmKumNnT+qvw5fpC
         06cc/nZATcm4zL7c59joU/3Dz894+S4E1KmCTte69NSWSULCPBavboELkyf0SKqGoNWv
         QRc+p0xOdP8exQOlA4VfPwXZ4wRMSjkqWAdF8ie9J/iHiAedVCL/LxU4VkBVwDYr2Wnz
         S50IB3E7LS2p+y9rWb5MiLXO1dk8UWpwoUG1xBgHd7xBqAjCJZtciZR+okSz9dTtx35q
         +mTNzfcfJu6eJ2qCZ1naD8g6RSm9GYy2l+s1L+fR9Z1unwPXwKso711a71sIL5jX21WC
         MnXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=iTb1upF2OKBNFOyNWHjfZvHh1y5Bhn/YvUp0pEiOg3Y=;
        b=Ah0ZBCG5sHJ9jndIvdd+NK6gW13iGQ7vsyuYg7AxBgqMjVEsyK7/FX31S4y9GR90O8
         NTAbFgxs+nGVV+PvcHPLta6puMr611SPOEh/oj4+7bPujG7yt+HS41O+7E8uhb7OSSoG
         3VBgjLokj+nUf+NnIITM8BzM1MIKMSVSuh10He+fuSihZoBPJEQbfGWVFCUvqCJFtYu8
         TxyWqTPKIT6Z/Q8Mc958h2CsWQ+L24/2M5vmc63UeXs8Oi8A6DMjWnkB6r0you2jCum4
         bgK3VwOZ9RYPcRFAq237fxg+WvcKTqmJLW+CER6LBpMiXXGgpOiufaJv1GIoOJIxGojr
         c4Pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iTb1upF2OKBNFOyNWHjfZvHh1y5Bhn/YvUp0pEiOg3Y=;
        b=IyRA+u1L98cm7x9GixnNkYRk8Spl5sRu2Pp0DyQxQqmEelr/imfkxpKt+Brb6uGBqM
         FRITy9WedKvFHcXXAA95ZSKJkNxnAxH/TD/UdDc283HeNArKLvrkVR12B9ehwq+HJPR6
         Ciaqi/sFcb8Xzz1EpY0ZhjVtLs3cv5uYOYvPM612cSZQBdxSFK8OV9g8YtdCnTKiS9DJ
         MPlibjLvF1Dun0bO1x2b3sxM2v9Zv9LwG372P7K4JEJ4i9nHB+y5XEmIT8SBrdRxYElv
         L60aF+atpuiJ00yIQLMkOhmpS0JOXI9IpcRJy08/asT9I7lhaWjqlmu9TxUUA6cWdXU4
         4rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iTb1upF2OKBNFOyNWHjfZvHh1y5Bhn/YvUp0pEiOg3Y=;
        b=YcxdEILZdas7YnDpY7B3D6KqStIJQeu8WX7sJzARGNaY3W0w0mJyK8FWPerfXwPQOh
         1v5/TFojd4u4ylArvsCeqvOWvWmN6GBU2N77agIW+mdMNfo/siewSzUg8uQ3kzfKk+/E
         q6QN0TDgQKoi947NR37phvbu5q4d3PmmFoIXyJJkqKPFZWdF7uv4TOVR2/fkSDI+c4+I
         R5pdNhWjrjIDGyjWQjMF2qrmRdlCBaq7F725RBqtEVl1SDtoSztg9Q0Azmv9m+X2RKq0
         kZj87Sb31e65U/rwzxLWrcbfThH0cosAP/Kszx+dtyDD+x32Ri6VyL65R7y5I7dfkqwJ
         /dJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVR9N7yo/3Cxa1Bm5AqAWQuHQ5PZO2ODOw3YyOjhC06qTk4CiX5
	Hz3k69mgdsDrrvCWHRwC2GY=
X-Google-Smtp-Source: APXvYqxiSgPsHqUTgfCMMFENqRSRAaXm7WTt5kE/i74ckxA9apUqaKniHmmEj2tqeB1iQRk9oVPkDA==
X-Received: by 2002:a50:89a6:: with SMTP id g35mr124322398edg.145.1564766045310;
        Fri, 02 Aug 2019 10:14:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:f4c3:: with SMTP id v3ls18905803edm.11.gmail; Fri, 02
 Aug 2019 10:14:04 -0700 (PDT)
X-Received: by 2002:aa7:d28a:: with SMTP id w10mr120368830edq.251.1564766044467;
        Fri, 02 Aug 2019 10:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564766044; cv=none;
        d=google.com; s=arc-20160816;
        b=NgThcsScYO5i5RY1JQbFARowymL1HXPQNp3CZlKiD/JQuzh6ZZgp6yRU7DUbsJ9J6p
         e7q4EB2HS0dzZX3ZqkyfZ3BIr6+1V/NKw3J93U1/A3rh6mWNoYoI5hBdto8RiYHVZLIN
         qemBXaEbN5vMTHoir6/4xHHm6bW2cRdqVl77EfQdtqhp2LBJbWIhpJGTFNM/cxqBF4aV
         XOeyrxZC6S8i9QP13bWbpPbRb88ZzgQCcDQX2gWRDSiBTa0V/KIX6UhGSDr6kVrWKbvY
         IoijRGUBpBDpua07jBEyqB217XHoNzOhLmHQocESsdFSDP6dsbLGQZh6VSRoXsCpP3OI
         ghOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=xdxyHVQtKmvMTnC96HLGbppSC+wWtBm1aK5/iTEuuLg=;
        b=S4kNJhsdAPRtfblfqd16PyppQHvluFRzbpn4Y3Sw2/apWWIuYrUSXs1rUvPxxFMeox
         FIq5zTxB9uNGdbN6miTPKWGYXv3UtW58E6bvK+hramTo8GYpasbQQkx20MY6Aaa01VZi
         mBAYirue8vJTcTVpJvLUD7ubFqbag6cr8hEC8xYCchI17vVeUC+aMU3YS8j8Bs6Vmed+
         3H483MTIFjS8HZB1gQHsKKZkJXqtaXiS1nUn1AKheD55lSk3nb54SFxlHGbcOU0iHD1u
         lGmqkljAosrAD1N+MCQ9Te/ZTt91FU8vV49f512flfKnI2r2Xr8BEgYCico0DFLMlOt9
         N0RA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id h23si1035688edb.2.2019.08.02.10.14.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 10:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x72HE3Kp023542
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Aug 2019 19:14:04 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x72HE3bS021212;
	Fri, 2 Aug 2019 19:14:03 +0200
Subject: Re: [PATCH v4 5/6] arm64: iommu: smmu-v3: Add data structure
 initialization and stage 2 for SMMUv3
To: Lokesh Vutla <lokeshvutla@ti.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190801113547.7460-1-lokeshvutla@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1dfc1039-1606-a0b7-04d2-75f4f0efac4b@siemens.com>
Date: Fri, 2 Aug 2019 19:14:03 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190801113547.7460-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 01.08.19 13:35, Lokesh Vutla wrote:
> From: Pratyush Yadav <p-yadav1@ti.com>
> 
> A System Memory Management Unit(SMMU) performs a task analogous to a
> CPU's MMU, translating addresses for device requests from system I/O
> devices before the requests are passed into the system interconnect.
> 
> Implement a driver for SMMU v3 that maps and unmaps memory for specified
> stream ids.
> 
> The guest cells are assigned stream IDs in their configs and only those
> assigned stream IDs can be used by the cells. There is no checking in
> place to make sure two cells do not use the same stream IDs. This must
> be taken care of when creating the cell configs.
> 
> This driver is implemented based on the following assumptions:
> - Running on a Little endian 64 bit core compatible with ARM v8
>   architecture.
> - SMMU supporting only AARCH64 mode.
> - SMMU AARCH 64 stage 2 translation configurations are compatible with
>   ARMv8 VMSA. So re-using the translation tables of CPU for SMMU.
> 
> This driver is loosely based on the Linux kernel SMMU v3 driver.
> 
> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  hypervisor/arch/arm64/Kbuild    |    2 +-
>  hypervisor/arch/arm64/smmu-v3.c | 1138 +++++++++++++++++++++++++++++++
>  2 files changed, 1139 insertions(+), 1 deletion(-)
>  create mode 100644 hypervisor/arch/arm64/smmu-v3.c
> 
> diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
> index 7283a008..323b78b6 100644
> --- a/hypervisor/arch/arm64/Kbuild
> +++ b/hypervisor/arch/arm64/Kbuild
> @@ -20,4 +20,4 @@ always := lib.a
>  # irqchip (common-objs-y), <generic units>
>  
>  lib-y := $(common-objs-y)
> -lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
> +lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o smmu-v3.o
> diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
> new file mode 100644
> index 00000000..d7e54350
> --- /dev/null
> +++ b/hypervisor/arch/arm64/smmu-v3.c
> @@ -0,0 +1,1138 @@
> +/*
> + * Jailhouse AArch64 support
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * Authors:
> + *  Lokesh Vutla <lokeshvutla@ti.com>
> + *  Pratyush Yadav <p-yadav1@ti.com>
> + *
> + * An emulated SMMU is presented to inmates by trapping access to MMIO
> + * registers to enable stage 1 translations. Accesses to the SMMU memory mapped
> + * registers are trapped and then routed to the emulated SMMU. This is not
> + * emulation in the sense that we fully emulate the device top to bottom. The
> + * emulation is used to provide an interface to the SMMU that the hypervisor
> + * can control to make sure the inmates are not doing anything they should not.
> + * The actual translations are done by hardware.
> + *
> + * Emulation is needed because both stage 1 and stage 2 parameters are
> + * configured in a single data structure, the stream table entry. For this
> + * reason, the inmates can't be allowed to directly control the stream table
> + * entries, and by extension, the stream table.

By factoring out patch 6, these two paragraphs no longer apply to this one,
right? I'm simply dropping them for now.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1dfc1039-1606-a0b7-04d2-75f4f0efac4b%40siemens.com.
