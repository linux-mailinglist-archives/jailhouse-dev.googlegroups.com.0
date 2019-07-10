Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD6MS7UQKGQEF7JBXFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 4959C646DF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 15:20:16 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id k22sf1395931ede.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 06:20:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562764816; cv=pass;
        d=google.com; s=arc-20160816;
        b=IVvq35ftJZbgWw5H/40DhtJ1Uf/LRIaIP5rsZOcT/oe8vvT7B8qmocMccijljZnzHB
         ekucuLatDexTancOGGSceC4izZNEn+x3DhHbN0K7AQRNbQi/okS78m+T98f2BN+BjRTX
         heArG+aQ1+groHlOA/xggreA3tF+pxKyMGbse2IW5hWRroysfNCDgP7Sge8ihVTKAoX6
         mXdPf0bNOJ7/VGzFjYRALFz6HW+4haRPivU291GrapiRFKNV8WU/XzpDtHkzNvKbqFHO
         sei8MJPvmZHfoblTCsn2WRHc4GmdnWeHPA5bVNCFtkntmJJZkyCi3gKcfPkjWygl6Euh
         0NaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=UJy1qbLhEcwL/d0vwkZV4IwSMbZ/BYxpp/QQnBn4SCM=;
        b=RtdsqJBAXPFZHadrkceAaOX5hFjXBc9YNF8eKsDmemo5qXa81Zio7sb1Y2nFw9ycJQ
         2dZhmsBI9QpGOVVZzjnJU8tBpFauW0QFje9Pjr9vPKWlu2iGnWBIwoPVroS88YiSiwHZ
         Thv2ycQ01wWHEbK4TTDxpm/dFWQZMl5zP5zQEkCpUuDiHw9TyYAVWfeZYpDimrtDJtQ8
         BpFpQc6resBJ1D9Na8G+ZoT434Si/qhoGaZuaGa9cgRxLxQC0npxVa3mYbwKXGWlGhIF
         Et8W+d+Vw3EuKRRY+t3mHiSz1+aLpjWlxkca5a7zg4TiY/UQWym1lUcr5m2HT1NoAMCN
         bSGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UJy1qbLhEcwL/d0vwkZV4IwSMbZ/BYxpp/QQnBn4SCM=;
        b=R5cilA0m4VgLyVK1i9Ljivi9xtTbspRPT4ioiWPTkzszjNk7oPlIBWWDZ4iTa2LQSK
         FqMbptUlbrnyWQRXwNziXvyQ+RSUtFTTI38LDTin1AVvCatryADGtB0wE28KxAvrtub3
         4A1vJZH0TrRB1zVNps/W9WkV+sOJ26ZA/NyKRna0BGVkk/G02XzyWEztXBTvmx6OBk5c
         xtXMjXo0lrRtTzaDc4+Y+2kzujShzk+/LSKGufgd7budZ7ijOlc1fN1FTJv0Bgo14TOQ
         JSDv4R+cRKYNMAlrow72JgVf8WMUHUd1mM/f98IBYfjMdoXrUpGSw8Hhrw+PLy/spNfb
         hm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UJy1qbLhEcwL/d0vwkZV4IwSMbZ/BYxpp/QQnBn4SCM=;
        b=q+dcFHKTg/H2ZGSd5gzuHbi85leHjdXeps06HOxXcqjGqMvfzuE40FwHWG53mF+Xhp
         mLBb4y5dMv1hfHb+Kk8K3ogjuCWGwFeeqiR1XXbIsV45pBfLoFTmyrogu7E4sRAtL0dy
         jXbe9wkdcs8yBKVmy3A0LKNV1jtiPVhpDz9WV9B60Onto1Hgp08BPGxYRdCutCuHHlAg
         0+atgHY6W4OzFt1qEAPjFEK64lnt1T9leVrAaRhYvd5FxRzURkK0087CfcSyUk/O/32R
         6+6K88M9GjNdpKg0Cpu+2IdNBLB8HyNh0R9EN4GQHQjnigVvdVcvPWHDJ/WElE79IO2F
         WY1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW7NoSRhVtAb0XffhN970xgbROXcGuqtxvoPWFczJeZda9/JPWG
	myWhFieRYu+v67LfWrGMY58=
X-Google-Smtp-Source: APXvYqzLhRQQlRbcuiSNqSmd/T9O9N/NhvYfFciKwaVbna1qOOVjgD2rj4DLO6kUElL8ebwY5Q0XFw==
X-Received: by 2002:a17:906:80cc:: with SMTP id a12mr26438619ejx.132.1562764816041;
        Wed, 10 Jul 2019 06:20:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6c4:: with SMTP id v4ls570264ejb.12.gmail; Wed, 10
 Jul 2019 06:20:15 -0700 (PDT)
