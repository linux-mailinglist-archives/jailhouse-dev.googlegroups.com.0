Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRB2H3UGDAMGQEFBXT67I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4DD3A7B9A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 12:16:09 +0200 (CEST)
Received: by mail-qk1-x73d.google.com with SMTP id y5-20020a37af050000b02903a9c3f8b89fsf27658417qke.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yQL/Hk8FfZpvM+8awSYj6QhOCC7hnL1y7P8nBTHX9UE=;
        b=m9zVFOStJQWKCgsBcokJIxVgx8BXfjb6gDuc9Y/dw4wzJex8HPwjdwyukZbZYtwAFX
         uFsz5oUPsit2ie12vY8Js/RHmQUWYrBojUZoBtF1Yx2pgFwjYCuJQ6FHBvRg24DU5Zwb
         rcAq+/SGfxRypv5JmfNEfST1ZEEoaQ/oRWqM+o5RUWnIxXNNvOcgQMrN5CLefTdlqgde
         XaVDm/WQWcqeFqQnoelui4vJ3Bjip7hzgsbkLw401FEAE/XD3hr+6hqXnZqmE8K/4EQM
         wrvpP0WVwP1JJU+RtVyuesar7/VRAC29pUoKiMJbYVhI1IdflmG2h18zi6V2IK7VIy2Q
         xmSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yQL/Hk8FfZpvM+8awSYj6QhOCC7hnL1y7P8nBTHX9UE=;
        b=bCLxWWqYtlc5LVY+/SPIlbAocZBgPLWWowM9Cmy5SJ5rXDR6oIz6JzmcypSFU+a+h4
         cNsG1DgVod2W23/nrS+h7PWZqKwS7qg5YrBgDe0CGMytyy17FDB76FJ6pOqjgJ9UjMJM
         jtMiWYmd08ojdhykWI153Ss2ucGVYtSQCQjtJ+YhIaOcasRwMme9r++h6BeNiUIGdmkS
         lZRu950yV8DelcXy8QwnpdC80KuXWU5l4lbTUazboGaxE7gfcr3U8rxjhX0Fd+gsDC28
         8Xbr9C65iUoeAzHnE9zzKfrup8UoL4ue2gAsr/FYf0Fum429/UsEcz9HwOatBSoegy0x
         ifhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yQL/Hk8FfZpvM+8awSYj6QhOCC7hnL1y7P8nBTHX9UE=;
        b=OuZnv74raLXJpPvNX6/X+q00nAgR27WRKEsoIRtD82qwpD9KYgIA8+BIFFo/LZGleF
         DMZ9RZ2NNvcwT7gn+vInmGfxY4IbylHw6iDt/QNtwjb+jg+DBn65SZ++9XIfMPGdqptI
         CAOczhF+m88XezfoLPnNcoHLd2zxL6ffsO3IxW+DO0/xDNOetrwD/ztI4Ib13JGB2onJ
         KKfgpxyzrNN6FlNBIEyg5PMVg7bWZgCrmYyDgy0UHkx6nwW/PHKpHUa+0NX/EDh1SB6c
         sMo+VDEdOyMQ64ebhLli1p9GqYY56fOGzsh9Pv4z5uG2p6fX1QJi5lJjalYq63zXyhfF
         H+WA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531oZDjNifjCqmO6BtPG5/iRnRkwGmdnrfbGv8XqraYk+EtoHca+
	WMDstqKU1y7Za0QnCoYyePU=
X-Google-Smtp-Source: ABdhPJy/V+16vM8LIleCde+Yt2wmd3fHg9Bu8DmF9qv2DvhcdVJ+syPxTDnoTiIBMBgoSegbFvdEZQ==
X-Received: by 2002:a05:620a:13f0:: with SMTP id h16mr21395309qkl.32.1623752168590;
        Tue, 15 Jun 2021 03:16:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5ace:: with SMTP id d14ls8739349qtd.7.gmail; Tue, 15 Jun
 2021 03:16:08 -0700 (PDT)
X-Received: by 2002:a05:622a:2d2:: with SMTP id a18mr20662447qtx.296.1623752167959;
        Tue, 15 Jun 2021 03:16:07 -0700 (PDT)
Date: Tue, 15 Jun 2021 03:16:07 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a7250b92-432f-43f9-9bd1-e18cc1d73b23n@googlegroups.com>
Subject: My configuration to partition  pci network card into inmate on
 NUC6CAY for x86_64
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_523_998623175.1623752167216"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_523_998623175.1623752167216
Content-Type: multipart/alternative; 
	boundary="----=_Part_524_383883740.1623752167216"

