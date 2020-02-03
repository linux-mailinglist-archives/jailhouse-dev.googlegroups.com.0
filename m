Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBM6Y4HYQKGQE3DQPE4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AC9150FFF
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Feb 2020 19:53:41 +0100 (CET)
Received: by mail-oi1-x23c.google.com with SMTP id w13sf5659200oif.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Feb 2020 10:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qwuZWiKkpVFwxJXce2cVVvIt9V2+HK0WDbDcvTruu0U=;
        b=qDsTcMkcVYC3mTiY9BMEeaaFy/6hNW8ClJUjeENxRyloy7O2Kk8IFLwKvkxoviGTzN
         xedpr/abCWs5elwnVNhoitFWyDUhFwO3oU1GyTESFnCRhCoklMN4jUqO/9yBzB5hGZA9
         VS2MRE8qiki7eDLIVe5gVNdiWECgbjh802KzkMZBqlixzxGngB4ox7Ic5QZu3b9FohpG
         eHy2a/8trVaHI4LOSdm1ngRC1lSKngMg44stxchYjkearPNT+kakPofzaKt95v8QJBqh
         o64eqb7Y9bdBBygg5fuYYC2SpzIs76jUkD9xPRxgzNOtNJGnUOx2aLvgDgcoJ/AfDS5s
         HQ3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qwuZWiKkpVFwxJXce2cVVvIt9V2+HK0WDbDcvTruu0U=;
        b=VqX288cc1ZehJeNpi8r9NR3TkC2GDj82MifQWL5nDG84dZYMWUAPXjf+9T//aa/tE4
         qIhXrEWhTQY5zxg93oLZ9UIagNVjoZkft7p/8Tefvy0eJCH4xxpUguBZn6ulrE4YSDIa
         1l6jbAX98JD5yfpumJyiiJLMu6vTkg+5fJwcbdqknz4LVGoYzcO/E9QrWWQG5rHTOteH
         yNJlwY4xwtLCUwSVFceibfSLw+rv3rD/sYGj9Yq2E+vP1MBAZwI2rnhE6nHUyG2b1aPZ
         50yNu26wYbgAsxH4a0aCDsBlyQWHGoxFEGcVkaV/nHGP7aACKTPebZrbV31VP6Qj+jKs
         sShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qwuZWiKkpVFwxJXce2cVVvIt9V2+HK0WDbDcvTruu0U=;
        b=c9r0rsQedwiXmviJ2wQHb0+sjAflSX2714d7u22NQC/Se6e0ZHy4VuEHJFn6iYuD3e
         Qn+9brg5W7oPFVOQ+hSrNGwHy2NN0OwmbkelUCF6Q96LSE4Wb0hrzxxXer4oijsq5Ww2
         jQKTcQ82WrHYaTEaPATt2Ra7ibH+qXiCGXoQrrvoYjprOw/7MTB9YsItNmQc04wmiqfe
         B/FZCXwJiXy+3EnpxtHz0Oik3IlT0rhX5Wu6kOESI0rVbmJKSbNe3r/S+Wjh9QJsGa0Y
         H7vQ8HV43ECBt12paYsowO2phEgg9LbBXjwNcaSin1eOxXEkBLJdTE4bY6EPrddyNkvi
         Jlew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWQ6wbFfA598JglKI0ihU1aLV3VDrVG2C202dsqjV6+LX4gvfpG
	hSEuqlx7vjuntHDzExYXmDg=
X-Google-Smtp-Source: APXvYqzJp5ZjOwV2csgrzdBWZqLZq0108DTOQT9BXyKJffpc7YzbDBiaYwEORCy+Y5XWxUp//WNuMw==
X-Received: by 2002:a05:6808:9b4:: with SMTP id e20mr300663oig.37.1580756020366;
        Mon, 03 Feb 2020 10:53:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7281:: with SMTP id t1ls32613otj.7.gmail; Mon, 03 Feb
 2020 10:53:39 -0800 (PST)
X-Received: by 2002:a9d:5e9:: with SMTP id 96mr13516424otd.307.1580756019497;
        Mon, 03 Feb 2020 10:53:39 -0800 (PST)
Date: Mon, 3 Feb 2020 10:53:38 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <262dbcd3-986b-4e42-9427-00b6fcd0e567@googlegroups.com>
In-Reply-To: <251365ff-7d39-451c-2b85-e6be4567d3b0@web.de>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
 <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
 <72876f0a-4d50-45e3-cd21-751f8bf223fb@siemens.com>
 <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
 <77fe6716-0d3b-8547-ba86-3797a33706e2@siemens.com>
 <e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f@googlegroups.com>
 <f34d7c4b-add2-7aef-666d-f132f30da6e9@siemens.com>
 <af79c7dc-6eb8-45c0-a93f-6e0e4da069ab@googlegroups.com>
 <251365ff-7d39-451c-2b85-e6be4567d3b0@web.de>
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2
 kit
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_23_2089964436.1580756018715"
X-Original-Sender: samirroj2016@gmail.com
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

------=_Part_23_2089964436.1580756018715
Content-Type: multipart/alternative; 
	boundary="----=_Part_24_1734881666.1580756018716"

------=_Part_24_1734881666.1580756018716
Content-Type: text/plain; charset="UTF-8"

Thank you heartily for providing and guiding. As per your suggestion,
I changed the configuration file according to /proc/iomem  (edittx2.c) and 
tried to enable jailhouse with it hypervisor still continue to crash. 
Please have a look at this file serial console output, edittx2.c and 
iomemtx2.txt
what are the mistakes? what will be the easiest way to enable jailhouse in 
tx2?
Thank you


On Saturday, February 1, 2020 at 3:34:55 AM UTC-6, Jan Kiszka wrote:
>
> On 30.01.20 22:00, Saroj Sapkota wrote: 
> > Thank you for the prompt reply Jan. 
> > 
> > ##>This means I have to compare jetson-tx2.c with /proc/iomem addresses 
> > and change if there is any deviation? 
>
> Yep. 
>
> > 
> > ##>How the address for inmate is allocated, its the spaces of system 
> RAM? 
>
> That's what mem= or device tree reservations are for: Keep root Linux 
> away from some memory that can then be used for non-root inmates and the 
> hypervisor itself. 
>
> > 
> > ##>where and how can i find the .gicd_base = 0x03881000,(.gicc_base, 
> > .gich_base, .gicv_base) addresses of the board? 
> > 
>
> Check the device tree of your target. 
>
> > ##> last thing how to define .irqchip; pin_base and pin_bitmap? 
> > 
>
> pin_base for the first gicd is always 32 (first SPI). The pin_bitmap of 
> the root cell should cover all possible SPIs. If those do not fit into 
> one irqchip, add another one with an appropriate pin_base. 
>
> For non-root cells, you only specify the SPIs that those should "steal" 
> from the root cell. 
>
> Jan 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/262dbcd3-986b-4e42-9427-00b6fcd0e567%40googlegroups.com.

------=_Part_24_1734881666.1580756018716
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you heartily for providing and guiding. As per =
your suggestion,<br></div><div>I changed the configuration file according t=
o /proc/iomem=C2=A0 (edittx2.c) and tried to enable jailhouse with it hyper=
visor still continue to crash. Please have a look at this file serial conso=
le output, edittx2.c and iomemtx2.txt</div><div>what are the mistakes? what=
 will be the easiest way to enable jailhouse in tx2?</div><div>Thank you<br=
></div><div><br></div><br>On Saturday, February 1, 2020 at 3:34:55 AM UTC-6=
, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;mar=
gin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 30.01.20=
 22:00, Saroj Sapkota wrote:
<br>&gt; Thank you for the prompt reply Jan.
<br>&gt;
<br>&gt; ##&gt;This means I have to compare jetson-tx2.c with /proc/iomem a=
ddresses
<br>&gt; and change if there is any deviation?
<br>
<br>Yep.
<br>
<br>&gt;
<br>&gt; ##&gt;How the address for inmate is allocated, its the spaces of s=
ystem RAM?
<br>
<br>That&#39;s what mem=3D or device tree reservations are for: Keep root L=
inux
<br>away from some memory that can then be used for non-root inmates and th=
e
<br>hypervisor itself.
<br>
<br>&gt;
<br>&gt; ##&gt;where and how can i find the .gicd_base =3D 0x03881000,(.gic=
c_base,
<br>&gt; .gich_base, .gicv_base) addresses of the board?
<br>&gt;
<br>
<br>Check the device tree of your target.
<br>
<br>&gt; ##&gt; last thing how to define .irqchip; pin_base and pin_bitmap?
<br>&gt;
<br>
<br>pin_base for the first gicd is always 32 (first SPI). The pin_bitmap of
<br>the root cell should cover all possible SPIs. If those do not fit into
<br>one irqchip, add another one with an appropriate pin_base.
<br>
<br>For non-root cells, you only specify the SPIs that those should &quot;s=
teal&quot;
<br>from the root cell.
<br>
<br>Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/262dbcd3-986b-4e42-9427-00b6fcd0e567%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/262dbcd3-986b-4e42-9427-00b6fcd0e567%40googlegroups.com<=
/a>.<br />

