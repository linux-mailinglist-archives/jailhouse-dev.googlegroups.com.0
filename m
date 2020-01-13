Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBBFE6DYAKGQECHMPICA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id BD662138BF1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 07:45:26 +0100 (CET)
Received: by mail-pg1-x538.google.com with SMTP id c8sf5907619pgl.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Jan 2020 22:45:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578897925; cv=pass;
        d=google.com; s=arc-20160816;
        b=PcZFlR1kKBsg8dyNipx0WS4fPF2PqWNgLSAdjSrV4+gG6uPUTmAcEzUddS0s8a0mbt
         EoCdzjVhLoAkFM3XtdZ4nLKrTUINkWU2o8O5InWZhp5lkoABjEc1FcBjr55T5Far1Skt
         5aEMOFBc806220M2SWgfQ6/ImvceBlDQzl1HCmr8K/ly4+kye4V/fB+wzSe3V8BBwHUS
         PtRHSgvS4X/2qK3XmFPZ7ANFAkGhOIjz41DfI0rfQ7FmK9vmFe+JRBO5BOb2dRGCash1
         pjoLU0Rw2YxL6jo+VZy5t6XLkMCEUrYOEQABlhDSDX8KQgQz5XZpC3gnl6WM2piCTa1p
         Jqhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=CCQI0wVMG/+lclXnx2thgcbWrbf+I2rcm8Hs/+mHX4c=;
        b=hggggq8Kamkjihfm/MMVzk0FG7EKUwfc5diuDGyUa5eiNq5B6D3ApmqY22gt42ODku
         aHzq7YZkEvRLcSkmbnzG3zot8LQVlgtP+edK8+S+uY5K0fgMqjjJ7u6bLaB/fadFFsWj
         YMkesyJtRx2qwV5fGnTJpVWIX3j9IkN56o8Nzao2QY7tFRiNljpysnvva0ACsGY5mV6i
         w9hsd9xgZb4cuOfyDWm+2eICxmVOGauGWA6NM/JVi1pvYvLGmntIQLnLKqsxphqzSGVF
         oRv/c0RySyq1CJJbIU8WG9ZqLtafUjiFYyqDSU3UqtP2KhN/Cqt8eMy69ciofwunA/7/
         S/DA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M2cfjLPR;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::841 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CCQI0wVMG/+lclXnx2thgcbWrbf+I2rcm8Hs/+mHX4c=;
        b=bmlSRxwuoyrabGDiTM0ZIFVnloY+iQ5EaLkDFvzMto+rsnzmw8/X/CFCOhtvaHQWsA
         G1U1yPSjPc8xkum1+457HnGvREgf/JrSES/QC04rtpOO5oGx0qxlrPpzKnGMjg3ynCze
         0kMbfp6Hk0PuvFnCelyD/G74Sf9kPDmF1t2k1iwlQWvoIfnlLKYl29jvUgHKOS97tB0g
         tzcJtUTDBkxGVQ3BdmD7xpvfNS2RN6D1nsFDHmctBt64ddEUPCG9m14S11jEsJaUQnuy
         LTpRmikmoRV00C24uqju6B0J6sxly/aiSTeUNpv6GbbbLLPiw0rrQPj+nZvz+JoZB6LU
         4L3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CCQI0wVMG/+lclXnx2thgcbWrbf+I2rcm8Hs/+mHX4c=;
        b=YurcmQKK///jd5mOK3rELBIeiVtxx8hjqQfg3NFjd8R3T+A676Cy8oIKXtrdC6IZKm
         TQUKfiErSmLtyJ+lYkLnnq3l8AJGcu5FtUrjDISRbrZ17xauAq/G6QZ8vt5S+rbu9VnN
         W6uiv9F7zxHkP4ZcDxJg70fqD1LCp50exG6fcbqHh14uqAjKftZJyXCQGyGzFFVAwhgw
         wyO+wxzijL1ulzi/3gMJk22yFBGcFdODh/uKzlnQEjVQv1JCF1jzuUEhXPHptm1dR1++
         y1JvC4UrstwvGUhsnEFOWynaaY52ksOSyRAcMBuZBXoLXTOQ2pGu5/J3dQS+ZeAqxdZs
         gg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CCQI0wVMG/+lclXnx2thgcbWrbf+I2rcm8Hs/+mHX4c=;
        b=cB5jBVJJf+YHcwRG2b4CARVfA82mUO0D4Ve9F4c9F0MXvNL8cQs7aJpRrNN/BpxhNf
         ymok4GIKSrCwIhTySKd71OJ5j08GoyY1fBzo2qmc60AYqNpS7WhYuDeMLBwpiH3B0SFw
         KXROJ97mcf53vFwsttvr6iOURF7tLsfahe5vE/SqQJ5ANXKltMIiLN7pNnw+wvAws+04
         53RdQJWHcXUhdkLXQTJqVf8ekTG3HLH5b9F3fJ5fUWOyE7NoZAl8+yowegT84OxuCu6T
         JwvFVAxuiNdHLVWcrg7KpO1eiRBeAQoS8EoOrEHOV4ByFzVYi4+1m3wDdKsq1xyk/8lB
         5WcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUj5qxZ2E5iRx/n6NSXWD3jushGgg6XNk2wn3mdLCb55uKOHG86
	PpHF1iY/xFeE2V6iBJmXNXo=
X-Google-Smtp-Source: APXvYqzMAmMgB+HcOWWRL0lMboLMKJ5Uluxc7gimvsS67pEr1114kkoVc+Z5P9tkvUfa1vZidqHXrA==
X-Received: by 2002:a17:90b:4015:: with SMTP id ie21mr20808038pjb.1.1578897924784;
        Sun, 12 Jan 2020 22:45:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:864b:: with SMTP id y11ls3387018plt.2.gmail; Sun, 12
 Jan 2020 22:45:24 -0800 (PST)
