Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV6L3H3AKGQEIHZ7XEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id F32FF1EBE5C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:44:39 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id 74sf3537420lfa.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:44:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591109079; cv=pass;
        d=google.com; s=arc-20160816;
        b=fTnobU1OLF935ziVjTyrqyl0XqmmH2czfcygDd/WpRreCPo3Kt6V4qKxvE9Kw9U8Fh
         1w2ZXd0VWn+4ittDIX8FYy76N/HpBGdCnIP+qq8qHYY5Li+EdL5QK7qLe1BNvrbDlLl4
         wMDH9AsOdZKFyd8FDZ5zFaPhXWQU2bvPh3FIXHrCylKGrS4H0Xqb9MsEAof+sAj6lm+a
         qI+/wzb6V8YEujY+h2zgPTWThx9kH3EhH9EGg+6CaHLmeGaqowAzsO0mnINusbOxHJzF
         ypuzc35ljzE6cS/6bIGUv5EAO1cMt87dMBwOGjZKyIS2O/uxUUt31kDtzROzSpDUXv+Q
         Qlzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Ff1T1rttEGv3SQVyjxq0Jy2J3kXauSanwSH+b0Z8Bec=;
        b=uzt61KrRIDFjZPeZnf5mifXZL7KQma08oHgKxIRdJXV9sZfeSfG3l79HemLOjYBixb
         Dbl02Yynfc7uOx9rzltRtm6d28htkVmMU0Dr7KDrYimov8vJOd+QTn/UP2KjyP1HN0Gi
         O+mQNl5w9FVhGB/PsVAOHvTu2jBSvBFZT8oQui1HbJYiyGR0GeK7ktc1sNwFaYpN3vO8
         byrgtY37oGvw8CMhfqv7NtCjFKbMuX1ZZyqNtyJcZlJP9fMjsb5LCKRnhGmE2TjA7+MV
         dCSPkALt5ThlIGSsKn4akS0Qv1rAqJ2gWlFcvACdRKg2HVMvZ3krYZ/5ogRdM1uSXzOU
         kK7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ff1T1rttEGv3SQVyjxq0Jy2J3kXauSanwSH+b0Z8Bec=;
        b=VZWFock8e2hYD97YzLtpaENfT6jOz2g1AM1ZKCCxW+rVCrcUqRHLOBCeYrZaDhjxz+
         H0NVkOL7Xp80xV38ghmbaHkpHC5/2cLdESZGxziZv+yePPHDWU5J1aOKnXOLo+dPH5C8
         dzOy5Mb+ovpsf65qfNYXeX6fEzWskAW9ED4WyGnmRZOSRNAT7XuXHwZcENyKOqx8RC5a
         pcU3Ri5fwW5RRn8qVochgezzItNcMhLrNjrZ5YMclc+BWmix6tNsn1kPNq+LKDax7WrQ
         Cr/WzLcvZ1Aft1qRPlzEjZxgGBh9KJl29S13m2sGfoH9kX2zW8w0ZGAaQY00P/SwfvDU
         58/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ff1T1rttEGv3SQVyjxq0Jy2J3kXauSanwSH+b0Z8Bec=;
        b=Vs+iTeOYDIol1iSNs9qrYDqKQAJoOp3lGnuUPsD3StnDMp1lSkmiAzC0tvn+cKQbQK
         m0qHArtWe09v3nV0YwRV6ofsh/gfxgfNV/5kdmb3PSvXcOkse+IDvGrUmCSdUJ+He206
         E7cPhCZqIEZwLk5J+wcn0hK08eYMWfyHl0mQt6t2s+HsKOHShwmpn65JIMgDR8EGktoS
         4y/xu7BhUdBI34/OL0HFqljHfGfB5CcwbpFJFNMKl0cymkm2r6j/Bk5bGaFKM3pzpp8v
         QA0P998tXUHVKO4CRGxXn1aFziP4upPEka2WCDtQqG4VYsc78FPGc/RUoMJWmaHZvMfe
         mhug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530d4ihECIB4BD2bFj717mLIIXe/5rnd4oOyWmwSbLo+miXs83B0
	HpB0fvf3a15x5y2+hP1FLxA=
