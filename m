Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB27R5SEQMGQEQMDVQMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D6406A61
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Sep 2021 12:52:28 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id x10-20020a05651c024a00b001cf8e423d60sf711424ljn.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Sep 2021 03:52:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631271148; cv=pass;
        d=google.com; s=arc-20160816;
        b=JwZQYrGOIuBJajeTyuTzNsHG3jSVSJzcYjkfc2BPgtzKTBZqO7B1j9gVNoRKldQWDm
         3kpeU+0IkebGzNsbAX5rV7zcxVcnElxQ5tK9QI/F8zkN8hE/17YjPnc+lc6i1vxij5bR
         +RAesXW1wHwlg39UOGCL1utgqa2qL6P5NMBYJlGN11Fmbd7s3beuVJeRXxAEma74h8Dh
         WUlaQTvwogAZVgxJbCjLY16jRW2k2ADFDc1vsp145VmnBJdJ6iKItAm5WPu2Ne4yHKxe
         t+s+C4IHIa3H7/l3QFseC02roYz6vPTRQ7QbZ86edGt67Mt+km+U4bAVwyMHHvkrGmjw
         y/UQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=nAgMoeQifz8UF194YiHnT79RcM6ocmrUQ/f0e2Chvvo=;
        b=QeAV+UkyC6hWK02SXBGFPQRgRPMJyK8yAjoEuSzhukSQfWgExoZdQDSye26jCmjcUe
         3quijulfWvsjB2mJvnvdv+qVJYmn+6lLtuZ++FyDE/U780MQRp0VmOJHxe2xCvuPPzdE
         AfxQ2ItiUJkEbgb5Tw+2K+Q17hrmsWP3aj9ttmr21VjbBeOh36jpoUhFg4xvoY9shlav
         SOQvsUrgz/KAsjIFOMy0UMe/H2rOCSRzl9RkXaVPTvj8vHsTGqiiAC92vzlgK4e7Mv1w
         OT3t2/q+211Eh8GClQE4rO4zqIGF21+5yya8Hfk1Gq5GSjV5uu9Lyjqv83skQzu9Zo/u
         dRVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nAgMoeQifz8UF194YiHnT79RcM6ocmrUQ/f0e2Chvvo=;
        b=SRJFI/L/z6q0aGCpgk9AaXPt0Q0Ji2lF8xORY8KJQZZXwRH/HZIj13zTGUNp7T8HIq
         Gza6t1d/zGdVTa4iACkXHVb1oRXjdZ2iyGESPy6raGf+w50eOgVvFvtFpZvdmfIAxCWE
         0LC3GiRpt+b7Gcnxz98IcXAe4ilZ8b4U0AI8ikI93OOVrvgwHa2PzLlUSBe/d4goe6Ux
         iXczv7mqxu5PswP4q44cD1ffddmJF/Vj2T7JjGLClQqVZd9kfSu9hVi3YbRpKr9e49W8
         3kk4xyX4hWY98dMpecfenALX5rh2FVc+dvWjafLp5thMPDYnQy2DrFWGUsbTjIeBXG/S
         3Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nAgMoeQifz8UF194YiHnT79RcM6ocmrUQ/f0e2Chvvo=;
        b=kB4/QSxnvDO7ZXwsM3Og6h1SJtx7x7wZnQogl83RvoegRsuS5eDxSOU6rorHgxUzJ5
         1Zng06X5SBMtwhwsteyJZ6UBd0ZQZtnpsXomCV+UhCGlVnSVeAt1XOGtbLt4t6R34Fau
         xEiB5LKxCPe6VRBMm8NYe4GydfzTfH/bLWecASNqKfTAXJR9rEI0n60v1cLJpgpFv2x7
         5JtWxXm+W5X7QTzZp+SxP+L1dNch0I0Zh1gCIRx3VllWboHtqYo4OEwp1aWO9rw6bzxr
         di/9daxe8P/Ubc6woWHOAknaFITyhOXeZ8ouZimV/uF4xAM2i4BSBUbUsu4ulUkd8jJV
         Tx4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533SVcsoYMBcHrsnAKxfKdy+kKVeLHoYLxrM0w6fyw+24JuijMBs
	Y2KChWzRrhCktYafbKuPLpk=
X-Google-Smtp-Source: ABdhPJySstSumfmYbqUaAmu6LMbrpMiPTuzSh8OH9W0nMjK6YdhMyUADaZaJoZ5IQMwpZhAj+2Rvuw==
X-Received: by 2002:a2e:b5dc:: with SMTP id g28mr3656032ljn.96.1631271147832;
        Fri, 10 Sep 2021 03:52:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:13a9:: with SMTP id p41ls2597574lfa.0.gmail; Fri,
 10 Sep 2021 03:52:26 -0700 (PDT)
