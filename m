Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5MOSP7AKGQECHRMDTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF72C81FB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 11:20:37 +0100 (CET)
Received: by mail-ej1-x63e.google.com with SMTP id u10sf3473126ejy.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 02:20:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606731637; cv=pass;
        d=google.com; s=arc-20160816;
        b=wosRIP34yO5Y+yTYZO99scvCOnIE3V+H2Rqc2czv4LJUgIcTDMq7l3D1ELiyJCTQCU
         m9MGcPszNpQ6xM84IFoH4KTFefE+zX55eOq0jaaWE/DEZ45xaT90m4tqZOEicuNacvix
         Cb/kq9p1qKmcSrfPvYZ6hPWZmtWa3vMNWpgNIvmfI/IHrKJseZUr5thISj2yciHSL/5M
         8vlfkO2B/OjkhlZ7ukOkoaCIjd5DgpE9NhouWmYzeTUv30dLTGHkl1a1QebRGcj81Dsz
         1p0RDiimkR07V4aAVC7UjbXHfQV0Vi6xy97mEb46iM4w2QP3jq8Yj+sLF4PUkt9kuTAM
         vNOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=6HjlZTOrBVVKNBwgYhtLu4sA19dW38W2FrOrhroe9x0=;
        b=Cn+gz+4/LKxeHqCB2z3Hy0R19TUPTA/TvySkoUOJtJC0NtqbNCOlk4TZufHJFWfb04
         rQ91LVZeM+zxAv+58dcN15oVJW+uiuqNhzA1ldVD3ZYUNq5F7xh2suBkMq19U2MBK59j
         vxOSQB3dXUAhNfdkUwybwgISetJUfK9Y+7pQQOsYiSyN2OKeHq6ypfT54UN8R4XOnnsB
         EwQ5iH4vOKu+kxCS7xnQDtkEZyByCcUTkCT/vCsTTUlMaWnrIOZXNryXc9WN3o1Xy5Fd
         cVOyYentXVqffRgHJyVvkJHSDBcHwtYSmxv/+AAvVVo7ZJd6XSaD3pb3MrABGzFWgWMw
         GK9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6HjlZTOrBVVKNBwgYhtLu4sA19dW38W2FrOrhroe9x0=;
        b=XW/Ls5j4v5CP1UBcBoN2tQyf/4D3v+b9rKBlEAVEayYHv7jq8g6ljrqNEJooM3WawH
         oMOKIdlfbanGIv19cm9BJQedsFxpLUfdZdf7p9qdB9zOnukoffn6NmdSnEX5ii6YPHaX
         /qGaUqsehmER6ScZZN6HvVq24meIiPzbYGGW99O4I13q/XGRUgxRzu3jPP6IN2Ikk7VL
         4+R5onVt0pKcRpFMlErosjFgY0ZNYlKWMBbJg0a2ceXPmYZsZHEb1sqkh2BBE+iAAxUj
         o/e/0IDHoMP+zlA5/+Myi49EBOJWAwKCD5VXDarJZzdrO9APQgsixELUTuHRYkHAu1O/
         U5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6HjlZTOrBVVKNBwgYhtLu4sA19dW38W2FrOrhroe9x0=;
        b=YJqu03wheqha55AnmBxk7xtTu8ZjQ/MQ5RyqOAeG6yMFsXeLYpjpAzYCPN+XUiVj22
         N5t38uj2qAOi1ckNIZ3+XkhlAb+Y87iIO5YYgk1hB1R0atX9WOVeE6of5Lhc3LbINAva
         t9KTDApClL/42Xfu244j+ruB6GBpQz/udPB7XLokDD7N4GtABs0qLCfri7/VeD+cMRZk
         PAC8lV7ZRPqd2B8HXOpbq4zWPnryHz0cqsSzYTs58aPCkEUuG0G2onnadOlJ7fymdVUp
         4pOCZciPCTJDc1ZVEFVa9GhXKXoCxydoNKSvSw3Q2l46Y9wikJFJrFYSCB1GlXI9N4l4
         h/qw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531thfBCKbCtPp1pL8n+K+kRKXjFLnVfHXuiS0qF0DwrzsjdJQUe
	Cnh0Ny/rluxVjKd6+zgVmEM=
