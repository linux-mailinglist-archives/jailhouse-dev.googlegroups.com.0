Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN6TTLZAKGQE6RFZ6RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id B904B15D904
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 15:07:51 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id f13sf7636682edy.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 06:07:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581689271; cv=pass;
        d=google.com; s=arc-20160816;
        b=AnrM7ozy/WZdgXjXA5l0nyGvkD2+5E2v7KEp54cZmr6MIiIVtXK+udEnrRPrJKvs3s
         GTvA9aODrvse2mjhBma9gnwYXH2Mq1ioJO1yE2jXf9R6lRuIrX+Xnq+EN0z6M895vSNs
         v9JKaZLabdjThqaIPEDIZZQRXyq+hfD39QgfSjNMJXighOldUsOOd3RXRmbxySU8x3xQ
         AN4zoB/DnQtM4CLUpywXmkiQKVxqVKSsYJAF2i0YpkWfPHX9Z9UiScnQV73udKR/sxpg
         657HtwarRuxy3Z0aoc+QLAVsvVCqGGNX21f+y6rLR9QoLGAk5VRpmdyF9cT8nKW9cMcF
         SifA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=IgeAC4lBoV2B8/J7oALXCZzsURDLKzfKYwV+veA9lFE=;
        b=tMe/5J6NcKu3qBUgajq5yqGQMgldrsO4ldrU20UpELou+o8N21ygZW+7cgjXgiT1bx
         7MMb2wUKR9UP24rOZ0JJ8JrES2/YMjm7o2qYrRmrMj1gw2CvQ0crpT9xfFJKye6f52Vp
         p1XkTwpFbXABXY943al6p+6ygqUPHjGfdybyJHw5Pa8wOjTpItOuB8doXo9p08dRZypB
         P7PSwVHhOzZ74yDFdcrQLf73QLFszbN1z7OPIbnAxfYbew+ODFBttlEzKi77dZyNwmyV
         6Chajt0PMCPrk7NymZ6VPLP8/orgF3vcGaWK2ly6/p91O5p8+riLKOD6N3QeM4RoBFCt
         fVhw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IgeAC4lBoV2B8/J7oALXCZzsURDLKzfKYwV+veA9lFE=;
        b=QOOJ8HikR/yuxzhK1fdXPMngNnPRyDKRzXoRUd3c78TJlL955fMH2iV4LX++BE9hA7
         qlr1Xlqk+poCbPcbfVgnBWJ6Op+7mGbfWNyhqovvcf5kkbnvuKOxSWS6CCaZJ32wr5FH
         SqMYphpeFhCXCAHTlkYVVJJHCJ2IhdOK8Js8LNH0tlfDLTpQS6sZ7ugGO++FXgDuRl21
         oTmQft+UIM8fIBF2qsK60bXg3h7OgXhwUhmWrDDq62TNchhvE4zepB2pE9lNcOINrtQ1
         BwAswkJfre6N57YXaz7EI15o6Az+Hh4ov2ondot6PmNX9/LscwRo2lw11ykx527zm3Vz
         /yPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IgeAC4lBoV2B8/J7oALXCZzsURDLKzfKYwV+veA9lFE=;
        b=J8ws2AhtV15JmTfKVFRA4DX4kmFt9O6pAhFoxalIPExJNSG1ryorCS8p5nsyet5E0m
         DQsyJn9ExQCnHUQ1HuLGbxvK553/gdnWe1qKQscXCq6pYiht3UwijAD9rm2C1iG9ogto
         sVvnyh6qzVXCKhkE1kE2bpPwS7vPSq//PoBTxB4STDBLnf3AKOqW97v8U9NIXq+PCH2b
         gPnP9O5DmExCvJ/yWdUgnGPGnIn/adTS1mGZM68ln1wUyYPePClQ+e77M9E2TOwEL24p
         SbRSqE+sUvRzDFn7B9g/ZtFHU9T2L/DN7yDQ2l/bllljcehW06mir2g+t6Sgds+Gfd4F
         Qf4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUmGpgr8R9ekk8xl/eAqQ1VEU4ddmvdhA70l6LZzI21S8Aj64ty
	tR3zQcVqlhDVo0D9mncpEis=
X-Google-Smtp-Source: APXvYqyY2LsCXNdAC7HbJB+e8iW9knQmDM2M6JUGg8wYUr8ixO2AOuRqyo6YtHyk9jqL3x0ldNZ6Sw==
X-Received: by 2002:a05:6402:2d5:: with SMTP id b21mr2779654edx.97.1581689271425;
        Fri, 14 Feb 2020 06:07:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:858a:: with SMTP id a10ls1483154edh.10.gmail; Fri, 14
 Feb 2020 06:07:50 -0800 (PST)
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr4995262wme.181.1581689270452;
        Fri, 14 Feb 2020 06:07:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581689270; cv=none;
        d=google.com; s=arc-20160816;
        b=khg4GLk2ZykOdJcQYLp+vjNT4Be9EMOrFixRtKXmXE4c6K9IFoXLIeHMaQzBgVjZwQ
         aj+DKtQb0GekM8S9qUVo3x4i92x76TCbNqzMh45quXAbFRJQZHebZkALeT4rYN2SHmB5
         Ab+johXzo38f07LXcJsAoasde4RoIKQh9JukqFK04+rdBF4kbkJtivj0GgLEVQAqXLyy
         ufFsYA57MjLNhkHLEOrAT2D4doyFghqItraLtqBuj5PTmB6QY9jibBWi6rR3IjVuqc/A
         7JMyrthozJ4V5b2oUekwyWHX2fqZEejfym05B9GatWodgdnIcwrXf6KpWZ50hWkeRq/c
         3Ehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=s1lkqqHt8PhHmJWobfTAAW+YwMjcRf1zPLU3DmR7ZdI=;
        b=HSKXZCENFARdJRtvw1wXdhn15rEb3WiEphDkDEsnQ45HTU1DAZg5siphFKI2XL83Xw
         CXRMSCoDaaqGtSV81QeOC2nt3iCgKR3qgpbu6aX4fKL+YATsa5jd1TG6rZBVgHTKahOB
         LvYZx3sa5XAtSSw2NdSKBcLe9ZRmjb/s3Q2oBxMFNjvfeaijUPsl7L54mpz1971LXIZG
         R79xOn747eilsQ9XmnmxGwlGxyzOBzzpeGleYkCves6f/4Db/twECmiqXl7tOwYOZpa+
         S4yjPytHzMvCOpAgO6QleMzUrqrx5kmgFCvoQ9NVEKC0w0r2j4rsoUe4Ouqo/SebwKRm
         CQnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y185si96887wmg.0.2020.02.14.06.07.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Feb 2020 06:07:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 01EE7nKA025252
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2020 15:07:49 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01EE7n4A006435;
	Fri, 14 Feb 2020 15:07:49 +0100
