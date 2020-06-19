Return-Path: <jailhouse-dev+bncBD7236HKXYJRBSFZWL3QKGQE3HOTILY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1120077F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jun 2020 13:08:57 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id w16sf4193166oie.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jun 2020 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zhUTLMOLpUvpHTlAewDexxjSq0M2oQQ5fuyMADEep2g=;
        b=P1jumQt1uY5Uldj6mBk9UJKgqGpm3GdbSgj6RYHZAcUu0NAdJL+1i+YSaU+w5DXLJA
         9sXsqz2gKkNXO7pZrpcVVBjhJANv7mQvxQHBuvVULnh3W4LV17FISIWb4J4jRKc+IKZi
         K4ey7vcdfon86LfUQVugEL2Za0s+7WG5lurZPKGswhh2t0iJNRHhtLnlWuqPQbkb8lbX
         O13/ilJiDPz85coQG+sbQJmbf46AQQy7Kpzg0fTxSkPKEwhN5FQ8G0qLQt2bnbbV494p
         rbdNfDGFPnt7bywdDcsOyRWBfHgv+eAZ2nBzKac4Q+OX3HrAPPLRoeE0qoj83IBbybjY
         eHzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zhUTLMOLpUvpHTlAewDexxjSq0M2oQQ5fuyMADEep2g=;
        b=ncOKd8CI41Oa7VWvnn8feKi3NUGX4Sszxjrkx/WFQlGEUZeeN1/gk6s61dASILz99H
         gCWsQZ11ZywoLxCRfmPCYBRfOD1h1vPhTBBk8bihqOxyTtOTyt6nA1fnG3N7cebSadHD
         WbxVudLeLmoBO2T/8HYubVChX+eb+lfMvXvicWhpun8d4kpyr0qllKpXZGnT5UhJAH/O
         0bMtnZr3w6iv1yWan9hSZrTwuhYCUq5UHjVrKYYtEhpwoyqJXTC6huoAgggkk3GibFJO
         XFbsnDnSAyYRas8wKk9UN2+MoYw4qt+POuIXIwzH+xvKtymPukAciDf1OKqbVa8Rqqw8
         WhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zhUTLMOLpUvpHTlAewDexxjSq0M2oQQ5fuyMADEep2g=;
        b=p9yFLO3xwFbOy3T4mY17xkzN6sDSB3ID9l+fpGEnz7YRdugT65WAfr1yjdxgSI2dxl
         RSgZIknevqDbxH2LyFVjhAThtYTTRxJqq03EyOtaE5qCoBqp5XFEBdHb6ftPcVqk8gta
         T6sxDNcwhTklXomEIedfbu9Qv62toAT8iS9Qeqsbx1u3hoKlvSRCMMFkUBRxG6ibL7Al
         92xmDQanSCnuLM7LRO93LHmoE1bcQKuK/+hOQhv49twNjpiWVdacCUoM6Ttq0URgR7cd
         4CWZ5hL+47OC6XARipxVQ2BdUneDljEO+TqOOMQLYfoAgvlKWx4yddeyj4LZWzRefeGi
         i4TA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Vtt2OJgkxMN3sQ030ZSRfbZM1AaPJTkcyVkyeSFJYPxKztrta
	qcRaYAKOZ+G+F3WPVoLiF/k=
X-Google-Smtp-Source: ABdhPJxEBGp5JwPKcMNVvNEj2isWX6Guk9cKpLzF6+emxhwaq0Wn7QeoWMGgwFH1xqdFjxLiKqfEbw==
X-Received: by 2002:a9d:6e8e:: with SMTP id a14mr2703884otr.52.1592564936445;
        Fri, 19 Jun 2020 04:08:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:2c46:: with SMTP id f64ls1972679otb.2.gmail; Fri, 19 Jun
 2020 04:08:55 -0700 (PDT)
X-Received: by 2002:a9d:6e84:: with SMTP id a4mr2488990otr.112.1592564935211;
        Fri, 19 Jun 2020 04:08:55 -0700 (PDT)
