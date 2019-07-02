Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVHZ5XUAKGQEKKO2P2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F45D360
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 17:48:36 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id i2sf7084758wrp.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 08:48:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562082516; cv=pass;
        d=google.com; s=arc-20160816;
        b=Npg+SqVxAOu+XhX68AfpweA0voHHCyvMVMUDAUMk4ZYn+rbxH2OQBIYEwDKX+41ZcX
         7XrAvXxGXNQYFdIKP0liU/2naAVz9ijgjqZBS0aUYwOt6oQNg82DbPRbo9no3N0nQMsE
         jruK87qbQNdrGg/cvjSmwcg+xbD/S1T9iFZAx74XK6c4T2CUuSZTfukKuSg2qnqdQ6yy
         PGMSrU5FLHcznCPukqoywjEC1hv2Ahba5A5FOhJ2sb/oNNBhFc2GPlX8Vbh1SyTWPSAT
         5ItkZlv8xASNX//7RbURqx0DuV4leybMoDS/oz4KC6I5hFyAs+z3aWUZENyYUB7rkYqR
         /z0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=hYg5vOpRjR+vvrcGYSZoMkGwhtBnkjPGRhwjO06+SG8=;
        b=TstFKZlw6iPEFHadELF0zQWPzYwGJU4rbjV1c/qjJaMS2COqMnSRKjyZKR3EcJOFzA
         Se45UuEcVEeh1jUPg9fVEb82wq0cBOStmPoh7Gwc9f68CrWsLZyRVthtITGdtYX3rydO
         PrXYwAlGO6ZcobIMu5nTpOUWC3RytZUD27LVcovVerIo6xIrWUIR+0+SjQjzrsbQ4A39
         LeyvzBMircu/01nRazBm8UrFtpwfHZqoMk0e6UBM1lJBuMxbU9SaRfAcbaDK07KhOhIk
         nUYoRj1qAYvjbYaH70vdoYlHa5IEtNM6LQeIKzpCbUp3kZMukuKECOFhJx7gqpa224ZD
         B6cA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hYg5vOpRjR+vvrcGYSZoMkGwhtBnkjPGRhwjO06+SG8=;
        b=sIbcRpsQsfz1pU71YT5djMmpcjGCsMld8otdU61VLM1IVK8fL1+rc2OviWxUeHIFHq
         ZrNYahKitO4KwNt8arxsikBcVOmBgQSf2eBFEgv+08O3xmcg+sWLCjPLPPk12GOI65E+
         s6LAXXnjICRq5XGBycuTdjNBmr8PvzMq8Kl+NV7PHTvSP9lkGtbyONdXTnZPYCFIqrAE
         zjigFX/0+XfFP3z/G+/gJLUBCBCaHh9w8nu7LJtooBWTd2P76FyIz0Hu6Y4jc+UCmQs6
         N2/P4DjpsV7tTM5VWlL3XsGdBP9PDjyBs2SZXimBpfQooRfWyLy7q/bDCtKCqpLDlxOD
         YgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hYg5vOpRjR+vvrcGYSZoMkGwhtBnkjPGRhwjO06+SG8=;
        b=CN/Opv/IQhbRW0Ds6HbChieG+kGbzza1a3OUEPxETpQlUwDaNIvlhMjps+qX83AVFb
         VNZNpzqDVyZvF8KgjxvTx8qUZb8Rzl668oFG9KNnSnEx6MYGsBC7JwKDuGwJsc7H1+xl
         XwzQqbDmflAyS2f6CpkY5vOX/kQdP0fedfk3wxn798PcViztANdOniGEXW/GSZAs78od
         J8+hk0aZGQkBNyzIKPJCabIMnGeeRiXfbDHkqpDQrGuwG7hF97DL9jXFSvwrkBnai4G5
         YW/KSW3JI9PhldQqgCP5ytK4D+PI0XyaKw2+kI+aj1IIqyuhA161EivckMPdvbKxONql
         xzGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX9Wxwo7ZLCYRk9wTyCtmw8vAgb9csmZ6168oEjt72C6JUCn3VX
	gc0llLF+DUVfGQqvMUCaAm4=
X-Google-Smtp-Source: APXvYqwMgSFzBaiktlbesrJ9z9XpipRt485NJgdhh8jYKOM9VWe1hldm1KsHkGV/5yokE/MmAGzGQw==
X-Received: by 2002:a1c:630a:: with SMTP id x10mr4169104wmb.113.1562082516574;
        Tue, 02 Jul 2019 08:48:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d89:: with SMTP id b9ls3290392wru.0.gmail; Tue, 02 Jul
 2019 08:48:35 -0700 (PDT)