------=_Part_524_383883740.1623752167216
Content-Type: text/plain; charset="UTF-8"

I have tried jailhouse for some time.
I  run  jailhouse on NUC6CAY and  partition  the pci network card  into 
inmate.

I do some modification on  configuration. 
I wish these  files may help some one!

The network card is  PCIDevice: 02:00.0 
pci.c  is configuration for  root cell
pci-linux.c is configuration for none-root cell.




-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a7250b92-432f-43f9-9bd1-e18cc1d73b23n%40googlegroups.com.

------=_Part_524_383883740.1623752167216
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have tried jailhouse for some time.<div>I&nbsp; run&nbsp; jailhouse on NU=
C6CAY and&nbsp; partition&nbsp; the pci network card&nbsp; into inmate.</di=
v><div><br></div><div>I do some modification on&nbsp; configuration.&nbsp;<=
/div><div>I wish these&nbsp; files may help some one!<br><div><br></div><di=
v>The network card is&nbsp; PCIDevice: 02:00.0&nbsp;</div><div>pci.c&nbsp; =
is configuration for&nbsp; root cell</div><div>pci-linux.c&nbsp;is configur=
ation for none-root cell.</div><div><br></div><div><br></div><div><br></div=
><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a7250b92-432f-43f9-9bd1-e18cc1d73b23n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a7250b92-432f-43f9-9bd1-e18cc1d73b23n%40googlegroups.co=
m</a>.<br />

------=_Part_524_383883740.1623752167216--

