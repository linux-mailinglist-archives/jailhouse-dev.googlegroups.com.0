Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBKOVRSHAMGQECFZPYIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567B47D318
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 14:39:55 +0100 (CET)
Received: by mail-qk1-x73e.google.com with SMTP id bi22-20020a05620a319600b00468606d7e7fsf1742093qkb.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 05:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VXhyQ0R2cPtB1KDkb09Q+Z9abomMo7Riw1GeOEbkymI=;
        b=dQHyfypkPnyA0GICPqwA2Rf2noFAqB9LVqzr8YbdXxbm3ecDIHvj+0uC4piRRU0sUP
         chEqPRKTpw9c7QtyXavx8BHRYvqmPgLaxxWfFk9yHQC3+2ivurhnafe4idGzxD1WSBC9
         rIo9GdG2O4BuafMM9mZ5+T0JZDre05/7NHdmvWw3Z2MVBI1+PYpUPG3kX/oEKrSE/3iw
         o1XeoU6eI7BmlV/SkxL4YHIgYAJ3FLo/JGMcjhllUgopNnKnfCD5D86LdJiUioTcoNST
         94aMm0F7PzIpKxBX+ZqDmJnIDRGlpACqeDGucu6JCUbBm5safYcHLkrWWdB2MNA7X4ZT
         jPOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VXhyQ0R2cPtB1KDkb09Q+Z9abomMo7Riw1GeOEbkymI=;
        b=d/+w4gGXeCK3rMwiIJtJflRFPt+5cJkDR+CWsD6GmFcNycyDcWTW1fUFpOFSBP5FBW
         hzhPvfof8FPLUni8E/pUTyE9VR1/BKEO/OF5PGqSv4xvGSYbJmgEaMhr+sv1VOQ6rM0G
         yeSFnM+xuBbpNp+UmcQK42GZV4FR5y5V/jGYpOKwFf1SFByR6YQY2nUE18UQWdv123Zg
         wPqZo5p6DbtmeHkAfrhGUYhn2egj1skZENK/Ne6l+rM/5G9BA76OhAdsbXCF9kPV8rch
         F+vzvccR8CAHN1u+/Cn/5n+Ths9DVJH8pc4oPfj5+82HDqX+zFigWj2gxO3wJZGSgWKo
         YmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VXhyQ0R2cPtB1KDkb09Q+Z9abomMo7Riw1GeOEbkymI=;
        b=HdjWQ11LUVNLlgLg8vwQ8y+lkLStS2DCVyvbFEaPMG2RzW8YuSHIYFypu67tidR6Mg
         EMzk8x7IOk4oKaCiESbvJpWJH0NxNsSwI8xHDErhgtUZg1yEdEyAwWQmAwo2vq8zsTOM
         azKqdFVF7wWpasmyZbK0XEuyoC4th14o7ldAwgROsQi4nq7CUI2yuu2u38kgJgVwbXlc
         JdOcdyEpwERY7KfZtey4xmH4dmuQIixTtnmtGWWAtagnzoMCrbHVw+gfo0GQVFNuiTAg
         5Xjw0xKYKOyJ15I+q1LX39sdPDRBALFWxgqba6J9aZK8nGBDf517bQ1zN5htfXacZzML
         a6og==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5302QdCaRJd+NSkiebsYMvC9gWLCpQOQIxp0/4BSJrJ9PnXyFV5c
	hrrogXbhSJpP6TVA3hskiTk=
X-Google-Smtp-Source: ABdhPJwE6iGijTwG6zrmcdZjXRcdd8A6Fz5faj1fiPjjhM9A+12aCGUdqKu9kIH+OjJr6cGjiO8AUQ==
X-Received: by 2002:ad4:5b82:: with SMTP id 2mr2333698qvp.87.1640180393849;
        Wed, 22 Dec 2021 05:39:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:40cc:: with SMTP id g12ls1099898qko.4.gmail; Wed,
 22 Dec 2021 05:39:53 -0800 (PST)
X-Received: by 2002:a05:620a:2886:: with SMTP id j6mr1944133qkp.316.1640180393092;
        Wed, 22 Dec 2021 05:39:53 -0800 (PST)
Date: Wed, 22 Dec 2021 05:39:52 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
Subject: FATAL: Unhandled VM-Exit, reason 2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6930_964888813.1640180392384"
X-Original-Sender: huangjiajun145041@gmail.com
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

