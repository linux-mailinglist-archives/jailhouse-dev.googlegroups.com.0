Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBFND4P5AKGQEEZRUWVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id BD039262ED1
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Sep 2020 14:59:02 +0200 (CEST)
Received: by mail-qv1-xf3c.google.com with SMTP id l1sf1306570qvr.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Sep 2020 05:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+4VM88hTNLlTPgOWeeTjob1DXPsIHm0+HkphAiv3mmA=;
        b=rJwolxrqu2MCLDcvq6jinJJMcM1STXB1ty7Bb/3frq1TXVWWn4xV5Qg2WxlC9fLNOF
         umKE30dWPRDjqLwhXRfyqCoXuqUcEOUstNf8jXajCmvD8oj2JSl35qxiNorcJMJf+Bkn
         wtpDlxJJpqN9xBE9mgV2Bma2qv88UQANnbCoLSxjXUur1r9m8H9zUoVGcXxqtomv07Ff
         7M2g6rRh8qFVGyQRiBvTkLXwj76ot5CRwkDp0m3K4eR/qsjo1ExZEk9YkTK9owZC8RVc
         noy89dKQSbE1kL+8SBTKJahJN2hnavNH7OHJZnQA4SJBiKHGt0U4w2S9gzglYzTdfOtu
         erLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+4VM88hTNLlTPgOWeeTjob1DXPsIHm0+HkphAiv3mmA=;
        b=iFtfvD3W+k2AZIyjiB6znMXFXw0VETgF1I+2TMtG84dXiG1DKFQm/G3j3yQfq+ik89
         r/1Tc0LMpluNl6OGMVE65lKd/DoDL1WEZuf/7pUTjlmMEvU3ulEbg9myLXPD4eyJ3jbH
         nJbFlbXw3b+dUqY6JYFLzrXtvU5UCrZYn4XTndUPBkYA2mXl4vZ7hQluCe1liJAhfdZO
         nBsVjIIQ/oAV2r5WWizWSdpmIwgcwbcardxOb2LRfTwA4i0CbgOU17IVKe/1LL7DSxH5
         +XpkHleXmjYLQjTnqte2IQHeTD+fh6MOJesXprobIW4F+qC7yUu0FVHsEMxsgk0w4g07
         eJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+4VM88hTNLlTPgOWeeTjob1DXPsIHm0+HkphAiv3mmA=;
        b=XJC1Lwbam/Pw3Kz8nW087J1rOT8x6LySsqDKbKMdwHP3tFoKWFflqA9kQkc7SuCNS2
         JaHLXjfuYLZsd9N7bTREeV0qk+I/x2ayneTS/j48lIiitD6aEmy+gsnwfVFtkKQDZG+m
         Kr+TN9uMEo+BzwQXafWB+i8tEca12XnLnTbw1L0zm5jxwBeLXFEIxoIYsh/f5T/bsP6i
         fKVchfmH4aAA8CW+pUMtpo6U6NkHTz4hjSu7lVLa+Ar2ek7vBZ8AMuAOld9mTGNSG5vH
         fyEC9QWKrmwFVDDnidzAjDP6LR5z0aGcLFdLvOtCQ/gFk5CAQ/JNa6Ol5IUcVZ7acPoJ
         Rj7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5330UTEnBFD5E6SVY+bOUp4o2agkhjjGh1+c/nntho1g28+1s8Mv
	1gDiGCa89DwNdtHrSaf922E=
X-Google-Smtp-Source: ABdhPJy/BlvDbefiwo38Qcf4tA0N0sZmmtqdW63xzdyOJmMYy7Ob0B63+KfqqOanujLlXiYzTV6xQg==
X-Received: by 2002:ac8:44b5:: with SMTP id a21mr3059225qto.36.1599656341681;
        Wed, 09 Sep 2020 05:59:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:f50b:: with SMTP id l11ls1279153qkk.6.gmail; Wed, 09 Sep
 2020 05:59:01 -0700 (PDT)