X-Received: by 2002:a17:902:9307:: with SMTP id bc7mr12382799plb.338.1578897924024;
        Sun, 12 Jan 2020 22:45:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578897924; cv=none;
        d=google.com; s=arc-20160816;
        b=ogXLPQbEsqwZkxdLvosa7kHP/ZMGFfqrhFukXI0B6/zjlZaV/h0QAXI7VovCiyO/Yz
         LEZBrqwTbfplBWMd3mCEEAAiXm8YGuAvj2aXr76nrZ1lPihSfkBvEENX06F8hWAMqpRG
         uu2a18DpHaf1taQEUnurkobeLpl7+EwWhKRHcYiMkA7Yz7fZDnjZ2tpG8M73wsc1ZLik
         xi5Dw9HZb71jJH9c4EdMUTgyWEQZHvpV2YpL1K9uA6Q/MRUy3Oj7Aaeka2nQZUsWIdZ5
         wlNOkFQ27JGtghE3EfxASLJ6e/zWyVJQREoTs7PKrJgP4WkKsetyif163tnVMmnWiDsE
         WU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=khcSS9mGH/B1wGRVzT5NbE5fEHruLpUziUnUU3kNHXs=;
        b=fRpM378ZExCKR2FPxTN0ooJc3H7xH7PO4MdFcneTreplBEHRsNWJ8bge83qP+w/92e
         3kelSkmRJsYv8gTlmhX992cp+p2/tb5LawwTlXFVgOiiUkKBUOv+9PZIWwDaC09PHoJn
         TRNCcwp3bUKd3r5BFXVTEZyPYNCooJ0DeBEiJKI7OOi7IMH56KgQ2n7/02thGhoQ5tnb
         yLyJG00QCkenqhVa3Qqb2CRggvqRiw5zu1/AflaeFFXLsqXTm0PvCnAL5zAI0sjm8yNA
         JHLd2Bo8n05aORT2bNs9dWgjcXeYrOqV5DMo8T57EAnKIfI8A3XkdEAq7ZV8lzInZ0sK
         khDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M2cfjLPR;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::841 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com. [2607:f8b0:4864:20::841])
        by gmr-mx.google.com with ESMTPS id 65si441504pfx.5.2020.01.12.22.45.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2020 22:45:24 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::841 as permitted sender) client-ip=2607:f8b0:4864:20::841;
Received: by mail-qt1-x841.google.com with SMTP id g1so8194325qtr.13
        for <jailhouse-dev@googlegroups.com>; Sun, 12 Jan 2020 22:45:23 -0800 (PST)
X-Received: by 2002:aed:2d67:: with SMTP id h94mr12758637qtd.74.1578897922980;
 Sun, 12 Jan 2020 22:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20200111165134.1421-1-vijaikumar.kanagarajan@gmail.com> <991592dc-0482-d4cf-47dd-fe198cc78bc3@web.de>
In-Reply-To: <991592dc-0482-d4cf-47dd-fe198cc78bc3@web.de>
From: vijai kumar <vijaikumar.kanagarajan@gmail.com>
Date: Mon, 13 Jan 2020 12:15:10 +0530
Message-ID: <CALLGG_KzRM+g3+eJf7Y6q7_Bpt-RtFciHSPPr+At96FXakzgBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] configs/arm64: Add support for pine64-plus board
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000d5ff76059bffd1ac"
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=M2cfjLPR;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::841 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000d5ff76059bffd1ac
Content-Type: text/plain; charset="UTF-8"

On Mon 13 Jan, 2020, 11:38 AM Jan Kiszka, <jan.kiszka@web.de> wrote:

