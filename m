Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBB7U3SFAMGQEFAVF7DA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC6141F241
	for <lists+jailhouse-dev@lfdr.de>; Fri,  1 Oct 2021 18:40:42 +0200 (CEST)
Received: by mail-qv1-xf3e.google.com with SMTP id ke16-20020a056214301000b003828c7cfd7bsf13747533qvb.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 01 Oct 2021 09:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2joij1swXBv8H4tIGTZB0Kee0YNrVkMdxi8qE5tfPqo=;
        b=fJ99yYFY6l6kGjG+3be9vArOOwWuoug7lNo66G09exWRcWV1DcR6GTDOl9UK1oB16R
         ltrJZwo8k4WZLMnUNB4X1Pu/wraO+NSh7rbYTsVerqZuy0VjpBFs3nEPqDzibab72FbY
         PBOJ55/2CP69F+ccb4gzqL/Rvq0dq2XFSa6VwYxkvaA2O5Y+TQ7QWlmPKX2SSWLQOe08
         zS2tidl/e1TImHDmOY8HIFsipN7aALwuw5p9bjeDKaYhDURgMM2gvhEo3jTSOY8Sj42E
         iFFF7sI+psGgum06/iJnpqDWW+V+CUXqAJiE/LWRL2FTfzB+T6MmGK/ZA64VIAJfm7DE
         EvQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2joij1swXBv8H4tIGTZB0Kee0YNrVkMdxi8qE5tfPqo=;
        b=aJ5CapOqd76PsfUarWT+mW61Ksr7A4SOb3IcpfI/u8iuqjtr3s2RlEqfvlJC0iUUDB
         IY7cIhZm3VXNHK7ECaDQefRcjvhewqd9bOcQNSOk+vhN1YAZX7Hp4Z1KRvFMFoVjrC1M
         8oI7UirtU5y0kstV5DODlBJV7r8k0ni7h+dEZQi1Yji/ypBe2qtpdtCYlvZ8CAbPwLHZ
         FYED2t4FZ6lOD5uF3/PyVomaPpoNCJduv74LdYZzD6Dkz/gtebW2jdkSngL+3BOhNhXP
         Jhj6dTe502Ksq38AJXt8LKgE8g5OI5MVFow7q4iGHUbAj+mhopNaI4KgL19ckC8fHtE2
         0moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2joij1swXBv8H4tIGTZB0Kee0YNrVkMdxi8qE5tfPqo=;
        b=xkMSKmrIV9j5YVmc7en1y/3OR3PywX8bozlhC4UvdOthHznPXWXwR7GCwewwKLLCWj
         eY7+VfVhehLA7jcBAjCLY4yb5Qf5F33+IhG8DBdzKVZywAS4rsx4CE2vCJ8tCC2CPcUC
         PNT4O0t2OW/6EaOpVoTBQgOQ4wJ2QQzwi1a/ha+gGcY3GGk7LEny74K5wfaZRypPqIZe
         4z8tPtr5qFmIqsjZE2FzsCY4/ZDdUDbQdtASJ6mBPOVdEkRqTbdhxkxNbFRvuA6rfxwj
         PlWMQ+04wdxLYY7XL9qZnAnvc8e6fM26oUPd/xOaLEe3vQzRMTsLfEUHp8ixgqja02MW
         s5Mg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530/daCI+kM+iRsYUzY/Zd/3s1J75fkcfQRa7HTKScb+CTpikBJt
	sVZ5ATRg/F4tdA09Z3roMME=
X-Google-Smtp-Source: ABdhPJwj3t78MvhhzCjQvEsRdXIhv16egf3A0rdaP4x6kXwadnmPoZ1+c1A3Rp/9Y/XdOckExr2Lqg==
X-Received: by 2002:a05:6214:4f4:: with SMTP id cl20mr3372025qvb.13.1633106439924;
        Fri, 01 Oct 2021 09:40:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:14a8:: with SMTP id x8ls6414333qkj.8.gmail; Fri, 01
 Oct 2021 09:40:39 -0700 (PDT)
