Return-Path: <jailhouse-dev+bncBDNPJEGU2MKBBC772WFAMGQEBMQNNCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF041D60B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 11:12:44 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id x26-20020a50f19a000000b003da81cce93bsf5566114edl.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 02:12:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632993163; cv=pass;
        d=google.com; s=arc-20160816;
        b=xVt1wsSPppglcpJdNh78tQOejC9/69R7r6tjtNQo9LxyMeDvWOb80K+ifAX61fXkRK
         CM5E537SkMqz4sdBHgj7G5BVTzV/ngs14+QBEd/bbHaY8pLOWn0IG0F2h/dZ1jPXMyxY
         Xmc/BkbWV94IwMDv9r5bq3h12j0HaExyQdS5qKbneTb0snkrejRpcgRZIJ3NIv/tKbaE
         5T4H7yz5e66tbLw9vgTfDMv7qKDdKp+aI6CWXWx70mqKJlwELa/aA8QiLrEIwI8L/V0P
         ClUcaJCTF7Xx1gnChjfc/iJwKHuugwiDQjI8ljDS8/x/90jvXFudB5my0D6DC3uu8+tV
         GfIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=pR5VCL8tSrds8Zs2ttzF5bUnCGgMRVOOvM5wf/Z+Ufc=;
        b=myJ5MVmy+PDWuU0m9a+np9oikT0Z6xRY6JAdbL6/350foRdinpG+r3jIxjYAUYtJvL
         IeAee+71cVGL0LP4jpHCLXCAfkx1w3RbfLPx7PB1dkwKy+bJaFopf+FxUDkyJl829L8q
         vNe5fLyRO+/oguHuLYvEriiiGpD9qtCiv+0GRva1nysr0di7hWLe19zgFKzLmk3x6kWh
         /bb8HwDhjYh//rWO/COhQZs3smEXzaoqFIaPQ+ku5tJVcHCTndnX6injtCHx/6TPWC18
         PcEGqD949n8PEDzZBXc4Qh+nOf1Wtz07kQi6C5KsPobPm1bpFFgvo2JJtmMlq2BAeLmI
         eroQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=Ikiz83P4;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=wMRM1rQO;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 193.142.43.55 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pR5VCL8tSrds8Zs2ttzF5bUnCGgMRVOOvM5wf/Z+Ufc=;
        b=f7DJsySi/uwe5z1fYXE5/44zTU4waW4jJ0ZbatMCAfgy9iwfJCLERIJIGeV3LPCWA2
         y6bkWiAlyfvmonspgCCIxu4Z8Bpmj4ZeAeJUcoFxLc37Ii61xmeqemBCRoxOQEsRnl6Y
         pId2k74HvVuovp1V54av209CbCtvE1ywq0ZCj8vrq5YBspZAt2wXbpRCF5thKeHdwqX9
         m8cRCPiW7Ue5RCSrb8o5SSSHezurjkMYRWRM2ocSpk62ljMTVRvrn9NQcDbkvSQm940b
         ePuHYCaswpYuQ9dRsdp9p4cQgVq9n3AYd9rw2+5dR5DLzsjZNmgAhQ1/+Ccd/LlURHZq
         aU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pR5VCL8tSrds8Zs2ttzF5bUnCGgMRVOOvM5wf/Z+Ufc=;
        b=ErV0VUIG9g2SH5sjyEo4lH3SHjFLolmOPAG5Ax7kIRF29w1tJ7gccSOEe+ISEMxSrP
         EVw5r9o9xQEUyspGSHZLNX41w6ZLdKiXuJ4LccG/AeXO/qAdCgGog/7xsGdT+tNBdYI8
         YcNnYG9nTXyC5X7zkc9ciFgnH0bpERlODg9IpOxcf19ol9q1tl/H9qfVg7zVCBKsyQ/9
         D0QJzgPNrmVz1PeF13G3D0V9KuFv1keQ57PToFgU3iVBwpvNfK2kMV/ccWcINW02AFMx
         /tFm9XZ7vGIM2S+68XSZvNukTJMfIER3rl1TZftHcHHVgAiXirmjI1kFwhGDg0GL4Wwb
         qmPg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531IIGQHYBspKCjQZ7mXFLfI2NUyozUmYdXxGJHxwURnNX+ZkW3y
	mnHkF6Vpr8iXeFxrbaD1P8o=
X-Google-Smtp-Source: ABdhPJxzdleRw9EUCncGe1oM2g/Dw3Wm+GmJtp+5VA1Se9pM4oJYlOKZrwKOa4LTy2Jrq+kFXwrJ3Q==
X-Received: by 2002:a05:6402:1a23:: with SMTP id be3mr5786900edb.372.1632993163813;
        Thu, 30 Sep 2021 02:12:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d1d6:: with SMTP id bs22ls2260211ejb.3.gmail; Thu,
 30 Sep 2021 02:12:42 -0700 (PDT)