> On 11.01.20 17:51, Vijai Kumar K wrote:
> > Add config for Pine64+ board.
> > https://www.pine64.org/devices/single-board-computers/pine-a64/
> >
> > Allwinner A64(Quad core A53) + 2GB RAM
> >
> > Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> > ---
> >   configs/arm64/pine64-plus.c | 339 ++++++++++++++++++++++++++++++++++++
> >   1 file changed, 339 insertions(+)
> >   create mode 100644 configs/arm64/pine64-plus.c
> >
> > diff --git a/configs/arm64/pine64-plus.c b/configs/arm64/pine64-plus.c
> > new file mode 100644
> > index 00000000..9a0730c0
> > --- /dev/null
> > +++ b/configs/arm64/pine64-plus.c
> > @@ -0,0 +1,339 @@
> > +/*
> > + * Jailhouse, a Linux-based partitioning hypervisor
> > + *
> > + * Configuration for Pine64+ board, 2 GB
> > + *
> > + * Copyright (c) Vijai Kumar K, 2019
> > + *
> > + * Authors:
> > + *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.  See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <jailhouse/types.h>
> > +#include <jailhouse/cell-config.h>
> > +
> > +struct {
> > +     struct jailhouse_system header;
> > +     __u64 cpus[1];
> > +     struct jailhouse_memory mem_regions[35];
> > +     struct jailhouse_irqchip irqchips[1];
> > +     struct jailhouse_pci_device pci_devices[1];
> > +} __attribute__((packed)) config = {
> > +     .header = {
> > +             .signature = JAILHOUSE_SYSTEM_SIGNATURE,
> > +             .revision = JAILHOUSE_CONFIG_REVISION,
> > +             .flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> > +             .hypervisor_memory = {
> > +                     .phys_start = 0xbc000000,
> > +                     .size =       0x04000000,
> > +             },
> > +             .debug_console = {
> > +                     .address = 0x01c28000,
> > +                     .size = 0x400,
> > +                     .type = JAILHOUSE_CON_TYPE_PL011,
> > +                     .flags = JAILHOUSE_CON_ACCESS_MMIO |
> > +                              JAILHOUSE_CON_REGDIST_4,
> > +             },
> > +             .platform_info = {
> > +                     .pci_mmconfig_base = 0xfc000000,
> > +                     .pci_mmconfig_end_bus = 0,
> > +                     .pci_is_virtual = 1,
> > +                     .arm = {
> > +                             .gic_version = 2,
> > +                             .gicd_base = 0x01c81000,
> > +                             .gicc_base = 0x01c82000,
> > +                             .gich_base = 0x01c84000,
> > +                             .gicv_base = 0x01c86000,
> > +                             .maintenance_irq = 25,
> > +                     },
> > +             },
> > +             .root_cell = {
> > +                     .name = "Pine64-Plus",
> > +
> > +                     .cpu_set_size = sizeof(config.cpus),
> > +                     .num_memory_regions =
> ARRAY_SIZE(config.mem_regions),
> > +                     .num_pci_devices = ARRAY_SIZE(config.pci_devices),
> > +                     .num_irqchips = ARRAY_SIZE(config.irqchips),
> > +
> > +                     .vpci_irq_base = 108,
> > +             },
> > +     },
> > +
> > +     .cpus = {
> > +             0xf,
> > +     },
> > +
> > +     .mem_regions = {
> > +                /* SRAM */ {
> > +                        .phys_start = 0x00018000,
> > +                        .virt_start = 0x00018000,
> > +                        .size =       0x00028000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_EXECUTE,
> > +                },
> > +                /* Clock */ {
> > +                        .phys_start = 0x01000000,
> > +                        .virt_start = 0x01000000,
> > +                        .size =       0x00100000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> > +                },
> > +                /* 1100000.mixer */ {
> > +                        .phys_start = 0x01100000,
> > +                        .virt_start = 0x01100000,
> > +                        .size =       0x00100000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* 1200000.mixer */ {
> > +                        .phys_start = 0x01200000,
> > +                        .virt_start = 0x01200000,
> > +                        .size =       0x00100000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* Syscon */ {
> > +                        .phys_start = 0x01c00000,
> > +                        .virt_start = 0x01c00000,
> > +                        .size =       0x00001000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* DMA */ {
> > +                        .phys_start = 0x01c02000,
> > +                        .virt_start = 0x01c02000,
> > +                        .size =       0x00001000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* LCD1 */ {
> > +                        .phys_start = 0x01c0c000,
> > +                        .virt_start = 0x01c0c000,
> > +                        .size =       0x00001000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* LCD2 */ {
> > +                        .phys_start = 0x01c0d000,
> > +                        .virt_start = 0x01c0d000,
> > +                        .size =       0x00001000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* MMC */ {
> > +                        .phys_start = 0x01c0f000,
> > +                        .virt_start = 0x01c0f000,
> > +                        .size =       0x00001000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* EEPROM */ {
> > +                        .phys_start = 0x01c14000,
> > +                        .virt_start = 0x01c14000,
> > +                        .size =       0x00000400,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* USB */ {
> > +                        .phys_start = 0x01c19000,
> > +                        .virt_start = 0x01c19000,
> > +                        .size =       0x00000400,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* USB */ {
> > +                        .phys_start = 0x01c19400,
> > +                        .virt_start = 0x01c19400,
> > +                        .size =       0x00000014,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* USB */ {
> > +                        .phys_start = 0x01c1a000,
> > +                        .virt_start = 0x01c1a000,
> > +                        .size =       0x00000100,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* USB */ {
> > +                        .phys_start = 0x01c1a400,
> > +                        .virt_start = 0x01c1a400,
> > +                        .size =       0x00000100,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* USB */ {
> > +                        .phys_start = 0x01c1a800,
> > +                        .virt_start = 0x01c1a800,
> > +                        .size =       0x00000100,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* USB */ {
> > +                        .phys_start = 0x01c1b000,
> > +                        .virt_start = 0x01c1b000,
> > +                        .size =       0x00000100,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* USB */ {
> > +                        .phys_start = 0x01c1b400,
> > +                        .virt_start = 0x01c1b400,
> > +                        .size =       0x00000100,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* USB */ {
> > +                        .phys_start = 0x01c1b800,
> > +                        .virt_start = 0x01c1b800,
> > +                        .size =       0x00000004,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* Clock */ {
> > +                        .phys_start = 0x01c20000,
> > +                        .virt_start = 0x01c20000,
> > +                        .size =       0x00000400,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> > +                },
> > +                /* Pincontrol */ {
> > +                        .phys_start = 0x01c20800,
> > +                        .virt_start = 0x01c20800,
> > +                        .size =       0x00000400,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> > +                },
> > +                /* Watchdog */ {
> > +                        .phys_start = 0x01c20ca0,
> > +                        .virt_start = 0x01c20ca0,
> > +                        .size =       0x00000020,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> > +                },
> > +                /* UART */ {
> > +                        .phys_start = 0x01c28000,
> > +                        .virt_start = 0x01c28000,
> > +                        .size =       0x00000020,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> > +                },
> > +                /* I2C */ {
> > +                        .phys_start = 0x01c2b000,
> > +                        .virt_start = 0x01c2b000,
> > +                        .size =       0x00000400,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* Ethernet */ {
> > +                        .phys_start = 0x01c30000,
> > +                        .virt_start = 0x01c30000,
> > +                        .size =       0x00010000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* GPU */ {
> > +                        .phys_start = 0x01c40000,
> > +                        .virt_start = 0x01c40000,
> > +                        .size =       0x00010000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* SRAM */ {
> > +                        .phys_start = 0x01d00000,
> > +                        .virt_start = 0x01d00000,
> > +                        .size =       0x00040000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_EXECUTE,
> > +                },
> > +                /* HDMI */ {
> > +                        .phys_start = 0x01ee0000,
> > +                        .virt_start = 0x01ee0000,
> > +                        .size =       0x00010000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* HDMI */ {
> > +                        .phys_start = 0x01ef0000,
> > +                        .virt_start = 0x01ef0000,
> > +                        .size =       0x00010000,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +                /* RTC */ {
> > +                        .phys_start = 0x01f00000,
> > +                        .virt_start = 0x01f00000,
> > +                        .size =       0x00000400,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> > +                },
> > +                /* Interrupt Controller */ {
> > +                        .phys_start = 0x01f00c00,
> > +                        .virt_start = 0x01f00c00,
> > +                        .size =       0x00000400,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> > +                },
> > +                /* Clock */ {
> > +                        .phys_start = 0x01f01400,
> > +                        .virt_start = 0x01f01400,
> > +                        .size =       0x00000100,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> > +                },
> > +                /* Pincontrol */ {
> > +                        .phys_start = 0x01f02c00,
> > +                        .virt_start = 0x01f02c00,
> > +                        .size =       0x00000400,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> > +                },
> > +                /* RSB(Reduced Serial Bus) */ {
> > +                        .phys_start = 0x01f03400,
> > +                        .virt_start = 0x01f03400,
> > +                        .size =       0x00000400,
> > +                        .flags = JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE |
> > +                                JAILHOUSE_MEM_IO,
> > +                },
> > +             /* System RAM */ {
> > +                     .phys_start = 0x40000000,
> > +                     .virt_start = 0x40000000,
> > +                     .size = 0x7c000000,
> > +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +                             JAILHOUSE_MEM_EXECUTE,
> > +             },
> > +             /* IVSHMEM shared memory region */ {
> > +                     .phys_start = 0xbbf00000,
> > +                     .virt_start = 0xbbf00000,
> > +                     .size = 0x100000,
> > +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> > +             },
> > +     },
> > +
> > +     .irqchips = {
> > +             /* GIC */ {
> > +                     .address = 0x01c81000,
> > +                     .pin_base = 32,
> > +                     .pin_bitmap = {
> > +                             0xffffffff, 0xffffffff, 0xffffffff,
> 0xffffffff,
> > +                     },
> > +             },
> > +     },
> > +
> > +     .pci_devices = {
> > +             /* 0001:00:00.0 */ {
> > +                     .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> > +                     .domain = 1,
> > +                     .bdf = 0x00,
> > +                     .bar_mask = {
> > +                             0xffffff00, 0xffffffff, 0x00000000,
> > +                             0x00000000, 0x00000000, 0x00000000,
> > +                     },
> > +                     .shmem_region = 34,
> > +                     .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> > +             },
> > +     },
> > +};
> >
>
> Thanks for adding this board. That's this
> https://store.pine64.org/?product=pine-a64-board-2gb, right?


Yes. That is the one.

Will that
> config also cover the LTS variant? Just curious.
>

Ideally it should but I don't have an LTS variant to test it out.

Could you rebase your patches over next (will be master soon)? This
> specifically affects the ivshmem devices and memory regions.


Sure, will do that. I'm on travel, so,  hopefully by this weekend.

And could
> you also add a linux-demo config?
>

Linux demo is in works. Will try to complete and send that in coming weeks.

Thanks,
Vijai Kumar K


> Jan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CALLGG_KzRM%2Bg3%2BeJf7Y6q7_Bpt-RtFciHSPPr%2BAt96FXakzgBQ%40mail.gmail.com.

--000000000000d5ff76059bffd1ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9ImF1dG8iPjxkaXY+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRp
diBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiAxMyBKYW4sIDIwMjAsIDExOjM4
IEFNIEphbiBLaXN6a2EsICZsdDs8YSBocmVmPSJtYWlsdG86amFuLmtpc3prYUB3ZWIuZGUiIHJl
bD0ibm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+amFuLmtpc3prYUB3ZWIu
ZGU8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFk
ZGluZy1sZWZ0OjFleCI+T24gMTEuMDEuMjAgMTc6NTEsIFZpamFpIEt1bWFyIEsgd3JvdGU6PGJy
Pg0KJmd0OyBBZGQgY29uZmlnIGZvciBQaW5lNjQrIGJvYXJkLjxicj4NCiZndDsgPGEgaHJlZj0i
aHR0cHM6Ly93d3cucGluZTY0Lm9yZy9kZXZpY2VzL3NpbmdsZS1ib2FyZC1jb21wdXRlcnMvcGlu
ZS1hNjQvIiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJlciBub3JlZmVycmVyIG5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwczovL3d3dy5waW5lNjQub3JnL2RldmljZXMvc2luZ2xlLWJv
YXJkLWNvbXB1dGVycy9waW5lLWE2NC88L2E+PGJyPg0KJmd0Ozxicj4NCiZndDsgQWxsd2lubmVy
IEE2NChRdWFkIGNvcmUgQTUzKSArIDJHQiBSQU08YnI+DQomZ3Q7PGJyPg0KJmd0OyBTaWduZWQt
b2ZmLWJ5OiBWaWphaSBLdW1hciBLICZsdDs8YSBocmVmPSJtYWlsdG86dmlqYWlrdW1hci5rYW5h
Z2FyYWphbkBnbWFpbC5jb20iIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIG5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj52aWphaWt1bWFyLmthbmFnYXJhamFuQGdtYWlsLmNvbTwvYT4mZ3Q7
PGJyPg0KJmd0OyAtLS08YnI+DQomZ3Q7wqAgwqBjb25maWdzL2FybTY0L3BpbmU2NC1wbHVzLmMg
fCAzMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrPGJyPg0KJmd0O8KgIMKg
MSBmaWxlIGNoYW5nZWQsIDMzOSBpbnNlcnRpb25zKCspPGJyPg0KJmd0O8KgIMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGNvbmZpZ3MvYXJtNjQvcGluZTY0LXBsdXMuYzxicj4NCiZndDs8YnI+DQomZ3Q7
IGRpZmYgLS1naXQgYS9jb25maWdzL2FybTY0L3BpbmU2NC1wbHVzLmMgYi9jb25maWdzL2FybTY0
L3BpbmU2NC1wbHVzLmM8YnI+DQomZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KJmd0OyBp
bmRleCAwMDAwMDAwMC4uOWEwNzMwYzA8YnI+DQomZ3Q7IC0tLSAvZGV2L251bGw8YnI+DQomZ3Q7
ICsrKyBiL2NvbmZpZ3MvYXJtNjQvcGluZTY0LXBsdXMuYzxicj4NCiZndDsgQEAgLTAsMCArMSwz
MzkgQEA8YnI+DQomZ3Q7ICsvKjxicj4NCiZndDsgKyAqIEphaWxob3VzZSwgYSBMaW51eC1iYXNl
ZCBwYXJ0aXRpb25pbmcgaHlwZXJ2aXNvcjxicj4NCiZndDsgKyAqPGJyPg0KJmd0OyArICogQ29u
ZmlndXJhdGlvbiBmb3IgUGluZTY0KyBib2FyZCwgMiBHQjxicj4NCiZndDsgKyAqPGJyPg0KJmd0
OyArICogQ29weXJpZ2h0IChjKSBWaWphaSBLdW1hciBLLCAyMDE5PGJyPg0KJmd0OyArICo8YnI+
DQomZ3Q7ICsgKiBBdXRob3JzOjxicj4NCiZndDsgKyAqwqAgVmlqYWkgS3VtYXIgSyAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnZpamFpa3VtYXIua2FuYWdhcmFqYW5AZ21haWwuY29tIiByZWw9Im5vcmVm
ZXJyZXIgbm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dmlqYWlrdW1hci5r
YW5hZ2FyYWphbkBnbWFpbC5jb208L2E+Jmd0Ozxicj4NCiZndDsgKyAqPGJyPg0KJmd0OyArICog
VGhpcyB3b3JrIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVy
c2lvbiAyLsKgIFNlZTxicj4NCiZndDsgKyAqIHRoZSBDT1BZSU5HIGZpbGUgaW4gdGhlIHRvcC1s
ZXZlbCBkaXJlY3RvcnkuPGJyPg0KJmd0OyArICovPGJyPg0KJmd0OyArPGJyPg0KJmd0OyArI2lu
Y2x1ZGUgJmx0O2phaWxob3VzZS90eXBlcy5oJmd0Ozxicj4NCiZndDsgKyNpbmNsdWRlICZsdDtq
YWlsaG91c2UvY2VsbC1jb25maWcuaCZndDs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICtzdHJ1Y3Qg
ezxicj4NCiZndDsgK8KgIMKgIMKgc3RydWN0IGphaWxob3VzZV9zeXN0ZW0gaGVhZGVyOzxicj4N
CiZndDsgK8KgIMKgIMKgX191NjQgY3B1c1sxXTs8YnI+DQomZ3Q7ICvCoCDCoCDCoHN0cnVjdCBq
YWlsaG91c2VfbWVtb3J5IG1lbV9yZWdpb25zWzM1XTs8YnI+DQomZ3Q7ICvCoCDCoCDCoHN0cnVj
dCBqYWlsaG91c2VfaXJxY2hpcCBpcnFjaGlwc1sxXTs8YnI+DQomZ3Q7ICvCoCDCoCDCoHN0cnVj
dCBqYWlsaG91c2VfcGNpX2RldmljZSBwY2lfZGV2aWNlc1sxXTs8YnI+DQomZ3Q7ICt9IF9fYXR0
cmlidXRlX18oKHBhY2tlZCkpIGNvbmZpZyA9IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoC5oZWFkZXIg
PSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAuc2lnbmF0dXJlID0gSkFJTEhPVVNF
X1NZU1RFTV9TSUdOQVRVUkUsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAucmV2aXNp
b24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklTSU9OLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgLmZsYWdzID0gSkFJTEhPVVNFX1NZU19WSVJUVUFMX0RFQlVHX0NPTlNPTEUsPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAuaHlwZXJ2aXNvcl9tZW1vcnkgPSB7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAucGh5c19zdGFydCA9IDB4YmMwMDAw
MDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuc2l6ZSA9wqAg
wqAgwqAgwqAweDA0MDAwMDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfSw8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoC5kZWJ1Z19jb25zb2xlID0gezxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmFkZHJlc3MgPSAweDAxYzI4MDAwLDxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLnNpemUgPSAweDQwMCw8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC50eXBlID0gSkFJTEhP
VVNFX0NPTl9UWVBFX1BMMDExLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgLmZsYWdzID0gSkFJTEhPVVNFX0NPTl9BQ0NFU1NfTU1JTyB8PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgSkFJTEhPVVNFX0NPTl9S
RUdESVNUXzQsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9LDxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgLnBsYXRmb3JtX2luZm8gPSB7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAucGNpX21tY29uZmlnX2Jhc2UgPSAweGZjMDAwMDAwLDxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLnBjaV9tbWNvbmZpZ19l
bmRfYnVzID0gMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5w
Y2lfaXNfdmlydHVhbCA9IDEsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAuYXJtID0gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLmdpY192ZXJzaW9uID0gMiw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5naWNkX2Jhc2UgPSAweDAxYzgxMDAwLDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmdpY2Nf
YmFzZSA9IDB4MDFjODIwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAuZ2ljaF9iYXNlID0gMHgwMWM4NDAwMCw8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5naWN2X2Jhc2UgPSAweDAx
Yzg2MDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgLm1haW50ZW5hbmNlX2lycSA9IDI1LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH0sPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAucm9vdF9jZWxsID0gezxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm5hbWUgPSAmcXVvdDtQaW5lNjQtUGx1cyZxdW90
Oyw8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmlnLmNwdXMpLDxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm51bV9tZW1vcnlfcmVnaW9ucyA9IEFSUkFZX1NJWkUo
Y29uZmlnLm1lbV9yZWdpb25zKSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC5udW1fcGNpX2RldmljZXMgPSBBUlJBWV9TSVpFKGNvbmZpZy5wY2lfZGV2aWNlcyks
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubnVtX2lycWNoaXBz
ID0gQVJSQVlfU0laRShjb25maWcuaXJxY2hpcHMpLDxicj4NCiZndDsgKzxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLnZwY2lfaXJxX2Jhc2UgPSAxMDgsPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9LDxicj4NCiZndDsgK8KgIMKgIMKgfSw8YnI+DQom
Z3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoC5jcHVzID0gezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgMHhmLDxicj4NCiZndDsgK8KgIMKgIMKgfSw8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7
ICvCoCDCoCDCoC5tZW1fcmVnaW9ucyA9IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAvKiBTUkFNICovIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAucGh5c19zdGFydCA9IDB4MDAwMTgwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnZpcnRfc3RhcnQgPSAweDAwMDE4MDAwLDxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5zaXplID3CoCDCoCDCoCDC
oDB4MDAwMjgwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
SkFJTEhPVVNFX01FTV9FWEVDVVRFLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogQ2xvY2sgKi8gezxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5waHlzX3N0YXJ0ID0g
MHgwMTAwMDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAudmlydF9zdGFydCA9IDB4MDEwMDAwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDEwMDAwMCw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxhZ3MgPSBKQUlMSE9VU0Vf
TUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9VU0VfTUVNX0lPIHwgSkFJ
TEhPVVNFX01FTV9JT18zMiw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9LDxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIDExMDAwMDAubWl4ZXIgKi8gezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5waHlzX3N0YXJ0
ID0gMHgwMTEwMDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAudmlydF9zdGFydCA9IDB4MDExMDAwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDEwMDAwMCw8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxhZ3MgPSBKQUlMSE9V
U0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9VU0VfTUVNX0lPLDxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgLyogMTIwMDAwMC5taXhlciAqLyB7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnBoeXNfc3RhcnQgPSAweDAxMjAwMDAwLDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC52aXJ0X3N0YXJ0ID0g
MHgwMTIwMDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAuc2l6ZSA9wqAgwqAgwqAgwqAweDAwMTAwMDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxI
T1VTRV9NRU1fV1JJVEUgfDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIEpBSUxIT1VTRV9NRU1fSU8sPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBT
eXNjb24gKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5waHlzX3N0YXJ0ID0gMHgwMWMwMDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4MDFjMDAwMDAsPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAw
MTAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9V
U0VfTUVNX0lPLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogRE1BICovIHs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAucGh5c19zdGFydCA9IDB4MDFjMDIwMDAsPGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnZpcnRfc3RhcnQg
PSAweDAxYzAyMDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIC5zaXplID3CoCDCoCDCoCDCoDB4MDAwMDEwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJ
TEhPVVNFX01FTV9XUklURSB8PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgSkFJTEhPVVNFX01FTV9JTyw8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB9LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8q
IExDRDEgKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5waHlzX3N0YXJ0ID0gMHgwMWMwYzAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4MDFjMGMwMDAsPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAw
MTAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9V
U0VfTUVNX0lPLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEMiAqLyB7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnBoeXNfc3RhcnQgPSAweDAxYzBkMDAwLDxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC52aXJ0X3N0YXJ0
ID0gMHgwMWMwZDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAuc2l6ZSA9wqAgwqAgwqAgwqAweDAwMDAxMDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpB
SUxIT1VTRV9NRU1fV1JJVEUgfDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIEpBSUxIT1VTRV9NRU1fSU8sPGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAv
KiBNTUMgKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5waHlzX3N0YXJ0ID0gMHgwMWMwZjAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4MDFjMGYwMDAsPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAw
MTAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9V
U0VfTUVNX0lPLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogRUVQUk9NICovIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAucGh5c19zdGFydCA9IDB4MDFjMTQwMDAs
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnZpcnRfc3Rh
cnQgPSAweDAxYzE0MDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIC5zaXplID3CoCDCoCDCoCDCoDB4MDAwMDA0MDAsPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwg
SkFJTEhPVVNFX01FTV9XUklURSB8PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgSkFJTEhPVVNFX01FTV9JTyw8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB9LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC8qIFVTQiAqLyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgLnBoeXNfc3RhcnQgPSAweDAxYzE5MDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIC52aXJ0X3N0YXJ0ID0gMHgwMWMxOTAwMCw8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuc2l6ZSA9wqAgwqAgwqAgwqAweDAw
MDAwNDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5m
bGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfDxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEpBSUxI
T1VTRV9NRU1fSU8sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSw8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBVU0IgKi8gezxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5waHlzX3N0YXJ0ID0gMHgwMWMxOTQwMCw8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFy
dCA9IDB4MDFjMTk0MDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAwMDAxNCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBK
QUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9VU0VfTUVNX0lPLDxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
LyogVVNCICovIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAucGh5c19zdGFydCA9IDB4MDFjMWEwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgLnZpcnRfc3RhcnQgPSAweDAxYzFhMDAwLDxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5zaXplID3CoCDCoCDCoCDCoDB4MDAw
MDAxMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZs
YWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgSkFJTEhP
VVNFX01FTV9JTyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9LDxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIFVTQiAqLyB7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnBoeXNfc3RhcnQgPSAweDAxYzFhNDAwLDxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC52aXJ0X3N0YXJ0
ID0gMHgwMWMxYTQwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAuc2l6ZSA9wqAgwqAgwqAgwqAweDAwMDAwMTAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpB
SUxIT1VTRV9NRU1fV1JJVEUgfDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIEpBSUxIT1VTRV9NRU1fSU8sPGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAv
KiBVU0IgKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5waHlzX3N0YXJ0ID0gMHgwMWMxYTgwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4MDFjMWE4MDAsPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAw
MDEwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9V
U0VfTUVNX0lPLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogVVNCICovIHs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAucGh5c19zdGFydCA9IDB4MDFjMWIwMDAsPGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnZpcnRfc3RhcnQg
PSAweDAxYzFiMDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIC5zaXplID3CoCDCoCDCoCDCoDB4MDAwMDAxMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJ
TEhPVVNFX01FTV9XUklURSB8PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgSkFJTEhPVVNFX01FTV9JTyw8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB9LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8q
IFVTQiAqLyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
LnBoeXNfc3RhcnQgPSAweDAxYzFiNDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIC52aXJ0X3N0YXJ0ID0gMHgwMWMxYjQwMCw8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuc2l6ZSA9wqAgwqAgwqAgwqAweDAwMDAw
MTAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5mbGFn
cyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfDxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEpBSUxIT1VT
RV9NRU1fSU8sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBVU0IgKi8gezxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5waHlzX3N0YXJ0ID0gMHgwMWMxYjgwMCw8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9
IDB4MDFjMWI4MDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAwMDAwNCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlM
SE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9VU0VfTUVNX0lPLDxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyog
Q2xvY2sgKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5waHlzX3N0YXJ0ID0gMHgwMWMyMDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4MDFjMjAwMDAsPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAw
MDQwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9V
U0VfTUVNX0lPIHwgSkFJTEhPVVNFX01FTV9JT18zMiw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIFBpbmNv
bnRyb2wgKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5waHlzX3N0YXJ0ID0gMHgwMWMyMDgwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4MDFjMjA4MDAsPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAw
MDQwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9V
U0VfTUVNX0lPIHwgSkFJTEhPVVNFX01FTV9JT18zMiw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIFdhdGNo
ZG9nICovIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAu
cGh5c19zdGFydCA9IDB4MDFjMjBjYTAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgLnZpcnRfc3RhcnQgPSAweDAxYzIwY2EwLDxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5zaXplID3CoCDCoCDCoCDCoDB4MDAwMDAw
MjAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZsYWdz
ID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgSkFJTEhPVVNF
X01FTV9JTyB8IEpBSUxIT1VTRV9NRU1fSU9fMzIsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBVQVJUICov
IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAucGh5c19z
dGFydCA9IDB4MDFjMjgwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgLnZpcnRfc3RhcnQgPSAweDAxYzI4MDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5zaXplID3CoCDCoCDCoCDCoDB4MDAwMDAwMjAsPGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZsYWdzID0gSkFJ
TEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgSkFJTEhPVVNFX01FTV9J
TyB8IEpBSUxIT1VTRV9NRU1fSU9fMzIsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBJMkMgKi8gezxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5waHlzX3N0YXJ0ID0g
MHgwMWMyYjAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAudmlydF9zdGFydCA9IDB4MDFjMmIwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAwMDQwMCw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxhZ3MgPSBKQUlMSE9VU0Vf
TUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9VU0VfTUVNX0lPLDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgLyogRXRoZXJuZXQgKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIC5waHlzX3N0YXJ0ID0gMHgwMWMzMDAwMCw8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4MDFjMzAw
MDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUg
PcKgIMKgIMKgIMKgMHgwMDAxMDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVN
X1dSSVRFIHw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBKQUlMSE9VU0VfTUVNX0lPLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogR1BVICovIHs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAucGh5c19zdGFy
dCA9IDB4MDFjNDAwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgLnZpcnRfc3RhcnQgPSAweDAxYzQwMDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5zaXplID3CoCDCoCDCoCDCoDB4MDAwMTAwMDAsPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZsYWdzID0gSkFJTEhP
VVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgSkFJTEhPVVNFX01FTV9JTyw8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9LDxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIC8qIFNSQU0gKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIC5waHlzX3N0YXJ0ID0gMHgwMWQwMDAwMCw8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4MDFkMDAw
MDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUg
PcKgIMKgIMKgIMKgMHgwMDA0MDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVN
X1dSSVRFIHw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBKQUlMSE9VU0VfTUVNX0VYRUNVVEUsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBIRE1J
ICovIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAucGh5
c19zdGFydCA9IDB4MDFlZTAwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgLnZpcnRfc3RhcnQgPSAweDAxZWUwMDAwLDxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5zaXplID3CoCDCoCDCoCDCoDB4MDAwMTAwMDAs
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZsYWdzID0g
SkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgSkFJTEhPVVNFX01F
TV9JTyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9LDxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIEhETUkgKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5waHlzX3N0YXJ0ID0gMHgwMWVmMDAwMCw8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4
MDFlZjAwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
LnNpemUgPcKgIMKgIMKgIMKgMHgwMDAxMDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9V
U0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9VU0VfTUVNX0lPLDxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogUlRD
ICovIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAucGh5
c19zdGFydCA9IDB4MDFmMDAwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgLnZpcnRfc3RhcnQgPSAweDAxZjAwMDAwLDxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5zaXplID3CoCDCoCDCoCDCoDB4MDAwMDA0MDAs
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZsYWdzID0g
SkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgSkFJTEhPVVNFX01F
TV9JTyB8IEpBSUxIT1VTRV9NRU1fSU9fMzIsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBJbnRlcnJ1cHQg
Q29udHJvbGxlciAqLyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgLnBoeXNfc3RhcnQgPSAweDAxZjAwYzAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIC52aXJ0X3N0YXJ0ID0gMHgwMWYwMGMwMCw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuc2l6ZSA9wqAgwqAgwqAgwqAw
eDAwMDAwNDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEpB
SUxIT1VTRV9NRU1fSU8gfCBKQUlMSE9VU0VfTUVNX0lPXzMyLDxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyog
Q2xvY2sgKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5waHlzX3N0YXJ0ID0gMHgwMWYwMTQwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4MDFmMDE0MDAsPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAw
MDEwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9V
U0VfTUVNX0lPIHwgSkFJTEhPVVNFX01FTV9JT18zMiw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIFBpbmNv
bnRyb2wgKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5waHlzX3N0YXJ0ID0gMHgwMWYwMmMwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAudmlydF9zdGFydCA9IDB4MDFmMDJjMDAsPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnNpemUgPcKgIMKgIMKgIMKgMHgwMDAw
MDQwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBKQUlMSE9V
U0VfTUVNX0lPIHwgSkFJTEhPVVNFX01FTV9JT18zMiw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIFJTQihS
ZWR1Y2VkIFNlcmlhbCBCdXMpICovIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAucGh5c19zdGFydCA9IDB4MDFmMDM0MDAsPGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnZpcnRfc3RhcnQgPSAweDAxZjAzNDAwLDxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5zaXplID3CoCDC
oCDCoCDCoDB4MDAwMDA0MDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklU
RSB8PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgSkFJTEhPVVNFX01FTV9JTyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB9LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgLyogU3lzdGVtIFJBTSAqLyB7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAucGh5c19zdGFydCA9IDB4
NDAwMDAwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAudmly
dF9zdGFydCA9IDB4NDAwMDAwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAuc2l6ZSA9IDB4N2MwMDAwMDAsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVN
X1dSSVRFIHw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoEpBSUxIT1VTRV9NRU1fRVhFQ1VURSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBJVlNITUVNIHNoYXJlZCBt
ZW1vcnkgcmVnaW9uICovIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoC5waHlzX3N0YXJ0ID0gMHhiYmYwMDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoC52aXJ0X3N0YXJ0ID0gMHhiYmYwMDAwMCw8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5zaXplID0gMHgxMDAwMDAsPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JF
QUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
fSw8YnI+DQomZ3Q7ICvCoCDCoCDCoH0sPGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAu
aXJxY2hpcHMgPSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBHSUMgKi8gezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmFkZHJlc3MgPSAweDAx
YzgxMDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLnBpbl9i
YXNlID0gMzIsPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAucGlu
X2JpdG1hcCA9IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZmYs
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9LDxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgfSw8YnI+DQomZ3Q7ICvCoCDCoCDCoH0sPGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArwqAgwqAgwqAucGNpX2RldmljZXMgPSB7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAvKiAwMDAxOjAwOjAwLjAgKi8gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfSVZTSE1FTSw8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5kb21haW4gPSAxLDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmJkZiA9IDB4MDAsPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuYmFyX21hc2sgPSB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweGZmZmZm
ZjAwLCAweGZmZmZmZmZmLCAweDAwMDAwMDAwLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0sPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuc2htZW1fcmVnaW9uID0gMzQs
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuc2htZW1fcHJvdG9j
b2wgPSBKQUlMSE9VU0VfU0hNRU1fUFJPVE9fVkVUSCw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoH0sPGJyPg0KJmd0OyArwqAgwqAgwqB9LDxicj4NCiZndDsgK307PGJyPg0KJmd0Ozxi
cj4NCjxicj4NClRoYW5rcyBmb3IgYWRkaW5nIHRoaXMgYm9hcmQuIFRoYXQmIzM5O3MgdGhpczxi
cj4NCjxhIGhyZWY9Imh0dHBzOi8vc3RvcmUucGluZTY0Lm9yZy8/cHJvZHVjdD1waW5lLWE2NC1i
b2FyZC0yZ2IiIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIG5vcmVmZXJyZXIgbm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vc3RvcmUucGluZTY0Lm9yZy8/cHJvZHVjdD1waW5l
LWE2NC1ib2FyZC0yZ2I8L2E+LCByaWdodD8gPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2PjxkaXYg
ZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPlllcy4gVGhhdCBpcyB0aGUgb25l
LjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxkaXYgY2xh
c3M9ImdtYWlsX3F1b3RlIj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJt
YXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6
MWV4Ij5XaWxsIHRoYXQ8YnI+DQpjb25maWcgYWxzbyBjb3ZlciB0aGUgTFRTIHZhcmlhbnQ/IEp1
c3QgY3VyaW91cy48YnI+PC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48
YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPklkZWFsbHkgaXQgc2hvdWxkIGJ1dCBJIGRvbiYjMzk7
dCBoYXZlIGFuIExUUyB2YXJpYW50IHRvIHRlc3QgaXQgb3V0LjwvZGl2PjxkaXYgZGlyPSJhdXRv
Ij48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48Ymxv
Y2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3Jk
ZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCkNvdWxkIHlvdSByZWJh
c2UgeW91ciBwYXRjaGVzIG92ZXIgbmV4dCAod2lsbCBiZSBtYXN0ZXIgc29vbik/IFRoaXM8YnI+
DQpzcGVjaWZpY2FsbHkgYWZmZWN0cyB0aGUgaXZzaG1lbSBkZXZpY2VzIGFuZCBtZW1vcnkgcmVn
aW9ucy4gPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+
PGRpdiBkaXI9ImF1dG8iPlN1cmUsIHdpbGwgZG8gdGhhdC4gSSYjMzk7bSBvbiB0cmF2ZWwsIHNv
LMKgIGhvcGVmdWxseSBieSB0aGlzIHdlZWtlbmQuPC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48
L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxibG9ja3F1b3Rl
IGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0
OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPkFuZCBjb3VsZDxicj4NCnlvdSBhbHNv
IGFkZCBhIGxpbnV4LWRlbW8gY29uZmlnPzxicj48L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+PGRp
diBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+TGludXggZGVtbyBpcyBpbiB3
b3Jrcy4gV2lsbCB0cnkgdG8gY29tcGxldGUgYW5kIHNlbmQgdGhhdCBpbiBjb21pbmcgd2Vla3Mu
PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+VGhhbmtzLMKg
PC9kaXY+PGRpdiBkaXI9ImF1dG8iPlZpamFpIEt1bWFyIEs8L2Rpdj48ZGl2IGRpcj0iYXV0byI+
PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8YnI+DQpKYW48YnI+DQo8
L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+PC9kaXY+DQoNCjxwPjwvcD4KCi0tIDxiciAvPgpZb3Ug
cmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBH
b29nbGUgR3JvdXBzICZxdW90O0phaWxob3VzZSZxdW90OyBncm91cC48YnIgLz4KVG8gdW5zdWJz
Y3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwg
c2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldit1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tIj5qYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+LjxiciAvPgpUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0
IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2
L0NBTExHR19LelJNJTJCZzMlMkJlSmY3WTZxN19CcHQtUnRGY2lIU1BQciUyQkF0OTZGWGFremdC
USU0MG1haWwuZ21haWwuY29tP3V0bV9tZWRpdW09ZW1haWwmdXRtX3NvdXJjZT1mb290ZXIiPmh0
dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBTExHR19LelJN
JTJCZzMlMkJlSmY3WTZxN19CcHQtUnRGY2lIU1BQciUyQkF0OTZGWGFremdCUSU0MG1haWwuZ21h
aWwuY29tPC9hPi48YnIgLz4K
--000000000000d5ff76059bffd1ac--