X-Received: by 2002:a05:620a:62d:: with SMTP id 13mr10774043qkv.216.1633106439330;
        Fri, 01 Oct 2021 09:40:39 -0700 (PDT)
Date: Fri, 1 Oct 2021 09:40:38 -0700 (PDT)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <56692931-19ec-4a1a-9df9-f7a44eaa1869n@googlegroups.com>
Subject: Root Cell crash in QEMU
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1208_1787767723.1633106438579"
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

------=_Part_1208_1787767723.1633106438579
Content-Type: multipart/alternative; 
	boundary="----=_Part_1209_1060096179.1633106438579"

------=_Part_1209_1060096179.1633106438579
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jailhouse community=EF=BC=8C

I am currently running into an issue when trying boot jailhouse on QEMU. I=
=20
follow the guidelines on https://github.com/siemens/jailhouse/tree/wip/kvm.=
=20
When I use the sysconfig.c created by "jailhouse config create -c ttyS0=20
--mem-hv 128M --mem-inmates 1536M configs/x86/sysconfig.c" to enable root=
=20
cell, the issue "FATAL: Invalid PIO read, port: 5658 size: 4" and "FATAL:=
=20
Invalid MMIO/RAM read" happened. I solved these issues with the help of=20
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jai=
lhouse-Tutorial.pdf.=20
Attached is the modified sysconfig.c file. However, the root cell will=20
still crash with no log a few minutes later.=20

Initializing Jailhouse hypervisor v0.12 (5-g06ba27d-dirty) on CPU 0
Code location: 0xfffffffff0000050
Using x2APIC
Page pool usage after early setup: mem 108/32207, remap 0/131072
Initializing processors:
 CPU 0... (APIC ID 0) OK
 CPU 1... (APIC ID 1) OK
 CPU 3... (APIC ID 3) OK
 CPU 2... (APIC ID 2) OK
Initializing unit: VT-d
DMAR unit @0xfed90000/0x1000
Reserving 24 interrupt(s) for device ff:00.0 at index 0
Initializing unit: IOAPIC
Initializing unit: Cache Allocation Technology
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:01.0 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Reserving 5 interrupt(s) for device 00:02.0 at index 24
Adding PCI device 00:1b.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1b.0 at index 29
Adding PCI device 00:1f.0 to cell "RootCell"
Adding PCI device 00:1f.2 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1f.2 at index 30
Adding PCI device 00:1f.3 to cell "RootCell"
Page pool usage after late setup: mem 333/32207, remap 65542/131072
Activating hypervisor


I want to know if I need to add all the missing PCI memory regions and PCI=
=20
IO ports to sysconfig.c according to the results of /proc/iomem and=20
/proc/ioports?

Best regards,

Jiajun Huang

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/56692931-19ec-4a1a-9df9-f7a44eaa1869n%40googlegroups.com.

------=_Part_1209_1060096179.1633106438579
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Dear Jailhouse community=EF=BC=8C</div><div><br></div><div>I am curren=
tly running into an issue when trying boot jailhouse on QEMU. I follow the =
guidelines on https://github.com/siemens/jailhouse/tree/wip/kvm. When I use=
 the sysconfig.c created by "jailhouse config create -c ttyS0 --mem-hv 128M=
 --mem-inmates 1536M configs/x86/sysconfig.c" to enable root cell, the issu=
