Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBG7U2T4QKGQESLABHAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB82243A75
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Aug 2020 15:03:24 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id o9sf1248703lfi.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Aug 2020 06:03:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597323803; cv=pass;
        d=google.com; s=arc-20160816;
        b=cuEdnnQ2zCig2WGRSm3ixZeP/kqhojuTWD6OA9f9VEORqf2DKoKYKPCLpDqnBFqBOI
         PwwjRoZetswdS6EuiePL8vwHFH4/BBBBXd77KvD2AHCq+lRyfZldDizFwg+sDLPRjFI0
         5ipxL1DCZTZuvpNxaSMNN4Z4CU78YgQtK1kmXTCOs8A8/e5lqyXqE5iu9+S3XHd1cw8v
         q8uL+0f4oWddmd017mqNlHmI8rQkpRqkxH2k8mxDusjQbH6+92qpzyPeE5bEPkUyEZLo
         x3WUb0ips30DaHhSPSytYcm5A9CVIwpel6K+6uTBoV9pKEtF/jGcp+StihOVoEtzzlkT
         NVPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Wo9hUuf+xKlh2QNGHpZmpRhSm8S0pwx6OjuNB49hTKI=;
        b=TgMKFk3ntZRWszpAbXgDoL5evxTpY1WELs4BB4XVbX8PaXUFfsHvNLqtc00Q4iLV2d
         fRUdaE0szP24F20A9v6X8XMNgehZFOwudnilHeaJui3n1rLdETviTb9DmNMBX16Hb5I2
         GYLHloZ5Oe3pzaDL/H83VZoAj+2bZVtxIRZL2gfXNpNq4oiYxKIJzM5jcmz40w3S5J18
         MuW/VsXHZeQWxnrQ0zZIB6vmLtW+ksQYndRUGDrD7UE+2D5QAtMLQFnsq/d+ePZn95Ze
         U4+2d2haTLjt077ctdfwotm5d6P4q25mycahF5N/fuPz15Xk5tkXwS4SruCqT/ErWTlD
         +aYw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Wo9hUuf+xKlh2QNGHpZmpRhSm8S0pwx6OjuNB49hTKI=;
        b=U5aP27NLmeZsjzgXnUKCQZQcuPo+2hZYy39a4ncjJzIW6VBrmlXSTZWtMcRwN1M472
         oCscIwRAlax0CK8lip4EaFr/JE8WHVz1U57FippbFIDeYi1Ge4DXIwC75kdHW5FBVA7n
         iMOwlL5KpXZ88yQ8tnUqG2gwsLNSWAlmsAKXL97uC5XZq0+WHHolpuRLioiam0A7Sowd
         B0IcNS4lZiGQcZ/4/nrM4Ah9uPPGIdQCKiXGXaydY3TcQJE+apDMnjfBgZ5RYJBi3Xuq
         7ZPWyFMRqhGA25kEv24Spfkl67SUvEEjEF2NgyELSSFgnWNoLSvXDzLgE01E3D8O31wW
         bN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Wo9hUuf+xKlh2QNGHpZmpRhSm8S0pwx6OjuNB49hTKI=;
        b=n9R2zqW+e6/elsWBsSNx+2srNLxmYxkTzcCSjfmjbyyow7d3zbnHq7rYBHCF+Qg9+a
         5eZbX8VanwhX3zoItMsIgDm1LLbwnJux2mqSzz4Efbe6XRfXeVe0VMBO4e94ioJZwZXo
         g7Yo8aK5vajo98BjGhlFQqRQ41+1qSFALppM9FOjyUMHfWpLdwwPhYt/N3iCp6h3Unua
         U8bdgw1kepA8Zll5S3G6+tGeh9QZSQ6EJxsbuyy0VEv1go4d9VhJt0vyuM/+fklhYdq5
         fWMXkRzsJx/QgVodsvnUC7bIlp1kb2zA1YbenJprxpK+d2rB3Rk36GGzvlTgToUgl92d
         38fA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532XpPXP5LKlyrJLJQOnXtoxT9O3EBiAJ5+ekbLSMTcKNd/FNhld
	91EXMfjLzAfucAFrH2Z38YQ=
