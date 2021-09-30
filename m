Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7XV2WFAMGQE6WL4CDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2E41D5C4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 10:53:19 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id k2-20020adfc702000000b0016006b2da9bsf1427408wrg.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 01:53:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632991998; cv=pass;
        d=google.com; s=arc-20160816;
        b=hiswH+QJNWmQy45a5aQtf8N7hx3V5s4/nsv6E90oJD6OudMYyt7dAgPAshdC0w/vsC
         K0HneQUc0EyqHToCEa8gNVEePnZXueCMr+3UcvJGtTDPK8XirgoeJy80xsiMgOP8qMMS
         zQaWclafc9vTpYr781QQYqsCN9EMygzQvfIqvzipMLfjekyGEy8KRgbmTQFX/Najx1bG
         tC6OImUfH4sNg0MwJXJNcQbqCzCi9TQOj/KiPTXXx+Rb0YAi/dDm6ePhGSq69jGlDTJN
         PS6egWz+D8sFjZN6FwIRvLxxnYCpj2UZkbL5yldwdto2rkdsP6QZKDdb9EV3ctpxveeN
         Z+mA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=1pjSWWeZqH2z3k2Nq1F5E4axCACds5jITexWv0/rRYw=;
        b=qwXvYOMyFIdFwmsPvq4HADkk6zo5zE4kJx+7BiznVxam6rCtIJiabSmINj5a+EWvwO
         UmEUUmcJ0hnT/H9yKVUTI4ZQ0noU41RqcJLrJEOFrPnq0gSp0pyE+NXg0tl8sG2OgKeU
         3PCISzR7vif6KHzrWU7rtsVXRKvFeyBkk9Y1uxnbyfPxRJy+xuef2f1jnRvMdjZD1H+L
         8lUQ5WQTIXsm8D9NRKY+nLQlITc4ltLPeRCIgVdp3FYEhmAuo1TQn2UCkznKE/l/7Poe
         wAU7qse2x73s0CiMd5pbJmKxkQZ7KW3cK/wIRlHv6/k8hXqAEuehG28LkjgQ6Ohkw/+g
         2YQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=m4+baONM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1pjSWWeZqH2z3k2Nq1F5E4axCACds5jITexWv0/rRYw=;
        b=M5edxP+yO/9rHqqwaFICQVdd1DMQjYxzEhlPI7KuSg+JUPKjVO4R5X9g8lsl3oMcUk
         RkqJObdyphqMdzg4k/uNVm3Q3hp8muZILV0Do76OO4GC0TAAqgBZy0ciatRYn49xYPPp
         EYhacxNiMNhdBJoiDQnG3rj/lJrIVm20L6MEL6A8RTYldNR8jjpAgvlF308njUB+Lt4V
         98PRRgtkX4B26AwO2YFhNbaN/h+9p4UDYQocaNTNHX//y0ALwagczWcuGJLF7oisdQp/
         kEf/h6j7Y+SlhblRKey0hrazuTKLFli/fYC9cNwtxaF7m/V2z64Fauegrdb/R1gYVbX+
         VCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1pjSWWeZqH2z3k2Nq1F5E4axCACds5jITexWv0/rRYw=;
        b=GK4DN/vsyjwA/pzHmDfF9BukREvqw/kCed4NK48XN0i0/79H/yfBJ7bjLxWQ+e5wDN
         683tOj8jCjpSNVCdp5GtgrEoKe9OH5SQn7dOD9Vi8fxTLuW//6n65VFvHAXGj0B9MF82
         XBEke5jNFjuk33kreV7ftOhe2ziEjgBgXP+DO7F57+WuNd7kmc1U3lyliJoR2EP6fzQx
         jgvPI179L/bRY5pj5u7HnVwS0+reCvFr8QC04JWw2+5RPzTVOg2BtY+0OLf8EmKmXsDJ
         pPdIfHD31MgIkx9oauIAkSsASIaKahOZtPSdFsxuDo9/u/9M9iszoB12m1qp3uzzQGqR
         M4MA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531vx3K6vzrEfvJeZystRM5fSB63vB0Fs4taj6h6aLoMbiMBcCpx
	MK/lto3yy8OKMu+H+oDLKio=