X-Received: by 2002:a05:6512:3987:: with SMTP id j7mr3507178lfu.280.1631271146376;
        Fri, 10 Sep 2021 03:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631271146; cv=none;
        d=google.com; s=arc-20160816;
        b=FhqklTxyVrcqIepxWPPVVnl6SU6xYXqM4tzOdrgapR8wNuZeen22qL01b+c3lNCX4F
         mpuukatVhz0YrMPwTaVfadFUSlmxusm0oPYA+s1vxYExuhaZGjYMB+voR3RU+8zGa7oY
         PaVlEDAIKKPwXKy3ov+m9BGXWKKc2WbqJNhvRlFtA917IAIV01AauuBxbeB5UVbHP17/
         qbDlhxWG2GgM6zK7KFmRLHMaIIojXf8Eq1iyr90pi1nJxrcTpakF+uVzEEfMPDf39KFp
         WDIYjy3uG2gcP/t7Cy8vs3JbNNQaR5BWldDc6ETHpmybJ7Lcsj45I6L/aTnH1K8ZJgRf
         O2LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=yxfIW0HbTsAALClgo1jA0j4d+W9wtdYKlOToTxu32xM=;
        b=giUUuM8+d/tCr9cj6lXd9xfDCXUGxSP7+usLRe3XxC2BzUbmldlSmq7G4fpMN8bUSx
         kTPz0aU/cG0S5JE7hJbgMHd/Cp9kr4pp1w61M68VvPcRQhMUbqdbD/DsmoZvXsPwfppe
         PeeSe6kgxoWACuak8Arp1Yi2g8Qn00aYwTB7QH2+YBKpn/luVX6RLMAaspKcpea4b18K
         TUgYbGXmHMVc7pqpm4NcYACmaspa30092MEg/VGmR7dXbWyr8b4sio5ican1A0TQdN3M
         IxFaWojnoa5isNPfAnEsNvD3maijomX29Iy6hF69c2G3DnTU6WqDiAU/cR7giZcetd6b
         ncxA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id n9si331920ljj.8.2021.09.10.03.52.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Sep 2021 03:52:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 18AAqP32008570
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Sep 2021 12:52:25 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 18AAqPfD030822;
	Fri, 10 Sep 2021 12:52:25 +0200
Subject: Re: FATAL: Invalid PCI config write
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB6663EB3E5EBA4CBBF44D1C1DB6CE9@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5e385f8b-5af0-444b-0a4d-9904534ed719@siemens.com>
Date: Fri, 10 Sep 2021 12:52:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB6663EB3E5EBA4CBBF44D1C1DB6CE9@AS8PR02MB6663.eurprd02.prod.outlook.com>
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

On 02.09.21 14:59, Bram Hooimeijer wrote:
> Dear Jailhouse community, 
> 
> We are currently running into an issue when using PCIe caps beyond 0x100, e.g.
> those in the extended config space.
> 
> We want to write to some address, say 0x480. We assign the PCI cap to the
> non-root cell as shown below.
> 
>> .pci_devices = {
>>         /* PCIDevice: 3b:00.0 */
>>         {
>>                 .type = JAILHOUSE_PCI_TYPE_DEVICE,
>>                 .iommu = 5,
>>                 .domain = 0x0,
>>                 .bdf = 0x3b00,
>>                 .bar_mask = {
>>                         0xff000000, 0xffffffff, 0xff000000,
>>                         0xffffffff, 0x00000000, 0x00000000,
>>                 },
>>                 .caps_start = 0,
>>                 .num_caps = 1,
>>                 .num_msi_vectors = 0,
>>                 .msi_64bits = 0,
>>                 .msi_maskable = 0,
>>                 .num_msix_vectors = 0,
>>                 .msix_region_size = 0x0,
>>                 .msix_address = 0x0,
>>         },
>> },
>> .pci_caps = {
>>         {
>>                 .id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
>>                 .start = 0x480,
>>                 .len = 0x80,
>>                 .flags = JAILHOUSE_PCICAPS_WRITE
>>         },
>> },
> 
> If we now write to this address, we get: 
> 
>> FATAL: Invalid PCI config write, port: 0xcfc, size: 4, address port: 0x843b0080
> 
> Even though the address port looks correct. Diving into the hypervisor, the
> value of address in hypervisor/pci.c:pci_cfg_write_moderate is 0x80 instead of
> 0x480. Due to that, it cannot find the cap.
> 
> The same happens for reads, however, with no cap these are still performed
> apparently.
> 
> The wrong address seems to originate from 
> hypervisor/arch/x86/pci.c:x86_pci_config_handler, which has the following
> snippet:
> 
> address = (addr_port_val & PCI_ADDR_REGNUM_MASK) + port 
> 		- PCI_REG_DATA_PORT;
> 
> The extended config space, ie bits [31:24] from addr_port_val are dropped here. 
> Hence, no config access can be done from 0x100 onwards.
> I think this should be:
> 
> address = (addr_port_val & PCI_ADDR_REGNUM_MASK) + port 
> 		- PCI_REG_DATA_PORT
> 		+ ((addr_port_val && BITMASK(31,24))>>16);
> 
> Is this a bug, or is this intentional and did I misconfigure the PCI extended
> capabilities? I can happily submit a patch, but given that PCIe usage is so 
> common, I expect I have misconfigured something.

This is indeed likely a bug. Just checked the Linux code
(arch/x86/pci/direct.c, PCI_CONF1_ADDRESS), and that also considers the
upper 4 bits for the extended config space.

I guess I was always under the assumption that only MMCONFIG would
permit access to extended config space, and all target configurations we
used to far actually showed that behaviour (likely because it's the
faster path anyway). Does your target have no MMCONFIG space? Would be
good to understand why only your system ran into this.

That said, we could also extend the access model in
hypervisor/arch/x86/pci.c, adding the upper bits consistently (3 places,
as it looks like). Maybe PCI_ADDR_REGNUM_MASK should be converted into
something that translates the register address into the address port value.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5e385f8b-5af0-444b-0a4d-9904534ed719%40siemens.com.