------=_Part_24_1734881666.1580756018716--

------=_Part_23_2089964436.1580756018715
Content-Type: text/x-csrc; charset=US-ASCII; name=editedtx2.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=editedtx2.c
X-Attachment-Id: 4a3f8596-e52a-47a0-ae21-007c7cf145eb
Content-ID: <4a3f8596-e52a-47a0-ae21-007c7cf145eb>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Jailhouse Jetson TX2 board
 *
 * Copyright (C) 2018 Evidence Srl
 *
 * Authors:
 *  Claudio Scordino <claudio@evidence.eu.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * NOTE: Add "mem=7808M vmalloc=512M" to the kernel command line.
 *
 *	2:7000:0000 inmate (size: 100:0000 = 16 MB)
 *	2:7100:0000 hypervisor (size: 400:0000 = 64 MB)
 *
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[65];
	struct jailhouse_irqchip irqchips[3];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.hypervisor_memory = {
			.phys_start = 0x271000000,
			.size = 0x4000000,
		},
		.debug_console = {
			.address = 0x3100000,
			.size = 0x10000,
			.flags = JAILHOUSE_CON1_TYPE_8250 |
				 JAILHOUSE_CON1_ACCESS_MMIO |
				 JAILHOUSE_CON1_REGDIST_4 |
				 JAILHOUSE_CON2_TYPE_ROOTPAGE,
		},
		.platform_info = {
			/* .pci_mmconfig_base is fixed; if you change it,
                         update the value in inmates/lib/arm-common/pci.c
                         (PCI_CFG_BASE) and regenerate the inmate library*/
                        .pci_mmconfig_base = 0x40000000, 
                        .pci_mmconfig_end_bus = 0x0,
                        .pci_is_virtual = 1,

			.arm = {
				.gicd_base = 0x03881000,
				.gicc_base = 0x03882000,
				.gich_base = 0x03884000,
				.gicv_base = 0x03886000,
				.gic_version = 2,
				.maintenance_irq = 25,
			}
		},
		.root_cell = {
			.name = "Jetson-TX2",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.vpci_irq_base = 288,
		},
	},

	.cpus = {
		0x39,
	},


	.mem_regions = {
		/* BPMP_ATCM notfound*/ {
                        .phys_start = 0x00000000,
                        .virt_start = 0x00000000,
                        .size = 0x40000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },

		/* MISC notfound*/ {
                        .phys_start = 0x00100000,
                        .virt_start = 0x00100000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },

		/* AXIP2P*/ {
			.phys_start = 0x02100000,
			.virt_start = 0x02100000,
			.size = 0xf0000,/*changed from 100000 */
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* GPIO */ {
			.phys_start = 0x02210000,/*changed from 02200000 */
			.virt_start = 0x02210000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* AXI2APB */ {
			.phys_start = 0x02390000,/*changed from 02300000 */
			.virt_start = 0x02390000,
			.size = 0x65000,/*changed from 100000 */
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},

		/* TSA not found */ {
			.phys_start = 0x2400000,
			.virt_start = 0x2400000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* (PINMUX) */ {
			.phys_start = 0x02430000,
			.virt_start = 0x02430000,
			.size = 0x14000,/*changed from 15000 */
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* UFSHC not found */ {
			.phys_start = 0x02450000,
			.virt_start = 0x02450000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* ETHER_QOS not found */ {
			.phys_start = 0x02490000,
			.virt_start = 0x02490000,
			.size = 0x50000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* DMA */ {
			.phys_start = 0x02600000,
			.virt_start = 0x02600000,
			.size = 0x210000,/*changed from 210000 */
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* APE not found todo*/ {
			.phys_start = 0x02900000,
			.virt_start = 0x02900000,
			.size = 0x200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* Mc_sid*/ {
			.phys_start = 0x02c00000,
			.virt_start = 0x02c00000,
			.size = 0xb0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* LIC not found*/ {
                        .phys_start = 0x03000000,
                        .virt_start = 0x03000000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* TOP_TKE/watchdog */ {
			.phys_start = 0x03010000,
			.virt_start = 0x03010000,
			.size = 0xe0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* UART-A */ {
			.phys_start = 0x03100000,
			.virt_start = 0x03100000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				     JAILHOUSE_MEM_EXECUTE,
		},
		/* UART-B */ {
			.phys_start = 0x03110000,
			.virt_start = 0x03110000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				     JAILHOUSE_MEM_EXECUTE,
		},
		/* UART-C */ {
			.phys_start = 0x03130000,
			.virt_start = 0x03130000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* I2C */ {
			.phys_start = 0x03160000,
			.virt_start = 0x03160000,
			.size = 0x90000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* spi newly added*/ {
			.phys_start = 0x03210000,
			.virt_start = 0x03210000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* PWM1+2+3 */ {
			.phys_start = 0x03280000,
			.virt_start = 0x03280000,
			.size = 0x30000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		
		/* SDMMC/sdhci */ {
			.phys_start = 0x3400000,
			.virt_start = 0x3400000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SATA (ipfd,config,ahci)*/ {
			.phys_start = 0x3500000,
			.virt_start = 0x3500000,
			.size = 0xf000,/*changed from 0x10000*/
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* HDA */ {
			.phys_start = 0x3510000,
			.virt_start = 0x3510000,
			.size = 0x10000,/*changed from 0x10000*/
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* XUSB_PADCTL/padclt + XUSB_HOST/xhci */ {
			.phys_start = 0x3520000,
			.virt_start = 0x3520000,
			.size = 0x1f000,/*changed from 0x20000*/
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* XUSB/ao+xudc */ {
			.phys_start = 0x03540000,
			.virt_start = 0x03540000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* FUSE + KFUSE */ {
			.phys_start = 0x03820000,
			.virt_start = 0x03820000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* MIPICAL */ {
			.phys_start = 0x03990000,
			.virt_start = 0x03990000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* TACH_0 */ {
			.phys_start = 0x039c0000,
			.virt_start = 0x039c0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SE0 not found/changed to elp*/ {
			.phys_start = 0x03ad0000,
			.virt_start = 0x03ac0000,
			.size = 0x30000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* TOP0_HSP */{
                        .phys_start = 0x03c00000,
                        .virt_start = 0x03c00000,
                        .size = 0xa0000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* VIC CAR not found */{
                        .phys_start = 0x05560000,
                        .virt_start = 0x05560000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* CSITE not found */ {
			.phys_start = 0x08000000,
			.virt_start = 0x08000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SCE VIC registers not found */ {
			.phys_start = 0x0b020000,
			.virt_start = 0x0b020000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SCE_PM */ {
			.phys_start = 0x0b1f0000,
			.virt_start = 0x0b1f0000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SCE_CFG */ {
			.phys_start = 0x0b230000,
			.virt_start = 0x0b230000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* AON VIC registers  not found */ {
			.phys_start = 0x0c020000,
			.virt_start = 0x0c020000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* More I2C + SPI */ {
			.phys_start = 0x0c240000,
			.virt_start = 0x0c240000,
			.size = 0x30000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* serial/UARTC, RTC */ {
			.phys_start = 0x0c280000,
			.virt_start = 0x0c280000,
			.size = 0x30000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* GPIO*/ {
			.phys_start = 0x0c2f1000,
			.virt_start = 0x0c2f1000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* (PINMUX) */ {
			.phys_start = 0x0c300000,
			.virt_start = 0x0c300000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/*CAN 1, CAN2 not found*/ {
			.phys_start = 0x0c310000,
			.virt_start = 0x0c310000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/*PWM4 (FAN) */ {
			.phys_start = 0x0c340000,
			.virt_start = 0x0c340000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* PMC */ {
			.phys_start = 0x0c360000,
			.virt_start = 0x0c360000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* BPMP VIC registers not found */ {
			.phys_start = 0x0d020000,
			.virt_start = 0x0d020000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* ACTMON /( + SIMON + SOC_THERM) */ {
			.phys_start = 0x0d230000,
			.virt_start = 0x0d230000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/*CCPLEX CLUSTER/ cpu_freq*/{
                        .phys_start = 0x0e000000,
                        .virt_start = 0x0e000000,
                        .size = 0x90000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* PCIE0 */ {
			.phys_start = 0x10000000,
			.virt_start = 0x10000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SMMU0/IOMMU */ {
			.phys_start = 0x12000000,
			.virt_start = 0x12000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* HOST1X */ {
			.phys_start = 0x13e00000,
			.virt_start = 0x13e00000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		
		/* DPAUX1 not found */ {
			.phys_start = 0x15040000,
			.virt_start = 0x15040000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* host 1x_NVCSI */ {
			.phys_start = 0x150c0000,
			.virt_start = 0x150c0000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* host_1x_TSECB */ {
			.phys_start = 0x15100000,
			.virt_start = 0x15100000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NVDISPLAY not found */ {
                        .phys_start = 0x15200000,
                        .virt_start = 0x15200000,
                        .size = 0x40000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* host_1x_VIC */ {
			.phys_start = 0x15340000,
			.virt_start = 0x15340000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* host_1x_NVJPG */ {
			.phys_start = 0x15380000,
			.virt_start = 0x15380000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* host_1x_NVDEC + NVENC + TSEC + ISP*/ {
			.phys_start = 0x15480000,
			.virt_start = 0x15480000,
			.size = 0x1c0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* host_1x_VI */ {
			.phys_start = 0x15700000,
			.virt_start = 0x15700000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SE1-SE4 */ {
			.phys_start = 0x15810000,
			.virt_start = 0x15810000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* GPU/gp10 */ {
			.phys_start = 0x17000000,
			.virt_start = 0x17000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SYSRAM_0 not found*/{
                        .phys_start = 0x30000000,
                        .virt_start = 0x30000000,
                        .size = 0x10000000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },

		/* System RAM */ {
			.phys_start = 0x961bd000,
			.virt_start = 0x961bd000,
			.size = 0x1D9E43000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* Inmate */ {
			.phys_start = 0x270000000,
			.virt_start = 0x270000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* Persistent RAM */ {
			.phys_start = 0x275880000,
			.virt_start = 0x275880000,
			.size = 0x300000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* IVHSMEM  1*/ {
                        .phys_start = 0x275c00000,
                        .virt_start = 0x275c00000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,

                },

                /* IVHSMEM  2*/ {
                        .phys_start = 0x275c20000,
                        .virt_start = 0x275c20000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
                },
	},
	.irqchips = {
		/* GIC */ {
			.address = 0x03881000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* GIC */ {
			.address = 0x03881000,
			.pin_base = 160,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* GIC */ {
			.address = 0x03881000,
			.pin_base = 288,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pci_devices = {
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0x0 << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },

                        /*num_msix_vectors needs to be 0 for INTx operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 63,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                        .domain = 0x0,

                },

                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0xf << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },

                        /*num_msix_vectors needs to be 0 for INTx operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 64,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
			.domain = 0x0,

                },
        },


};

------=_Part_23_2089964436.1580756018715
Content-Type: text/plain; charset=US-ASCII; name=serialconsole.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=serialconsole.txt
X-Attachment-Id: 19569dab-a7e3-411e-b398-85853b7c1d98
Content-ID: <19569dab-a7e3-411e-b398-85853b7c1d98>

##############
command on the terminal:
insmod ~/linux-jailhouse-jetson/driver/jailhouse.ko
##############
output on serial console:
tx2@tx2-desktop:~$ [ 1063.949718] jailhouse: loading out-of-tree module taints kernel.
###############
command on the terminal:
jailhouse enable ~/linux-jailhouse-jetson/configs/arm64/edittx2.cell
##############
output on serial console:
#############
Dump for CPU3:
pid: 0  comm: swapper/3
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 0000000011170aec   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000003  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000003  x25 ffffffc1e7fba060
 x26 ffffffc1e7fbe050  x27 ffffff8009e46000
 x28 ffffffc1def7c600  x29 ffffffc1e7fbdf50
 x30 0000000000000016   sp ffffffc1e7fbdf50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1e7fbdf50   fp ffffffc1e7fbdf50
flush_smp_call_function_queue+0xb8/0x160:
  pc ffffff8008150e00   sp ffffffc1e7fbdf60   fp ffffffc1e7fbdf70
generic_smp_call_function_single_interrupt+0x18/0x20:
  pc ffffff8008151d28   sp ffffffc1e7fbdf80   fp ffffffc1e7fbdfa0
handle_IPI+0x94/0x2e8:
  pc ffffff800809322c   sp ffffffc1e7fbdfb0   fp ffffffc1e7fbdfb0
gic_handle_irq+0xa8/0xb0:
  pc ffffff8008080d90   sp ffffffc1e7fbdfc0   fp ffffffc1e7fbe000
el1_irq+0xe8/0x18c:
  pc ffffff8008082be8   sp ffffffc1e7fbe010   fp ffffffc1e7fbe040
cpuidle_enter_state+0xb8/0x380:
  pc ffffff8008b9b330   sp ffffffc1def97d80   fp ffffffc1def97eb0
cpuidle_enter+0x34/0x48:
  pc ffffff8008b9b66c   sp ffffffc1def97ec0   fp ffffffc1def97f00
call_cpuidle+0x44/0x70:
  pc ffffff8008112a1c   sp ffffffc1def97f10   fp ffffffc1def97f30
cpu_startup_entry+0x1b0/0x200:
  pc ffffff8008112d98   sp ffffffc1def97f40   fp ffffffc1def97f60
secondary_start_kernel+0x190/0x1f8:
  pc ffffff8008092ce8   sp ffffffc1def97f70   fp ffffffc1def97fd0
0x8115a1a4:
  pc 000000008115a1a4   sp ffffffc1def97fe0   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 0000000011170aec   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000003  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000003  x25 ffffffc1e7fba060
 x26 ffffffc1e7fbe050  x27 ffffff8009e46000
 x28 ffffffc1def7c600  x29 ffffffc1e7fbdf50
 x30 0000000000000016   sp ffffffc1e7fbdf50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)
 sp_el0   ffffffc1def7c600
 elr_el1  ffffff8008b9b330
 spsr_el1 60000045
debug> Dump for CPU5:
pid: 0  comm: swapper/5
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 0000000011170aec   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000005  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000005  x25 ffffffc1e7fec060
 x26 ffffffc1e7ff0050  x27 ffffff8009e46000
 x28 ffffffc1def7e200  x29 ffffffc1e7feff50
 x30 0000000000000016   sp ffffffc1e7feff50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1e7feff50   fp ffffffc1e7feff50
flush_smp_call_function_queue+0xb8/0x160:
  pc ffffff8008150e00   sp ffffffc1e7feff60   fp ffffffc1e7feff70
generic_smp_call_function_single_interrupt+0x18/0x20:
  pc ffffff8008151d28   sp ffffffc1e7feff80   fp ffffffc1e7feffa0
handle_IPI+0x94/0x2e8:
  pc ffffff800809322c   sp ffffffc1e7feffb0   fp ffffffc1e7feffb0
gic_handle_irq+0xa8/0xb0:
  pc ffffff8008080d90   sp ffffffc1e7feffc0   fp ffffffc1e7ff0000
el1_irq+0xe8/0x18c:
  pc ffffff8008082be8   sp ffffffc1e7ff0010   fp ffffffc1e7ff0040
cpuidle_enter_state+0xb8/0x380:
  pc ffffff8008b9b330   sp ffffffc1def9fd80   fp ffffffc1def9feb0
cpuidle_enter+0x34/0x48:
  pc ffffff8008b9b66c   sp ffffffc1def9fec0   fp ffffffc1def9ff00
call_cpuidle+0x44/0x70:
  pc ffffff8008112a1c   sp ffffffc1def9ff10   fp ffffffc1def9ff30
cpu_startup_entry+0x1b0/0x200:
  pc ffffff8008112d98   sp ffffffc1def9ff40   fp ffffffc1def9ff60
secondary_start_kernel+0x190/0x1f8:
  pc ffffff8008092ce8   sp ffffffc1def9ff70   fp ffffffc1def9ffd0
0x8115a1a4:
  pc 000000008115a1a4   sp ffffffc1def9ffe0   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 0000000011170aec   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000005  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000005  x25 ffffffc1e7fec060
 x26 ffffffc1e7ff0050  x27 ffffff8009e46000
 x28 ffffffc1def7e200  x29 ffffffc1e7feff50
 x30 0000000000000016   sp ffffffc1e7feff50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)
 sp_el0   ffffffc1def7e200
 elr_el1  ffffff8008b9b330
 spsr_el1 60000045
debug> Dump for CPU0:
pid: 10050  comm: jailhouse
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000000   x5 0000000000000038
  x6 ffffffc1e7ffe738   x7 5e72736877646c75
  x8 7f7f7f7f7f7f7f7f   x9 fefefdff6862726f
 x10 ffffff7f7f7f7f7f  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000000  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000040  x23 0000000000000000
 x24 ffffff800113b990  x25 ffffff800113bf80
 x26 ffffff8018000000  x27 ffffff8009e5a998
 x28 ffffff800113c2d0  x29 ffffffc1570f7bc0
 x30 0000000000000016   sp ffffffc1570f7bc0
  pc ffffff8018004050 cpsr 200000c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1570f7bc0   fp ffffffc1570f7bc0
on_each_cpu+0x58/0x98:
  pc ffffff8008151800   sp ffffffc1570f7bd0   fp ffffffc1570f7be0
jailhouse_cmd_enable+0x420/0x710 [jailhouse]:
  pc ffffff8001138a10   sp ffffffc1570f7bf0   fp ffffffc1570f7c10
jailhouse_ioctl+0x8c/0x110 [jailhouse]:
  pc ffffff8001138d8c   sp ffffffc1570f7c20   fp ffffffc1570f7de0
do_vfs_ioctl+0xb0/0x8d8:
  pc ffffff8008273188   sp ffffffc1570f7df0   fp ffffffc1570f7e00
SyS_ioctl+0x8c/0xa8:
  pc ffffff8008273a3c   sp ffffffc1570f7e10   fp ffffffc1570f7e80
el0_svc_naked+0x34/0x38:
  pc ffffff80080838c0   sp ffffffc1570f7e90   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000000   x5 0000000000000038
  x6 ffffffc1e7ffe738   x7 5e72736877646c75
  x8 7f7f7f7f7f7f7f7f   x9 fefefdff6862726f
 x10 ffffff7f7f7f7f7f  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000000  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000040  x23 0000000000000000
 x24 ffffff800113b990  x25 ffffff800113bf80
 x26 ffffff8018000000  x27 ffffff8009e5a998
 x28 ffffff800113c2d0  x29 ffffffc1570f7bc0
 x30 0000000000000016   sp ffffffc1570f7bc0
  pc ffffff8018004050 cpsr 200000c5 (EL1h)
 sp_el0   ffffffc16d4a3800
 elr_el1  ffffff8008213580
 spsr_el1 20000045
debug> Dump for CPU4:
pid: 0  comm: swapper/4
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 0000000011170aec   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000004  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000004  x25 ffffffc1e7fd3060
 x26 ffffffc1e7fd7050  x27 ffffff8009e46000
 x28 ffffffc1def7d400  x29 ffffffc1e7fd6f50
 x30 0000000000000016   sp ffffffc1e7fd6f50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1e7fd6f50   fp ffffffc1e7fd6f50
flush_smp_call_function_queue+0xb8/0x160:
  pc ffffff8008150e00   sp ffffffc1e7fd6f60   fp ffffffc1e7fd6f70
generic_smp_call_function_single_interrupt+0x18/0x20:
  pc ffffff8008151d28   sp ffffffc1e7fd6f80   fp ffffffc1e7fd6fa0
handle_IPI+0x94/0x2e8:
  pc ffffff800809322c   sp ffffffc1e7fd6fb0   fp ffffffc1e7fd6fb0
gic_handle_irq+0xa8/0xb0:
  pc ffffff8008080d90   sp ffffffc1e7fd6fc0   fp ffffffc1e7fd7000
el1_irq+0xe8/0x18c:
  pc ffffff8008082be8   sp ffffffc1e7fd7010   fp ffffffc1e7fd7040
cpuidle_enter_state+0xb8/0x380:
  pc ffffff8008b9b330   sp ffffffc1def9bd80   fp ffffffc1def9beb0
cpuidle_enter+0x34/0x48:
  pc ffffff8008b9b66c   sp ffffffc1def9bec0   fp ffffffc1def9bf00
call_cpuidle+0x44/0x70:
  pc ffffff8008112a1c   sp ffffffc1def9bf10   fp ffffffc1def9bf30
cpu_startup_entry+0x1b0/0x200:
  pc ffffff8008112d98   sp ffffffc1def9bf40   fp ffffffc1def9bf60
secondary_start_kernel+0x190/0x1f8:
  pc ffffff8008092ce8   sp ffffffc1def9bf70   fp ffffffc1def9bfd0
0x8115a1a4:
  pc 000000008115a1a4   sp ffffffc1def9bfe0   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 0000000011170aec   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000004  x17 ffffff8001138014
 x18 0000000000000000  x19 ffffff800113c2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000004  x25 ffffffc1e7fd3060
 x26 ffffffc1e7fd7050  x27 ffffff8009e46000
 x28 ffffffc1def7d400  x29 ffffffc1e7fd6f50
 x30 0000000000000016   sp ffffffc1e7fd6f50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)
 sp_el0   ffffffc1def7d400
 elr_el1  ffffff8008b9b330
 spsr_el1 60000045
debug> [0000.268] I> Welcome to MB2(TBoot-BPMP)(version: 01.00.160913-t186-M-00.00-mobile-7d3edb9d)
[0000.276] I> bit @ 0xd480000
[0000.279] I> Boot-device: eMMC
[0000.286] I> sdmmc bdev is already initialized
[0000.291] I> pmic: reset reason (nverc)        : 0x0
[0000.322] I> Found 18 partitions in SDMMC_BOOT (instance 3)
[0000.341] I> Found 33 partitions in SDMMC_USER (instance 3)
[0000.347] W> No valid slot number is found in scratch register
[0000.353] W> Return default slot: _a
[0000.356] I> A/B: bin_type (16) slot 0
[0000.360] I> Loading partition bpmp-fw at 0xd7800000
[0000.365] I> Reading two headers - addr:0xd7800000 blocks:1
[0000.370] I> Addr: 0xd7800000, start-block: 58777608, num_blocks: 1
[0000.395] I> Binary(16) of size 533504 is loaded @ 0xd7800000
[0000.401] W> No valid slot number is found in scratch register
[0000.406] W> Return default slot: _a
[0000.410] I> A/B: bin_type (17) slot 0
[0000.413] I> Loading partition bpmp-fw-dtb at 0xd79f0000
[0000.419] I> Reading two headers - addr:0xd79f0000 blocks:1
[0000.424] I> Addr: 0xd79f0000, start-block: 58780024, num_blocks: 1
[0000.448] I> Binary(17) of size 465840 is loaded @ 0xd798e200
[0000.626] I> Loading SCE-FW ...
[0000.629] W> No valid slot number is found in scratch register
[0000.634] W> Return default slot: _a
[0000.638] I> A/B: bin_type (12) slot 0
[0000.641] I> Loading partition sce-fw at 0xd7300000
[0000.646] I> Reading two headers - addr:0xd7300000 blocks:1
[0000.652] I> Addr: 0xd7300000, start-block: 58784120, num_blocks: 1
[0000.671] I> Binary(12) of size 125168 is loaded @ 0xd7300000
[0000.677] I> Init SCE
[0000.679] I> Loading APE-FW ...
[0000.682] W> No valid slot number is found in scratch register
[0000.688] W> Return default slot: _a
[0000.691] I> A/B: bin_type (11) slot 0
[0000.695] I> Loading partition adsp-fw at 0xd7400000
[0000.699] I> Reading two headers - addr:0xd7400000 blocks:1
[0000.705] I> Addr: 0xd7400000, start-block: 58761224, num_blocks: 1
[0000.724] I> Binary(11) of size 107808 is loaded @ 0xd7400000
[0000.730] I> Copy BTCM section
[0000.733] W> No valid slot number is found in scratch register
[0000.739] W> Return default slot: _a
[0000.742] I> A/B: bin_type (13) slot 0
[0000.746] I> Loading partition cpu-bootloader at 0x96000000
[0000.751] I> Reading two headers - addr:0x96000000 blocks:1
[0000.757] I> Addr: 0x96000000, start-block: 58740744, num_blocks: 1
[0000.778] I> Binary(13) of size 283728 is loaded @ 0x96000000
[0000.783] W> No valid slot number is found in scratch register
[0000.789] W> Return default slot: _a
[0000.792] I> A/B: bin_type (20) slot 0
[0000.796] I> Loading partition bootloader-dtb at 0x8520f400
[0000.802] I> Reading two headers - addr:0x8520f400 blocks:1
[0000.807] I> Addr: 0x8520f400, start-block: 58742792, num_blocks: 1
[0000.829] I> Binary(20) of size 371232 is loaded @ 0x8520f400
[0000.835] W> No valid slot number is found in scratch register
[0000.841] W> Return default slot: _a
[0000.844] I> A/B: bin_type (14) slot 0
[0000.848] I> Loading partition secure-os at 0x8530f600
[0000.853] I> Reading two headers - addr:0x8530f600 blocks:1
[0000.858] I> Addr: 0x8530f600, start-block: 58744840, num_blocks: 1
[0000.880] I> Binary(14) of size 312752 is loaded @ 0x8530f600
[0000.887] I> TOS boot-params @ 0x85000000
[0000.891] I> TOS params prepared
[0000.895] I> Loading EKS ...
[0000.897] I> A/B: bin_type (15) slot 0
[0000.901] I> Loading partition eks at 0x8590f800
[0000.905] I> Reading two headers - addr:0x8590f800 blocks:1
[0000.911] I> Addr: 0x8590f800, start-block: 58757128, num_blocks: 1
[0000.930] I> Binary(15) of size 1040 is loaded @ 0x8590f800
[0000.935] I> EKB detected (length: 0x400) @ 0x8590f800
[0000.940] I> Copied encrypted keys
[0000.944] I> boot profiler @ 0x275844000
[0000.948] I> boot profiler for TOS @ 0x275844000
[0000.953] I> Unhalting SCE
[0000.955] I> Primary Memory Start:80000000 Size:70000000
[0000.960] I> Extended Memory Start:f0110000 Size:1856f0000
[0000.967] I> MB2(TBoot-BPMP) done

NOTICE:  BL31: v1.3(release):23b153a63
NOTICE:  BL31: Built : 22:43:09, Dec  9 2019
ipc-unittest-main: 1519: Welcome to IPC unittest!!!
ipc-unittest-main: 1531: waiting forever
ipc-unittest-srv: 329: Init unittest services!!!
keystore-demo: 141: Hello world from keystore-demo app
keystore-demo: 207: main: EKB contents match expected value
exit called, thread 0xffffffffea87ad58, name trusty_app_2_7d18fc60-e9fc-11e8
platform_bootstrap_epilog: trusty bootstrap complete
[0001.328] I> Welcome to Cboot
[0001.331] I> Cboot Version: t186-c3c778fb
[0001.335] I> CPU-BL Params @ 0x275800000
[0001.338] I>  0) Base:0x00000000 Size:0x00000000
[0001.343] I>  1) Base:0x277f00000 Size:0x00100000
[0001.347] I>  2) Base:0x277e00000 Size:0x00100000
[0001.352] I>  3) Base:0x277d00000 Size:0x00100000
[0001.356] I>  4) Base:0x277c00000 Size:0x00100000
[0001.361] I>  5) Base:0x277b00000 Size:0x00100000
[0001.365] I>  6) Base:0x277800000 Size:0x00200000
[0001.370] I>  7) Base:0x277400000 Size:0x00400000
[0001.374] I>  8) Base:0x277a00000 Size:0x00100000
[0001.379] I>  9) Base:0x277300000 Size:0x00100000
[0001.383] I> 10) Base:0x276800000 Size:0x00800000
[0001.388] I> 11) Base:0x30000000 Size:0x00040000
[0001.392] I> 12) Base:0xf0000000 Size:0x00100000
[0001.397] I> 13) Base:0x30040000 Size:0x00001000
[0001.401] I> 14) Base:0x30048000 Size:0x00001000
[0001.406] I> 15) Base:0x30049000 Size:0x00001000
[0001.410] I> 16) Base:0x3004a000 Size:0x00001000
[0001.414] I> 17) Base:0x3004b000 Size:0x00001000
[0001.419] I> 18) Base:0x3004c000 Size:0x00001000
[0001.423] I> 19) Base:0x3004d000 Size:0x00001000
[0001.428] I> 20) Base:0x3004e000 Size:0x00001000
[0001.432] I> 21) Base:0x3004f000 Size:0x00001000
[0001.437] I> 22) Base:0x00000000 Size:0x00000000
[0001.441] I> 23) Base:0xf0100000 Size:0x00010000
[0001.446] I> 24) Base:0x00000000 Size:0x00000000
[0001.450] I> 25) Base:0x00000000 Size:0x00000000
[0001.454] I> 26) Base:0x00000000 Size:0x00000000
[0001.459] I> 27) Base:0x00000000 Size:0x00000000
[0001.463] I> 28) Base:0x84400000 Size:0x00400000
[0001.468] I> 29) Base:0x30000000 Size:0x00010000
[0001.472] I> 30) Base:0x278000000 Size:0x08000000
[0001.477] I> 31) Base:0x00000000 Size:0x00000000
[0001.481] I> 32) Base:0x276000000 Size:0x00600000
[0001.486] I> 33) Base:0x80000000 Size:0x70000000
[0001.490] I> 34) Base:0xf0110000 Size:0x1856f0000
[0001.495] I> 35) Base:0x00000000 Size:0x00000000
[0001.499] I> 36) Base:0x00000000 Size:0x00000000
[0001.503] I> 37) Base:0x2772e0000 Size:0x00020000
[0001.508] I> 38) Base:0x84000000 Size:0x00400000
[0001.512] I> 39) Base:0x96000000 Size:0x02000000
[0001.517] I> 40) Base:0x85000000 Size:0x01200000
[0001.521] I> 41) Base:0x275800000 Size:0x00500000
[0001.526] I> 42) Base:0x00000000 Size:0x00000000
[0001.530] I> 43) Base:0x00000000 Size:0x00000000
[0001.535] GIC-SPI Target CPU: 4
[0001.538] Interrupts Init done
[0001.541] calling constructors
[0001.544] initializing heap
[0001.547] initializing threads
[0001.550] initializing timers
[0001.553] creating bootstrap completion thread
[0001.558] top of bootstrap2()
[0001.561] CPU: ARM Cortex A57
[0001.564] CPU: MIDR: 0x411FD073, MPIDR: 0x80000100
[0001.569] initializing platform
[0001.573] I> Bl_dtb @0x8520f400
[0001.575] I> gpio framework initialized
[0001.582] I> tegrabl_gpio_driver_register: register 'nvidia,tegra186-gpio' driver
[0001.592] I> tegrabl_gpio_driver_register: register 'nvidia,tegra186-gpio-aon' driver
[0001.600] I> GPIO framework and drivers are initialized.
[0001.605] I> Boot-device: eMMC
[0001.612] I> sdmmc bdev is already initialized
[0001.642] I> Found 18 partitions in SDMMC_BOOT (instance 3)
[0001.660] I> Found 33 partitions in SDMMC_USER (instance 3)
[0001.665] W> opt-in fuse is not set, skip fuse_burning
[0001.670] I> Reserved memory at 0xfbe00000 for U-Boot relocation
[0001.676] W> No valid slot number is found in scratch register
[0001.682] W> Return default slot: _a
[0001.685] I> A/B: bin_type (21) slot 0
[0001.689] I> Loading partition kernel-dtb at 0x80000000 from device(0x1)
[0001.706] I> Kernel_dtb @0x80000000
[0001.709] I> tegrabl_tca9539_init: i2c bus: 0, slave addr: 0xee
[0001.720] I> tegrabl_gpio_driver_register: register 'tca9539_gpio_driver' driver
[0001.727] I> tegrabl_tca9539_init: i2c bus: 0, slave addr: 0xe8
[0001.736] I> tegrabl_gpio_driver_register: register 'tca9539_gpio_driver' driver
[0001.746] I> fixed regulator driver initialized
[0001.779] I> register 'maxim' power off handle
[0001.785] I> virtual i2c enabled
[0001.788] I> registered 'maxim,max77620' pmic
[0001.792] I> tegrabl_gpio_driver_register: register 'max77620-gpio' driver
[0001.806] I> Find /i2c@c250000's alias i2c7
[0001.810] I> Reading eeprom i2c=7 address=0x50
[0001.839] I> Device at /i2c@c250000:0x50
[0001.843] I> Reading eeprom i2c=7 address=0x57
[0001.871] I> Device at /i2c@c250000:0x57
[0001.876] I> Find /i2c@c240000's alias i2c1
[0001.880] I> Reading eeprom i2c=1 address=0x51
[0001.885] E> I2C: slave not found in slaves.
[0001.889] E> I2C: Could not write 0 bytes to slave: 0x00a2 with repeat start true.
[0001.897] E> I2C_DEV: Failed to send register address 0x00000000.
[0001.902] E> I2C_DEV: Could not read 256 registers of size 1 from slave 0xa2 at 0x00000000 via instance 1.
[0001.912] E> eeprom: Retry to read I2C slave device.
[0001.917] E> I2C: slave not found in slaves.
[0001.921] E> I2C: Could not write 0 bytes to slave: 0x00a2 with repeat start true.
[0001.929] E> I2C_DEV: Failed to send register address 0x00000000.
[0001.935] E> I2C_DEV: Could not read 256 registers of size 1 from slave 0xa2 at 0x00000000 via instance 1.
[0001.944] E> eeprom: Failed to read I2C slave device
[0001.949] I> Eeprom read failed 0x3526070d
[0001.953] I> Find /i2c@3160000's alias i2c0
[0001.957] I> Reading eeprom i2c=0 address=0x50
[0001.962] E> I2C: slave not found in slaves.
[0001.966] E> I2C: Could not write 0 bytes to slave: 0x00a0 with repeat start true.
[0001.973] E> I2C_DEV: Failed to send register address 0x00000000.
[0001.979] E> I2C_DEV: Could not read 256 registers of size 1 from slave 0xa0 at 0x00000000 via instance 0.
[0001.989] E> eeprom: Failed to read I2C slave device
[0001.994] I> Eeprom read failed 0x3526070d
[0001.998] I> Find /i2c@3180000's alias i2c2
[0002.002] I> Reading eeprom i2c=2 address=0x54
[0002.007] I> Enabling gpio chip_id = 2, gpio pin = 9
[0002.037] I> Disabling gpio chip_id = 2, gpio pin = 9
[0002.042] I> Device at /i2c@3180000:0x54
[0002.046] I> Reading eeprom i2c=2 address=0x57
[0002.050] I> Enabling gpio chip_id = 2, gpio pin = 9
[0002.056] E> I2C: slave not found in slaves.
[0002.060] E> I2C: Could not write 0 bytes to slave: 0x00ae with repeat start true.
[0002.068] E> I2C_DEV: Failed to send register address 0x00000000.
[0002.074] E> I2C_DEV: Could not read 256 registers of size 1 from slave 0xae at 0x00000000 via instance 2.
[0002.083] E> eeprom: Failed to read I2C slave device
[0002.088] I> Disabling gpio chip_id = 2, gpio pin = 9
[0002.093] I> Eeprom read failed 0x00000000
[0002.097] I> create_pm_ids: id: 3310-1000-B02-D, len: 15
[0002.102] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0002.113] I> create_pm_ids: id: 2597-0000-501-C, len: 15
[0002.118] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0002.129] I> create_pm_ids: id: 3326-1000-100-M, len: 15
[0002.134] I> config: mem-type:ff,power-config:ff,misc-config:ff,modem-config:ff,touch-config:ff,display-config:ff,, len: 93
[0002.170] I> enabling 'vdd-hdmi' regulator
[0002.185] I> regulator 'vdd-hdmi' already enabled
[0002.190] I> hdmi cable connected
[0002.199] I> setting 'vdd-pex-1v00' regulator to 1000000 micro volts
[0002.211] I> setting 'vdd-1v8' regulator to 1800000 micro volts
[0002.219] E> cannot find any other nvdisp nodes
[0002.240] I> edid read success
[0002.243] I> width = 640, height = 480, frequency = 25174825
[0002.249] I> width = 640, height = 480, frequency = 25174825
[0002.254] I> width = 1600, height = 1200, frequency = 162000000
[0002.260] I> Best mode Width = 640, Height = 480, freq = 25174825
[0002.270] I> hdmi_enable, starting HDMI initialisation
[0002.277] I> hdmi_enable, HDMI initialisation complete
[0002.284] initializing target
[0002.287] calling apps_init()
[0002.290] starting app kernel_boot_app
[0002.312] I> found decompressor handler: lz4-legacy
[0002.317] I> decompressing BMP blob ...
[0002.327] I> Kernel type = Normal
[0002.330] I> Loading partition kernel-bootctrl at 0xa8000000 from device(0x1)
[0002.344] W> tegrabl_get_kernel_bootctrl: magic number(0x00000000) is invalid
[0002.351] W> tegrabl_get_kernel_bootctrl: use default dummy boot control data
[0002.358] I> ########## Fixed storage boot ##########
[0002.363] I> Loading kernel from partition ...
[0002.367] W> No valid slot number is found in scratch register
[0002.373] W> Return default slot: _a
[0002.376] I> A/B: bin_type (24) slot 0
[0002.392] I> Boot image size read from image header: f2f08
[0002.397] I> Boot image load address: 0x0x80400000
[0002.402] I> Loading partition kernel at 0x80400000 from device(0x1)
[0003.362] I> Validate kernel ...
[0003.365] I> T18x: Authenticate kernel (bin_type 24), max size 0x4000000
[0003.372] I> kernel-dtb is already loaded
[0003.376] I> Validate kernel-dtb ...
[0003.379] I> T18x: Authenticate kernel-dtb (bin_type 21), max size 0x100000
[0003.387] I> Checking boot.img header magic ... [0003.391] I> [OK]
[0003.393] I> Kernel hdr @0x80400000
[0003.396] I> Kernel dtb @0x80000000
[0003.400] I> decompressor handler not found
[0003.404] I> Copying kernel image (477882 bytes) from 0x80400800 to 0x80800000 ... [0003.411] I> Done
[0003.413] I> Move ramdisk (len: 0) from 0x80475800 to 0x94830000
[0003.420] I> Updated bpmp info to DTB
[0003.426] I> Ramdisk: Base: 0x94830000; Size: 0x0
[0003.431] I> Updated initrd info to DTB
[0003.434] W> WARN: Fail to override "console=none" in commandline
[0003.440] E> tegrabl_linuxboot_add_disp_param, du 1 failed to get display params
[0003.447] E> tegrabl_linuxboot_add_disp_param, du 1 failed to get display params
[0003.455] I> disabled_core_mask: 0xffffff0c
[0003.459] W> No valid slot number is found in scratch register
[0003.464] W> Return default slot: _a
[0003.468] I> Active slot suffix: 
[0003.471] I> add_boot_slot_suffix: slot_suffix = 
[0003.475] I> Linux Cmdline: root=/dev/mmcblk0p1 rw rootwait rootfstype=ext4 console=ttyS0,115200n8 console=tty0 fbcon=map:0 net.ifnames=0 video=tegrafb no_console_suspend=1 earlycon=uart8250,mmio32,0x31 
[0003.517] I> Updated bootarg info to DTB
[0003.521] I> eeprom_get_mac_addr: MAC (type: 0): 00:04:4b:a8:11:d7
[0003.527] I> eeprom_get_mac_addr: MAC (type: 1): 00:04:4b:a8:11:d8
[0003.533] I> eeprom_get_mac_addr: MAC (type: 2): 00:04:4b:a8:11:d9
[0003.540] E> Found no plugin manager ids in source DT
[0003.544] W> Add plugin manager ids from board info
[0003.549] E> "plugin-manager" doesn't exist, creating
[0003.554] E> "ids" doesn't exist, creating
[0003.558] E> "connection" doesn't exist, creating
[0003.563] E> "configs" doesn't exist, creating
[0003.567] I> create_pm_ids: id: 3310-1000-B02-D, len: 15
[0003.572] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0003.583] I> create_pm_ids: id: 2597-0000-501-C, len: 15
[0003.588] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0003.599] I> create_pm_ids: id: 3326-1000-100-M, len: 15
[0003.604] I> config: mem-type:ff,power-config:ff,misc-config:ff,modem-config:ff,touch-config:ff,display-config:ff,, len: 93
[0003.615] I> Adding plugin-manager/ids/3310-1000-B02=/i2c@c250000:module@0x50
[0003.622] E> "i2c@c250000" doesn't exist, creating
[0003.627] E> "module@0x50" doesn't exist, creating
[0003.632] I> Adding plugin-manager/ids/2597-0000-501=/i2c@c250000:module@0x57
[0003.639] E> "module@0x57" doesn't exist, creating
[0003.644] I> Adding plugin-manager/ids/3326-1000-100=/i2c@3180000:module@0x54
[0003.651] E> "i2c@3180000" doesn't exist, creating
[0003.656] E> "module@0x54" doesn't exist, creating
[0003.663] I> Adding plugin-manager/ids/3310-1000-B02-D
[0003.670] I> Adding plugin-manager/configs/3310-mem-type 00
[0003.676] I> Adding plugin-manager/configs/3310-power-config 00
[0003.682] I> Adding plugin-manager/configs/3310-misc-config 00
[0003.687] I> Adding plugin-manager/configs/3310-modem-config 00
[0003.693] I> Adding plugin-manager/configs/3310-touch-config 00
[0003.699] I> Adding plugin-manager/configs/3310-display-config 00
[0003.706] I> Adding plugin-manager/cvm
[0003.709] E> "chip-id" doesn't exist, creating
[0003.714] I> Adding plugin-manager/chip-id/A02P
[0003.718] E> "odm-data" doesn't exist, creating
[0003.723] I> Adding /chosen/plugin-manager/odm-data
[0003.733] I> added [base:0x80000000, size:0x70000000] to /memory
[0003.739] I> added [base:0xf0200000, size:0x185600000] to /memory
[0003.744] I> added [base:0x275e00000, size:0x200000] to /memory
[0003.750] I> added [base:0x276600000, size:0x200000] to /memory
[0003.756] I> added [base:0x277000000, size:0x200000] to /memory
[0003.762] I> Updated memory info to DTB
[0003.766] E> add_disp_param: failed to get display params for du=1
[0003.774] E> "reset" doesn't exist, creating
[0003.778] E> "pmc-reset-reason" doesn't exist, creating
[0003.784] E> "pmic-reset-reason" doesn't exist, creating
[0003.790] I> Adding ecid(00000001644007480000000003fb81c0) to DT
[0003.796] I> disabled_core_mask: 0xffffff0c
[0003.809] I> Add serial number:0320218169735 as DT property
[0003.818] I> Plugin-manager override starting
[0003.823] I> node /plugin-manager/fragement@0 matches
[0003.834] I> node /plugin-manager/fragement@4 matches
[0003.846] I> node /plugin-manager/fragment-sdwake-p3310-1000-300 matches
[0003.866] I> node /plugin-manager/fragement-pmon-p3310-1000-300 matches
[0003.876] I> node /plugin-manager/fragement-pmon-p3310-1000-800 matches
[0003.884] I> node /plugin-manager/fragment-devslp@0 matches
[0003.897] I> node /plugin-manager/fragment-500-pcie-config matches
[0003.911] I> node /plugin-manager/fragment-500-xusb-config matches
[0003.934] I> node /plugin-manager/fragment-p3310-c00-comm matches
[0003.948] I> node /plugin-manager/fragment-p3310-c00-pmic matches
[0003.958] I> node /plugin-manager/fragment-p3310-c01 matches
[0003.971] I> node /plugin-manager/fragment-p3310-c03 matches
[0004.006] I> node /plugin-manager/fragment-e3326@0 matches
[0004.087] I> node /plugin-manager/fragment-p3310-c00-camera matches
[0004.113] I> Disable plugin-manager status in FDT
[0004.118] I> Plugin-manager override finished successfully
[0004.123] I> tegrabl_load_kernel_and_dtb: Done
[0004.133] I> Kernel EP: 0x80800000, DTB: 0x80000000


U-Boot 2016.07-g0536cf2a27 (Dec 09 2019 - 22:43:10 -0800)

TEGRA186
Model: NVIDIA P2771-0000-500
DRAM:  7.8 GiB
MC:   Tegra SD/MMC: 0, Tegra SD/MMC: 1
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   eth0: ethernet@2490000
Hit any key to stop autoboot:  0 
MMC: no card present
switch to partitions #0, OK
mmc0(part 0) is current device
Scanning mmc 0:1...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
756 bytes read in 89 ms (7.8 KiB/s)
1:      primary kernel
Retrieving file: /boot/initrd
5565140 bytes read in 240 ms (22.1 MiB/s)
Retrieving file: /boot/Image
34191368 bytes read in 857 ms (38 MiB/s)
append: root=/dev/mmcblk0p1 rw rootwait rootfstype=ext4 console=ttyS0,115200n8 console=tty0 fbcon=map:0 net.ifnames=0 video=tegrafb no_console_suspend=1 earlycon=uart8250,mmio32,0x3100000 nvdumper_reservt
## Flattened Device Tree blob at 80000000
   Booting using the fdt blob at 0x80000000
   reserving fdt memory region: addr=80000000 size=10000
   Using Device Tree in place at 0000000080000000, end 000000008005f9b7

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x100
[    0.000000] Linux version 4.9.140-tegra (buildbrain@mobile-u64-1935) (gcc version 7.3.1 20180425 [linaro-7.3-2018.05 revision d29120a424ecfbc167ef90065c0eeb7f91977701] (Linaro GCC 7.3-2018.05) ) #1 SM9
[    0.000000] Boot CPU: AArch64 Processor [411fd073]
[    0.000000] OF: fdt:memory scan node memory@80000000, reg size 16416,
[    0.000000] OF: fdt: - 80000000 ,  70000000
[    0.000000] OF: fdt: - f0200000 ,  185600000
[    0.000000] OF: fdt: - 275e00000 ,  200000
[    0.000000] OF: fdt: - 276600000 ,  200000
[    0.000000] OF: fdt: - 277000000 ,  200000
[    0.000000] earlycon: uart8250 at MMIO32 0x0000000003100000 (options '')
[    0.000000] bootconsole [uart8250] enabled
[    0.000000] Found tegra_fbmem2: 00140000@9607d000
[    0.000000] Found lut_mem2: 00002008@9607a000
[    0.000000] Memory limited to 7808MB
<hit enter to activate fiq debugger>
[    4.274770] cgroup: cgroup2: unknown option "nsdelegate"
[    5.837237] using random self ethernet address
[    5.871986] using random host ethernet address
[    6.516771] using random self ethernet address
[    6.526051] using random host ethernet address
[    7.362366] CPU1: shutdown
[    7.428729] CPU2: shutdown
[    7.929846] vdd-1v8: voltage operation not allowed
[    7.929861] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    7.949992] vdd-1v8: voltage operation not allowed
[    7.950012] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    7.970640] vdd-1v8: voltage operation not allowed
[    7.970656] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    7.973159] vdd-1v8: voltage operation not allowed
[    7.973198] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    8.083264] vdd-1v8: voltage operation not allowed
[    8.083281] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    8.084229] vdd-1v8: voltage operation not allowed
[    8.084244] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)
[    8.085843] vdd-1v8: voltage operation not allowed
[    8.085856] sdhci-tegra 3440000.sdhci: could not set regulator OCR (-1)

Ubuntu 18.04.3 LTS tx2-desktop ttyS0

tx2-desktop login: tx2
Password: 
Last login: Mon Feb  3 11:41:32 CST 2020 on ttyS0
Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 4.9.140-tegra aarch64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.

237 packages can be updated.
128 updates are security updates.

Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

tx2@tx2-desktop:~$ 


------=_Part_23_2089964436.1580756018715
Content-Type: text/plain; charset=US-ASCII; name=iomemtx2.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=iomemtx2.txt
X-Attachment-Id: 4da7d0a1-c7ef-4aa8-80b5-a96479d2befb
Content-ID: <4da7d0a1-c7ef-4aa8-80b5-a96479d2befb>

tx2@tx2-desktop:~$ sudo cat /proc/iomem
[sudo] password for tx2: 
02100000-02100fff : /axip2p@2100000
02110000-02110fff : /axip2p@2110000
02120000-02120fff : /axip2p@2120000
02130000-02130fff : /axip2p@2130000
02140000-02140fff : /axip2p@2140000
02150000-02150fff : /axip2p@2150000
02160000-02160fff : /axip2p@2160000
02170000-02170fff : /axip2p@2170000
02180000-02180fff : /axip2p@2180000
02190000-02190fff : /axip2p@2190000
02200000-0220ffff : security
02210000-0221ffff : gpio
02390000-02390fff : /axi2apb@2390000
023a0000-023a0fff : /axi2apb@23a0000
023b0000-023b0fff : /axi2apb@23b0000
023c0000-023c0fff : /axi2apb@23c0000
023d0000-023d0fff : /axi2apb@23d0000
02430000-02444fff : /pinmux@2430000
02600000-0280ffff : /dma@2600000
02900800-02900fff : /aconnect@2a41000/ahub
02901000-029010ff : /aconnect@2a41000/ahub/i2s@2901000
02901100-029011ff : /aconnect@2a41000/ahub/i2s@2901100
02901200-029012ff : /aconnect@2a41000/ahub/i2s@2901200
02901300-029013ff : /aconnect@2a41000/ahub/i2s@2901300
02901400-029014ff : /aconnect@2a41000/ahub/i2s@2901400
02901500-029015ff : /aconnect@2a41000/ahub/i2s@2901500
02902000-029021ff : /aconnect@2a41000/ahub/sfc@2902000
02902200-029023ff : /aconnect@2a41000/ahub/sfc@2902200
02902400-029025ff : /aconnect@2a41000/ahub/sfc@2902400
02902600-029027ff : /aconnect@2a41000/ahub/sfc@2902600
02903000-029030ff : /aconnect@2a41000/ahub/amx@2903000
02903100-029031ff : /aconnect@2a41000/ahub/amx@2903100
02903200-029032ff : /aconnect@2a41000/ahub/amx@2903200
02903300-029033ff : /aconnect@2a41000/ahub/amx@2903300
02903800-029038ff : /aconnect@2a41000/ahub/adx@2903800
02903900-029039ff : /aconnect@2a41000/ahub/adx@2903900
02903a00-02903aff : /aconnect@2a41000/ahub/adx@2903a00
02903b00-02903bff : /aconnect@2a41000/ahub/adx@2903b00
02904000-029040ff : /aconnect@2a41000/ahub/dmic@2904000
02904100-029041ff : /aconnect@2a41000/ahub/dmic@2904100
02904200-029042ff : /aconnect@2a41000/ahub/dmic@2904200
02904300-029043ff : /aconnect@2a41000/ahub/dmic@2904300
02905000-029050ff : /aconnect@2a41000/ahub/dspk@2905000
02905100-029051ff : /aconnect@2a41000/ahub/dspk@2905100
02907000-029070ff : /aconnect@2a41000/ahub/afc@2907000
02907100-029071ff : /aconnect@2a41000/ahub/afc@2907100
02907200-029072ff : /aconnect@2a41000/ahub/afc@2907200
02907300-029073ff : /aconnect@2a41000/ahub/afc@2907300
02907400-029074ff : /aconnect@2a41000/ahub/afc@2907400
02907500-029075ff : /aconnect@2a41000/ahub/afc@2907500
02908000-029080ff : /aconnect@2a41000/ahub/ope@2908000
02908100-029081ff : /aconnect@2a41000/ahub/ope@2908000
02908200-029083ff : /aconnect@2a41000/ahub/ope@2908000
0290a000-0290a1ff : /aconnect@2a41000/ahub/mvc@290a000
0290a200-0290a3ff : /aconnect@2a41000/ahub/mvc@290a200
0290bb00-0290c2ff : /aconnect@2a41000/ahub/amixer@290bb00
0290e400-0290e7ff : /aconnect@2a41000/ahub/arad@290e400
0290f000-0290ffff : /aconnect@2a41000/ahub/admaif@290f000
02910000-02911fff : /aconnect@2a41000/ahub/asrc@2910000
02930000-0297ffff : /aconnect@2a41000/adma@2930000
02c00000-02c0ffff : /mc_sid@2c00000
02c10000-02c1ffff : /mc_sid@2c00000
03010000-0301ffff : /watchdog@30c0000
03090000-0309fffe : /watchdog@30c0000
030c0000-030cfffe : /watchdog@30c0000
03100000-0310003f : serial
03110000-0311003f : /serial@3110000
03130000-0313003f : /serial@3130000
03160000-031600ff : /i2c@3160000
03180000-031800ff : /i2c@3180000
03190000-031900ff : /i2c@3190000
031b0000-031b00ff : /i2c@31b0000
031c0000-031c00ff : /i2c@31c0000
031e0000-031e00ff : /i2c@31e0000
03210000-0321ffff : /spi@3210000
03240000-0324ffff : /spi@3240000
03280000-0328ffff : /pwm@3280000
03290000-0329ffff : /pwm@3290000
032a0000-032affff : /pwm@32a0000
03400000-0340020f : /sdhci@3400000
03440000-0344020f : /sdhci@3440000
03460000-0346020f : /sdhci@3460000
03500000-03500fff : sata-ipfs
03501000-03506fff : sata-config
03507000-03508fff : sata-ahci
03510000-0351ffff : /hda@3510000
03520000-03520fff : padctl
03530000-03537fff : /xhci@3530000
03538000-03538fff : /xhci@3530000
03540000-03540fff : ao
03550000-03557fff : /xudc@3550000
03558000-03558fff : /xudc@3550000
03820000-038205ff : /efuse@3820000
03830000-0383ffff : /kfuse@0x3830000
03960000-03960fff : 3960000.tegra_cec
03990000-0399ffff : 3990000.mipical
039c0000-039c000f : /tachometer@39c0000
03a90000-03a9ffff : sata-aux
03ad0000-03adffff : /se_elp@3ad0000
03ae0000-03aeffff : /se_elp@3ad0000
03c00000-03c00fff : Tegra Combined UART TOP0_HSP Linux mailbox interrrupt
03c10000-03c10003 : Tegra Combined UART TOP0_HSP Linux mailbox
08010000-08010fff : /funnel_major@8010000
08030000-08030fff : /etf@8030000
08050000-08050fff : /etr@8050000
08060000-08060fff : /tpiu@8060000
08070000-08070fff : stm-base
08820000-08820fff : /funnel_minor@8820000
08a1c000-08a1cfff : /ptm_bpmp@8a1c000
09010000-09010fff : /funnel_bccplex@9010000
09840000-09840fff : /ptm@9840000
09940000-09940fff : /ptm@9940000
09a40000-09a40fff : /ptm@9a40000
09b40000-09b40fff : /ptm@9b40000
0b1f0000-0b22ffff : sce-pm
0b230000-0b23ffff : sce-cfg
0c168000-0c168003 : Tegra Combined UART SPE mailbox
0c240000-0c2400ff : /i2c@c240000
0c250000-0c2500ff : /i2c@c250000
0c260000-0c26ffff : /spi@c260000
0c280000-0c28003f : /serial@c280000
0c2a0000-0c2a00ff : /rtc@c2a0000
0c2f0000-0c2f0fff : security
0c2f1000-0c2f1fff : gpio
0c300000-0c303fff : /pinmux@2430000
0c340000-0c34ffff : /pwm@c340000
0c360000-0c3603ff : /pmc@c360000
0c370000-0c3705ff : /pmc@c370000
0c390000-0c392ffe : /pmc@c360000
0d230000-0d230fff : /actmon@d230000
0e000000-0e07ffff : /cpufreq@e070000
10000000-10000fff : /pcie-controller@10003000/pci@1,0
10004000-10004fff : /pcie-controller@10003000/pci@3,0
12000000-12ffffff : /iommu@12000000
13e00000-13e0ffff : /host1x
13e10000-13e1ffff : /host1x
13ec0000-13efffff : /host1x
150c0000-150fffff : /host1x/nvcsi@150c0000
15100000-1513ffff : /host1x/tsecb@15100000
15340000-1537ffff : /host1x/vic@15340000
15380000-153bffff : /host1x/nvjpg@15380000
15480000-154bffff : /host1x/nvdec@15480000
154c0000-154fffff : /host1x/nvenc@154c0000
15500000-1553ffff : /host1x/tsec@15500000
15600000-1563ffff : /host1x/isp@15600000
15700000-157fffff : /host1x/vi@15700000
15810000-1581ffff : /host1x/se@15810000
15820000-1582ffff : /host1x/se@15820000
15830000-1583ffff : /host1x/se@15830000
15840000-1584ffff : /host1x/se@15840000
17000000-17ffffff : /gp10b
18000000-18ffffff : /gp10b
80000000-96079fff : System RAM
  80280000-817dffff : Kernel code
  82040000-823b9fff : Kernel data
961bd000-efffffff : System RAM
f0200000-2681fffff : System RAM
275880000-27588ffff : persistent_ram
275890000-27589ffff : persistent_ram
2758a0000-2758affff : persistent_ram
2758b0000-2758bffff : persistent_ram
2758c0000-2758cffff : persistent_ram
2758d0000-2758dffff : persistent_ram
2758e0000-2758effff : persistent_ram
2758f0000-2758fffff : persistent_ram
275900000-27590ffff : persistent_ram
275910000-27591ffff : persistent_ram
275920000-27592ffff : persistent_ram
275930000-27593ffff : persistent_ram
275940000-27594ffff : persistent_ram
275950000-27595ffff : persistent_ram
275960000-27596ffff : persistent_ram
275970000-27597ffff : persistent_ram
275980000-27598ffff : persistent_ram
275990000-27599ffff : persistent_ram
2759a0000-2759affff : persistent_ram
2759b0000-2759bffff : persistent_ram
2759c0000-2759cffff : persistent_ram
2759d0000-2759dffff : persistent_ram
2759e0000-2759effff : persistent_ram
2759f0000-2759fffff : persistent_ram
275a00000-275a7ffff : persistent_ram


------=_Part_23_2089964436.1580756018715--