X-Received: by 2002:a17:906:a08a:: with SMTP id q10mr5285687ejy.100.1632993162881;
        Thu, 30 Sep 2021 02:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632993162; cv=none;
        d=google.com; s=arc-20160816;
        b=lNMtshYaDQzJA9CVVCjx41SHk8oFd20euE82wugOivS6OvOaeg+igjXTZQa5d9X78R
         v0rPRUqdkjJh5XdOdqLkMBPhkgWp5PKytFy1NK9j1O/ueurWcnIw0WGwB/NJN7lzZ+r6
         JBndAKkk/FMMg0w46p7wYXqh/8hE/JAawffZFspZ18vSkHfEV+Bopj6GSYLwXfPdNay6
         Nnb1IfwI3A5Y4PT4abZ5V7tl+wAuaWJZV2M3W3jXsJw6htlId9h24FtkHcOgPBSPLFEH
         KIAlVKY+ANY3Xl6bnr7gqaMTeFVpehetUHH39Pnq2gtX31D3nmfZsm+fCcdIRb0xNz5N
         Fkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :date:message-id:from:references:cc:to:dkim-signature:dkim-signature
         :subject;
        bh=Z7f+6vukd1Yfn16I+cDagwYhYI1gNE+L73cY20iZ8NE=;
        b=EPresBOsR4xMkE4NhLKz8CQTjSJMxarZ2be0h78D+wQa9XWlZ3+ywxqjDZ3ZeOKYdH
         Uz96hg6yOEwwqcIwZyGOMD/0lq7PuS6Cr7KwP/1J4k7qiQzm65nGAvktbzKJNUbx6KVA
         osdzCyzY/Njx+Y39XLqdaosUGv+JfEdKGTtzeP8+Z8V2nyo05u2psiqdHmxkWqRyVBtJ
         Hh2QQI6l76Cxt/j9j6kIdM3lisPiU1Bn4vutru4j5ExeonDOsNRvf7YujKkGnuelKxii
         SDaXk1gv5lFaKRQw54Mr5zeXrWNJk2ltHGJEjQ/+dinozLit1w+MBL6UxLskH8Mi3iCt
         fVTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=Ikiz83P4;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=wMRM1rQO;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 193.142.43.55 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [193.142.43.55])
        by gmr-mx.google.com with ESMTPS id r23si198572edy.3.2021.09.30.02.12.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 02:12:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of martin.kaistra@linutronix.de designates 193.142.43.55 as permitted sender) client-ip=193.142.43.55;
Subject: Re: [PATCH 2/2] arm: gic-v2: clear SGI GICD active flag
To: Jan Kiszka <jan.kiszka@web.de>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
References: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
 <20210930070704.2315052-2-peng.fan@oss.nxp.com>
 <de40c4af-207c-f96a-9acf-7b2a33d38957@web.de>
From: Martin Kaistra <martin.kaistra@linutronix.de>
Message-ID: <942722a3-4e4e-c797-42d5-31488a063990@linutronix.de>
Date: Thu, 30 Sep 2021 11:12:42 +0200
MIME-Version: 1.0
In-Reply-To: <de40c4af-207c-f96a-9acf-7b2a33d38957@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: de-DE
X-Original-Sender: martin.kaistra@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=Ikiz83P4;       dkim=neutral
 (no key) header.i=@linutronix.de header.s=2020e header.b=wMRM1rQO;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates
 193.142.43.55 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
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

Am 30.09.21 um 10:53 schrieb Jan Kiszka:
> On 30.09.21 09:07, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> With Linux Kernel 5.15
>> commit 6abbd6988971a ("irqchip/gic, gic-v3: Make SGIs use handle_percpu_devid_irq()"),
>> the on_each_cpu IPI_CALL_FUNC interrupt active flag will not be cleared
>> until interrupt handler finish.
>>
>> Without Jailhouse hypervisor enabled, everything is ok, but when
>> enabling jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1
>> is actually accessing GICV_DIR when eoi_irq after enter_hypervisor
>> return. It not able to deactive the interrupt that is actually a
>> phyiscal irq which in active state.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>
>> Note:
>>   Not tested on Hardware.
>>
>>   hypervisor/arch/arm-common/gic-v2.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
>> index 31371de9..8a9f6201 100644
>> --- a/hypervisor/arch/arm-common/gic-v2.c
>> +++ b/hypervisor/arch/arm-common/gic-v2.c
>> @@ -101,6 +101,7 @@ static int gicv2_cpu_init(struct per_cpu *cpu_data)
>>   	unsigned int mnt_irq = system_config->platform_info.arm.maintenance_irq;
>>   	u32 vtr, vmcr;
>>   	u32 cell_gicc_ctlr, cell_gicc_pmr;
>> +	u32 gicd_isacter;
>>   	unsigned int n;
>>
>>   	/*
>> @@ -168,6 +169,10 @@ static int gicv2_cpu_init(struct per_cpu *cpu_data)
>>
>>   	cpu_data->public.gicc_initialized = true;
>>
>> +	/* Deactivate all active SGIs */
>> +	gicd_isacter = mmio_read32(gicd_base + GICD_ISACTIVER);
>> +	mmio_write32(gicd_base + GICD_ICACTIVER, gicd_isacter & 0xffff);
>> +
>>   	/*
>>   	 * Forward any pending physical SGIs to the virtual queue.
>>   	 * We will convert them into self-inject SGIs, ignoring the original
>>
> 
> Martin, could this be the issue you are seeing? Are you already using 5.15?
> 
> Jan
> 

Hi Jan,

I am currently running some tests with this patch and it looks 
promising. I have not been able to reproduce the issue so far.

I am not using 5.15, but the mentioned commit 6abbd6988971a is also 
present as a cherry-pick in the xilinx-v2021.1 kernel, that I use.

Thanks,
Martin

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/942722a3-4e4e-c797-42d5-31488a063990%40linutronix.de.