Date: Fri, 19 Jun 2020 04:08:54 -0700 (PDT)
From: "contact....@gmail.com" <contact.thorsten@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <785d19a7-5a7c-4157-9e45-f4ead7c37a08n@googlegroups.com>
Subject: jailhouse-config-create: creates many overlapping memory regions
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_82_528449415.1592564934071"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_82_528449415.1592564934071
Content-Type: multipart/alternative; 
	boundary="----=_Part_83_1568343698.1592564934071"

------=_Part_83_1568343698.1592564934071
Content-Type: text/plain; charset="UTF-8"

This issue may be in the works / known -- just to add another example.

On the this x86 box (Edge Up-Squared, similar device class like the 
existing nuc6cay), jailhouse-config-create finds ~100 memory regions, of 
which many overlap and most probably are irrelevant to actual use. 
jailhouse-config-check coughs them up again.

Apart from this uncomfort, just for understanding:

What happens to resources *not* mentioned in the system-config? Do they 
stay with the root-cell or become completely unavailable?

In theory, how would I make a resource inaccessible to the root-cell (but 
available to non-root)?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/785d19a7-5a7c-4157-9e45-f4ead7c37a08n%40googlegroups.com.

------=_Part_83_1568343698.1592564934071
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>This issue may be in the works / known -- just to add another example.=
</div><div><br></div><div>On the this x86 box (Edge Up-Squared, similar dev=
ice class like the existing nuc6cay), jailhouse-config-create finds ~100 me=
mory regions, of which many overlap and most probably are irrelevant to act=
ual use. jailhouse-config-check coughs them up again.</div><div><br></div><=
div>Apart from this uncomfort, just for understanding:</div><div><br></div>=
<div>What happens to resources *not* mentioned in the system-config? Do the=
y stay with the root-cell or become completely unavailable?</div><div><br><=
/div><div>In theory, how would I make a resource inaccessible to the root-c=
ell (but available to non-root)?<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/785d19a7-5a7c-4157-9e45-f4ead7c37a08n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/785d19a7-5a7c-4157-9e45-f4ead7c37a08n%40googlegroups.co=
m</a>.<br />

------=_Part_83_1568343698.1592564934071--

------=_Part_82_528449415.1592564934071
Content-Type: application/x-xz; name=edge-up2.tar.xz
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=edge-up2.tar.xz
X-Attachment-Id: 439a299a-1258-4526-ac8d-982e08e73940
Content-ID: <439a299a-1258-4526-ac8d-982e08e73940>

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