X-Received: by 2002:adf:efcb:: with SMTP id i11mr4512111wrp.188.1562082515968;
        Tue, 02 Jul 2019 08:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562082515; cv=none;
        d=google.com; s=arc-20160816;
        b=AmJ72KqS2xYjmrqyYiBEXqaMjBbDBkaCo5sJu5Dbg06qs2M1NSYkxYMg8cXBNBTcL8
         +NhtYF8gOAHdqNGou4N3dmPT9XoMAGoVl4+tZO6L6RJrEVuARK7zmaey4Mrs6yVrCoIr
         TEt3vNzdiQIFYSfpxAVPOj+iIvPx4jV3u8mhdC6VHUFVfxRj1wRIlRvntl5kehyn65BY
         OqaFe5Yazel8/owJSIN0kTeAQBN0UTyM/hAu/AYTzL+7vtib1AZIwbr8kWyzO8MxNyoC
         5eoA1RmtD+dSOezjsAdg+VrAP6luIG547Vyaq5dIXc8S0gR1PhPGkVLVTDFybD0yABTz
         jpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=SQVZD+VbrH3AO2Xj/qgSeqGd5Bkajwee/aEs7R7yUwM=;
        b=0voD4lidIsi1yIvDzyUjKNnd0AnWFy/ug3XshO751UwFb0LHazsKyQ9T7pB5a+6Ruy
         fBvXHXuxcADZe7y0LB4NuUWt5HoISKvFCLTN524oMssYW6nFp3CuaKoRMoHot1o3Bt+8
         QKGJ3slMHHc6onFPCbOWQlu9et5iDsymivDobiMr1OdHoKYids9RayQpY8H3PkQfMD0N
         Xvd8un6cMD+VpDrQPt6dJOdq0JqrKsxkS/zJEgwHzDjKHnPxCZf6e3tNOHF1mgX7EsEp
         EEHXZaVBPcat6kzKXmV9kLORXUjzrGg+K/aZGL0n++mi5nAqNbUiiAoxzxJiSB1K1sdt
         uO7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id j18si155835wmk.0.2019.07.02.08.48.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 08:48:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x62FmZTT019652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2019 17:48:35 +0200
Received: from [139.23.114.160] ([139.23.114.160])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x62FmYt4016628;
	Tue, 2 Jul 2019 17:48:35 +0200
Subject: Re: [PATCH 5/6] core: Move unit initialization after memory
 initialization
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-6-p-yadav1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bd22fee9-f3ee-0585-d98f-a411f8d58f1a@siemens.com>
Date: Tue, 2 Jul 2019 17:48:34 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190702143607.16525-6-p-yadav1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 02.07.19 16:36, Pratyush Yadav wrote:
> The SMMU driver needs access to guest paging structures, so they need to
> be initialized before we can initialize the driver.

No signed-off - because you were not sure if this is ready? ;)

The bad news: it isn't. The x86 IOMMUs have to be initialized prior to calling 
arch_map_memory_region because that calls iommu_map_memory_region.

Can you describe in more details why the SMMU driver needs that guest paging 
access during init, and why that can't be solved by hooking into ARM's 
arch_map_memory_region?

Jan

> ---
>   hypervisor/setup.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hypervisor/setup.c b/hypervisor/setup.c
> index e3b1b3c8..c4032f5b 100644
> --- a/hypervisor/setup.c
> +++ b/hypervisor/setup.c
> @@ -174,13 +174,6 @@ static void init_late(void)
>   		return;
>   	}
>   
> -	for_each_unit(unit) {
> -		printk("Initializing unit: %s\n", unit->name);
> -		error = unit->init();
> -		if (error)
> -			return;
> -	}
> -
>   	for_each_mem_region(mem, root_cell.config, n) {
>   		if (JAILHOUSE_MEMORY_IS_SUBPAGE(mem))
>   			error = mmio_subpage_register(&root_cell, mem);
> @@ -190,6 +183,13 @@ static void init_late(void)
>   			return;
>   	}
>   
> +	for_each_unit(unit) {
> +		printk("Initializing unit: %s\n", unit->name);
> +		error = unit->init();
> +		if (error)
> +			return;
> +	}
> +
>   	config_commit(&root_cell);
>   
>   	paging_dump_stats("after late setup");
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bd22fee9-f3ee-0585-d98f-a411f8d58f1a%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