e "FATAL: Invalid PIO read, port: 5658 size: 4" and "FATAL: Invalid MMIO/RA=
M read" happened. I solved these issues with the help of https://events.sta=
tic.linuxfound.org/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pd=
f. Attached is the modified sysconfig.c file. However, the root cell will s=
till crash with no log a few minutes later.&nbsp;</div><div><br></div><div>=
<div>Initializing Jailhouse hypervisor v0.12 (5-g06ba27d-dirty) on CPU 0</d=
iv><div>Code location: 0xfffffffff0000050</div><div>Using x2APIC</div><div>=
Page pool usage after early setup: mem 108/32207, remap 0/131072</div><div>=
Initializing processors:</div><div>&nbsp;CPU 0... (APIC ID 0) OK</div><div>=
&nbsp;CPU 1... (APIC ID 1) OK</div><div>&nbsp;CPU 3... (APIC ID 3) OK</div>=
<div>&nbsp;CPU 2... (APIC ID 2) OK</div><div>Initializing unit: VT-d</div><=
div>DMAR unit @0xfed90000/0x1000</div><div>Reserving 24 interrupt(s) for de=
vice ff:00.0 at index 0</div><div>Initializing unit: IOAPIC</div><div>Initi=
alizing unit: Cache Allocation Technology</div><div>Initializing unit: PCI<=
/div><div>Adding PCI device 00:00.0 to cell "RootCell"</div><div>Adding PCI=
 device 00:01.0 to cell "RootCell"</div><div>Adding PCI device 00:02.0 to c=
ell "RootCell"</div><div>Reserving 5 interrupt(s) for device 00:02.0 at ind=
ex 24</div><div>Adding PCI device 00:1b.0 to cell "RootCell"</div><div>Rese=
rving 1 interrupt(s) for device 00:1b.0 at index 29</div><div>Adding PCI de=
vice 00:1f.0 to cell "RootCell"</div><div>Adding PCI device 00:1f.2 to cell=
 "RootCell"</div><div>Reserving 1 interrupt(s) for device 00:1f.2 at index =
30</div><div>Adding PCI device 00:1f.3 to cell "RootCell"</div><div>Page po=
ol usage after late setup: mem 333/32207, remap 65542/131072</div><div>Acti=
vating hypervisor</div></div><div><br></div><div><br></div><div>I want to k=
now if I need to add all the missing PCI memory regions and PCI IO ports to=
 sysconfig.c according to the results of /proc/iomem and /proc/ioports?</di=
v><div><br></div><div>Best regards,</div><div><br></div><div>Jiajun Huang</=
div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/56692931-19ec-4a1a-9df9-f7a44eaa1869n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/56692931-19ec-4a1a-9df9-f7a44eaa1869n%40googlegroups.co=
m</a>.<br />

------=_Part_1209_1060096179.1633106438579--

------=_Part_1208_1787767723.1633106438579
Content-Type: application/octet-stream; name=iomem
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=iomem
X-Attachment-Id: 87be9467-26ee-438a-8a87-8350d07e1f5a
Content-ID: <87be9467-26ee-438a-8a87-8350d07e1f5a>

00000000-00000fff : Reserved
00001000-0009fbff : System RAM
0009fc00-0009ffff : Reserved
000a0000-000bffff : PCI Bus 0000:00
000c0000-000c99ff : Video ROM
000ca000-000cadff : Adapter ROM
000cb000-000cd3ff : Adapter ROM
000f0000-000fffff : Reserved
  000f0000-000fffff : System ROM
00100000-7ffdefff : System RAM
7ffdf000-7fffffff : Reserved
80000000-afffffff : PCI Bus 0000:00
b0000000-bfffffff : PCI MMCONFIG 0000 [bus 00-ff]
  b0000000-bfffffff : Reserved
    b0000000-bfffffff : pnp 00:06
c0000000-febfffff : PCI Bus 0000:00
  fd000000-fdffffff : 0000:00:01.0
  feb40000-feb7ffff : 0000:00:02.0
  feb80000-feb9ffff : 0000:00:02.0
    feb80000-feb9ffff : e1000e
  feba0000-febbffff : 0000:00:02.0
    feba0000-febbffff : e1000e
  febd0000-febd3fff : 0000:00:02.0
    febd0000-febd3fff : e1000e
  febd4000-febd7fff : 0000:00:1b.0
    febd4000-febd7fff : ICH HD audio
  febd8000-febd8fff : 0000:00:01.0
  febd9000-febd9fff : 0000:00:1f.2
    febd9000-febd9fff : ahci
fec00000-fec003ff : IOAPIC 0
fed00000-fed003ff : HPET 0
  fed00000-fed003ff : PNP0103:00