------=_Part_82_528449415.1592564934071
Content-Type: text/x-csrc; charset=US-ASCII; name=edge-up2.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=edge-up2.c
X-Attachment-Id: edece998-4f68-49f3-b274-2329c84d88f5
Content-ID: <edece998-4f68-49f3-b274-2329c84d88f5>

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
 * Configuration for AAEON UP-APL01
 * created with 'jailhouse/tools/jailhouse config create edge-up2.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x5200000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[102];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[11];
	struct jailhouse_pci_device pci_devices[33];
	struct jailhouse_pci_capability pci_caps[41];
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
					.base = 0xfed64000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xfed65000,
					.size = 0x1000,
				},
			},
			.x86 = {
				.pm_timer_address = 0x408,
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
		0x000000000000000f,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0003efff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x3f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00040000-0009dfff : System RAM */
		{
			.phys_start = 0x40000,
			.virt_start = 0x40000,
			.size = 0x5e000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-0fffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0xff00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 12151000-39ffffff : System RAM */
		{
			.phys_start = 0x12151000,
			.virt_start = 0x12151000,
			.size = 0x27eaf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3f200000-77899fff : System RAM */
		{
			.phys_start = 0x3f200000,
			.virt_start = 0x3f200000,
			.size = 0x3869a000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7789a000-7789a143 : ACPI Tables */
		{
			.phys_start = 0x7789a000,
			.virt_start = 0x7789a000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7789a144-77b0cfff : System RAM */
		{
			.phys_start = 0x7789a144,
			.virt_start = 0x7789a144,
			.size = 0x273000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 79c2b000-79c43fff : ACPI Tables */
		{
			.phys_start = 0x79c2b000,
			.virt_start = 0x79c2b000,
			.size = 0x19000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 79c44000-79ca3fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x79c44000,
			.virt_start = 0x79c44000,
			.size = 0x60000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7a041000-7a08cfff : Unknown E820 type */
		{
			.phys_start = 0x7a041000,
			.virt_start = 0x7a041000,
			.size = 0x4c000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7a08d000-7a3fafff : System RAM */
		{
			.phys_start = 0x7a08d000,
			.virt_start = 0x7a08d000,
			.size = 0x36e000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7a3fb000-7a3fbfff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x7a3fb000,
			.virt_start = 0x7a3fb000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7a426000-7a964fff : System RAM */
		{
			.phys_start = 0x7a426000,
			.virt_start = 0x7a426000,
			.size = 0x53f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7a967000-7affffff : System RAM */
		{
			.phys_start = 0x7a967000,
			.virt_start = 0x7a967000,
			.size = 0x699000,
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
		/* MemRegion: 90000000-90ffffff : 0000:00:02.0 */
		{
			.phys_start = 0x90000000,
			.virt_start = 0x90000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9100c100-911fffff : dwc_usb3 */
		{
			.phys_start = 0x9100c100,
			.virt_start = 0x9100c100,
			.size = 0x1f4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91200000-912fffff : ICH HD audio */
		{
			.phys_start = 0x91200000,
			.virt_start = 0x91200000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91301000-91303fff : r8169 */
		{
			.phys_start = 0x91301000,
			.virt_start = 0x91301000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91304000-91304fff : r8169 */
		{
			.phys_start = 0x91304000,
			.virt_start = 0x91304000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91401000-91403fff : r8169 */
		{
			.phys_start = 0x91401000,
			.virt_start = 0x91401000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91404000-91404fff : r8169 */
		{
			.phys_start = 0x91404000,
			.virt_start = 0x91404000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91500000-9150ffff : xhci-hcd */
		{
			.phys_start = 0x91500000,
			.virt_start = 0x91500000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91510000-91513fff : ICH HD audio */
		{
			.phys_start = 0x91510000,
			.virt_start = 0x91510000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91514000-91515fff : ahci */
		{
			.phys_start = 0x91514000,
			.virt_start = 0x91514000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91516000-915160ff : 0000:00:1f.1 */
		{
			.phys_start = 0x91516000,
			.virt_start = 0x91516000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91517000-91517fff : 0000:00:1e.0 */
		{
			.phys_start = 0x91517000,
			.virt_start = 0x91517000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91518000-91518fff : mmc1 */
		{
			.phys_start = 0x91518000,
			.virt_start = 0x91518000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91519000-91519fff : 0000:00:1c.0 */
		{
			.phys_start = 0x91519000,
			.virt_start = 0x91519000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9151a000-9151afff : mmc0 */
		{
			.phys_start = 0x9151a000,
			.virt_start = 0x9151a000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9151b000-9151bfff : 0000:00:1a.0 */
		{
			.phys_start = 0x9151b000,
			.virt_start = 0x9151b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9151c000-9151cfff : 0000:00:1a.0 */
		{
			.phys_start = 0x9151c000,
			.virt_start = 0x9151c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9151d000-9151dfff : 0000:00:19.2 */
		{
			.phys_start = 0x9151d000,
			.virt_start = 0x9151d000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9151e000-9151e1ff : lpss_dev */
		{
			.phys_start = 0x9151e000,
			.virt_start = 0x9151e000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9151e200-9151e2ff : lpss_priv */
		{
			.phys_start = 0x9151e200,
			.virt_start = 0x9151e200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9151e800-9151efff : idma64.12 */
		{
			.phys_start = 0x9151e800,
			.virt_start = 0x9151e800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9151f000-9151ffff : 0000:00:19.1 */
		{
			.phys_start = 0x9151f000,
			.virt_start = 0x9151f000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91520000-915201ff : lpss_dev */
		{
			.phys_start = 0x91520000,
			.virt_start = 0x91520000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91520200-915202ff : lpss_priv */
		{
			.phys_start = 0x91520200,
			.virt_start = 0x91520200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91520800-91520fff : idma64.11 */
		{
			.phys_start = 0x91520800,
			.virt_start = 0x91520800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91521000-91521fff : 0000:00:19.0 */
		{
			.phys_start = 0x91521000,
			.virt_start = 0x91521000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91522000-915221ff : lpss_dev */
		{
			.phys_start = 0x91522000,
			.virt_start = 0x91522000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91522200-915222ff : lpss_priv */
		{
			.phys_start = 0x91522200,
			.virt_start = 0x91522200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91522800-91522fff : idma64.10 */
		{
			.phys_start = 0x91522800,
			.virt_start = 0x91522800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91523000-91523fff : 0000:00:18.1 */
		{
			.phys_start = 0x91523000,
			.virt_start = 0x91523000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91524000-9152401f : serial */
		{
			.phys_start = 0x91524000,
			.virt_start = 0x91524000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91524200-915242ff : lpss_priv */
		{
			.phys_start = 0x91524200,
			.virt_start = 0x91524200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91524800-91524fff : idma64.9 */
		{
			.phys_start = 0x91524800,
			.virt_start = 0x91524800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91525000-91525fff : 0000:00:18.0 */
		{
			.phys_start = 0x91525000,
			.virt_start = 0x91525000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91526000-9152601f : serial */
		{
			.phys_start = 0x91526000,
			.virt_start = 0x91526000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91526200-915262ff : lpss_priv */
		{
			.phys_start = 0x91526200,
			.virt_start = 0x91526200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91526800-91526fff : idma64.8 */
		{
			.phys_start = 0x91526800,
			.virt_start = 0x91526800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91527000-91527fff : 0000:00:17.3 */
		{
			.phys_start = 0x91527000,
			.virt_start = 0x91527000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91528000-915281ff : lpss_dev */
		{
			.phys_start = 0x91528000,
			.virt_start = 0x91528000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91528200-915282ff : lpss_priv */
		{
			.phys_start = 0x91528200,
			.virt_start = 0x91528200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91528800-91528fff : idma64.7 */
		{
			.phys_start = 0x91528800,
			.virt_start = 0x91528800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91529000-91529fff : 0000:00:17.2 */
		{
			.phys_start = 0x91529000,
			.virt_start = 0x91529000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152a000-9152a1ff : lpss_dev */
		{
			.phys_start = 0x9152a000,
			.virt_start = 0x9152a000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152a200-9152a2ff : lpss_priv */
		{
			.phys_start = 0x9152a200,
			.virt_start = 0x9152a200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152a800-9152afff : idma64.6 */
		{
			.phys_start = 0x9152a800,
			.virt_start = 0x9152a800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152b000-9152bfff : 0000:00:17.1 */
		{
			.phys_start = 0x9152b000,
			.virt_start = 0x9152b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152c000-9152c1ff : lpss_dev */
		{
			.phys_start = 0x9152c000,
			.virt_start = 0x9152c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152c200-9152c2ff : lpss_priv */
		{
			.phys_start = 0x9152c200,
			.virt_start = 0x9152c200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152c800-9152cfff : idma64.5 */
		{
			.phys_start = 0x9152c800,
			.virt_start = 0x9152c800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152d000-9152dfff : 0000:00:17.0 */
		{
			.phys_start = 0x9152d000,
			.virt_start = 0x9152d000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152e000-9152e1ff : lpss_dev */
		{
			.phys_start = 0x9152e000,
			.virt_start = 0x9152e000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152e200-9152e2ff : lpss_priv */
		{
			.phys_start = 0x9152e200,
			.virt_start = 0x9152e200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152e800-9152efff : idma64.4 */
		{
			.phys_start = 0x9152e800,
			.virt_start = 0x9152e800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9152f000-9152ffff : 0000:00:16.3 */
		{
			.phys_start = 0x9152f000,
			.virt_start = 0x9152f000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91530000-915301ff : lpss_dev */
		{
			.phys_start = 0x91530000,
			.virt_start = 0x91530000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91530200-915302ff : lpss_priv */
		{
			.phys_start = 0x91530200,
			.virt_start = 0x91530200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91530800-91530fff : idma64.3 */
		{
			.phys_start = 0x91530800,
			.virt_start = 0x91530800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91531000-91531fff : 0000:00:16.2 */
		{
			.phys_start = 0x91531000,
			.virt_start = 0x91531000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91532000-915321ff : lpss_dev */
		{
			.phys_start = 0x91532000,
			.virt_start = 0x91532000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91532200-915322ff : lpss_priv */
		{
			.phys_start = 0x91532200,
			.virt_start = 0x91532200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91532800-91532fff : idma64.2 */
		{
			.phys_start = 0x91532800,
			.virt_start = 0x91532800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91533000-91533fff : 0000:00:16.1 */
		{
			.phys_start = 0x91533000,
			.virt_start = 0x91533000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91534000-915341ff : lpss_dev */
		{
			.phys_start = 0x91534000,
			.virt_start = 0x91534000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91534200-915342ff : lpss_priv */
		{
			.phys_start = 0x91534200,
			.virt_start = 0x91534200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91534800-91534fff : idma64.1 */
		{
			.phys_start = 0x91534800,
			.virt_start = 0x91534800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91535000-91535fff : 0000:00:16.0 */
		{
			.phys_start = 0x91535000,
			.virt_start = 0x91535000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91536000-915361ff : lpss_dev */
		{
			.phys_start = 0x91536000,
			.virt_start = 0x91536000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91536200-915362ff : lpss_priv */
		{
			.phys_start = 0x91536200,
			.virt_start = 0x91536200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91536800-91536fff : idma64.0 */
		{
			.phys_start = 0x91536800,
			.virt_start = 0x91536800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91537000-91537fff : 0000:00:15.1 */
		{
			.phys_start = 0x91537000,
			.virt_start = 0x91537000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91538000-915387ff : ahci */
		{
			.phys_start = 0x91538000,
			.virt_start = 0x91538000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91539000-915390ff : ahci */
		{
			.phys_start = 0x91539000,
			.virt_start = 0x91539000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9153c000-9153cfff : mei_me */
		{
			.phys_start = 0x9153c000,
			.virt_start = 0x9153c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fea00000-feafffff : pnp 00:01 */
		{
			.phys_start = 0xfea00000,
			.virt_start = 0xfea00000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed03000-fed03fff : pnp 00:01 */
		{
			.phys_start = 0xfed03000,
			.virt_start = 0xfed03000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed06000-fed06fff : pnp 00:01 */
		{
			.phys_start = 0xfed06000,
			.virt_start = 0xfed06000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed08000-fed09fff : pnp 00:01 */
		{
			.phys_start = 0xfed08000,
			.virt_start = 0xfed08000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed1c000-fed1cfff : pnp 00:01 */
		{
			.phys_start = 0xfed1c000,
			.virt_start = 0xfed1c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed40000-fed44fff : MSFT0101:00 */
		{
			.phys_start = 0xfed40000,
			.virt_start = 0xfed40000,
			.size = 0x5000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed80000-fedbffff : pnp 00:01 */
		{
			.phys_start = 0xfed80000,
			.virt_start = 0xfed80000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-1d05fffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0xd0600000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 1d0600000-1d2ffffff : Kernel */
		{
			.phys_start = 0x1d0600000,
			.virt_start = 0x1d0600000,
			.size = 0x2a00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 1d3000000-27fffffff : System RAM */
		{
			.phys_start = 0x1d3000000,
			.virt_start = 0x1d3000000,
			.size = 0xad000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 79bc6000-79be5fff : ACPI DMAR RMRR */
		/* PCI device: 00:15.0 */
		/* PCI device: 00:15.1 */
		{
			.phys_start = 0x79bc6000,
			.virt_start = 0x79bc6000,
			.size = 0x20000,
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
		/* IOAPIC 1, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x1faf8,
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
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
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
		/* Port I/O: 0400-0403 : ACPI PM1a_EVT_BLK */
		/* PIO_RANGE(0x400, 0x4), */
		/* Port I/O: 0404-0405 : ACPI PM1a_CNT_BLK */
		/* PIO_RANGE(0x404, 0x2), */
		/* Port I/O: 0408-040b : ACPI PM_TMR */
		/* PIO_RANGE(0x408, 0x4), */
		/* Port I/O: 0420-043f : ACPI GPE0_BLK */
		/* PIO_RANGE(0x420, 0x20), */
		/* Port I/O: 0450-0450 : ACPI PM2_CNT_BLK */
		/* PIO_RANGE(0x450, 0x1), */
		/* Port I/O: 0500-05fe : pnp 00:00 */
		/* PIO_RANGE(0x500, 0xff), */
		/* Port I/O: 0680-069f : pnp 00:00 */
		/* PIO_RANGE(0x680, 0x20), */
		/* Port I/O: d000-d0ff : 0000:03:00.0 */
		PIO_RANGE(0xd000, 0x100),
		/* Port I/O: e000-e0ff : 0000:02:00.0 */
		PIO_RANGE(0xe000, 0x100),
		/* Port I/O: f000-f03f : 0000:00:02.0 */
		PIO_RANGE(0xf000, 0x40),
		/* Port I/O: f040-f05f : 0000:00:1f.1 */
		PIO_RANGE(0xf040, 0x20),
		/* Port I/O: f060-f07f : 0000:00:12.0 */
		PIO_RANGE(0xf060, 0x20),
		/* Port I/O: f080-f083 : 0000:00:12.0 */
		PIO_RANGE(0xf080, 0x4),
		/* Port I/O: f090-f097 : 0000:00:12.0 */
		PIO_RANGE(0xf090, 0x8),
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
			.num_caps = 0,
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
			.caps_start = 0,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x70,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0xfff00000, 0xffffffff,
			},
			.caps_start = 7,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x78,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
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
				0xffffe000, 0xffffff00, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfffff800,
			},
			.caps_start = 15,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:13.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x98,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:13.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x99,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:13.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x9a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:13.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x9b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa1,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:15.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa8,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 27,
			.num_caps = 3,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:15.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa9,
			.bar_mask = {
				0xffe00000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:16.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb1,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:16.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb2,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:16.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb3,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
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
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:17.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb9,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:17.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xba,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:17.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xbb,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xc0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xc1,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xc8,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xc9,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xca,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xd0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xf0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
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
		/* PCIDevice: 00:1f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xf9,
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
		/* PCIDevice: 02:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x200,
			.bar_mask = {
				0xffffff00, 0x00000000, 0xfffff000,
				0xffffffff, 0xffffc000, 0xffffffff,
			},
			.caps_start = 32,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 4,
			.msix_region_size = 0x1000,
			.msix_address = 0x91400000,
		},
		/* PCIDevice: 03:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x300,
			.bar_mask = {
				0xffffff00, 0x00000000, 0xfffff000,
				0xffffffff, 0xffffc000, 0xffffffff,
			},
			.caps_start = 32,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 4,
			.msix_region_size = 0x1000,
			.msix_address = 0x91300000,
		},
	},

	.pci_caps = {
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
		/* PCIDevice: 00:0e.0 */
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
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:0f.0 */
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
		/* PCIDevice: 00:12.0 */
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
		/* PCIDevice: 00:13.0 */
		/* PCIDevice: 00:13.1 */
		/* PCIDevice: 00:13.2 */
		/* PCIDevice: 00:13.3 */
		/* PCIDevice: 00:14.0 */
		/* PCIDevice: 00:14.1 */
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
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x220,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:15.0 */
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
		/* PCIDevice: 00:15.1 */
		/* PCIDevice: 00:16.0 */
		/* PCIDevice: 00:16.1 */
		/* PCIDevice: 00:16.2 */
		/* PCIDevice: 00:16.3 */
		/* PCIDevice: 00:17.0 */
		/* PCIDevice: 00:17.1 */
		/* PCIDevice: 00:17.2 */
		/* PCIDevice: 00:17.3 */
		/* PCIDevice: 00:18.0 */
		/* PCIDevice: 00:18.1 */
		/* PCIDevice: 00:19.0 */
		/* PCIDevice: 00:19.1 */
		/* PCIDevice: 00:19.2 */
		/* PCIDevice: 00:1a.0 */
		/* PCIDevice: 00:1c.0 */
		/* PCIDevice: 00:1e.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 02:00.0 */
		/* PCIDevice: 03:00.0 */
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
			.id = PCI_CAP_ID_MSIX,
			.start = 0xb0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VPD,
			.start = 0xd0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x170,
			.len = 0x8,
			.flags = 0,
		},
	},
};

------=_Part_82_528449415.1592564934071--