X-Google-Smtp-Source: ABdhPJzJCOlWKnZmX93wORvbXXQLqbYLkrIbhmreImBuve8vJ/D23V3kZOm2Xm7VLqlrJqQCVqMe0Q==
X-Received: by 2002:a2e:a548:: with SMTP id e8mr14096201ljn.76.1591109079391;
        Tue, 02 Jun 2020 07:44:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:43bb:: with SMTP id t27ls1558144lfl.3.gmail; Tue, 02 Jun
 2020 07:44:38 -0700 (PDT)
X-Received: by 2002:ac2:4d1c:: with SMTP id r28mr13807647lfi.45.1591109078316;
        Tue, 02 Jun 2020 07:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591109078; cv=none;
        d=google.com; s=arc-20160816;
        b=o71eRkBfVGUJPcLSeRAF787CArbZZKRLpnQdPprocjpAO5wmZsZW82KSaim1mHApFl
         CCbQSxeWmtXDTllOSN++A2+cTEDZTA5NbKTcXQ+Rg7lUOSfcmC2NiyK3XyH+fYv+0NU5
         cN5PJgmQWmKHSkGX8UuhLe48kHbNeE/Ov5H6Z0P3Uopbhon+D6xQlCz64MbIs8ZTZK8X
         s+GUKLFRV3lz+NhhhfKRoOyyjY6UsxvJzw2oLQ1P4i2et7LDRF2+2nvsnyj+sWo6QblQ
         uu1hyw6n4xZb5gLJZCuJEfqOdOLb+q+SkQxiZ+wLC6L8O209Yi2pb0kPd1zcfF+0BA9N
         1D2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=HMC5NScNthFE2DU76rga3JS7d3XM7d7Cb92vSeXApic=;
        b=xQXOIoecsMjNFmnL6UYq+uqtH10d4grH0p2Wbq7QLDTd1Orq1MqkFyJnRGApXhnFzB
         gF+WWWHmkpo89ReJVc/g58wwRLy4GxnhO/S/94ctV0hKpPqjBnhcHZwT1gHKhQ20RL6T
         Ze11zGAoZAQ8V/G1Bq4pwsnCbN4TCQS8I5TvEpiHO/Kf+kVQe50p9ZGWNrH9EZJG/T8W
         QqQo1oNpeYu0RaP5vESh/YnYVWe1mIneaKJCpe81VtH7zwzg052jVI0s4KYAcQjlX+Fx
         w5oztssy1Xot+8LWu/1NYJXIkTMzlViIScAfrcuFJf5UmkwVNvN8hM0JZZGOq6KMxqBN
         3UDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v16si215442ljg.4.2020.06.02.07.44.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 052Eibkh002545
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jun 2020 16:44:37 +0200
Received: from [167.87.142.254] ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EiY0T028121;
	Tue, 2 Jun 2020 16:44:36 +0200
Subject: Re: [PATCH v1 0/5] arm64: k3-j721e config fixes
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527122358.14723-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2dff1677-1886-ec04-24a5-6fec518bc08c@siemens.com>
Date: Tue, 2 Jun 2020 16:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527122358.14723-1-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 27.05.20 14:23, nikhil.nd via Jailhouse wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> This series fixes few issues with the jailhouse cell
> config files. It adds required memory regions for
> fixing crashes due to accessing few devices.
> 
> Also, remove some obsolete device partitioning
> which is no longer supported in the 5.4 kernel.
> We will add only when the drivers are upstreamed to
> mainline kernel.
> 
> Kishon Vijay Abraham I (1):
>   configs: arm64: k3-j721e-linux: Add GIC ITS Mem region
> 
> Nikhil Devshatwar (4):
>   arm64: dts: k3-j721e-evm: Add pinmux for main_uart1
>   configs: arm64: k3-j721e-linux: Add USB mem_regions
>   configs: k3-j721e-evm-linux-demo: Remove unsupported device
>     partitioning
>   configs: arm64: k3-j721e-evm: Fix failure with PCIe
> 
>  configs/arm64/dts/inmate-k3-j721e-evm.dts | 12 ++++
>  configs/arm64/k3-j721e-evm-linux-demo.c   | 79 +++++------------------
>  configs/arm64/k3-j721e-evm.c              | 32 +++++++--
>  3 files changed, 53 insertions(+), 70 deletions(-)
> 

I only had one comment back then on the last patch. But now the new
config checker has some findings on the j721e as well. Please have a
look and address them for v2 ideally.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2dff1677-1886-ec04-24a5-6fec518bc08c%40siemens.com.