X-Google-Smtp-Source: ABdhPJwxM6OU1D+HJG1hbGH3jGh6N0bK+TOG8c29fsnpWnxDIkxpqAQ4hhHdKDtXU4HgZuI+tAFrOw==
X-Received: by 2002:a05:6402:22ea:: with SMTP id dn10mr14564086edb.67.1606731637648;
        Mon, 30 Nov 2020 02:20:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:22d3:: with SMTP id dm19ls2230032edb.2.gmail; Mon,
 30 Nov 2020 02:20:36 -0800 (PST)
X-Received: by 2002:a05:6402:144f:: with SMTP id d15mr20998215edx.300.1606731636605;
        Mon, 30 Nov 2020 02:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606731636; cv=none;
        d=google.com; s=arc-20160816;
        b=fn2+Y9N3UmVe9qpkYtReqWkBbqf9wZJ70XGvxm4kODimWTVNQFwOjJSoZ4n98W2/LQ
         TZHTvCwvDwRsD3sG5jP2hc/XRDOo+0UH2ymYQCdA1ye+kfe1BSjSSomVqdEeVqATZD5F
         z2QKjQUOJli5Qz5LD7JuKsaceV8oT6UK4OntzbXfkJR6DsLx40stpEVHRlXZA91iX558
         pck2NfUJBgQ2GQ92IWml96qyase0jaasn5KWZWVmk7P6RTxNGyLtFq3i44WUIZdAElpB
         WXLs0bspkrw0FEwlUCB6nxziD/uAEFZI03sM1X/yRrR2wtd+IdC45/X8u0TzbIvzstIu
         XokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=aGMR8u43oFhJAqADWc9HLTrvtkRqBRk2HCwKs1cdLz8=;
        b=jQF5BbuwK6S11tLo+ZJAuIkwFOefsFmGOG+sSwY8xfz2Epjq8bEPx4nwpEI+OECWh+
         3Ahdi7S/sUPVsUEXD0JRbztRZhRFDjcsqzaFQR21/yKJbVHrql6dZWR460ZpdKark1kl
         9gvDs9ne8kbQVfa3dIJhOGubHwjYX6fb46PEgW5WMyIGwf3V9pzAkcffQaAJbwCqpXD/
         41CN23Hht6B8EbHJiNghqQs2kDDdKOThCF9uHxEfloSX5tZjY8uGUYz2eirkE76rLAmn
         TE/2nmr92zD9nijr3aPSUP9pRkp8+VqgU0X7EHEW5Y3oBEAOMA7PPJ/Iv0/YAlb0YCZA
         X87A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j6si40391edl.2.2020.11.30.02.20.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 02:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AUAKaDT016568
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Nov 2020 11:20:36 +0100
Received: from [167.87.39.132] ([167.87.39.132])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AUAKZtv012745;
	Mon, 30 Nov 2020 11:20:35 +0100
Subject: Re: [PATCH] configs: add ls1046ardb linux demo
To: Peter Pan <jiafei.pan@nxp.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20201130070515.21504-1-Jiafei.Pan@nxp.com>
 <8a7f2697-3782-61d5-d68d-859e20fa1269@siemens.com>
 <09f76682-1c9d-4ddb-b8ca-3aab01218e47n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <41e873f3-1eff-a142-a9f1-de08ef22786f@siemens.com>
