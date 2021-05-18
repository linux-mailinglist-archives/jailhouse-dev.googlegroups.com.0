Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBZEJR6CQMGQEVDLPNIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF78387A5A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 May 2021 15:45:09 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id p10-20020a19f10a0000b02901d675ef8fb8sf2059689lfh.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 May 2021 06:45:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621345509; cv=pass;
        d=google.com; s=arc-20160816;
        b=MXN9pNQa8R2MTsyb3FWKzw892oUiQFWf6pkbIED8afRcSR+nFd2Fs/TFzC3Nv/yAbp
         bOYBjLPmS2ZWg0RIOtL6MWKIEGn41KeL45H55Q/30lboTnwUElfhyhiHPDlU/5RgH4CH
         TInXdqcNyL3lAkPUSrD0hQZ0OSs7qAXTlCWlX2Z3wbxqKpH6QOVgaaIs3hAzMRbKT+/S
         GW1Uc6II5e2lC1gK09ur9UZO8uE1TBi3mM+3pcPhgi9PkdIR14+mXmhiZqMlSb+6cuuh
         T+FKsdMCnOzIKIVQA9Umoul7rpqBRMg3NEPnB971nDaypDjpaUw/emfjwfr7yyx1IB1/
         /6Ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=i64Osf5cT/cuslgAFH/P49XRijzpxHK3WxdK3o2y+6A=;
        b=EMhseq5fKsCRKxw28vLcEO5eeAWhrm+aL+7dy8dHmYBR6BebDe5AkOckNLR8ZU8pWh
         btKAo73v7yDVMqqfGyZ4/5+PJB9zuaM416457GGEaXxWTEk5WvJEFHvPlstFTWcYzmGD
         BwugugixJsO4kNLNfMdMDbRiieGcQrkJIgb3puY8vg3ndjWXF1GNIt2IKF2uLqk+yDcT
         JnuLAYoCFhXBUiEbgoZIojGwxxVwjmqqlSeLzstBVygooEAjjNDREoonCh/4J0Wb9VeV
         sFV++rSfMvjaDEtOG8/HDBnNp+2jx5B+hFh1EtI/QlEe3KIMFLowtJgkIQKVtbYA7d2t
         lkRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i64Osf5cT/cuslgAFH/P49XRijzpxHK3WxdK3o2y+6A=;
        b=R/Mxb5+xyaaRVZE2yebQnm9KrzExr+5yymvWfKCAC+YtTZxfg2A/YcfTAkbVfHAMhk
         FbALTPnTOYIKwji6PyEGnA1I7UBauQ8gy0d72tsUIS3c0taYqHv3FYcSakCPckQZQxhq
         8jE6pyd3Iu0F6LC/kNp0syOqPjhyeik6xCY5gdaKqQQatDpiSvmJpBQuWtTarD7L3ihu
         3qizwSSBHyOpzElH/CU7eGlZL80KJF2mzh9bcrGVcdKVgrkpcEbHDkvXfAWuscvzWQi0
         eYRyOnd2TK9h29XPx84bw+7rkHChBgXaDmhcNAKXFTkHOSUvSwLPz0fjkxomM5idP9jZ
         PGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=i64Osf5cT/cuslgAFH/P49XRijzpxHK3WxdK3o2y+6A=;
        b=sLxeQqjNeCUflnQyQfNOzF71XxT0aM2ZMJpzH8zsfeidriZtWD5vLiMfvFqZKYat/2
         yBtYxPtIu8XxkTeZ/I3+PBs2PMivA4o34lXskBqTFIPMuplY2R8XQ07ny5fqnawrOpwP
         8UsjPnIiEHLBAyFySe3pjdPzoXOhXtv4FsIHs5Jq6UvCbXBLIv1V+kBkE5I6YzMR5BSe
         chW7cQ2ui2QDnlD8dz4+eunn1n9JH+ol5OLJ++we6zcPtIHjRlGvEae5QvlpWelMeMon
         KVKlhwP6YFBo0m0z7HTX35RwoFKywQ8Wdb6qOAvEhzGTkDuUZdkavEGW9m5ZtXgKOHcW
         ApwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533iSC8DrxUt/7Y3IO/Gjnvwut291eu12jrknCUUgEzBQ2w1wfv0
	c/XyzF7hCGTJZQ9mh3yTUd0=