X-Received: by 2002:a37:897:: with SMTP id 145mr3230134qki.82.1599656340269;
        Wed, 09 Sep 2020 05:59:00 -0700 (PDT)
Date: Wed, 9 Sep 2020 05:58:59 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
In-Reply-To: <1776338.qqhLftCfjJ@monster>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_872_1991689635.1599656339101"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_872_1991689635.1599656339101
Content-Type: multipart/alternative; 
	boundary="----=_Part_873_203712023.1599656339101"

------=_Part_873_203712023.1599656339101
Content-Type: text/plain; charset="UTF-8"

I have good news.
I now have a Linux system on an Intel NUC8I7 with IOMMU support!.

The hardware check of Jalihouse works and I was able to create a 
configuration for the root cell with "jailhouse config create nuc8i7.c". 
(I've attached this configuration.)
I inserted this cell configuration into the Yocto build system and the file 
"nuc8i7.cell" is created and installed under "/usr/share/jailhouse/cells".

In order to start Jailhouse with "jailhouse enable nuc8i7.cell" I extended 
the Linux command line with:
intel_iommu=off memmap=0x5200000$0x3a000000

I took the entry "memmap = ..." from the generated configuration "nuc8i7.c".

While re-booting the system it gets stuck with the following message:
Kernel panic - System is deadlocked on memory

The kernel parameter  "memmap = ..." should actually work, because 82M of 
the following area is reserved:

/* MemRegion: 00100000-39ffffff : System RAM */
{
     .phys_start = 0x100000,
     .virt_start = 0x100000,
     .size = 0x39f00000,
     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
      JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
}

What could I do?

Best regards
Jan.


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/33ee04f7-5518-4f30-b28d-fb567ef1c609n%40googlegroups.com.

------=_Part_873_203712023.1599656339101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I have good news.</div><div></div>I now have a Linux system on an Inte=
l NUC8I7 with IOMMU support!.<br><div><br></div><div>The hardware check of =
Jalihouse works and I was able to create a configuration for the root cell =
with "jailhouse config create nuc8i7.c". (I've attached this configuration.=
)</div><div>I inserted this cell configuration into the Yocto build system =
and the file "nuc8i7.cell" is created and installed under "/usr/share/jailh=
ouse/cells".</div><div><br></div><div>In order to start Jailhouse with "jai=
lhouse enable nuc8i7.cell" I <span><span>extended</span></span> the Linux c=
ommand line with:</div><div><span style=3D"font-family: Courier New;">intel=
_iommu=3Doff memmap=3D0x5200000$0x3a000000</span></div><div><br></div><div>=
I took the entry "memmap =3D ..." from the generated configuration "nuc8i7.=
c".</div><div><br></div><div>While re-booting the system it gets stuck with=
 the following message:</div><div><span style=3D"font-family: Courier New;"=
>Kernel panic - System is deadlocked on memory</span><br></div><div><br></d=
iv><div>The kernel parameter&nbsp; "memmap =3D ..." should actually work, b=
ecause 82M of the following area is reserved:<br></div><div><br></div><div>=
<span style=3D"font-family: Courier New;">/* MemRegion: 00100000-39ffffff :=
 System RAM */<br>{<br>&nbsp;&nbsp; &nbsp; .phys_start =3D 0x100000,<br>&nb=
sp;&nbsp;&nbsp;&nbsp; .virt_start =3D 0x100000,<br>&nbsp;&nbsp;&nbsp;&nbsp;=
 .size =3D 0x39f00000,<br>&nbsp;&nbsp;&nbsp;&nbsp; .flags =3D JAILHOUSE_MEM=
_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp;&nbsp; &nbsp;&nbsp; JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,<br>}</span></div><div><br></div><div>What could =
I do?</div><div><br></div><div>Best regards</div><div>Jan.<br></div><div><b=
r></div><div class=3D"gmail_quote"><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/33ee04f7-5518-4f30-b28d-fb567ef1c609n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/33ee04f7-5518-4f30-b28d-fb567ef1c609n%40googlegroups.co=
m</a>.<br />

------=_Part_873_203712023.1599656339101--

------=_Part_872_1991689635.1599656339101
Content-Type: text/x-csrc; charset=US-ASCII; name=nuc8i7.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=nuc8i7.c
X-Attachment-Id: e6730c3a-91e8-4872-ae4c-b62f8326cbac
Content-ID: <e6730c3a-91e8-4872-ae4c-b62f8326cbac>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for Intel(R) Client Systems NUC8i7BEH
 * created with '/usr/libexec/jailhouse/jailhouse config create nuc8i7.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x5200000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[48];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[10];
	struct jailhouse_pci_device pci_devices[20];
	struct jailhouse_pci_capability pci_caps[76];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
			.size = 0x600000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xe0000000,
			.pci_mmconfig_end_bus = 0xff,
			.iommu_units = {
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xfed90000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xfed91000,
					.size = 0x1000,
				},
			},
			.x86 = {
				.pm_timer_address = 0x1808,
				.vtd_interrupt_limit = 256,
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x00000000000000ff,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0005efff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x5f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00060000-0009ffff : System RAM */
		{
			.phys_start = 0x60000,
			.virt_start = 0x60000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-39ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x39f00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3f200000-79959fff : System RAM */
		{
			.phys_start = 0x3f200000,
			.virt_start = 0x3f200000,
			.size = 0x3a75a000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 79dc4000-79e40fff : ACPI Tables */
		{
			.phys_start = 0x79dc4000,
			.virt_start = 0x79dc4000,
			.size = 0x7d000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 79e41000-7a274fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x79e41000,
			.virt_start = 0x79e41000,
			.size = 0x434000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7ab53000-7ac0dfff : Unknown E820 type */
		{
			.phys_start = 0x7ab53000,
			.virt_start = 0x7ab53000,
			.size = 0xbb000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7ac0e000-7ac0efff : System RAM */
		{
			.phys_start = 0x7ac0e000,
			.virt_start = 0x7ac0e000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 80000000-8fffffff : 0000:00:02.0 */
		{
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: bf000000-bfffffff : 0000:00:02.0 */
		{
			.phys_start = 0xbf000000,
			.virt_start = 0xbf000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c0000000-c0000fff : 0000:6e:00.0 */
		{
			.phys_start = 0xc0000000,
			.virt_start = 0xc0000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c0a00000-c0a01fff : nvme */
		{
			.phys_start = 0xc0a00000,
			.virt_start = 0xc0a00000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c0a03000-c0a03fff : nvme */
		{
			.phys_start = 0xc0a03000,
			.virt_start = 0xc0a03000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c0b00000-c0b1ffff : e1000e */
		{
			.phys_start = 0xc0b00000,
			.virt_start = 0xc0b00000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c0b20000-c0b23fff : ICH HD audio */
		{
			.phys_start = 0xc0b20000,
			.virt_start = 0xc0b20000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c0b24000-c0b25fff : ahci */
		{
			.phys_start = 0xc0b24000,
			.virt_start = 0xc0b24000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c0b26000-c0b267ff : ahci */
		{
			.phys_start = 0xc0b26000,
			.virt_start = 0xc0b26000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c0b27000-c0b270ff : ahci */
		{
			.phys_start = 0xc0b27000,
			.virt_start = 0xc0b27000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd000000-fd69ffff : pnp 00:05 */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0x6a0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6a0000-fd6affff : INT34BB:00 INT34BB:00 */
		{
			.phys_start = 0xfd6a0000,
			.virt_start = 0xfd6a0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6b0000-fd6cffff : pnp 00:05 */
		{
			.phys_start = 0xfd6b0000,
			.virt_start = 0xfd6b0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6d0000-fd6dffff : INT34BB:00 INT34BB:00 */
		{
			.phys_start = 0xfd6d0000,
			.virt_start = 0xfd6d0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6e0000-fd6effff : INT34BB:00 INT34BB:00 */
		{
			.phys_start = 0xfd6e0000,
			.virt_start = 0xfd6e0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6f0000-fdffffff : pnp 00:05 */
		{
			.phys_start = 0xfd6f0000,
			.virt_start = 0xfd6f0000,
			.size = 0x910000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe200000-fe7fffff : pnp 00:05 */
		{
			.phys_start = 0xfe200000,
			.virt_start = 0xfe200000,
			.size = 0x600000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : HPET 0 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed10000-fed17fff : pnp 00:04 */
		{
			.phys_start = 0xfed10000,
			.virt_start = 0xfed10000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed18000-fed18fff : pnp 00:04 */
		{
			.phys_start = 0xfed18000,
			.virt_start = 0xfed18000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed19000-fed19fff : pnp 00:04 */
		{
			.phys_start = 0xfed19000,
			.virt_start = 0xfed19000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed20000-fed3ffff : pnp 00:04 */
		{
			.phys_start = 0xfed20000,
			.virt_start = 0xfed20000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed45000-fed8ffff : pnp 00:04 */
		{
			.phys_start = 0xfed45000,
			.virt_start = 0xfed45000,
			.size = 0x4b000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-4eedfffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x3eee00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 4eee00000-4f0ffffff : Kernel */
		{
			.phys_start = 0x4eee00000,
			.virt_start = 0x4eee00000,
			.size = 0x2200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 4f1000000-87dffffff : System RAM */
		{
			.phys_start = 0x4f1000000,
			.virt_start = 0x4f1000000,
			.size = 0x38d000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 87e000000-87fffffff : RAM buffer */
		{
			.phys_start = 0x87e000000,
			.virt_start = 0x87e000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 404ab00000-404abfffff : ICH HD audio */
		{
			.phys_start = 0x404ab00000,
			.virt_start = 0x404ab00000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 404ac00000-404ac0ffff : xhci-hcd */
		{
			.phys_start = 0x404ac00000,
			.virt_start = 0x404ac00000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 404ac10000-404ac11fff : iwlwifi */
		{
			.phys_start = 0x404ac10000,
			.virt_start = 0x404ac10000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 404ac13000-404ac13fff : iwlwifi */
		{
			.phys_start = 0x404ac13000,
			.virt_start = 0x404ac13000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 404ac14000-404ac15fff : 0000:00:14.2 */
		{
			.phys_start = 0x404ac14000,
			.virt_start = 0x404ac14000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 404ac16000-404ac160ff : 0000:00:1f.4 */
		{
			.phys_start = 0x404ac16000,
			.virt_start = 0x404ac16000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 404ac17000-404ac17fff : mei_me */
		{
			.phys_start = 0x404ac17000,
			.virt_start = 0x404ac17000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 404ac18000-404ac18fff : 0000:00:14.2 */
		{
			.phys_start = 0x404ac18000,
			.virt_start = 0x404ac18000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 404ac19000-404ac19fff : 0000:00:12.0 */
		{
			.phys_start = 0x404ac19000,
			.virt_start = 0x404ac19000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 404ac1a000-404ac1afff : 0000:00:08.0 */
		{
			.phys_start = 0x404ac1a000,
			.virt_start = 0x404ac1a000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7a738000-7a981fff : ACPI DMAR RMRR */
		/* PCI device: 00:14.0 */
		{
			.phys_start = 0x7a738000,
			.virt_start = 0x7a738000,
			.size = 0x24a000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7b800000-7fffffff : ACPI DMAR RMRR */
		/* PCI device: 00:02.0 */
		{
			.phys_start = 0x7b800000,
			.virt_start = 0x7b800000,
			.size = 0x4800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3a600000-3f1fffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x3a600000,
			.virt_start = 0x3a600000,
			.size = 0x4c00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 2, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x100f7,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0000-001f : dma1 */
		/* PIO_RANGE(0x0, 0x20), */
		/* Port I/O: 0020-0021 : pic1 */
		/* PIO_RANGE(0x20, 0x2), */
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0050-0053 : timer1 */
		/* PIO_RANGE(0x50, 0x4), */
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0062-0062 : EC data */
		/* PIO_RANGE(0x62, 0x1), */
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0066-0066 : EC cmd */
		/* PIO_RANGE(0x66, 0x1), */
		/* Port I/O: 0070-0077 : rtc0 */
		PIO_RANGE(0x70, 0x8),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00ff : fpu */
		/* PIO_RANGE(0xf0, 0x10), */
		/* Port I/O: 0400-041f : iTCO_wdt */
		/* PIO_RANGE(0x400, 0x20), */
		/* Port I/O: 0680-069f : pnp 00:01 */
		/* PIO_RANGE(0x680, 0x20), */
		/* Port I/O: 0a00-0a1f : pnp 00:00 */
		/* PIO_RANGE(0xa00, 0x20), */
		/* Port I/O: 0a20-0a2f : pnp 00:00 */
		/* PIO_RANGE(0xa20, 0x10), */
		/* Port I/O: 0a30-0a3f : pnp 00:00 */
		/* PIO_RANGE(0xa30, 0x10), */
		/* Port I/O: 0a40-0a4f : pnp 00:00 */
		/* PIO_RANGE(0xa40, 0x10), */
		/* Port I/O: 0a50-0a5f : pnp 00:00 */
		/* PIO_RANGE(0xa50, 0x10), */
		/* Port I/O: 0a60-0a6f : pnp 00:00 */
		/* PIO_RANGE(0xa60, 0x10), */
		/* Port I/O: 4000-4007 : 0000:6d:00.0 */
		PIO_RANGE(0x4000, 0x8),
		/* Port I/O: 5000-503f : 0000:00:02.0 */
		PIO_RANGE(0x5000, 0x40),
		/* Port I/O: 5060-507f : 0000:00:17.0 */
		PIO_RANGE(0x5060, 0x20),
		/* Port I/O: 5080-5083 : 0000:00:17.0 */
		PIO_RANGE(0x5080, 0x4),
		/* Port I/O: 5090-5097 : 0000:00:17.0 */
		PIO_RANGE(0x5090, 0x8),
		/* Port I/O: efa0-efbf : 0000:00:1f.4 */
		PIO_RANGE(0xefa0, 0x20),
	},

	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x10,
			.bar_mask = {
				0xff000000, 0xffffffff, 0xf0000000,
				0xffffffff, 0xffffffc0, 0x00000000,
			},
			.caps_start = 1,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x40,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:12.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x90,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 11,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa0,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 13,
			.num_caps = 3,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa2,
			.bar_mask = {
				0xffffe000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa3,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 17,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 16,
			.msix_region_size = 0x1000,
			.msix_address = 0x404ac12000,
		},
		/* PCIDevice: 00:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 24,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:17.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb8,
			.bar_mask = {
				0xffffe000, 0xffffff00, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfffff800,
			},
			.caps_start = 27,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe4,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 35,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 44,
			.num_caps = 10,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1d.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xee,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 44,
			.num_caps = 10,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xf8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfb,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0xfff00000, 0xffffffff,
			},
			.caps_start = 54,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfc,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfd,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfe,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 57,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 6d:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x6d00,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0xfffffff8,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 59,
			.num_caps = 10,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 9,
			.msix_region_size = 0x1000,
			.msix_address = 0xc0a02000,
		},
		/* PCIDevice: 6e:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x6e00,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 69,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:00.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0xe0,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x40,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xac,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xd0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_PASID | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ATS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PRI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x90,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xdc,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_AF,
			.start = 0xf0,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:12.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:14.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:14.2 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:14.3 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xc8,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xd0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x80,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x14c,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x164,
			.len = 0x18,
			.flags = 0,
		},
		/* PCIDevice: 00:16.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x8c,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0xa4,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:17.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.4 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PTM | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x220,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DPC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x250,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:1d.0 */
		/* PCIDevice: 00:1d.6 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PTM | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x220,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DPC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x250,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x80,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:1f.6 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xc8,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xd0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 6d:00.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xd0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xe0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xf8,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x108,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x110,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ARI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x128,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 6e:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x158,
			.len = 0x4,
			.flags = 0,
		},
	},
};

------=_Part_872_1991689635.1599656339101--
