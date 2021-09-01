Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEV6XWEQMGQEGOHWI7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 5008C3FD86E
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Sep 2021 13:08:03 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id q5-20020ac25fc5000000b003d9227d9edcsf905743lfg.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Sep 2021 04:08:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630494482; cv=pass;
        d=google.com; s=arc-20160816;
        b=yV3bcg89Wf5QtF22nbcYFSsMZnv+nr/Zb8QIB+Abj15la/5XY666hAvz6H2TaUSNxT
         taS1lEKDNZtr9BUC4VDBmk/rQy8U3Ch7dbDDaNFVfPO0CQ4bGIXXo8h7z00mQa+0cjl6
         1whniEXVL9bgZpVMLgGwlfDK8nn+WciANkDeO4qY9g1caXykQfF0SxifKJUjvv5NkOMt
         ps/nZOycJdVVT3KO93ji1VTw/XEwWnn45mAWQTickpj7V7boXmAewecQPMqpXy+ImGsm
         2LBB/03jYuSl96oTOXnjod8vJOMaIUdVdH02GXhx+wTabFT+heOPV9cqKcm5MxRgFR+6
         es8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=e34AgU0nHB67IsGhGduVT+FUyf5aoopVvwQL2ZB4mtE=;
        b=V8VaUfPzVOaubI+jXdD5yr//SUcg+hlX5qqZw58Qm5UJo+9/jw/+VqPn9C3J+gh/Y3
         F6QW8FZXAxKpEcCwZlBkKiNsbi7psEPM+/Bvtj8p7SaCKtFHzAUfpUq7bE/uiu3cCC4+
         NIOdEfbjFOJ0MH72Etsf95LOnPnocOKkMano8PPSNx+6Ig395491WpcYqpH2x4swPE8a
         kd0G8tSM0/jOxWhDe8lVFQ3qp/XfffCLMBat+lJpGJ40QdDdTvqOgFvD3xiida+Q2q9z
         1OAuEab7veCuhlPWcJkXkHzgrHJXprz1t6GaUKddy+CX3Y0/AifRa+owk1x7ZDhUNVfJ
         Kb6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=e34AgU0nHB67IsGhGduVT+FUyf5aoopVvwQL2ZB4mtE=;
        b=d0IymNls9GxU0UKTFMv0wvwhGj8fHb1dx4K9OKvSdlVOl8N0ce3OPp1wZ32CKF5DBO
         zYILG2apSC0xk0Edbf8ssm11+7WDTJTsvShHGiSK+DYOsCJqA6ymk527V2Qhdtv0yZT+
         KngRiUkBrIbmn4YwsDWYG/89HaqqlO2+FtxjqgSq3VtHjo3MCJSB4MNr7OaqQqxP0oRX
         EjSXIRQsPTZ+qQS1MEwOXlaXqQd8OhISzWPQzzdE3AcR3Ck/knTKcgOkRERI98sryg9P
         0+Po3dV4VEzg6sH13/cYBFRDAU59NnXSTrIhFQHWqnzaEBol+hRdHecJjQC+Tl03E8oQ
         xz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=e34AgU0nHB67IsGhGduVT+FUyf5aoopVvwQL2ZB4mtE=;
        b=jcBgwZanKl1MJEOOsZSwnlkKFoU/xI29BVbRc10wEP/MFBcCjoWBotwlDffoXqOZKm
         YzHkdKLz9XDpG0oJ1+uzjjM48199Xxq/EOu2kFQMyx6RsiQ2hST6+GITWKV7b/5rARzF
         YijLBSWmsbcafUseuI8SBAFaT89MQBHjh6n+6789tzeLJqG71SNTrj7xWj/ux7JjIKsm
         ZFJ0OhUdCx5dTZfRmQBeFc8TrM7l8TrwGZ9H7J8xPCakwAojbNzKgCG7EWpQvN41nbVD
         smQfnl4hFTTS2KdY8kd8BFJl3kL+KjxKxBALl5iKPE4ptuDEGi1tIAAASgU+pRXMQJUE
         nkDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530siDU+Dto7XGhRFbTzMlD8YWCykIBeBgGAJQShUBc17sKCvYGQ
	Ib460P9RLzj0GqSlLJlq85Y=
X-Google-Smtp-Source: ABdhPJwrTbOZcnzHcGesjn6WihH+c+CkxOdeuf6ttzBiaxhLMTTo+MV8dbiYgi7lzDKaUN6run6BZA==
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr29439893ljj.321.1630494482790;
        Wed, 01 Sep 2021 04:08:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:4016:: with SMTP id br22ls985872lfb.0.gmail; Wed,
 01 Sep 2021 04:08:01 -0700 (PDT)