Subject: Re: Intel Coffe Lake issues
To: raymanfx@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <0a31af1e-1735-40c6-920c-5da6a5d1ad99@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9c349699-be0d-c112-041e-7f6485132b3f@siemens.com>
Date: Fri, 14 Feb 2020 15:07:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0a31af1e-1735-40c6-920c-5da6a5d1ad99@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 14.02.20 14:23, raymanfx@gmail.com wrote:
> Hi all,
>=20
> I am facing issues related to the integrated GPU (iGPU) on an Intel=20
> consumer SoC.
> First, some generic system information:
>=20
> Product: Dell OptiPlex 3060
> CPU: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
>=20
> Now, the Jailhouse stack I'm using:
> GIT revision: 92db71f257fabd3c08fa4b99498fa61a41ea831d (0.12)
> Root cell config: attached
>=20
> After enabling Jailhouse using:
> |
> jailhouse enable dell-optiplex.cell
> |
>=20
> I observe logspam in the kernel logs (dmesg) like the following:
> |
> [drm:gen8_de_irq_handler [i915]]*ERROR*Faulterrors on pipe A:0x00000080
> |
>=20
> The same message is repeated numerous times each second.
> Unloading Jailhouse stops the logspam.
>=20
> Reading from the /dev/jailhouse device, I can see there are some VT-d=20
> issues with the iGPU PCIe device at 00:02.0
> |
> <missed84 bytesofconsolelog>
> Using x2APIC
> Page pool usage after early setup: mem 59/975, remap 0/131072
> Initializing processors:
>  =C2=A0CPU 1... (APIC ID 2) OK
>  =C2=A0CPU 4... (APIC ID 8) OK
>  =C2=A0CPU 2... (APIC ID 4) OK
>  =C2=A0CPU 3... (APIC ID 6) OK
>  =C2=A0CPU 0... (APIC ID 0) OK
>  =C2=A0CPU 5... (APIC ID 10) OK
> Initializing unit: VT-d
> DMAR unit @0xfed90000/0x1000
> DMAR unit @0xfed91000/0x1000
> Reserving 120 interrupt(s) for device 00:1e.7 at index 0
> Initializing unit: IOAPIC
> Initializing unit: Cache Allocation Technology
> Initializing unit: PCI
> Adding PCI device 00:00.0 to cell "RootCell"
> Adding PCI device 00:02.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:02.0 at index 120
> Adding PCI device 00:08.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:08.0 at index 121
> Adding PCI device 00:12.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:12.0 at index 122
> Adding PCI device 00:14.0 to cell "RootCell"
> Reserving 8 interrupt(s) for device 00:14.0 at index 123
> Adding PCI device 00:14.2 to cell "RootCell"
> Adding PCI device 00:16.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:16.0 at index 131
> Adding PCI device 00:17.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:17.0 at index 132
> Adding PCI device 00:1c.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1c.0 at index 133
> Adding PCI device 00:1c.5 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1c.5 at index 134
> Adding PCI device 00:1f.0 to cell "RootCell"
> Adding PCI device 00:1f.3 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1f.3 at index 135
> Adding PCI device 00:1f.4 to cell "RootCell"
> Adding PCI device 00:1f.5 to cell "RootCell"
> Adding PCI device 01:00.0 to cell "RootCell"
> Reserving 4 interrupt(s) for device 01:00.0 at index 136
> Adding PCI device 02:00.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 02:00.0 at index 140
> Page pool usage after late setup: mem 279/975, remap 16395/131072
> Activating hypervisor
> VT-d fault event reported by IOMMU 0:
>  =C2=A0Source Identifier (bus:dev.func): 00:02.0
>  =C2=A0Fault Reason: 0x6 Fault Info: 6a1cea1 Type 1
> |

This is a translation fault, read permission at physical address=20
0x6a1cea1000 was denied. Check if there is a memory region covering this=20
already. It might be an ACPI-reserved region that Linux is not reporting=20
but that has to be added due to the GPU accesses.

Jan

>=20
> |
> lspci -nnk
> ...
> 00:02.0VGA compatible controller [0300]:IntelCorporationUHD=20
> Graphics630(Desktop)[8086:3e92]
> DeviceName:Onboard-Video
> Subsystem:DellDevice[1028:085c]
> Kerneldriver inuse:i915
> Kernelmodules:i915
> |
>=20
> Unfortunately I'm not really familiar with VT-d and the Intel=20
> virtualization stack in general. Does "Fault Reason: 0x6" ring a bell to=
=20
> anyone?
> I'm happy to provide more information if needed.
>=20
> Cheers

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9c349699-be0d-c112-041e-7f6485132b3f%40siemens.com.