fed1c000-fed1ffff : Reserved
  fed1f410-fed1f414 : iTCO_wdt.1.auto
fed90000-fed90fff : dmar0
fee00000-fee00fff : Local APIC
feffc000-feffffff : Reserved
fffc0000-ffffffff : Reserved
100000000-27fffffff : System RAM
  186a00000-187800e90 : Kernel code
  187800e91-1882570ff : Kernel data
  188518000-1889fffff : Kernel bss
280000000-a7fffffff : PCI Bus 0000:00

------=_Part_1208_1787767723.1633106438579
Content-Type: application/octet-stream; name=ioports
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ioports
X-Attachment-Id: 90560d35-0819-4317-a744-448541d959b3
Content-ID: <90560d35-0819-4317-a744-448541d959b3>

0000-0cf7 : PCI Bus 0000:00
  0000-001f : dma1
  0020-0021 : pic1
  0040-0043 : timer0
  0050-0053 : timer1
  0060-0060 : keyboard
  0064-0064 : keyboard
  0070-0077 : rtc0
  0080-008f : dma page reg
  00a0-00a1 : pic2
  00c0-00df : dma2
  00f0-00ff : fpu
  02f8-02ff : serial
  0378-037a : parport0
  03c0-03df : vga+
  03f8-03ff : serial
  0510-051b : QEMU0002:00
    0510-051b : fw_cfg_io
  0600-067f : 0000:00:1f.0
    0600-0603 : ACPI PM1a_EVT_BLK
    0604-0605 : ACPI PM1a_CNT_BLK
    0608-060b : ACPI PM_TMR
    0620-062f : ACPI GPE0_BLK
    0630-0633 : iTCO_wdt.1.auto
    0660-067f : iTCO_wdt.1.auto
  0700-073f : 0000:00:1f.3
0cf8-0cff : PCI conf1
0d00-ffff : PCI Bus 0000:00
  c040-c05f : 0000:00:02.0
  c060-c07f : 0000:00:1f.2
    c060-c07f : ahci