X-Google-Smtp-Source: ABdhPJwh8z2wCXzMU7cyR8okcb8pA06pXMKFHGar/wdh0o0DI/7QZjuIRHMBl1EAiYb0ICei7bjXqg==
X-Received: by 2002:a05:6000:160c:: with SMTP id u12mr4787161wrb.100.1632991998819;
        Thu, 30 Sep 2021 01:53:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4f8e:: with SMTP id n14ls2736087wmq.1.gmail; Thu,
 30 Sep 2021 01:53:17 -0700 (PDT)
X-Received: by 2002:a05:600c:190c:: with SMTP id j12mr14878636wmq.122.1632991997892;
        Thu, 30 Sep 2021 01:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632991997; cv=none;
        d=google.com; s=arc-20160816;
        b=g82HAHVAD4/D7Cjo4knQ5EjeOxypf7CmXpNFMkzW8BApDhYKEblsiO9rc7AKKHdz6Q
         dSdXA/brrcxuzX/J9/9OxgnT3290tYW9IuPBAyPciQIQ/3wo+5EDIXq+RuUzDDVQBX27
         Cqo43gb0xZYDGGOWsFlccuOcaOnPq2692WFemoZedLQYaugQw2J8xoJ9zxCUT6WWMVcf
         5PfTdS35sykflGJ5wHWnlsjLnolHcYQv0A8MxwJXS0M1L9JRSxGIWZWomY3vCskmnwyD
         UTe0+JbmCh760kMAA8zpPfEg8d4W8ziWe8jRSXr+SFo0AFkKpr3HxnE3051LJ4QtlCdV
         AMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Gvqt6wAFVedjBRGEKB71SL4ZrqxaNehejyL88r8lD14=;
        b=prOibTvWbOtUBa1wRKdCGjq9PrR1IOSHc2e9Sz/e08U85qa519dIX4YlE1TS3x9eiG
         WMb8KHbe0R3wIGj1Wuc3WiL5CDsg8SfAbo26a9rikiBryfN673RktD1+yXdu2ec3Bn68
         IbJ52W6WbqvZiK5zvMQBaDfk6Af161Pn6I3s5a2evYV3PRFYhRsn58xchPup50gInDYv
         +fAYjrZ4L+xfncw6dFu7210gpze5eiRn4jxIO7FjIy5JpMxdhzCtZRFH+QAx4JZ50bzV
         XhKMT8NG3pBUc5qMOQYBx0Iy2uB4UNpZSynKe0BkJRu9ZVDhsZr/TsPwNCc8e9Y5G1K1
         eS5Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=m4+baONM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id t16si144126wrx.3.2021.09.30.01.53.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 01:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([94.217.148.121]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Maaur-1mG7HQ15DN-00K9yc; Thu, 30
 Sep 2021 10:53:17 +0200
Subject: Re: [PATCH 2/2] arm: gic-v2: clear SGI GICD active flag
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, jailhouse-dev@googlegroups.com,
 Martin Kaistra <martin.kaistra@linutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
References: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
 <20210930070704.2315052-2-peng.fan@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <de40c4af-207c-f96a-9acf-7b2a33d38957@web.de>
Date: Thu, 30 Sep 2021 10:53:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930070704.2315052-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:01Pi9DPZrPqgh+LK4ynH+jWnlD2WFjbN2w1/RL2SB2UD89JPoaU
 +wbP55vuvmuGDxXQ1Cb0gjex7zg40pm2kgDRSCotrqc6pRXHlBzqUN8LHTdXdS0SJcfCrff
 3r/57n4FqjCRgjhOh7+4Uu6S7FPJiLdL8y20XThP3DmyRs1VP04PweeqnDgHzkF0R12Zu7U
 w/FHn18sCQscPLvhSpoBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ht6gNgfeWuQ=:UgsB8L9fo3rSkj3PX7Cb4t
 T5vjSM2udLi3RfZj287X2fNkSeLGQIa1oxOAoUCqk1FDf+wyHunOTTbqNw0bdyWhSQsgTd+Cr
 eOgGUYC4dUcUL0sMl7krI+i5UhBH46DYIEv5dTk4i0iPAr8F5+FnX2voNE33Bq4dBikdZyDZq
 ha8oHHr72kq9KsNPKYr7fjbNaILYEI701xi9yoqkawJNxwtCv3WVCJwzjNkvSYsD+bLm+aZ84
 dyfafDnEHliMDF4ol17K8QT46AaOcpWsya7pwjYwuGFlZ7Gr9fVuaXDHODf++v2X56QMZMF0y
 fOksEqep0zVGfL4pD2ZL4YyoFYRIS4ERKBTedDgMsVe5hqWXwYcioYsEJNUwOu1LSj7esZ9Fp
 igxmDCPHCSNJ1DSAM9SShh0cahE8HNx2h1uyLYhrTYrqqRdh564iRQFXvz+LDHxZeDWpeESOs
 +O7mVvn63nnz0ujQolsraxffXijFc9IAG/HPzrRDVvKzOSvgv4GtH6jFHqX7l07CQfPWR2Aq/
 xOg/820Z0XrGRK4igmAU/NG7lE0NoBXWYloeMDjTnVdvy0GOMIOCmSifRMW0q8WzhQs0l2P4E
 8zhwBvhV4punwQXcDetlNLD8VD8XQDDZREhNaPFNICkysVu++Tsb3SrX8OgPddfaqQe1AQKzs
 k5ZI5DN9nbhvD9gWOTVDWfxz9oxW34CmyFG6lBVpQmJY21tV3hq6et0L4QJMpQtm3nlr0G9i8
 I2qDR+9yP0N2WtJsUN7yXe+sBC8STnd7Pu5zh3vnYEbRW8diqo98FScYi1uXI8BTweXtKrFdf
 0WQF6OaKmXriV5mxmsaRfzbwZccmgjWYPSaX3BCoJkKaO2WN+rgBob7u1gnbA0HGBR9vSDu6G
 4dSp+uzEApcmYO+oWj87sycVBBxe/WxW90XG5Y3GwOzqtJLVUG+3Nv3OW97sw27sykpxgxbLN
 VWjkTjCUT5vzJxzHM8LFHRsvuE3lr1CZh+HfExo9kMD9ZOJzs8TdhxDhGLzPT62/rOuv/MRNg
 78A5gbp/TuL8K7sEME+yAClxS7U36dEL9u9l3OnLUTLMb6nVERvwq4Pv4T+kJHpRczMhtp7wK
 lYhJ+vF0RY4OmM=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=m4+baONM;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

On 30.09.21 09:07, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> With Linux Kernel 5.15
> commit 6abbd6988971a ("irqchip/gic, gic-v3: Make SGIs use handle_percpu_devid_irq()"),
> the on_each_cpu IPI_CALL_FUNC interrupt active flag will not be cleared
> until interrupt handler finish.
>
> Without Jailhouse hypervisor enabled, everything is ok, but when
> enabling jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1
> is actually accessing GICV_DIR when eoi_irq after enter_hypervisor
> return. It not able to deactive the interrupt that is actually a
> phyiscal irq which in active state.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> Note:
>  Not tested on Hardware.
>
>  hypervisor/arch/arm-common/gic-v2.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
> index 31371de9..8a9f6201 100644
> --- a/hypervisor/arch/arm-common/gic-v2.c
> +++ b/hypervisor/arch/arm-common/gic-v2.c
> @@ -101,6 +101,7 @@ static int gicv2_cpu_init(struct per_cpu *cpu_data)
>  	unsigned int mnt_irq = system_config->platform_info.arm.maintenance_irq;
>  	u32 vtr, vmcr;
>  	u32 cell_gicc_ctlr, cell_gicc_pmr;
> +	u32 gicd_isacter;
>  	unsigned int n;
>
>  	/*
> @@ -168,6 +169,10 @@ static int gicv2_cpu_init(struct per_cpu *cpu_data)
>
>  	cpu_data->public.gicc_initialized = true;
>
> +	/* Deactivate all active SGIs */
> +	gicd_isacter = mmio_read32(gicd_base + GICD_ISACTIVER);
> +	mmio_write32(gicd_base + GICD_ICACTIVER, gicd_isacter & 0xffff);
> +
>  	/*
>  	 * Forward any pending physical SGIs to the virtual queue.
>  	 * We will convert them into self-inject SGIs, ignoring the original
>

Martin, could this be the issue you are seeing? Are you already using 5.15?

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/de40c4af-207c-f96a-9acf-7b2a33d38957%40web.de.