X-Received: by 2002:a05:6512:4da:: with SMTP id w26mr12115819lfq.576.1630494481479;
        Wed, 01 Sep 2021 04:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630494481; cv=none;
        d=google.com; s=arc-20160816;
        b=honbuWYEq43aawaVodbTzNLfmcBsVMRkE4tnXUUCMes6qnOofBbmOp3KCkm2yilyqr
         Q5nVEHcDuvsCaLpeN+YRDsGHhL+Dmjzjm+XdGcOJa797PMeas1pErP0U+ViELDzlkwoM
         NlooqTy8p97eX7QTOSPQkUjMxCL9gq2oAyQFPp7aZyKFVdRaJabg1QHh3777CNQZtWWL
         FDMrHg3EkUPL0NyyLC9VV3ko9i11iKzac+ampOLdN3FIz3P4UUMojJKDe0+Vl2u7BaL3
         1faqvrDfiuDxOmIKYFmMDjDoUSGvlEtz7wY/rX5okd978kTOUJYcl69HebpMsQCypX7/
         eDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=pIR/mciaTxuzQNHaq6ev+qeFG6jo2ZNH+ujlfNbXJlc=;
        b=K1W3TeaVShB05TBlcBM8eHL3MEolaztSR/bs+N+kitMSBGZrnN9qrG63mB68ZM2gmS
         l8rxc3qTXXiFqQ6I/RRBAo8DjR6+hvL51wAv+KJkipmXq2JLhl/a6u234A1gDFhm6lMP
         pvQfS3hGi/Aw2lDUl0N9HfT/tPylKyxEjJb+Z1NybeJy6rr9rW151AB+GcM6IVSUJcow
         4MfA924xjDk/nOYpjIh5fimVMfODW8zrkFCic5gNPW7LVg8J4NT7jUKTjY2kesFqoej7
         ZZJKCXXJ3b+tJqBtLSc11qW8gR2rkhV4raV76Cu06vGXWoTgVfILI0Oie6g6BKVjVm2i
         XYAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id t7si453803ljc.4.2021.09.01.04.08.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Sep 2021 04:08:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 181B8052010802
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Sep 2021 13:08:00 +0200
Received: from [167.87.73.68] ([167.87.73.68])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 181B80Tk026872;
	Wed, 1 Sep 2021 13:08:00 +0200
Subject: Re: Error: FATAL: Unsupported MSI/MSI-X state, device xx:xx.x, cap 5
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB66630A289AFD9FCF2EBFAD7EB6CD9@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3e7cea78-3cba-030a-3896-0607fda06f9e@siemens.com>
Date: Wed, 1 Sep 2021 13:08:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB66630A289AFD9FCF2EBFAD7EB6CD9@AS8PR02MB6663.eurprd02.prod.outlook.com>
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

On 01.09.21 13:01, Bram Hooimeijer wrote:
> Dear Jailhouse community, 
> 
> Currently I am running into an issue enabling Jailhouse on a x86-based server 
> platform. 
> 
> The error triggered is
> FATAL: Unsupported MSI/MSI-X state, device xx:xx.x, cap 5
> from hypervisor/pci.c, line 833. 
> 
> This is traced back via
> hypervisor/pci.c: 		pci_config_commit
> hypervisor/arch/x86/pci.c: 	arch_pci_update_msi
> hypervisor/arch/x86/vtd.c:	iommu_map_interrupt
> 
> where the check irte.field.sid != device_id fails.
> 
> The device for which this fails is a PCI bridge. The check fails for
> vector 8
> sid  0x5F40
> device_id 0x5E00
> 
> The device_id corresponds to the upstream switch port, the sid corresponds to 
> the downstream switch port. See the sysconfig snippet below.
> 
> The sysconfig discovers 8 msi_vectors for the upstream port, so this failing at
> vector 8 makes quite some sense. However, the value of vectors in
> arch_pci_update_msi is 128! I.e, tries to access up to 128 vector, which seems 
> much too high. This value comes from union pci_msi_registers. Could that be 
> misconfigured in the case of a bridge?
> 
> Does anybody have an idea what goes wrong here?
> Is this on the Jailhouse side, or is the switch misconfigured?
> 
> PS, Removing the bridges fixes the error.
> 
> Thanks for the support!
> 
> Best regards, Bram Hooimeijer
> 
>     /* PCIDevice: 5e:00.0: Upstream port*/
>     {
>             .type = JAILHOUSE_PCI_TYPE_BRIDGE,
>             .iommu = 6,
>             .domain = 0x0,
>             .bdf = 0x5e00,
>             .bar_mask = {
>                     0xfffc0000, 0x00000000, 0x00000000,
>                     0x00000000, 0x00000000, 0x00000000,
>             },
>             .caps_start = 80,
>             .num_caps = 12,
>             .num_msi_vectors = 8,
>             .msi_64bits = 1,
>             .msi_maskable = 1,
>             .num_msix_vectors = 0,
>             .msix_region_size = 0x0,
>             .msix_address = 0x0,
>     },
>     /* PCIDevice: 5f:08.0 Downstream port*/
>     {
>             .type = JAILHOUSE_PCI_TYPE_BRIDGE,
>             .iommu = 6,
>             .domain = 0x0,
>             .bdf = 0x5f40,
>             .bar_mask = {
>                     0x00000000, 0x00000000, 0x00000000,
>                     0x00000000, 0x00000000, 0x00000000,
>             },
>             .caps_start = 92,
>             .num_caps = 12,
>             .num_msi_vectors = 8,
>             .msi_64bits = 1,
>             .msi_maskable = 1,
>             .num_msix_vectors = 0,
>             .msix_region_size = 0x0,
>             .msix_address = 0x0,
>     },
>     /* PCIDevice: 5f:10.0 Downstream port */
>     {
>             .type = JAILHOUSE_PCI_TYPE_BRIDGE,
>             .iommu = 6,
>             .domain = 0x0,
>             .bdf = 0x5f80,
>             .bar_mask = {
>                     0x00000000, 0x00000000, 0x00000000,
>                     0x00000000, 0x00000000, 0x00000000,
>             },
>             .caps_start = 92,
>             .num_caps = 12,
>             .num_msi_vectors = 8,
>             .msi_64bits = 1,
>             .msi_maskable = 1,
>             .num_msix_vectors = 0,
>             .msix_region_size = 0x0,
>             .msix_address = 0x0,
>     },
> 

Does
https://lore.kernel.org/lkml/8f9a13ac-8ab1-15ac-06cb-c131b488a36f@siemens.com/
happen to help in this case as well? Just crafted it recently after
seeing spurious MSIs on enable.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3e7cea78-3cba-030a-3896-0607fda06f9e%40siemens.com.