X-Received: by 2002:a17:906:ece7:: with SMTP id qt7mr26774373ejb.155.1562764815307;
        Wed, 10 Jul 2019 06:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562764815; cv=none;
        d=google.com; s=arc-20160816;
        b=wNjlc5SzmdG1T4f9DVDE1di0XUmoq3V2JP2MiLo6pB0IOqJYfiD0BUyzV3tqdl4wBY
         e48kyCyl0wQVxfUY+0QzCGa4oqaH2tcpR0ibUSvSm1m6IrgYTPRqEMU4KYGGH2A8a3RY
         l6FgiZzwr1quY3TG/JcWTaPLRgl1nXCymre8ELblAm7mYYp47gl7wpVD/9iVF06C17T8
         vs5Q2vF1uwYgKCE2FffMSvZ2gmoJFbjKGFP2BltdjbJRE229CuXzRrj5rMSIwr6ErupE
         EK63UAAh7UeAxOpYFmv9I8hkaqgv6r+mcReBveD67ivTKHRkWNq0nij5l2xp58xh0eLD
         RFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=VWhlALs/7Q7ieE0JoadK+5ZVYzYjDJONfoOP+ZAn8UU=;
        b=iX5faJAZK7sgB1f7riKJ9zJ+Xiu3fxNWTVJ8u+dASGn2pE+YS9azNaW45N4v/za8X6
         ow4dxt8X2hEeumfs6BV+quBw8XcO6kp0HRDeCzrewwgQj9ZtpD/O175qldzQM0zzCzzI
         NaJJclsxHXBMmT52yMevgMSJCwhwyPCMrNCHI+IYseW0I0hlN+5uZOQSqwMKK0NzIPQ4
         hCPtBggkP2L1QvkFhLFFM6BuAsPd6oBAc3ZHgnvSD8SHHY910vxM8mgwzdWytdp09SM3
         8pBPwcrQNWsx4I5Zs05lyS1DedAy23MB0W1ELkcqcJwW8DQ88U/T59jEH/dhsM+uCoJR
         iw+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id b39si169780edb.1.2019.07.10.06.20.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 06:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6ADKErn014186
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2019 15:20:14 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6ADKE2q017351;
	Wed, 10 Jul 2019 15:20:14 +0200
Subject: Re: Assigning a PCI device to a non-root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <7f2b8593-b6bb-353c-1eb8-604076f7da6b@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <521c1b04-ab40-e566-5625-5827d3a7f2e2@siemens.com>
Date: Wed, 10 Jul 2019 15:20:13 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <7f2b8593-b6bb-353c-1eb8-604076f7da6b@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 10.07.19 12:19, Ralf Ramsauer wrote:
> Hi,
> 
> on an Intel system, I'd like to assign a PCI Device (dual port serial
> controller, 8250 compatible chipset) to a non-root cell. Please find
> more details of the card in lspci-root.txt. This is the card as it is
> seen by the root-cell, before being assigned to the non-root cell.
> 
> As exemplarily shown for an E1000e card in linux-x86-demo.c, I followed
> those steps to assign the card:
>   - Add memory regions
>   - Add the pci device
>   - Add its caps
>   - Add access bits to I/O ports
> ... to the non-root cell configuration.
> 
> In the non-root cell, probing of the card fails with:
> [...]
> [    1.551079] serial 0000:01:00.0: enabling device (0400 -> 0403)
> [    1.559060] querying PCI -> IRQ mapping bus:1, slot:0, pin:0.
> [    1.574310] serial 0000:01:00.0: can't find IRQ for PCI INT A;
> probably buggy MP table
> [    1.582375] serial 0000:01:00.0: Couldn't register serial port 20c0,
> irq 0, type 0, error -28
> [...]
> (see dmesg.non-root.txt)
> 
> 
> AFAICT, while this card support MSI interrupts, the driver wants to use
> legacy interrupts, but can't find the IRQ. In the non-root world, lspci
> reports this would be 0, which is clearly not correct.
> 
> In the root cell, the card has IRQ 16:
> [    1.921700] IOAPIC 0:
> [...]
> [    1.921811]  pin10, enabled , level, low , V(10), IRR(0), S(0),
> remapped, I(000F),  Z(0)
> 
> The non-root cell knows this irqchip. Any suggestions what I'm missing?

No. nothing. This is in fact an unsupported case.

The problem with PCI IRQ forwarding to other cells is that there are chipsets
between the PCI slot and the IOAPIC, and they can affect the IRQ routing. Plus
there is a high chance of interrupt sharing this way, something Jailhouse cannot
resolve when doing device pass-through.

Therefore, we do not address this case and only support MSI/MSI-X for assigned
PCI devices on x86.

> 
> I guess the kernel would like to access MADT tables, but we don't have
> those tables of course. So how can the kernel detect which IRQ is being
> used? Who or what carries this information (in case of legacy IRQs)?
> 
> 
> 
> Not related, but this issue raised another question: On x86, we supress
> probing of non-existent platform serial devices in non-root cells with
> 8250.nr_uarts=n. Why do we have to do this? My local machine doesn't
> have a single serial device, and the kernel doesn't even try to probe.
> So why does non-root Linux?
> 
> Is it again due to missing ACPI tables that carry such platform information?
> 

Exactly. We do not have any other platform information that tells it that there
are no platform UARTs to touch.

> 
> Last but not least: The dual-port serial card has one interrupt, two I/O
> regions and some MMIO regions (that I don't need). To assign the card, I
> could also 'just' map the I/O ports and the interrupt to the non-root cell.
> 
> Just out of curiosity: In this manner, would it be possible to share an
> interrupt between two cells? If so, it should be even possible to
> partition the card.

See above: Interrupt sharing is only possible if there is a single trusted
instance that terminates the common interrupt and then forwards it to the
different drivers. Splitting this between guests means driving the UART from one
or the hypervisor and emulating the other UART. Not our style.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/521c1b04-ab40-e566-5625-5827d3a7f2e2%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