------=_Part_523_998623175.1623752167216
Content-Type: text/plain; charset=US-ASCII; name=pci.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=pci.c
X-Attachment-Id: 2dbaa4c9-373a-4838-bbcd-657fa270a74d
Content-ID: <2dbaa4c9-373a-4838-bbcd-657fa270a74d>

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[67];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[30];
	struct jailhouse_pci_device pci_devices[22];
	struct jailhouse_pci_capability pci_caps[53];
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
			.address = 0x80000000,
			.size = 0x7f0000,
			.type = JAILHOUSE_CON_TYPE_EFIFB,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				JAILHOUSE_CON_FB_1920x1080,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xe0000000,
			.pci_mmconfig_end_bus = 0xff,
			.x86 = {
				.pm_timer_address = 0x408,
				.vtd_interrupt_limit = 256,
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
			},
		},
		.root_cell = {
			.name = "root",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x0f,
	},

	.mem_regions = {
		/* lay IVSHMEM shared memory regions (demo) */
		{
			.phys_start = 0x3f0f0000,
			.virt_start = 0x3f0f0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0x3f0f1000,
			.virt_start = 0x3f0f1000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{
			.phys_start = 0x3f0fa000,
			.virt_start = 0x3f0fa000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{
			.phys_start = 0x3f0fc000,
			.virt_start = 0x3f0fc000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0x3f0fe000,
			.virt_start = 0x3f0fe000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ,
		},
		
		/* lay IVSHMEM shared memory regions (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
		
		/* MemRegion: 00000000-0003efff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x3f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00040000-0009efff : System RAM */
		{
			.phys_start = 0x40000,
			.virt_start = 0x40000,
			.size = 0x5f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-01ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x1f00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 02000000-03ffffff : Kernel */
		{
			.phys_start = 0x2000000,
			.virt_start = 0x2000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 04000000-0fffffff : System RAM */
		{
			.phys_start = 0x4000000,
			.virt_start = 0x4000000,
			.size = 0xc000000,
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
		/* MemRegion: 3f200000-7736ffff : System RAM */
		{
			.phys_start = 0x3f200000,
			.virt_start = 0x3f200000,
			.size = 0x38170000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 79492000-794acfff : ACPI Tables */
		{
			.phys_start = 0x79492000,
			.virt_start = 0x79492000,
			.size = 0x1b000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 794ad000-798b0fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x794ad000,
			.virt_start = 0x794ad000,
			.size = 0x404000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 79bdb000-79c3ffff : Unknown E820 type */
		{
			.phys_start = 0x79bdb000,
			.virt_start = 0x79bdb000,
			.size = 0x65000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 79c40000-79fc2fff : System RAM */
		{
			.phys_start = 0x79c40000,
			.virt_start = 0x79c40000,
			.size = 0x383000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 79fc3000-79fc3fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x79fc3000,
			.virt_start = 0x79fc3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 79fee000-7a9defff : System RAM */
		{
			.phys_start = 0x79fee000,
			.virt_start = 0x79fee000,
			.size = 0x9f1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7a9e1000-7affffff : System RAM */
		{
			.phys_start = 0x7a9e1000,
			.virt_start = 0x7a9e1000,
			.size = 0x61f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 80000000-807effff : efifb */
		{
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x7f0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 90000000-90ffffff : 0000:00:02.0 */
		{
			.phys_start = 0x90000000,
			.virt_start = 0x90000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91000000-910fffff : ICH HD audio */
		{
			.phys_start = 0x91000000,
			.virt_start = 0x91000000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91100000-91101fff : iwlwifi */
		{
			.phys_start = 0x91100000,
			.virt_start = 0x91100000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* lay MemRegion: 91104000-91104fff : r8169 */
		{
			.phys_start = 0x91104000,
			.virt_start = 0x91104000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91200000-91200fff : 0000:01:00.0 */
		{
			.phys_start = 0x91200000,
			.virt_start = 0x91200000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* lay MemRegion:91200000-91201fff : iwwifi */
		
		{
			.phys_start = 0x91200000,
			.virt_start = 0x91200000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},

		/* pubb MemRegion: 91300000-91308000 : xhci-hcd */
		{
			.phys_start = 0x91300000,
			.virt_start = 0x91300000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91308070-9130846f : intel_xhci_usb_sw */
		{
			.phys_start = 0x91308070,
			.virt_start = 0x91308070,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91310000-91313fff : ICH HD audio */
		{
			.phys_start = 0x91310000,
			.virt_start = 0x91310000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91314000-91315fff : ahci */
		{
			.phys_start = 0x91314000,
			.virt_start = 0x91314000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91316000-913160ff : 0000:00:1f.1 */
		{
			.phys_start = 0x91316000,
			.virt_start = 0x91316000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91317000-91317fff : 0000:00:1a.0 */
		{
			.phys_start = 0x91317000,
			.virt_start = 0x91317000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91318000-91318fff : 0000:00:1a.0 */
		{
			.phys_start = 0x91318000,
			.virt_start = 0x91318000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91319000-91319fff : 0000:00:19.2 */
		{
			.phys_start = 0x91319000,
			.virt_start = 0x91319000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* lay MemRegion: 91400000-9140ffff : xhci-hcd */
		{
			.phys_start = 0x91400000,
			.virt_start = 0x91400000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131a000-9131afff : 0000:00:19.2 */
		{
			.phys_start = 0x9131a000,
			.virt_start = 0x9131a000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131b000-9131bfff : 0000:00:19.1 */
		{
			.phys_start = 0x9131b000,
			.virt_start = 0x9131b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131c000-9131cfff : 0000:00:19.1 */
		{
			.phys_start = 0x9131c000,
			.virt_start = 0x9131c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131d000-9131dfff : 0000:00:19.0 */
		{
			.phys_start = 0x9131d000,
			.virt_start = 0x9131d000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131e000-9131efff : 0000:00:19.0 */
		{
			.phys_start = 0x9131e000,
			.virt_start = 0x9131e000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131f000-9131ffff : 0000:00:18.0 */
		{
			.phys_start = 0x9131f000,
			.virt_start = 0x9131f000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91320000-91320fff : 0000:00:18.0 */
		{
			.phys_start = 0x91320000,
			.virt_start = 0x91320000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91321000-91321fff : 0000:00:16.0 */
		{
			.phys_start = 0x91321000,
			.virt_start = 0x91321000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91322000-91322fff : 0000:00:16.0 */
		{
			.phys_start = 0x91322000,
			.virt_start = 0x91322000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91323000-913237ff : ahci */
		{
			.phys_start = 0x91323000,
			.virt_start = 0x91323000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91324000-913240ff : ahci */
		{
			.phys_start = 0x91324000,
			.virt_start = 0x91324000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91327000-91327fff : 0000:00:0f.0 */
		{
			.phys_start = 0x91327000,
			.virt_start = 0x91327000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* lay MemRegion: 91410000-91413fff : ahci */
		{
			.phys_start = 0x91410000,
			.virt_start = 0x91410000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* lay MemRegion: 91423000-914237ff : ahci */
		{
			.phys_start = 0x91423000,
			.virt_start = 0x91423000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fea00000-feafffff : pnp 00:03 */
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
		/* MemRegion: fed03000-fed03fff : pnp 00:03 */
		{
			.phys_start = 0xfed03000,
			.virt_start = 0xfed03000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed06000-fed06fff : pnp 00:03 */
		{
			.phys_start = 0xfed06000,
			.virt_start = 0xfed06000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed08000-fed09fff : pnp 00:03 */
		{
			.phys_start = 0xfed08000,
			.virt_start = 0xfed08000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed1c000-fed1cfff : pnp 00:03 */
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
		/* MemRegion: fed80000-fedbffff : pnp 00:03 */
		{
			.phys_start = 0xfed80000,
			.virt_start = 0xfed80000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-27fffffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x180000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7942d000-7944cfff : ACPI DMAR RMRR */
		/* PCI device: 00:15.0 */
		{
			.phys_start = 0x7942d000,
			.virt_start = 0x7942d000,
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
		
		/* lay MemRegion: 91101000-91103fff : 0000:03:00.0 */
		{
			.phys_start = 0x91101000,
			.virt_start = 0x91101000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* lay MemRegion: e0000000-efffffff : PCI MMCONFIG */
		{
			.phys_start = 0xe0000000,
			.virt_start = 0xe0000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		
	},

	.irqchips = {
		/* IOAPIC 1, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x1faf8,
			.pin_bitmap = {
				0xffffffff, 
				0xffffffff, 
				0xffffffff, 
				0xffffffff,
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
		/* pubb, strange port 61 access */
		PIO_RANGE(0x61, 0x1),
		/* Port I/O: 0062-0062 : EC data */
		PIO_RANGE(0x62, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0066-0066 : EC cmd */
		PIO_RANGE(0x66, 0x1),
		/* Port I/O: 0070-0077 : PCI Bus 0000:00 */
		PIO_RANGE(0x70, 0x8),
		/* Port I/O: 0080-008f : dma page reg */
		PIO_RANGE(0x80, 0x10),
		/* Port I/O: 00a0-00a1 : pic2 */
		PIO_RANGE(0xa0, 0x2),
		/* Port I/O: 00c0-00df : dma2 */
		PIO_RANGE(0xc0, 0x20),
		/* Port I/O: 00f0-00ff : fpu */
		PIO_RANGE(0xf0, 0x10),

		/* pubb, strange IOPORT access such as 3f8,3f9,419 incurs to FATAL, so open it */
		PIO_RANGE(0x3f0, 0x60),
		//net 03:00.0
		PIO_RANGE(0xe000, 0x100),

		/* Port I/O: 0500-05fe : pnp 00:02 */
		PIO_RANGE(0x500, 0xff),
		/* Port I/O: 0600-061f : pnp 00:02 */
		PIO_RANGE(0x600, 0x20),
		/* Port I/O: 0680-069f : pnp 00:02 */
		PIO_RANGE(0x680, 0x20),
		/* Port I/O: 0a00-0a1f : pnp 00:00 */
		PIO_RANGE(0xa00, 0x20),
		/* Port I/O: 0a20-0a2f : pnp 00:00 */
		PIO_RANGE(0xa20, 0x10),
		/* Port I/O: 0a30-0a3f : pnp 00:00 */
		PIO_RANGE(0xa30, 0x10),
		/* Port I/O: 0a40-0a4f : pnp 00:00 */
		PIO_RANGE(0xa40, 0x10),
		/* Port I/O: 0a50-0a5f : pnp 00:00 */
		PIO_RANGE(0xa50, 0x10),
		/* Port I/O: 0a60-0a6f : pnp 00:00 */
		PIO_RANGE(0xa60, 0x10),
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
		/* PCIDevice: 01:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x100,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
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
				0xffffe000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 37,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		
		/* lay PCIDevice: 03:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x300,
			.bar_mask = {
				0xffffff00, 0x00000000, 0xfffff000,
				0xffffffff, 0xffffc000, 0xffffffff,
			},
			.caps_start = 44,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 4,
			.msix_region_size = 0x1000,
			.msix_address = 0x91100000,
		},
		
		
		/* lay IVSHMEM: 00:10.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x10 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 0,
			.shmem_dev_id = 0,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		/* lay IVSHMEM: 00:11.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x11 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 3,
			.shmem_regions_start = 5,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
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
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
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
		/* PCIDevice: 00:16.0 */
		/* PCIDevice: 00:18.0 */
		/* PCIDevice: 00:19.0 */
		/* PCIDevice: 00:19.1 */
		/* PCIDevice: 00:19.2 */
		/* PCIDevice: 00:1a.0 */
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
		/* PCIDevice: 01:00.0 */
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
		/* PCIDevice: 02:00.0 */
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
			.start = 0x14c,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x154,
			.len = 0x4,
			.flags = 0,
		},
		
		/* lay PCIDevice: 03:00.0 */
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
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x178,
			.len = 0x4,
			.flags = 0,
		},
		
		
	},
};

------=_Part_523_998623175.1623752167216
Content-Type: text/plain; charset=US-ASCII; name=pci-linux.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=pci-linux.c
X-Attachment-Id: e9a1be07-8c2a-427b-b512-6cbc6cb1cdd7
Content-ID: <e9a1be07-8c2a-427b-b512-6cbc6cb1cdd7>

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[20];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[1];
	struct jailhouse_pci_device pci_devices[3];
	struct jailhouse_pci_capability pci_caps[9];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "linux-nuc6cay-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.num_pci_caps = ARRAY_SIZE(config.pci_caps),//
	},

	.cpus = {
		0b1000,
	},

	.mem_regions = {
		/* IVSHMEM shared memory regions (demo) */
		{
			.phys_start = 0x3f0f0000,
			.virt_start = 0x3f0f0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f0f1000,
			.virt_start = 0x3f0f1000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f0fa000,
			.virt_start = 0x3f0fa000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f0fc000,
			.virt_start = 0x3f0fc000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x3f0fe000,
			.virt_start = 0x3f0fe000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		/* IVSHMEM shared memory regions (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
		/* low RAM */ 
		{
			.phys_start = 0x3a600000,
			.virt_start = 0,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ 
		{
			.virt_start = 0x00100000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
		},
		/* high RAM */ 
		{
			.phys_start = 0x3a700000,
			.virt_start = 0x00200000,
			.size = 0x4900000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* lay MemRegion: 91101000-91103fff : 0000:03:00.0 */
		{
			.phys_start = 0x91101000,
			.virt_start = 0x91101000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91104000-91104fff : r8169 */
		{
			.phys_start = 0x91104000,
			.virt_start = 0x91104000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* lay MemRegion: e0000000-efffffff : PCI MMCONFIG */
		{
			.phys_start = 0xe0000000,
			.virt_start = 0xe0000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed03000-fed03fff : pnp 00:03 */
		{
			.phys_start = 0xfed03000,
			.virt_start = 0xfed03000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed06000-fed06fff : pnp 00:03 */
		{
			.phys_start = 0xfed06000,
			.virt_start = 0xfed06000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed08000-fed09fff : pnp 00:03 */
		{
			.phys_start = 0xfed08000,
			.virt_start = 0xfed08000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed1c000-fed1cfff : pnp 00:03 */
		{
			.phys_start = 0xfed1c000,
			.virt_start = 0xfed1c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed80000-fedbffff : pnp 00:03 */
		{
			.phys_start = 0xfed80000,
			.virt_start = 0xfed80000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},
	
	.irqchips = {
		/* IOAPIC */ 
		{
			.address = 0xfec00000,
			.id = 0x1faf8,
			.pin_bitmap = {
				0,//(1 << 3) | (1 << 4), //0
				0,
				0,
				0,//(1 << (127-96)), //0,
			},
		},
	},
	
	.pio_regions = {
		PIO_RANGE(0xe000,0x100),/* r8169 */
	},
	
	
	
	.pci_devices = {
		/* IVSHMEM: 00:10.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x10 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 0,
			.shmem_dev_id = 2,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		/* IVSHMEM: 00:11.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x11 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 3,
			.shmem_regions_start = 5,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
		/* lay PCIDevice: 03:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3 << 8,
			.bar_mask = {
				0xffffff00, 0x00000000, 0xfffff000,
				0xffffffff, 0xffffc000, 0xffffffff,
			},
			.caps_start = 0,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 4,
			.msix_region_size = 0x1000,
			.msix_address = 0x91100000,
		},
	},
	
	/* lay */
	.pci_caps = {
	    /* lay PCIDevice: 03:00.0 */
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
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x10,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x170,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x178,
			.len = 0x4,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
	},
};

------=_Part_523_998623175.1623752167216--