------=_Part_6930_964888813.1640180392384
Content-Type: multipart/alternative; 
	boundary="----=_Part_6931_1952621926.1640180392384"

------=_Part_6931_1952621926.1640180392384
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jailhouse community=EF=BC=8C
This bug occurred when I tried to start nuttx on a none-root cell on the=20
server. I added two ivshmem devices for nuttx. Below is my configuration=20
file. I am not sure if there is a problem with the mmio area in the=20
configuration file. What is the communication area? In addition, if=20
jailhouse runs in QEMU, can two virtual machines communicate with each=20
other through ivshmem-net?

Below is my root-cell , nuttx configuration and log output from the port.

Best regards,

Jiajun Huang

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/db157b8a-dadc-440b-9385-1278ef5d7097n%40googlegroups.com.

------=_Part_6931_1952621926.1640180392384
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jailhouse community=EF=BC=8C<br><div>This bug occurred when I tried to=
 start nuttx on a none-root cell on the server. I added two ivshmem devices=
 for nuttx. Below is my configuration file. I am not sure if there is a pro=
blem with the mmio area in the configuration file. What is the communicatio=
n area? In addition, if jailhouse runs in QEMU, can two virtual machines co=
mmunicate with each other through ivshmem-net?<br></div><div><br></div><div=
>Below is my root-cell , nuttx configuration and log output from the port.<=
br></div><div><br></div><div><div><div>Best regards,</div><div><br></div><d=
iv>Jiajun Huang</div></div><div><div><div><br></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/db157b8a-dadc-440b-9385-1278ef5d7097n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/db157b8a-dadc-440b-9385-1278ef5d7097n%40googlegroups.co=
m</a>.<br />

------=_Part_6931_1952621926.1640180392384--