X-Google-Smtp-Source: ABdhPJzbTl0Zg59gEql7+nAokr0E+5Wiuvs13BHspX2leq8d/RQGU37pJ07Zeszk32OjM3FHv8ipng==
X-Received: by 2002:a19:428c:: with SMTP id p134mr2165183lfa.70.1597323803616;
        Thu, 13 Aug 2020 06:03:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e33:: with SMTP id o19ls77599lfg.1.gmail; Thu, 13 Aug
 2020 06:03:22 -0700 (PDT)
X-Received: by 2002:a19:830a:: with SMTP id f10mr2189031lfd.28.1597323802737;
        Thu, 13 Aug 2020 06:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597323802; cv=none;
        d=google.com; s=arc-20160816;
        b=icw6xVd/RLu7cuIgXBKKfBLiuqsmotN3g+qu+7EUksEUiqOIiWDn6MQek6RM4WQ5XY
         wLNKuxM0FhThOUA0nwwE7qA8enn+8Z48k5J1hr6vLcOMg5VnO/xkbiC9BTcMo+YD5PwF
         8YZSxDtDz2KUIcrexJEFP4cVBmVvqHWB4oYPOw1eVsjhik6z2mvHns9EVw11zs/kpon/
         PFpFwfhjhIVTG0BZNUL8PSyhRLX0FqIcm+ERGl8kmwBg5I2KxVva7QtWcwzzGAlVX0ju
         2Bs1g5JqOPM43s0dJ9tL32C8Ps6MLynjORm6UHZr5uqBk1ToP4c3YWXqluKmfEWHXrCS
         vw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Wt4Sa5M329uuEdEHwL26kVBd+KyLt+Hg/emvTY1BmOQ=;
        b=X5G/2B4ELinFL/q4rJFaUJtkKzN5kQrd13wLB+U+jncEA/qG0HxluAC+xttvGBMn9Y
         0C2Jj0sukfu2KEJhAWOTH8Q17bYFG31pokBUXUkM5GqmG6q6AF+AqLcPmvUuyeD9rncJ
         jJLO6L4x8otKT8m7NSonczuE8tFQNjZrkbyuaAOAGeF9IIwTxOqU04j+MmHb4dsdzoq/
         Lp2LHfjFyzKMtWDhqHX1psZe7RavmrkFgH85MUfM1VEHhGkkcLvymju0J6i5swAMztqc
         i70nuVMB9Pf1tgBfSRbvGzqFF8x75Ss4og/DiKc7kTNmjhFziYqCtWdkfFcDBDdJkbek
         uFfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z26si298176lfe.5.2020.08.13.06.03.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2020 06:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07DD3KVc029887
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Aug 2020 15:03:20 +0200
Received: from [167.87.13.5] ([167.87.13.5])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07DD3JB8008442;
	Thu, 13 Aug 2020 15:03:20 +0200
Subject: Re: Starting jailhouse on real hardware without QEMU
To: stranzjanmarc@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <cf0c959a-a862-4ef3-80c9-2037c88fad45o@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ce8b7368-3da1-fc89-d1ea-628b25bec62d@siemens.com>
Date: Thu, 13 Aug 2020 15:03:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <cf0c959a-a862-4ef3-80c9-2037c88fad45o@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 13.08.20 14:39, stranzjanmarc@gmail.com wrote:
> I am using a PC (AMD Ryzen) with Linux (Ubuntu 18.04, Kernel 5.5.19).
> I want to activate the hypervisor "jailhouse" on this PC and start 
> another Linux on a CPU core without using KVM / QEMU.
> 
> I built and installed "jailhouse" from the GIT repository (as of 
> 08/13/2020).
> 
> With "sudo jailhouse config create configs/x86/sysconfig.c" I created a 
> system configuration.
> When "make" was called again, the "configs/x86/sysconfig.cell" file was 
> created.
> 
> The kernel module was loaded with "sudo insmod 
> /lib/modules/5.5.19-050519-generic/extra/driver/jailhouse.ko".
> 
> Unfortunately, when I call "sudo jailhouse enable 
> $HOME/Projects/Jailhouse/jailhouse.git/configs/x86/sysconfig.cell" I 
> only get the message "JAILHOUSE_ENABLE: Invalid argument".
> What could be the cause?
> 

No output on the UART console? Nothing in the kernel logs (dmesg)?

You can increase the verbosity of Jailhouse by setting

#define CONFIG_TRACE_ERROR 1

in include/jailhouse/config.h, see also 
Documentation/hypervisor-configuration.md.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ce8b7368-3da1-fc89-d1ea-628b25bec62d%40siemens.com.