------=_Part_1208_1787767723.1633106438579
Content-Type: text/x-csrc; charset=US-ASCII; name=sysconfig.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=sysconfig.c
X-Attachment-Id: fc15fddf-1ed1-450a-83d1-a8a4d3ceb4df
Content-ID: <fc15fddf-1ed1-450a-83d1-a8a4d3ceb4df>

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
 * Configuration for QEMU Standard PC (Q35 + ICH9, 2009)
 * created with '/usr/local/libexec/jailhouse/jailhouse config create -c ttyS0 --mem-hv 128M --mem-inmates 1536M configs/x86/sysconfig.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x68000000$0x16b000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[17];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[26];
	struct jailhouse_pci_device pci_devices[7];
	struct jailhouse_pci_capability pci_caps[9];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x16b000000,
			.size = 0x8000000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xb0000000,
			.pci_mmconfig_end_bus = 0xff,
			.x86 = {
				.pm_timer_address = 0x608,
				.vtd_interrupt_limit = 128,
				.iommu_units = {
					{
						.type = JAILHOUSE_IOMMU_INTEL,
						.base = 0xfed90000,
						.size = 0x1000,
					},
				},
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
		/* MemRegion: 00000000-0009fbff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000a0000-000bffff : PCI Bus 0000:00 adding */
		{
			.phys_start = 0xa0000,
			.virt_start = 0xa0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,	
		},
		/* MemRegion: 00100000-7ffdefff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x7fedf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: fd000000-fdffffff : 0000:00:01.0 */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
		{
			.phys_start = 0xfeb40000,
			.virt_start = 0xfeb40000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb80000-feb9ffff : e1000e */
		{
			.phys_start = 0xfeb80000,
			.virt_start = 0xfeb80000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feba0000-febbffff : e1000e */
		{
			.phys_start = 0xfeba0000,
			.virt_start = 0xfeba0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd1000-febd3fff : e1000e */
		{
			.phys_start = 0xfebd1000,
			.virt_start = 0xfebd1000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd4000-febd7fff : ICH HD audio */
		{
			.phys_start = 0xfebd4000,
			.virt_start = 0xfebd4000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd8000-febd8fff : 0000:00:01.0 */
		{
			.phys_start = 0xfebd8000,
			.virt_start = 0xfebd8000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd9000-febd9fff : ahci */
		{
			.phys_start = 0xfebd9000,
			.virt_start = 0xfebd9000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-168dfffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x68e00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 168e00000-16affffff : Kernel */
		{
			.phys_start = 0x168e00000,
			.virt_start = 0x168e00000,
			.size = 0x2200000,
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
		/* MemRegion: 000c0000-000dffff : ROMs */
		{
			.phys_start = 0xc0000,
			.virt_start = 0xc0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 173000000-1d2ffffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x173000000,
			.virt_start = 0x173000000,
			.size = 0x60000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 0, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0xff00,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0000-001f : dma1 */
		PIO_RANGE(0x0, 0x20), 
		/* Port I/O: 0020-0021 : pic1 */
		PIO_RANGE(0x20, 0x2), 
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0050-0053 : timer1 */
		PIO_RANGE(0x50, 0x4), 
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0077 : rtc0 */
		PIO_RANGE(0x70, 0x8),
		/* Port I/O: 0080-008f : dma page reg */
		PIO_RANGE(0x80, 0x10), 
		/* Port I/O: 00a0-00a1 : pic2 */
		PIO_RANGE(0xa0, 0x2), 
		/* Port I/O: 00c0-00df : dma2 */
		PIO_RANGE(0xc0, 0x20), 
		/* Port I/O: 00f0-00ff : fpu */
		PIO_RANGE(0xf0, 0x10), 
		/* Port I/O: 02f8-02ff : serial */
		PIO_RANGE(0x2f8, 0x8),
		/* Port I/O: 0378-037a : parport0 */
		PIO_RANGE(0x378, 0x3), 
		/* Port I/O: 03c0-03df : vga+ */
		PIO_RANGE(0x3c0, 0x20),
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 0510-051b : fw_cfg_io */
		PIO_RANGE(0x510, 0xc), 
		/* Port I/O: 0600-0603 : ACPI PM1a_EVT_BLK */
		PIO_RANGE(0x600, 0x4), 
		/* Port I/O: 0604-0605 : ACPI PM1a_CNT_BLK */
		PIO_RANGE(0x604, 0x2), 
		/* Port I/O: 0608-060b : ACPI PM_TMR */
		PIO_RANGE(0x608, 0x4), 
		/* Port I/O: 0620-062f : ACPI GPE0_BLK */
		PIO_RANGE(0x620, 0x10), 
		/* Port I/O: 0630-0633 : iTCO_wdt.1.auto */
		PIO_RANGE(0x630, 0x4), 
		/* Port I/O: 0660-067f : iTCO_wdt.1.auto */
		PIO_RANGE(0x660, 0x20), 
		/* Port I/O: 0700-073f : 0000:00:1f.3 */
		PIO_RANGE(0x700, 0x40), 
		/* Port I/O: c040-c05f : 0000:00:02.0 */
		PIO_RANGE(0xc040, 0x20),
		/* Port I/O: c060-c07f : 0000:00:1f.2 */
		PIO_RANGE(0xc060, 0x20),
		PIO_RANGE(0x5658, 0x4),
	},

	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
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
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0xff000000, 0x00000000, 0xfffff000,
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
				0xfffe0000, 0xfffe0000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xfebd0000,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd8,
			.bar_mask = {
				0xffffc000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 1,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
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
		/* PCIDevice: 00:1f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xfa,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffe0, 0xfffff000,
			},
			.caps_start = 7,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xfb,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffc0, 0x00000000,
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
		/* PCIDevice: 00:02.0 */
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
		/* PCIDevice: 00:1b.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 0x2,
			.flags = 0,
		},
	},
};

------=_Part_1208_1787767723.1633106438579--