------=_Part_6930_964888813.1640180392384
Content-Type: text/x-csrc; charset=US-ASCII; name=sysconfig-2.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=sysconfig-2.c
X-Attachment-Id: 56264e31-fb55-477e-89d9-1d9270731f64
Content-ID: <56264e31-fb55-477e-89d9-1d9270731f64>

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
 * Configuration for langchao NP5020M3
 * created with '/usr/local/libexec/jailhouse/jailhouse config create -c ttyS0 --mem-hv 128M --mem-inmates 1536M configs/x86/sysconfig.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x68000000$0x572000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[49];
	struct jailhouse_irqchip irqchips[3];
	struct jailhouse_pio pio_regions[16];
	struct jailhouse_pci_device pci_devices[99];
	struct jailhouse_pci_capability pci_caps[55];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x572000000,
			.size = 0x8000000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0x80000000,
			.pci_mmconfig_end_bus = 0xff,
			.iommu_units = {
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xfbffe000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xdfffc000,
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
		0x00000000000000ff,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0009ffff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000f0000-000fffff : System ROM */
		{
			.phys_start = 0xf0000,
			.virt_start = 0xf0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 00100000-538a8017 : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x537a9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538a8018-538b0057 : System RAM */
		{
			.phys_start = 0x538a9000,
			.virt_start = 0x538a9000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538b0058-538b1017 : System RAM */
		{
			.phys_start = 0x537b3000,
			.virt_start = 0x537b3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538b1018-538c0857 : System RAM */
		{
			.phys_start = 0x537b4000,
			.virt_start = 0x537b4000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538c0858-538c1017 : System RAM */
		{
			.phys_start = 0x537c4000,
			.virt_start = 0x537c4000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538c1018-538d0857 : System RAM */
		{
			.phys_start = 0x537c5000,
			.virt_start = 0x537c5000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538d0858-7df97fff : System RAM */
		{
			.phys_start = 0x537d5000,
			.virt_start = 0x537d5000,
			.size = 0x2a7c3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7dfa7020-7dfd6fff : ACPI Tables */
		{
			.phys_start = 0x7dfa7000,
			.virt_start = 0x7dfa7000,
			.size = 0x30000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7dfd7000-7e0ecfff : ACPI Tables */
		{
			.phys_start = 0x7dfd7000,
			.virt_start = 0x7dfd7000,
			.size = 0x116000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7e0ed000-7e2f2fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x7e0ed000,
			.virt_start = 0x7e0ed000,
			.size = 0x206000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7f337000-7f337fff : System RAM */
		{
			.phys_start = 0x7f337000,
			.virt_start = 0x7f337000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7f338000-7f3bdfff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x7f338000,
			.virt_start = 0x7f338000,
			.size = 0x86000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7f3be000-7f7fffff : System RAM */
		{
			.phys_start = 0x7f3be000,
			.virt_start = 0x7f3be000,
			.size = 0x442000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7f800000-7fffffff : RAM buffer */
		{
			.phys_start = 0x7f800000,
			.virt_start = 0x7f800000,
			.size = 0x800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: d8000000-dbffffff : 0000:09:00.0 */
		{
			.phys_start = 0xd8000000,
			.virt_start = 0xd8000000,
			.size = 0x4000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc000000-dc01ffff : 0000:09:00.0 */
		{
			.phys_start = 0xdc000000,
			.virt_start = 0xdc000000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc100000-dc11ffff : e1000e */
		{
			.phys_start = 0xdc100000,
			.virt_start = 0xdc100000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc121000-dc123fff : e1000e */
		{
			.phys_start = 0xdc121000,
			.virt_start = 0xdc121000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc200000-dc21ffff : e1000e */
		{
			.phys_start = 0xdc200000,
			.virt_start = 0xdc200000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc221000-dc223fff : e1000e */
		{
			.phys_start = 0xdc221000,
			.virt_start = 0xdc221000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc300000-dc3000ff : 0000:00:1f.3 */
		{
			.phys_start = 0xdc300000,
			.virt_start = 0xdc300000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc301000-dc3017ff : ahci */
		{
			.phys_start = 0xdc301000,
			.virt_start = 0xdc301000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc302000-dc3023ff : ehci_hcd */
		{
			.phys_start = 0xdc302000,
			.virt_start = 0xdc302000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc303000-dc3033ff : ehci_hcd */
		{
			.phys_start = 0xdc303000,
			.virt_start = 0xdc303000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc307000-dc307fff : 0000:00:05.4 */
		{
			.phys_start = 0xdc307000,
			.virt_start = 0xdc307000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbf00000-fbf00fff : 0000:80:05.4 */
		{
			.phys_start = 0xfbf00000,
			.virt_start = 0xfbf00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fc000000-fcffffff : pnp 00:00 */
		{
			.phys_start = 0xfc000000,
			.virt_start = 0xfc000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd000000-fdffffff : pnp 00:00 */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe000000-feafffff : pnp 00:00 */
		{
			.phys_start = 0xfe000000,
			.virt_start = 0xfe000000,
			.size = 0xb00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb00000-febfffff : pnp 00:00 */
		{
			.phys_start = 0xfeb00000,
			.virt_start = 0xfeb00000,
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
		/* MemRegion: fed08000-fed08fff : pnp 00:07 */
		{
			.phys_start = 0xfed08000,
			.virt_start = 0xfed08000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed45000-fedfffff : pnp 00:00 */
		{
			.phys_start = 0xfed45000,
			.virt_start = 0xfed45000,
			.size = 0xbb000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-537dfffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x437e00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 537e00000-539ffffff : Kernel */
		{
			.phys_start = 0x537e00000,
			.virt_start = 0x537e00000,
			.size = 0x2200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 53a000000-571ffffff : System RAM */
		{
			.phys_start = 0x53a000000,
			.virt_start = 0x53a000000,
			.size = 0x38000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 5da000000-107fffffff : System RAM */
		{
			.phys_start = 0x5da000000,
			.virt_start = 0x5da000000,
			.size = 0xaa6000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000c0000-000dffff : ROMs */
		{
			.phys_start = 0xc0000,
			.virt_start = 0xc0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7dfad000-7dfb9fff : ACPI DMAR RMRR */
		/* PCI device: 00:1d.0 */
		/* PCI device: 00:1a.0 */
		{
			.phys_start = 0x7dfad000,
			.virt_start = 0x7dfad000,
			.size = 0xd000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 57a000000-5d9ffffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x57a000000,
			.virt_start = 0x57a000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x57a001000,
			.virt_start = 0x57a001000,
			.size =       0x40000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x5ba001000,
			.virt_start = 0x5ba001000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x5ba005000,
			.virt_start = 0x5ba005000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		JAILHOUSE_SHMEM_NET_REGIONS(0x5ba205000, 0),
	},

	.irqchips = {
		/* IOAPIC 0, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x100ff,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 2, GSI base 24 */
		{
			.address = 0xfec01000,
			.id = 0x1002c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 3, GSI base 48 */
		{
			.address = 0xfec40000,
			.id = 0x802c,
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
		/* Port I/O: 0061-0061 : PNP0800:00 */
		PIO_RANGE(0x61, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0071 : rtc0 */
		PIO_RANGE(0x70, 0x2),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00b2-00b2 : APEI ERST */
		/* PIO_RANGE(0xb2, 0x1), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00ff : fpu */
		/* PIO_RANGE(0xf0, 0x10), */
		/* Port I/O: 02f8-02ff : serial */
		PIO_RANGE(0x2f8, 0x8),
		/* Port I/O: 03b0-03df : PCI Bus 0000:00 */
		/* PIO_RANGE(0x3b0, 0x30), */
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 0400-0403 : ACPI PM1a_EVT_BLK */
		/* PIO_RANGE(0x400, 0x4), */
		/* Port I/O: 0404-0405 : ACPI PM1a_CNT_BLK */
		/* PIO_RANGE(0x404, 0x2), */
		/* Port I/O: 0408-040b : ACPI PM_TMR */
		/* PIO_RANGE(0x408, 0x4), */
		/* Port I/O: 0420-042f : ACPI GPE0_BLK */
		/* PIO_RANGE(0x420, 0x10), */
		/* Port I/O: 0430-0433 : iTCO_wdt.1.auto */
		/* PIO_RANGE(0x430, 0x4), */
		/* Port I/O: 0450-0450 : ACPI PM2_CNT_BLK */
		/* PIO_RANGE(0x450, 0x1), */
		/* Port I/O: 0454-0457 : pnp 00:08 */
		/* PIO_RANGE(0x454, 0x4), */
		/* Port I/O: 0460-047f : iTCO_wdt.1.auto */
		/* PIO_RANGE(0x460, 0x20), */
		/* Port I/O: 04d0-04d1 : pnp 00:06 */
		/* PIO_RANGE(0x4d0, 0x2), */
		/* Port I/O: 0500-057f : pnp 00:07 */
		/* PIO_RANGE(0x500, 0x80), */
		/* Port I/O: 0a00-0a1f : pnp 00:02 */
		/* PIO_RANGE(0xa00, 0x20), */
		/* Port I/O: 6000-607f : 0000:09:00.0 */
		PIO_RANGE(0x6000, 0x80),
		/* Port I/O: 7000-701f : 0000:07:00.0 */
		PIO_RANGE(0x7000, 0x20),
		/* Port I/O: 8000-801f : 0000:06:00.0 */
		PIO_RANGE(0x8000, 0x20),
		/* Port I/O: 9000-901f : 0000:00:1f.3 */
		PIO_RANGE(0x9000, 0x20),
		/* Port I/O: 9020-903f : 0000:00:1f.2 */
		PIO_RANGE(0x9020, 0x20),
		/* Port I/O: 9040-9043 : 0000:00:1f.2 */
		PIO_RANGE(0x9040, 0x4),
		/* Port I/O: 9050-9057 : 0000:00:1f.2 */
		PIO_RANGE(0x9050, 0x8),
		/* Port I/O: 9060-9063 : 0000:00:1f.2 */
		PIO_RANGE(0x9060, 0x4),
		/* Port I/O: 9070-9077 : 0000:00:1f.2 */
		PIO_RANGE(0x9070, 0x8),
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
			.num_caps = 6,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		{ 
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x17 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 41,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = 0x0002,
		},
		{ 
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x18 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 45,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x9,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x18,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x28,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:11.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x88,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 21,
			.num_caps = 6,
			.num_msi_vectors = 1,
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
				0xfffffc00, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 27,
			.num_caps = 3,
			.num_msi_vectors = 0,
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
		/* PCIDevice: 00:1c.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe1,
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
		/* PCIDevice: 00:1c.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe3,
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
		/* PCIDevice: 00:1d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe8,
			.bar_mask = {
				0xfffffc00, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 27,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xf0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 35,
			.num_caps = 1,
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
			.caps_start = 36,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfa,
			.bar_mask = {
				0xfffffff8, 0xfffffffc, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfffff800,
			},
			.caps_start = 37,
			.num_caps = 4,
			.num_msi_vectors = 1,
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
		/* PCIDevice: 06:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x600,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 41,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xdc220000,
		},
		/* PCIDevice: 07:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x700,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 41,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xdc120000,
		},
		/* PCIDevice: 08:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x800,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 47,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 09:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x900,
			.bar_mask = {
				0xfc000000, 0xfffe0000, 0xffffff80,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 52,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f40,
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
		/* PCIDevice: 7f:09.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f48,
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
		/* PCIDevice: 7f:0a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f50,
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
		/* PCIDevice: 7f:0a.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f51,
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
		/* PCIDevice: 7f:0a.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f52,
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
		/* PCIDevice: 7f:0a.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f53,
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
		/* PCIDevice: 7f:0b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f58,
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
		/* PCIDevice: 7f:0b.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f5b,
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
		/* PCIDevice: 7f:0c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f60,
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
		/* PCIDevice: 7f:0c.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f61,
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
		/* PCIDevice: 7f:0d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f68,
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
		/* PCIDevice: 7f:0d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f69,
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
		/* PCIDevice: 7f:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f70,
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
		/* PCIDevice: 7f:0e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f71,
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
		/* PCIDevice: 7f:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f78,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f79,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f7a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f7b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f7c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f7d,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f80,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f81,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f82,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f83,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f84,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f85,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f86,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f87,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:13.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f98,
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
		/* PCIDevice: 7f:13.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f99,
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
		/* PCIDevice: 7f:13.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f9c,
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
		/* PCIDevice: 7f:13.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f9d,
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
		/* PCIDevice: 7f:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7fb0,
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
		/* PCIDevice: 7f:16.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7fb1,
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
		/* PCIDevice: 7f:16.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7fb2,
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
		/* PCIDevice: 80:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x8018,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:03.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x801a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x8028,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x802a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x802c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff40,
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
		/* PCIDevice: ff:09.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff48,
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
		/* PCIDevice: ff:0a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff50,
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
		/* PCIDevice: ff:0a.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff51,
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
		/* PCIDevice: ff:0a.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff52,
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
		/* PCIDevice: ff:0a.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff53,
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
		/* PCIDevice: ff:0b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff58,
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
		/* PCIDevice: ff:0b.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff5b,
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
		/* PCIDevice: ff:0c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff60,
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
		/* PCIDevice: ff:0c.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff61,
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
		/* PCIDevice: ff:0d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff68,
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
		/* PCIDevice: ff:0d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff69,
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
		/* PCIDevice: ff:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff70,
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
		/* PCIDevice: ff:0e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff71,
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
		/* PCIDevice: ff:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff78,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff79,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff7a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff7b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff7c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff7d,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff80,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff81,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff82,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff83,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff84,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff85,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff86,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff87,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:13.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff98,
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
		/* PCIDevice: ff:13.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff99,
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
		/* PCIDevice: ff:13.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff9c,
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
		/* PCIDevice: ff:13.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff9d,
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
		/* PCIDevice: ff:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xffb0,
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
		/* PCIDevice: ff:16.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xffb1,
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
		/* PCIDevice: ff:16.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xffb2,
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
	},

	.pci_caps = {
		/* PCIDevice: 00:00.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x90,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x144,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 0xe,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 0x1c,
			.flags = 0,
		},
		/* PCIDevice: 00:01.0 */
		/* PCIDevice: 00:01.1 */
		/* PCIDevice: 00:03.0 */
		/* PCIDevice: 00:03.2 */
		/* PCIDevice: 80:03.0 */
		/* PCIDevice: 80:03.2 */
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x40,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0x14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x90,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x110,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x148,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 0xe,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x250,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 0x1c,
			.flags = 0,
		},
		/* PCIDevice: 00:05.0 */
		/* PCIDevice: 00:05.2 */
		/* PCIDevice: 80:05.0 */
		/* PCIDevice: 80:05.2 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:05.4 */
		/* PCIDevice: 80:05.4 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x44,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:11.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x88,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x90,
			.len = 0xa,
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
			.start = 0x138,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 00:1a.0 */
		/* PCIDevice: 00:1d.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_DBG,
			.start = 0x58,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_AF,
			.start = 0x98,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.0 */
		/* PCIDevice: 00:1c.1 */
		/* PCIDevice: 00:1c.3 */
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
		/* PCIDevice: 00:1e.0 */
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x50,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0xe0,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.2 */
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
		{
			.id = PCI_CAP_ID_AF,
			.start = 0xb0,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 06:00.0 */
		/* PCIDevice: 07:00.0 */
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
			.start = 0xe0,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xa0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
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
		/* PCIDevice: 08:00.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xa4,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 09:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 7f:0f.0 */
		/* PCIDevice: 7f:0f.1 */
		/* PCIDevice: 7f:0f.2 */
		/* PCIDevice: 7f:0f.3 */
		/* PCIDevice: 7f:0f.4 */
		/* PCIDevice: 7f:0f.5 */
		/* PCIDevice: 7f:10.0 */
		/* PCIDevice: 7f:10.1 */
		/* PCIDevice: 7f:10.2 */
		/* PCIDevice: 7f:10.3 */
		/* PCIDevice: 7f:10.4 */
		/* PCIDevice: 7f:10.5 */
		/* PCIDevice: 7f:10.6 */
		/* PCIDevice: 7f:10.7 */
		/* PCIDevice: ff:0f.0 */
		/* PCIDevice: ff:0f.1 */
		/* PCIDevice: ff:0f.2 */
		/* PCIDevice: ff:0f.3 */
		/* PCIDevice: ff:0f.4 */
		/* PCIDevice: ff:0f.5 */
		/* PCIDevice: ff:10.0 */
		/* PCIDevice: ff:10.1 */
		/* PCIDevice: ff:10.2 */
		/* PCIDevice: ff:10.3 */
		/* PCIDevice: ff:10.4 */
		/* PCIDevice: ff:10.5 */
		/* PCIDevice: ff:10.6 */
		/* PCIDevice: ff:10.7 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
	},
};

------=_Part_6930_964888813.1640180392384
Content-Type: text/rtf; charset=US-ASCII; name=log1.rtf
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log1.rtf
X-Attachment-Id: d9d0317a-3eb2-4e06-989d-42e0ba392ce2
Content-ID: <d9d0317a-3eb2-4e06-989d-42e0ba392ce2>

{\rtf1\ansi\ansicpg936\cocoartf2636
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;\f1\fmodern\fcharset0 CourierNewPSMT;}
{\colortbl;\red255\green255\blue255;\red20\green20\blue20;}
{\*\expandedcolortbl;;\csgenericrgb\c7843\c7843\c7843;}
\paperw11900\paperh16840\vieww12000\viewh15320\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs20 \cf0 Initializing Jailhouse hypervisor v0.12 (294-g6af5edf-dirty) on CPU 7\cf2 \
\cf0 Code location: 0xfffffffff0000050\cf2 \
\cf0 Using x2APIC\cf2 \
\cf0 Page pool usage after early setup: mem 134/32207, remap 0/131072\cf2 \
\cf0 Initializing processors:\cf2 \
\cf0  CPU 7... (APIC ID 38) OK\cf2 \
\cf0  CPU 4... (APIC ID 32) OK\cf2 \
\cf0  CPU 5... (APIC ID 34) OK\cf2 \
\cf0  CPU 6... (APIC ID 36) OK\cf2 \
\cf0  CPU 1... (APIC ID 2) OK\cf2 \
\cf0  CPU 0... (APIC ID 0) OK\cf2 \
\cf0  CPU 2... (APIC ID 4) OK\cf2 \
\cf0  CPU 3... (APIC ID 6) OK\cf2 \
\cf0 Initializing unit: VT-d\cf2 \
\cf0 DMAR unit @0xfbffe000/0x1000\cf2 \
\cf0 DMAR unit @0xdfffc000/0x1000\cf2 \
\cf0 Reserving 24 interrupt(s) for device 00:1f.7 at index 0\cf2 \
\cf0 Reserving 24 interrupt(s) for device 00:05.4 at index 24\cf2 \
\cf0 Reserving 24 interrupt(s) for device 80:05.4 at index 48\cf2 \
\cf0 Initializing unit: IOAPIC\cf2 \
\cf0 Initializing unit: Cache Allocation Technology\cf2 \
\cf0 Initializing unit: PCI\cf2 \
\cf0 Adding PCI device 00:00.0 to cell "RootCell"\cf2 \
\cf0 Adding virtual PCI device 00:17.0 to cell "RootCell"\cf2 \
\cf0 Adding virtual PCI device 00:18.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 00:01.0 to cell "RootCell"\cf2 \
\cf0 Reserving 2 interrupt(s) for device 00:01.0 at index 72\cf2 \
\cf0 Adding PCI device 00:01.1 to cell "RootCell"\cf2 \
\cf0 Reserving 2 interrupt(s) for device 00:01.1 at index 74\cf2 \
\cf0 Adding PCI device 00:03.0 to cell "RootCell"\cf2 \
\cf0 Reserving 2 interrupt(s) for device 00:03.0 at index 76\cf2 \
\cf0 Adding PCI device 00:03.2 to cell "RootCell"\cf2 \
\cf0 Reserving 2 interrupt(s) for device 00:03.2 at index 78\cf2 \
\cf0 Adding PCI device 00:05.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 00:05.2 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 00:05.4 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 00:11.0 to cell "RootCell"\cf2 \
\cf0 Reserving 1 interrupt(s) for device 00:11.0 at index 80\cf2 \
\cf0 Adding PCI device 00:1a.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 00:1c.0 to cell "RootCell"\cf2 \
\cf0 Reserving 1 interrupt(s) for device 00:1c.0 at index 81\cf2 \
\cf0 Adding PCI device 00:1c.1 to cell "RootCell"\cf2 \
\cf0 Reserving 1 interrupt(s) for device 00:1c.1 at index 82\cf2 \
\cf0 Adding PCI device 00:1c.3 to cell "RootCell"\cf2 \
\cf0 Reserving 1 interrupt(s) for device 00:1c.3 at index 83\cf2 \
\cf0 Adding PCI device 00:1d.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 00:1e.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 00:1f.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 00:1f.2 to cell "RootCell"\cf2 \
\cf0 Reserving 1 interrupt(s) for device 00:1f.2 at index 84\cf2 \
\cf0 Adding PCI device 00:1f.3 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 06:00.0 to cell "RootCell"\cf2 \
\cf0 Reserving 5 interrupt(s) for device 06:00.0 at index 85\cf2 \
\cf0 Adding PCI device 07:00.0 to cell "RootCell"\cf2 \
\cf0 Reserving 5 interrupt(s) for device 07:00.0 at index 90\cf2 \
\cf0 Adding PCI device 08:00.0 to cell "RootCell"\cf2 \
\cf0 Reserving 1 interrupt(s) for device 08:00.0 at index 95\cf2 \
\cf0 Adding PCI device 09:00.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:08.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:09.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0a.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0a.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0a.2 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0a.3 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0b.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0b.3 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0c.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0c.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0d.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0d.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0e.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0e.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0f.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0f.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0f.2 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0f.3 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0f.4 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:0f.5 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:10.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:10.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:10.2 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:10.3 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:10.4 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:10.5 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:10.6 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:10.7 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:13.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:13.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:13.4 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:13.5 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:16.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:16.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 7f:16.2 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 80:03.0 to cell "RootCell"\cf2 \
\cf0 Reserving 2 interrupt(s) for device 80:03.0 at index 96\cf2 \
\cf0 Adding PCI device 80:03.2 to cell "RootCell"\cf2 \
\cf0 Reserving 2 interrupt(s) for device 80:03.2 at index 98\cf2 \
\cf0 Adding PCI device 80:05.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 80:05.2 to cell "RootCell"\cf2 \
\cf0 Adding PCI device 80:05.4 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:08.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:09.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0a.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0a.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0a.2 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0a.3 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0b.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0b.3 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0c.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0c.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0d.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0d.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0e.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0e.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0f.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0f.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0f.2 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0f.3 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0f.4 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:0f.5 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:10.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:10.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:10.2 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:10.3 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:10.4 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:10.5 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:10.6 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:10.7 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:13.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:13.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:13.4 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:13.5 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:16.0 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:16.1 to cell "RootCell"\cf2 \
\cf0 Adding PCI device ff:16.2 to cell "RootCell"\cf2 \
\cf0 Page pool usage after late setup: mem 469/32207, remap 65549/131072\cf2 \
\cf0 Activating hypervisor\cf2 \
\cf0 Adding virtual PCI device 00:17.0 to cell "nuttx"\cf2 \
\cf0 Shared memory connection established, peer cells:\cf2 \
\cf0  "RootCell"\cf2 \
\cf0 Adding virtual PCI device 00:18.0 to cell "nuttx"\cf2 \
\cf0 Shared memory connection established, peer cells:\cf2 \
\cf0  "RootCell"\cf2 \
\cf0 Created cell "nuttx"\cf2 \
\cf0 Page pool usage after cell creation: mem 1001/32207, remap 65549/131072\cf2 \
\cf0 Cell "nuttx" can be loaded\cf2 \
\cf0 CPU 3 received SIPI, vector 100\cf2 \
\cf0 Started cell "nuttx"\cf2 \
\cf0 FATAL: Unhandled VM-Exit, reason 2\cf2 \
\cf0 qualification 0\cf2 \
\cf0 vectoring info: 0 interrupt info: 0\cf2 \
\cf0 RIP: 0x0000000100939685 RSP: 0x0000000100da4d28 FLAGS: 10006\cf2 \
\cf0 RAX: 0x00000000000326a0 RBX: 0x0000000100da4d40 RCX: 0x000000000000003e\cf2 \
\cf0 RDX: 0x000000000010a003 RSI: 0x000000000010a000 RDI: 0x0000000000104010\cf2 \
\cf0 CS: 8 BASE: 0x0000000000000000 AR-BYTES: 2099 EFER.LMA 1\cf2 \
\cf0 CR0: 0x0000000080010033 CR3: 0x0000000000102000 CR4: 0x00000000000326a0\cf2 \
\cf0 EFER: 0x0000000000000500\cf2 \
\cf0 Parking CPU 3 (Cell: "nuttx")\cf2 \
\pard\pardeftab720\partightenfactor0

\f1\fs14 \cf0 \
}
------=_Part_6930_964888813.1640180392384
Content-Type: text/x-csrc; charset=US-ASCII; name=nuttx-2.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=nuttx-2.c
X-Attachment-Id: da26afd8-9ec3-4460-83c0-91339e6d0310
Content-ID: <da26afd8-9ec3-4460-83c0-91339e6d0310>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * Hand crafted configuration for Nuttx in cRTOS
 *
 * Copyright (c) ChungFan Yang @ Fixstars corporation, 2020
 *    <chungfan.yang@fixstars.com>
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
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[9];
	struct jailhouse_cache cache_regions[1];
	struct jailhouse_irqchip irqchips[3];
	struct jailhouse_pio pio_regions[3];
	struct jailhouse_pci_device pci_devices[2];
	struct jailhouse_pci_capability pci_caps[0];

} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "nuttx",
    .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
    .num_pci_caps = ARRAY_SIZE(config.pci_caps),
		.console = {
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO,
			.address = 0x3f8,
		},
	},

	.cpus = {
		0x8,
	},

	.mem_regions = {
		/* MemRegion: 57a000000-5d9ffffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x57a000000,
			.virt_start = 0x57a000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x57a001000,
			.virt_start = 0,
			.size = 0x40000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x5ba001000,
			.virt_start = 0x5ba001000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x5ba005000,
			.virt_start = 0x5ba005000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ| JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* communication region */ {
			.virt_start = 0x5ba010000,
			.size       = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
		JAILHOUSE_SHMEM_NET_REGIONS(0x5ba205000, 1),
	},

	.cache_regions = {
		{
			.start = 0,
			.size = 2,
			.type = JAILHOUSE_CACHE_L3,
		},
	},

	.irqchips = {
		/* IOAPIC 0, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x100ff,
			.pin_bitmap = {
				0x000001
			},
		},
		/* IOAPIC 2, GSI base 24 */
		{
			.address = 0xfec01000,
			.id = 0x1002c,
			.pin_bitmap = {
				0x000000
			},
		},
		/* IOAPIC 3, GSI base 48 */
		{
			.address = 0xfec40000,
			.id = 0x802c,
			.pin_bitmap = {
				0x000000
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0020-0021 : pic1 */
    PIO_RANGE(0x20, 0x2),
		/* Port I/O: 00a0-00a1 : pic2 */
    PIO_RANGE(0xa0, 0x2),
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
	},
	.pci_devices = {
		{ 
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x17 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 0,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = 0x0002,
		},
		{ 
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x18 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 5,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},

	.pci_caps = {
		
    },
};

------=_Part_6930_964888813.1640180392384--