Date: Mon, 30 Nov 2020 11:20:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <09f76682-1c9d-4ddb-b8ca-3aab01218e47n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 30.11.20 08:19, Peter Pan wrote:
>=20
>=20
> On Monday, November 30, 2020 at 3:02:12 PM UTC+8 j.kiszka...@gmail.com
> wrote:
>=20
>     On 30.11.20 08:05, Jiafei Pan wrote:
>     > Add root cell, inmate cell, ivshmem demo cell and Linux demo cell
>     > configure files for NXP ls1046a RDB platform.
>     >
>     > Signed-off-by: Jiafei Pan <Jiafe...@nxp.com>
>     > ---
>     > configs/arm64/ls1046a-rdb-inmate-demo.c | 67 +++
>     > configs/arm64/ls1046a-rdb-ivshmem-demo.c | 142 +++++++
>     > configs/arm64/ls1046a-rdb-linux-demo.c | 165 ++++++++
>     > configs/arm64/ls1046a-rdb.c | 517 +++++++++++++++++++++++
>     > 4 files changed, 891 insertions(+)
>     > create mode 100644 configs/arm64/ls1046a-rdb-inmate-demo.c
>     > create mode 100644 configs/arm64/ls1046a-rdb-ivshmem-demo.c
>     > create mode 100644 configs/arm64/ls1046a-rdb-linux-demo.c
>     > create mode 100644 configs/arm64/ls1046a-rdb.c
>     >
>     > diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c
>     b/configs/arm64/ls1046a-rdb-inmate-demo.c
>     > new file mode 100644
>     > index 00000000..0f4f2395
>     > --- /dev/null
>     > +++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
>     > @@ -0,0 +1,67 @@
>     > +/*
>     > + * ls1046a RDB - inmate demo
>     > + *
>     > + * Copyright NXP 2020
>     > + *
>     > + * Authors:
>     > + * Jiafei Pan <jiafe...@nxp.com>
>     > + *
>     > + * This work is licensed under the terms of the GNU GPL, version
>     2. See
>     > + * the COPYING file in the top-level directory.
>     > + */
>     > +
>     > +#include <jailhouse/types.h>
>     > +#include <jailhouse/cell-config.h>
>     > +
>     > +struct {
>     > + struct jailhouse_cell_desc cell;
>     > + __u64 cpus[1];
>     > + struct jailhouse_memory mem_regions[3];
>     > +} __attribute__((packed)) config =3D {
>     > + .cell =3D {
>     > + .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
>     > + .revision =3D JAILHOUSE_CONFIG_REVISION,
>     > + .name =3D "inmate-demo",
>     > + .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
>     > +
>     > + .cpu_set_size =3D sizeof(config.cpus),
>     > + .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
>     > + .num_irqchips =3D 0,
>     > + .num_pci_devices =3D 0,
>     > +
>     > + .console =3D {
>     > + .address =3D 0x21c0600, /* Uart1 in DUART1 */
>     > + .divider =3D 0xbd, /* baudrate: 115200 */
>     > + .type =3D JAILHOUSE_CON_TYPE_8250,
>     > + .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
>     > + JAILHOUSE_CON_REGDIST_1,
>     > + },
>     > + },
>     > +
>     > + .cpus =3D {
>     > + 0x8,
>     > + },
>     > +
>     > + .mem_regions =3D {
>     > + /* DUART1 */ {
>     > + .phys_start =3D 0x21c0000,
>     > + .virt_start =3D 0x21c0000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + /* RAM: Top at 2GB DRAM1 Space */ {
>     > + .phys_start =3D 0xc0000000,
>     > + .virt_start =3D 0,
>     > + .size =3D 0x00010000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>     > + },
>     > + /* communication region */ {
>     > + .virt_start =3D 0x80000000,
>     > + .size =3D 0x00001000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_COMM_REGION,
>     > + },
>     > + }
>     > +};
>     > diff --git a/configs/arm64/ls1046a-rdb-ivshmem-demo.c
>     b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
>     > new file mode 100644
>     > index 00000000..907ba1f1
>     > --- /dev/null
>     > +++ b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
>     > @@ -0,0 +1,142 @@
>     > +/*
>     > + * ls1046a RDB - ivshmem demo
>     > + *
>     > + * Copyright NXP 2020
>     > + *
>     > + * Authors:
>     > + * Jiafei Pan <jiafe...@nxp.com>
>     > + *
>     > + * This work is licensed under the terms of the GNU GPL, version
>     2. See
>     > + * the COPYING file in the top-level directory.
>     > + */
>     > +
>     > +#include <jailhouse/types.h>
>     > +#include <jailhouse/cell-config.h>
>     > +
>     > +struct {
>     > + struct jailhouse_cell_desc cell;
>     > + __u64 cpus[1];
>     > + struct jailhouse_memory mem_regions[8];
>     > + struct jailhouse_irqchip irqchips[2];
>     > + struct jailhouse_pci_device pci_devices[1];
>     > +} __attribute__((packed)) config =3D {
>     > + .cell =3D {
>     > + .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
>     > + .revision =3D JAILHOUSE_CONFIG_REVISION,
>     > + .name =3D "ivshmem-demo",
>     > + .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
>     > +
>     > + .cpu_set_size =3D sizeof(config.cpus),
>     > + .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
>     > + .num_irqchips =3D ARRAY_SIZE(config.irqchips),
>     > + .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
>     > + .vpci_irq_base =3D 60 - 32, /* vPCI INTx */
>     > +
>     > + .console =3D {
>     > + .address =3D 0x21c0600, /* Uart1 in DUART1 */
>     > + .divider =3D 0xbd, /* baudrate: 115200 */
>     > + .type =3D JAILHOUSE_CON_TYPE_8250,
>     > + .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
>     > + JAILHOUSE_CON_REGDIST_1,
>     > + },
>     > + },
>     > +
>     > + .cpus =3D {
>     > + 0x8,
>     > + },
>     > +
>     > + .mem_regions =3D {
>     > + /* IVHSMEM shared memory region for 00:00.0 */ {
>     > + .phys_start =3D 0xfb700000,
>     > + .virt_start =3D 0xfb700000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb701000,
>     > + .virt_start =3D 0xfb701000,
>     > + .size =3D 0x9000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb70a000,
>     > + .virt_start =3D 0xfb70a000,
>     > + .size =3D 0x2000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb70c000,
>     > + .virt_start =3D 0xfb70c000,
>     > + .size =3D 0x2000,
>     > + //.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb70e000,
>     > + .virt_start =3D 0xfb70e000,
>     > + .size =3D 0x2000,
>     > + //.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + // JAILHOUSE_MEM_ROOTSHARED,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + /* DUART1 */ {
>     > + .phys_start =3D 0x21c0000,
>     > + .virt_start =3D 0x21c0000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + /* RAM: Top at 4GB Space */ {
>     > + .phys_start =3D 0xc0000000,
>     > + .virt_start =3D 0,
>     > + .size =3D 0x00010000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>     > + },
>     > + /* communication region */ {
>     > + .virt_start =3D 0x80000000,
>     > + .size =3D 0x00001000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_COMM_REGION,
>     > + },
>     > + },
>     > +
>     > + .irqchips =3D {
>     > + /* GIC-400 */ {
>     > + .address =3D 0x1410000,
>     > + .pin_base =3D 32,
>     > + .pin_bitmap =3D {
>     > + 1 << (60 - 32), /* vPCI */
>     > + 0,
>     > + 0,
>     > + 0,
>     > + },
>     > + },
>     > + /* GIC-400 */ {
>     > + .address =3D 0x1410000,
>     > + .pin_base =3D 160,
>     > + .pin_bitmap =3D {
>     > + 0,
>     > + 0,
>     > + 0,
>     > + 0,
>     > + },
>     > + },
>     > + },
>     > +
>     > + .pci_devices =3D {
>     > + { /* IVSHMEM 00:00.0 (demo) */
>     > + .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>     > + .domain =3D 0,
>     > + .bdf =3D 0 << 3,
>     > + .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>     > + .shmem_regions_start =3D 0,
>     > + .shmem_dev_id =3D 1,
>     > + .shmem_peers =3D 1,
>     > + .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>     > + },
>     > + },
>     > +
>     > +};
>     > diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c
>     b/configs/arm64/ls1046a-rdb-linux-demo.c
>     > new file mode 100644
>     > index 00000000..c8f699bb
>     > --- /dev/null
>     > +++ b/configs/arm64/ls1046a-rdb-linux-demo.c
>     > @@ -0,0 +1,165 @@
>     > +/*
>     > + * ls1046a RDB target - linux-demo
>     > + *
>     > + * Copyright 2020 NXP
>     > + *
>     > + * Authors:
>     > + * Jiafei Pan <jiafe...@nxp.com>
>     > + *
>     > + * This work is licensed under the terms of the GNU GPL, version
>     2. See
>     > + * the COPYING file in the top-level directory.
>     > + */
>     > +
>     > +#include <jailhouse/types.h>
>     > +#include <jailhouse/cell-config.h>
>     > +
>     > +struct {
>     > + struct jailhouse_cell_desc cell;
>     > + __u64 cpus[1];
>     > + struct jailhouse_memory mem_regions[16];
>     > + struct jailhouse_irqchip irqchips[2];
>     > + struct jailhouse_pci_device pci_devices[2];
>     > +} __attribute__((packed)) config =3D {
>     > + .cell =3D {
>     > + .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
>     > + .revision =3D JAILHOUSE_CONFIG_REVISION,
>     > + .name =3D "linux-inmate-demo",
>     > + .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
>     > +
>     > + .cpu_set_size =3D sizeof(config.cpus),
>     > + .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
>     > + .num_irqchips =3D ARRAY_SIZE(config.irqchips),
>     > + .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
>     > + .vpci_irq_base =3D 60 - 32, /* vPCI INTx: 60,61,62,63 */
>     > + },
>     > +
>     > + .cpus =3D {
>     > + 0xc,
>     > + },
>     > +
>     > + .mem_regions =3D {
>     > + /* IVHSMEM shared memory region for 00:00.0 */ {
>     > + .phys_start =3D 0xfb700000,
>     > + .virt_start =3D 0xfb700000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb701000,
>     > + .virt_start =3D 0xfb701000,
>     > + .size =3D 0x9000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb70a000,
>     > + .virt_start =3D 0xfb70a000,
>     > + .size =3D 0x2000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb70c000,
>     > + .virt_start =3D 0xfb70c000,
>     > + .size =3D 0x2000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb70e000,
>     > + .virt_start =3D 0xfb70e000,
>     > + .size =3D 0x2000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + /* IVSHMEM shared memory regions for 00:01.0 (networking) */
>     > + JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
>     > + /* DUART1 */ {
>     > + .phys_start =3D 0x21c0000,
>     > + .virt_start =3D 0x21c0000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + /* clockgen */ {
>     > + .phys_start =3D 0x01ee1000,
>     > + .virt_start =3D 0x01ee1000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>     > + },
>     > + /* dcfg */ {
>     > + .phys_start =3D 0x01ee0000,
>     > + .virt_start =3D 0x01ee0000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* RAM */ {
>     > + .phys_start =3D 0xbf900000,
>     > + .virt_start =3D 0,
>     > + .size =3D 0x00010000, /* 64K */
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>     > + },
>     > + /* RAM: Top at DRAM1 2GB Space */ {
>     > + .phys_start =3D 0xc0000000,
>     > + .virt_start =3D 0xc0000000,
>     > + .size =3D 0x3b500000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>     > + JAILHOUSE_MEM_LOADABLE,
>     > + },
>     > + /* communication region */ {
>     > + .virt_start =3D 0x80000000,
>     > + .size =3D 0x00001000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_COMM_REGION,
>     > + },
>     > + },
>     > +
>     > + .irqchips =3D {
>     > + /* GIC-400 */ {
>     > + .address =3D 0x1410000,
>     > + .pin_base =3D 32,
>     > + .pin_bitmap =3D {
>     > + 1 << (60 -32) | 1 << (61 - 32) |
>     > + 1 << (62 - 32) | 1 << (63 -32), /* vPCI */
>     > + 0,
>     > + 0,
>     > + 0,
>     > + },
>     > + },
>     > + /* GIC-400 */ {
>     > + .address =3D 0x1410000,
>     > + .pin_base =3D 160,
>     > + .pin_bitmap =3D {
>     > + 0,
>     > + 0,
>     > + 0,
>     > + 0,
>     > + },
>     > + },
>     > + },
>     > +
>     > + .pci_devices =3D {
>     > + { /* IVSHMEM 00:00.0 (demo) */
>     > + .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>     > + .domain =3D 0,
>     > + .bdf =3D 0 << 3,
>     > + .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>     > + .shmem_regions_start =3D 0,
>     > + .shmem_dev_id =3D 2,
>     > + .shmem_peers =3D 3,
>     > + .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>     > + },
>     > + { /* IVSHMEM 00:01.0 (networking) */
>     > + .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>     > + .domain =3D 0,
>     > + .bdf =3D 1 << 3,
>     > + .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>     > + .shmem_regions_start =3D 5,
>     > + .shmem_dev_id =3D 1,
>     > + .shmem_peers =3D 2,
>     > + .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
>     > + },
>     > + },
>     > +};
>     > diff --git a/configs/arm64/ls1046a-rdb.c
>     b/configs/arm64/ls1046a-rdb.c
>     > new file mode 100644
>     > index 00000000..3eb58005
>     > --- /dev/null
>     > +++ b/configs/arm64/ls1046a-rdb.c
>     > @@ -0,0 +1,517 @@
>     > +/*
>     > + * ls1046a RDB target - linux-demo
>     > + *
>     > + * Copyright 2020 NXP
>     > + *
>     > + * Authors:
>     > + * Jiafei Pan <jiafe...@nxp.com>
>     > + *
>     > + * This work is licensed under the terms of the GNU GPL, version
>     2. See
>     > + * the COPYING file in the top-level directory.
>     > + */
>     > +
>     > +#include <jailhouse/types.h>
>     > +#include <jailhouse/cell-config.h>
>     > +
>     > +struct {
>     > + struct jailhouse_system header;
>     > + __u64 cpus[1];
>     > + struct jailhouse_memory mem_regions[64];
>     > + struct jailhouse_irqchip irqchips[2];
>     > + struct jailhouse_pci_device pci_devices[2];
>     > +} __attribute__((packed)) config =3D {
>     > + .header =3D {
>     > + .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
>     > + .revision =3D JAILHOUSE_CONFIG_REVISION,
>     > + .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>     > + .hypervisor_memory =3D {
>     > + .phys_start =3D 0xfba00000,
>     > + .size =3D 0x00400000,
>     > + },
>     > + .debug_console =3D {
>     > + .address =3D 0x21c0500, /* Uart0 in DUART1 */
>     > + .size =3D 0x100,
>     > + .type =3D JAILHOUSE_CON_TYPE_8250,
>     > + .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
>     > + JAILHOUSE_CON_REGDIST_1,
>     > + },
>     > + .platform_info =3D {
>     > + .pci_mmconfig_base =3D 0xfb500000,
>     > + .pci_mmconfig_end_bus =3D 0,
>     > + .pci_is_virtual =3D 1,
>     > + .pci_domain =3D -1,
>     > +
>     > + .arm =3D {
>     > + .gic_version =3D 2,
>     > + .gicd_base =3D 0x1410000,
>     > + .gicc_base =3D 0x142f000,
>     > + .gich_base =3D 0x1440000,
>     > + .gicv_base =3D 0x146f000,
>     > + .maintenance_irq =3D 25,
>     > + },
>     > + },
>     > + .root_cell =3D {
>     > + .name =3D "ls1046a",
>     > + .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
>     > + .cpu_set_size =3D sizeof(config.cpus),
>     > + .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
>     > + .num_irqchips =3D ARRAY_SIZE(config.irqchips),
>     > + .vpci_irq_base =3D 67 - 32, /* Not include 32 base */
>     > + },
>     > + },
>     > +
>     > + .cpus =3D {
>     > + 0xf,
>     > + },
>     > +
>     > + .mem_regions =3D {
>     > + /* IVHSMEM shared memory region for 00:00.0 */ {
>     > + .phys_start =3D 0xfb700000,
>     > + .virt_start =3D 0xfb700000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb701000,
>     > + .virt_start =3D 0xfb701000,
>     > + .size =3D 0x9000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb70a000,
>     > + .virt_start =3D 0xfb70a000,
>     > + .size =3D 0x2000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb70c000,
>     > + .virt_start =3D 0xfb70c000,
>     > + .size =3D 0x2000,
>     > + .flags =3D JAILHOUSE_MEM_READ,
>     > + },
>     > + {
>     > + .phys_start =3D 0xfb70e000,
>     > + .virt_start =3D 0xfb70e000,
>     > + .size =3D 0x2000,
>     > + .flags =3D JAILHOUSE_MEM_READ,
>     > + },
>     > + /* IVSHMEM shared memory regions for 00:01.0 (networking) */
>     > + JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
>     > + /* RAM - 1GB at DRAM1 region - root cell */ {
>     > + .phys_start =3D 0x80000000,
>     > + .virt_start =3D 0x80000000,
>     > + .size =3D 0x40000000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_EXECUTE,
>     > + },
>     > + /* DRAM2 6GB */ {
>     > + .phys_start =3D 0x880000000,
>     > + .virt_start =3D 0x880000000,
>     > + .size =3D 0x180000000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_EXECUTE,
>     > + },
>     > + /* RAM: Inmate */ {
>     > + .phys_start =3D 0xc0000000,
>     > + .virt_start =3D 0xc0000000,
>     > + .size =3D 0x3b500000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_EXECUTE,
>     > + },
>     > + /* RAM: loader */ {
>     > + .phys_start =3D 0xbf900000,
>     > + .virt_start =3D 0xbf900000,
>     > + .size =3D 0x00100000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_EXECUTE,
>     > + },
>     > + /* DDR memory controller */ {
>     > + .phys_start =3D 0x01080000,
>     > + .virt_start =3D 0x01080000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* IFC */ {
>     > + .phys_start =3D 0x01530000,
>     > + .virt_start =3D 0x01530000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* QSPI */ {
>     > + .phys_start =3D 0x01550000,
>     > + .virt_start =3D 0x01550000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* esdhc */ {
>     > + .phys_start =3D 0x01560000,
>     > + .virt_start =3D 0x01560000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* scfg */ {
>     > + .phys_start =3D 0x01570000,
>     > + .virt_start =3D 0x01570000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* crypto */ {
>     > + .phys_start =3D 0x01700000,
>     > + .virt_start =3D 0x01700000,
>     > + .size =3D 0x100000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* qman */ {
>     > + .phys_start =3D 0x01880000,
>     > + .virt_start =3D 0x01880000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* bman */ {
>     > + .phys_start =3D 0x01890000,
>     > + .virt_start =3D 0x01890000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* fman */ {
>     > + .phys_start =3D 0x01a00000,
>     > + .virt_start =3D 0x01a00000,
>     > + .size =3D 0x100000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* qportals CE */ {
>     > + .phys_start =3D 0x500000000,
>     > + .virt_start =3D 0x500000000,
>     > + .size =3D 0x4000000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>     > + },
>     > + /* qportals CI */ {
>     > + .phys_start =3D 0x504000000,
>     > + .virt_start =3D 0x504000000,
>     > + .size =3D 0x4000000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* bportals CE */ {
>     > + .phys_start =3D 0x508000000,
>     > + .virt_start =3D 0x508000000,
>     > + .size =3D 0x4000000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>     > + },
>     > + /* bportals CI */ {
>     > + .phys_start =3D 0x50c000000,
>     > + .virt_start =3D 0x50c000000,
>     > + .size =3D 0x4000000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* dcfg */ {
>     > + .phys_start =3D 0x01ee0000,
>     > + .virt_start =3D 0x01ee0000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* clockgen */ {
>     > + .phys_start =3D 0x01ee1000,
>     > + .virt_start =3D 0x01ee1000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* rcpm */ {
>     > + .phys_start =3D 0x01ee2000,
>     > + .virt_start =3D 0x01ee2000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* tmu */ {
>     > + .phys_start =3D 0x01f00000,
>     > + .virt_start =3D 0x01f00000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* dspi */ {
>     > + .phys_start =3D 0x02100000,
>     > + .virt_start =3D 0x02100000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* i2c0 */ {
>     > + .phys_start =3D 0x02180000,
>     > + .virt_start =3D 0x02180000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* i2c1 */ {
>     > + .phys_start =3D 0x02190000,
>     > + .virt_start =3D 0x02190000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* i2c2 */ {
>     > + .phys_start =3D 0x021a0000,
>     > + .virt_start =3D 0x021a0000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* i2c3 */ {
>     > + .phys_start =3D 0x021b0000,
>     > + .virt_start =3D 0x021b0000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* duart1 */ {
>     > + .phys_start =3D 0x021c0000,
>     > + .virt_start =3D 0x021c0000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* duart2 */ {
>     > + .phys_start =3D 0x021d0000,
>     > + .virt_start =3D 0x021d0000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* gpio0 */ {
>     > + .phys_start =3D 0x02300000,
>     > + .virt_start =3D 0x02300000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* gpio1 */ {
>     > + .phys_start =3D 0x02310000,
>     > + .virt_start =3D 0x02310000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* gpio2 */ {
>     > + .phys_start =3D 0x02320000,
>     > + .virt_start =3D 0x02320000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* gpio3 */ {
>     > + .phys_start =3D 0x02330000,
>     > + .virt_start =3D 0x02330000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* lpuart0 */ {
>     > + .phys_start =3D 0x02950000,
>     > + .virt_start =3D 0x02950000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* lpuart1 */ {
>     > + .phys_start =3D 0x02960000,
>     > + .virt_start =3D 0x02960000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* lpuart2 */ {
>     > + .phys_start =3D 0x02970000,
>     > + .virt_start =3D 0x02970000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* lpuart3 */ {
>     > + .phys_start =3D 0x02980000,
>     > + .virt_start =3D 0x02980000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* lpuart4 */ {
>     > + .phys_start =3D 0x02990000,
>     > + .virt_start =3D 0x02990000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* lpuart5 */ {
>     > + .phys_start =3D 0x029a0000,
>     > + .virt_start =3D 0x029a0000,
>     > + .size =3D 0x1000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* wdog0 */ {
>     > + .phys_start =3D 0x02ad0000,
>     > + .virt_start =3D 0x02ad0000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* edma0 */ {
>     > + .phys_start =3D 0x02c00000,
>     > + .virt_start =3D 0x02c00000,
>     > + .size =3D 0x30000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* usb0 */ {
>     > + .phys_start =3D 0x02f00000,
>     > + .virt_start =3D 0x02f00000,
>     > + .size =3D 0x100000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* usb1 */ {
>     > + .phys_start =3D 0x03000000,
>     > + .virt_start =3D 0x03000000,
>     > + .size =3D 0x100000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* usb2 */ {
>     > + .phys_start =3D 0x03100000,
>     > + .virt_start =3D 0x03100000,
>     > + .size =3D 0x100000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* sata */ {
>     > + .phys_start =3D 0x03200000,
>     > + .virt_start =3D 0x03200000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* msi1 */ {
>     > + .phys_start =3D 0x01580000,
>     > + .virt_start =3D 0x01580000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* msi2 */ {
>     > + .phys_start =3D 0x01590000,
>     > + .virt_start =3D 0x01590000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* msi3 */ {
>     > + .phys_start =3D 0x015a0000,
>     > + .virt_start =3D 0x015a0000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* pcie0 */ {
>     > + .phys_start =3D 0x03400000,
>     > + .virt_start =3D 0x03400000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* pcie1 */ {
>     > + .phys_start =3D 0x03500000,
>     > + .virt_start =3D 0x03500000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* pcie2 */ {
>     > + .phys_start =3D 0x03600000,
>     > + .virt_start =3D 0x03600000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* pcie2 pf0 */ {
>     > + .phys_start =3D 0x036c0000,
>     > + .virt_start =3D 0x036c0000,
>     > + .size =3D 0x10000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* PCI host bridge 0 */ {
>     > + .phys_start =3D 0x4000000000,
>     > + .virt_start =3D 0x4000000000,
>     > + .size =3D 0x800000000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* PCI host bridge 1 */ {
>     > + .phys_start =3D 0x4800000000,
>     > + .virt_start =3D 0x4800000000,
>     > + .size =3D 0x800000000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + /* PCI host bridge 2 */ {
>     > + .phys_start =3D 0x5000000000,
>     > + .virt_start =3D 0x5000000000,
>     > + .size =3D 0x800000000,
>     > + .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > + JAILHOUSE_MEM_IO,
>     > + },
>     > + },
>     > +
>     > + .irqchips =3D {
>     > + /* GIC */ {
>     > + .address =3D 0x1410000,
>     > + .pin_base =3D 32,
>     > + .pin_bitmap =3D {
>     > + 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
>     > + },
>     > + },
>     > + /* GIC */ {
>     > + .address =3D 0x1410000,
>     > + .pin_base =3D 160,
>     > + .pin_bitmap =3D {
>     > + 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
>     > + },
>     > + },
>     > + },
>     > +
>     > + .pci_devices =3D {
>     > + { /* IVSHMEM 00:00.0 (demo) */
>     > + .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>     > + .domain =3D 0,
>     > + .bdf =3D 0 << 3,
>     > + .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>     > + .shmem_regions_start =3D 0,
>     > + .shmem_dev_id =3D 0,
>     > + .shmem_peers =3D 3,
>     > + .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>     > + },
>     > + { /* IVSHMEM 00:01.0 (networking) */
>     > + .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>     > + .domain =3D 0,
>     > + .bdf =3D 1 << 3,
>     > + .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>     > + .shmem_regions_start =3D 5,
>     > + .shmem_dev_id =3D 0,
>     > + .shmem_peers =3D 2,
>     > + .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
>     > + },
>     > + },
>     > +};
>     >
>=20
>     You are missing the linux inmate dtb.
>=20
>=20
> Hi, Jan,
>=20
> I am reusing the root cell dts: include root cell dts and then delete or
> modify some nodes,=C2=A0 so do you think we need to create a standalone d=
ts
> for inmate cell? thanks.

Would be smoother for your users.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/41e873f3-1eff-a142-a9f1-de08ef22786f%40siemens.com.