X-Google-Smtp-Source: ABdhPJwOz2+6+r7IIOw/RLAhH09OTmlioLU3VmZiFnNcBK1cH1csZMXKZDG7nFMu4RhNWywIaBVrMw==
X-Received: by 2002:a19:490f:: with SMTP id w15mr4295417lfa.192.1621345508991;
        Tue, 18 May 2021 06:45:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bf0f:: with SMTP id c15ls3531039ljr.9.gmail; Tue, 18 May
 2021 06:45:07 -0700 (PDT)
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr4019637ljn.503.1621345507900;
        Tue, 18 May 2021 06:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621345507; cv=none;
        d=google.com; s=arc-20160816;
        b=fP7YFDr/48bqGFViCQBwpqF+9nNAg4uY1c3tQVg/hfDb3UIpJgBpQyO4mVGVGXt7pa
         7nw92g5KNMDq6WhPznvFh8465x4rY1Cuzh3lOk7n93oK8kYpCLJCCBMm1r3IgSM4PD6m
         35gHWMNYJeXPtXam8napSle3rcYXEi9drtT/49BQwuLpWmQPwnO2zMpBSwBjGG6TLbuL
         JSQ6lJR1He8+lZSzsgO0irUps/It4Px25tDVknlPHo9Nens0ag9w6E/V8ySCFJKhMjga
         9ddNe4xpTqNe86UJYq67/3GrOtVKt/lZDjtZCIJMVHpNhi5mPAYmV60Z74WLhzUuyBnz
         80uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=MzYzxmrRsMBcbxgbwK7Jf01rSEE2dPKAS/295CBuObE=;
        b=JRrwQWw5P2OIy+dsBwVI0/vM7eVZtUZsDE3VKXgyvpnMgLBLu7WtiLcGTH/A2XUPg5
         5N4fWFTBIpbX/G+KBK2pU4b3z2N7WiclI6XvgkSdeo85oa/bhrniF5XhQKwBFfrXV/WD
         vItEDFqUSdcBnOanvBPmFBwlML4QcAI731hhrZQAuoSz7aGJO5ndNBeUbjZ2LLZTLqm/
         ChxZ6jRJ/MeAGGRixpf9rBubQfMDkqUE2ytxZHRkP0FbMfNZQqBPC6Njql6+fs0t6SWq
         jrPNVkXXQU9/zj3Za1dWAzFr3LhborfS8FnWWliLv5PFJTCblSAA+d8aZnUoCYjLzB52
         hOAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 81si550473lff.11.2021.05.18.06.45.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 May 2021 06:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14IDj521012442
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 May 2021 15:45:05 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.0.120])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14IDfOhC000535;
	Tue, 18 May 2021 15:41:24 +0200
Date: Tue, 18 May 2021 15:41:23 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Prashant Kalikotay <prashantkalikotay1995@gmail.com>
Cc: jailhouse-dev@googlegroups.com
Subject: Re: Installation error in Fedora
Message-ID: <20210518154123.18b0ba78@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAEoyBwCDWM=+iUXzXtECTpugFprTkMSj-P+goS0R8yOizZTYdg@mail.gmail.com>
References: <CAEoyBwCDWM=+iUXzXtECTpugFprTkMSj-P+goS0R8yOizZTYdg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Am Tue, 18 May 2021 13:32:00 +0530
schrieb Prashant Kalikotay <prashantkalikotay1995@gmail.com>:

> Hello All,
>               I am trying to install Jailhouse in Fedora, X86 system.
> While running make I run into these errors:
> [prashant@fedora jailhouse]$ make
>   CC [M]  /home/prashant/jailhouse/driver/cell.o
>   CC [M]  /home/prashant/jailhouse/driver/main.o
>   CC [M]  /home/prashant/jailhouse/driver/sysfs.o
>   CC [M]  /home/prashant/jailhouse/driver/pci.o
>   LD [M]  /home/prashant/jailhouse/driver/jailhouse.o
>   CC      /home/prashant/jailhouse/configs/x86/apic-demo.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/apic-demo.cell
>   CC      /home/prashant/jailhouse/configs/x86/e1000-demo.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/e1000-demo.cell
>   CC      /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.cell
>   CC      /home/prashant/jailhouse/configs/x86/imb-a180.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/imb-a180.cell
>   CC      /home/prashant/jailhouse/configs/x86/ioapic-demo.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/ioapic-demo.cell
>   CC      /home/prashant/jailhouse/configs/x86/ivshmem-demo.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/ivshmem-demo.cell
>   CC      /home/prashant/jailhouse/configs/x86/linux-x86-demo.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/linux-x86-demo.cell
>   CC      /home/prashant/jailhouse/configs/x86/pci-demo.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/pci-demo.cell
>   CC      /home/prashant/jailhouse/configs/x86/qemu-x86.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/qemu-x86.cell
>   CC      /home/prashant/jailhouse/configs/x86/smp-demo.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/smp-demo.cell
>   CC      /home/prashant/jailhouse/configs/x86/tiny-demo.o
>   OBJCOPY /home/prashant/jailhouse/configs/x86/tiny-demo.cell
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/asm-defines.s
>   GEN
> /home/prashant/jailhouse/hypervisor/arch/x86/include/generated/asm/asm-de=
fines.h
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/svm.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/amd_iommu.o
>   AS      /home/prashant/jailhouse/hypervisor/arch/x86/svm-vmexit.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/apic.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/dbg-write.o
>   AS      /home/prashant/jailhouse/hypervisor/arch/x86/entry.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/setup.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/control.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/mmio.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/iommu.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/paging.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/pci.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/i8042.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.o
> /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c: In function
> =E2=80=98vcpu_reset=E2=80=99:
> /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c:429:9: warning:
> =E2=80=98memset=E2=80=99 offset [0, 127] is out of the bounds [0, 0] [-Wa=
rray-bounds]
>   429 |         memset(&cpu_data->guest_regs, 0,
> sizeof(cpu_data->guest_regs));
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/efifb.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/ivshmem.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/ioapic.o
>   AR      /home/prashant/jailhouse/hypervisor/arch/x86/lib-amd.a
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/vmx.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/vtd.o
>   AS      /home/prashant/jailhouse/hypervisor/arch/x86/vmx-vmexit.o
>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/cat.o
>   AR      /home/prashant/jailhouse/hypervisor/arch/x86/lib-intel.a
>   LDS     /home/prashant/jailhouse/hypervisor/hypervisor.lds
>   CC      /home/prashant/jailhouse/hypervisor/setup.o
>   CC      /home/prashant/jailhouse/hypervisor/printk.o
>   CC      /home/prashant/jailhouse/hypervisor/paging.o
>   CC      /home/prashant/jailhouse/hypervisor/control.o
>   CC      /home/prashant/jailhouse/hypervisor/lib.o
>   CC      /home/prashant/jailhouse/hypervisor/mmio.o
>   CC      /home/prashant/jailhouse/hypervisor/pci.o
>   CC      /home/prashant/jailhouse/hypervisor/ivshmem.o
>   CC      /home/prashant/jailhouse/hypervisor/uart.o
>   CC      /home/prashant/jailhouse/hypervisor/uart-8250.o
>   LD      /home/prashant/jailhouse/hypervisor/hypervisor-amd.o
>   OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-amd.bin
>   LD      /home/prashant/jailhouse/hypervisor/hypervisor-intel.o
>   OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-intel.bin
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../alloc.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../cmdline.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../pci.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../printk.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../setup.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../string.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../test.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../uart-8250.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/cpu-features.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/excp.o
>   AS      /home/prashant/jailhouse/inmates/lib/x86/header-64.o
>   AS      /home/prashant/jailhouse/inmates/lib/x86/header-common.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/ioapic.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/irq.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/mem.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/pci.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/printk.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/setup.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/smp.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/timing.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/uart.o
>   AR      /home/prashant/jailhouse/inmates/lib/x86/lib.a
>   CC      /home/prashant/jailhouse/inmates/lib/x86/cpu-features-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/excp-32.o
>   AS      /home/prashant/jailhouse/inmates/lib/x86/header-common-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/irq-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/ioapic-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/printk-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/setup-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/uart-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../alloc-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../pci-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../string-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../cmdline-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../setup-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../test-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../uart-8250-32.o
>   CC      /home/prashant/jailhouse/inmates/lib/x86/../printk-32.o
>   AS      /home/prashant/jailhouse/inmates/lib/x86/header-32.o
>   AR      /home/prashant/jailhouse/inmates/lib/x86/lib32.a
>   CC      /home/prashant/jailhouse/inmates/demos/x86/tiny-demo.o
>   LD
> /home/prashant/jailhouse/inmates/demos/x86/tiny-demo-linked.o OBJCOPY
> /home/prashant/jailhouse/inmates/demos/x86/tiny-demo.bin CC
> /home/prashant/jailhouse/inmates/demos/x86/apic-demo.o LD
> /home/prashant/jailhouse/inmates/demos/x86/apic-demo-linked.o OBJCOPY
> /home/prashant/jailhouse/inmates/demos/x86/apic-demo.bin CC
> /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo.o LD
> /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo-linked.o
> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo.bin CC
>      /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo.o LD
> /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo-linked.o
> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo.bin CC
>      /home/prashant/jailhouse/inmates/demos/x86/pci-demo.o LD
> /home/prashant/jailhouse/inmates/demos/x86/pci-demo-linked.o OBJCOPY
> /home/prashant/jailhouse/inmates/demos/x86/pci-demo.bin CC
> /home/prashant/jailhouse/inmates/demos/x86/e1000-demo.o LD
> /home/prashant/jailhouse/inmates/demos/x86/e1000-demo-linked.o
> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/e1000-demo.bin CC
>     /home/prashant/jailhouse/inmates/demos/x86/../ivshmem-demo.o LD
>    /home/prashant/jailhouse/inmates/demos/x86/ivshmem-demo-linked.o
> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ivshmem-demo.bin
> CC      /home/prashant/jailhouse/inmates/demos/x86/smp-demo.o LD
> /home/prashant/jailhouse/inmates/demos/x86/smp-demo-linked.o OBJCOPY
> /home/prashant/jailhouse/inmates/demos/x86/smp-demo.bin CC
> /home/prashant/jailhouse/inmates/demos/x86/cache-timings.o LD
> /home/prashant/jailhouse/inmates/demos/x86/cache-timings-linked.o
> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/cache-timings.bin
> CC      /home/prashant/jailhouse/inmates/tests/x86/mmio-access.o LD
>    /home/prashant/jailhouse/inmates/tests/x86/mmio-access-linked.o
> OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/mmio-access.bin CC
>      /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32.o LD
>    /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32-linked.o
> OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32.bin
> CC      /home/prashant/jailhouse/inmates/tests/x86/sse-demo.o LD
> /home/prashant/jailhouse/inmates/tests/x86/sse-demo-linked.o OBJCOPY
> /home/prashant/jailhouse/inmates/tests/x86/sse-demo.bin CC
> /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32.o LD
> /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32-linked.o
> OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32.bin CC
>      /home/prashant/jailhouse/inmates/tools/x86/linux-loader.o LD
>  /home/prashant/jailhouse/inmates/tools/x86/linux-loader-linked.o
> OBJCOPY /home/prashant/jailhouse/inmates/tools/x86/linux-loader.bin
> GEN     /home/prashant/jailhouse/pyjailhouse/pci_defs.py CC
> /home/prashant/jailhouse/tools/jailhouse.o LD
> /home/prashant/jailhouse/tools/jailhouse CC
> /home/prashant/jailhouse/tools/demos/ivshmem-demo.o LD
> /home/prashant/jailhouse/tools/demos/ivshmem-demo CC
> /home/prashant/jailhouse/tools/demos/cache-timings.o LD
> /home/prashant/jailhouse/tools/demos/cache-timings GEN
> /home/prashant/jailhouse/tools/jailhouse-config-collect CC
> /home/prashant/jailhouse/tools/jailhouse-gcov-extract.o LD
> /home/prashant/jailhouse/tools/jailhouse-gcov-extract GEN
> /home/prashant/jailhouse/tools/jailhouse.8 GEN
> /home/prashant/jailhouse/tools/jailhouse-cell.8 GEN
> /home/prashant/jailhouse/tools/jailhouse-enable.8 MODPOST
> /home/prashant/jailhouse/Module.symvers ERROR: modpost:
> "lapic_timer_period" [/home/prashant/jailhouse/driver/jailhouse.ko]
> undefined! ERROR: modpost: "__get_vm_area_caller"
> [/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
> ERROR: modpost: "ioremap_page_range"
> [/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:111:
> /home/prashant/jailhouse/Module.symvers] Error 1
> make[2]: *** Deleting file '/home/prashant/jailhouse/Module.symvers'
> make[1]: *** [Makefile:1714: modules] Error 2
> make: *** [Makefile:40: modules] Error 2
> [prashant@fedora jailhouse]$
>=20
> I could see the issue is with the kernel. Could I get necessary steps
> to fix this? How to apply patches if I have? Pointing to any resource
> also might be very helpful.
> Thank you

On x86 we used to get away without patching the kernel, i think with
more recent 5.x kernels that luxury is gone. Check out
https://github.com/siemens/linux/tree/jailhouse-enabling/5.10

There are other jailhouse-enabling branches as well. Find one that is
close to your distro kernel and compile a custom kernel.

regards,
Henning


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210518154123.18b0ba78%40md1za8fc.ad001.siemens.net.
