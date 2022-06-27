Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNHB42KQMGQEM6YNP6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA955BA06
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:25 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id h18-20020a056512055200b004810d1b257asf2128298lfl.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336565; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ea2rtTnsmV4ehz6tPtfzUDYiPJxd9SAvlZYPaoI8GGlqPmjH80NzvMzRcqqKxgSNDR
         NzFnT1JdfVT9iCLt3+NCMcaW3RB/7phfUR+ZB/9KxImjOPzu0Nz9Tmx9aV0J5/YPVrC1
         +V27Ddbi2j6lnZ5wuXRA7jJHFUiKJKKj5ncJ0Lp+ke1SINEpx6HY/3YTmQN9yqTaw8IU
         gHoKF1msM3gU+AjaLixSCVDuoMHM8nj5/riDeNdI+Oto7UCEY0zFydrSAVYQnemU5DaG
         iiUEE2kJVkRvBM9zBwRW6XYmf9XZkaqVt7lQWazye00sjIBP2g0wUhROdIczCfTAa1Qi
         LXxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=NLDIhzFjw8ky7Bm2FTMES6S9g0lim/5IpXPPN1U280g=;
        b=No30e/Iknb1l8vDQOC9RTKFf0dp6oZGXvs050VgvoFl/UtTlyFKiT7uFkE+nO5aW1M
         lakove1QwoDVFaVu81M9Jh0LiYm0TutRrr5rp2C2srEe917X60LfFjaVKGJ5QxbO4AEu
         zJxDFzyRO0SnH/Fjy3Do9nHuLYd0V0G3+UomhWHCILPLXpA+FRB1tzyc4hqkdUS9zBqK
         TPfwa9u3hDNx2EWFMn43F9/MZoM1LyLSr75++xTNsCkR+3DLB/uX2TeLkTgE5Eg5AsoI
         SiZ9s4tZxyzyDIlYhNHHQqNmiCRWsdkrG048BsmaHcMzDH4EOw5HzEUTQ/SanVjvRr9I
         K7ZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=d4e1cj5n;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NLDIhzFjw8ky7Bm2FTMES6S9g0lim/5IpXPPN1U280g=;
        b=AeAbKnZWzSBhHPS6bPw61W75E+wjF6CdHh/KpAqMpZ8qNtn69bIsBtLoKAL+tz3ta2
         86YOj01aK8lUW9C+OjagUmnRsfoREF/TUoa9fcaR9NMUUfsvjY8NKTqanNjoBisEbHMt
         WAphTpBQe21Iw7ljEglTj4P/lBWbB6vDth1gezXaLOovfwwTZuMyMeouTGZ7uCVK46a1
         SBl9Gj6khCHJfWq9jn498iyXCF2FufFvGtP5anLUcgdSzraY0OtFKli5txGsNbmzCmtv
         O3tPFRWabwL/MZRCNxeo9C6w/Oc2whzz+ZSMF9gWRxrPF/NI5qL6HtJpyQtCd+pS0uQ9
         VgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NLDIhzFjw8ky7Bm2FTMES6S9g0lim/5IpXPPN1U280g=;
        b=cTdCZGolYHFO4nVaUAw34beomwuejciXOkgbq/hi02vlW/zDLZaFWkTnd86392PnET
         KVGiALnn8Fn6kOdV0OfFidlex5vi/fSDgPnmHX51YXEpqQtKTdZGuekhTKPJVLbzUvr3
         z74VtWHp/6NxgjKDZGKuaqPVvArpUQFgsISsisuyULLMre5NFy636gx2HOoaKdYWEZ8X
         LswKaznxBQk3oj0lBdSXd1jtbSucxh6fmnB5ZH3mP7weMsUrp48Chw4dPvTHnp0IJ4gN
         4NsPgL+wun1TYl9cjC+TzioBe5OVs+c1TJ43zpiGUzVhrwFsyooEJ1CRig8hp74smDR+
         xSGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+bU/dJLI6HpmAM5oa1waDiOfui/eHAEnA1vAvCFHULeoDPIGcj
	okAJ/lx9Fx5ZCm5GcxYBbGQ=
X-Google-Smtp-Source: AGRyM1sVyKpr4ks+uUYbB93hKq+Xyl4eQAg02xlrYzvEpPZouVTfMOmw8IsJyOzg1DZ863a05+JF3g==
X-Received: by 2002:a2e:b818:0:b0:25a:6e83:cc89 with SMTP id u24-20020a2eb818000000b0025a6e83cc89mr6895535ljo.150.1656336565031;
        Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3b0c:b0:47f:9907:2b50 with SMTP id
 f12-20020a0565123b0c00b0047f99072b50ls214509lfv.3.gmail; Mon, 27 Jun 2022
 06:29:23 -0700 (PDT)
X-Received: by 2002:a05:6512:2508:b0:480:f1cb:64a5 with SMTP id be8-20020a056512250800b00480f1cb64a5mr8627105lfb.0.1656336563407;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336563; cv=none;
        d=google.com; s=arc-20160816;
        b=CErLcm/NbRNNcUbVQo/QBfkowE6zj6kXwu1itH6CQrdcQun+qs0RdHxiynHfzcZeHV
         tCZObAX2OLKW9VQaJA17VLP4dGnhYpSANWIpoMVtWz+1vlpzJElQKqLtlDa8M14ALOe5
         n2RiSvBqoKFRTBZ61bgtDaTxcFdfZl42mb6pu5rvdf5nLptGXBcQ5h3K5xN8kCkQPLG6
         Rbb3eU5fKNJJmgch20gIMJjQqzhykbejTIzWnihi08Gb/emqontY/RKnA23tCueXU1Vj
         UTBZSjKVTTUb3MK+cxrOhJvCf6dxEP5fDgSRWWiaPvZLJoaw6c1+xgIKDHJe60tC4Zq6
         qasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/3rMRizePijavSZ/AFjtyQfAXgIPisE0AwNMhWKHRFM=;
        b=BGB36hPkGDulRdAcWPHdV/fWSwo7y1GxbqUBpjAeeVvgIoiT45LW7C6eB4W//VzKao
         R9eeCm9XQ1n3fCWq4pHaIxDi2/E0+WythtlNP9kRmG8M2N/+M7Wfd+Zl6jovpdweFxib
         wVkQ1ew7Wr0FPNscAOHVqOYXZhJ22MVHHeIZV4VLrKsj8IYbxr3HHs/KGNLOV9yzG9RO
         YyWkGgikKbWHm/HfDSnJs9dS8x8Si7JIZeIdGVrzVDRgOWDn3KNEbrODylHavR30VRtV
         u9Rb/ddCOFCXD39hb+apCmPl/YN2mmTpZxdDDFjG+rpuCnF5LOt+6Tr2Jn1IzUNk9O4s
         ZPxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=d4e1cj5n;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id p16-20020a2eb7d0000000b0025a71229262si382428ljo.3.2022.06.27.06.29.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVB64Sfzy6w;
	Mon, 27 Jun 2022 15:29:22 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:22 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 34/42] configs: riscv: qemu: add system configs
Date: Mon, 27 Jun 2022 15:28:57 +0200
Message-ID: <20220627132905.4338-35-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=d4e1cj5n;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/riscv/qemu-riscv64.c | 218 +++++++++++++++++++++++++++++++++--
 include/jailhouse/console.h  |   1 +
 2 files changed, 211 insertions(+), 8 deletions(-)

diff --git a/configs/riscv/qemu-riscv64.c b/configs/riscv/qemu-riscv64.c
index 3c68ad71..1ace554b 100644
--- a/configs/riscv/qemu-riscv64.c
+++ b/configs/riscv/qemu-riscv64.c
@@ -1,12 +1,15 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for QEMU riscv64 virtual target, 1G RAM, 4 cores
+ * Configuration for QEMU riscv64 virtual target, 1G RAM, 6 cores
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -17,24 +20,65 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
+#define IVSHMEM
+
+#define VIRTIO_MMIO(OFFSET)					\
+{								\
+	.phys_start = 0x10000000 + (OFFSET),			\
+	.virt_start = 0x10000000 + (OFFSET),			\
+	.size = 0x00001000,					\
+	.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |	\
+		JAILHOUSE_MEM_IO,				\
+}
+
 struct {
 	struct jailhouse_system header;
-	struct jailhouse_cpu cpus[4];
-	struct jailhouse_memory mem_regions[1];
+	struct jailhouse_cpu cpus [6];
+	struct jailhouse_memory mem_regions [20];
+	struct jailhouse_irqchip irqchips [1];
+	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_capability pci_caps[6];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
-			.phys_start = 0xbfc00000,
-			.size =       0x00400000,
+			/* N.B.: 2 MiB megapage alignment requirement */
+			.phys_start = 0xbfa00000,
+			.size =       0x00600000,
+		},
+
+		.platform_info = {
+			.pci_mmconfig_base = 0x30000000,
+			.pci_mmconfig_end_bus = 0xff, // ??
+			.riscv = {
+				.plic = {
+					.base_address = 0xc000000,
+					.size = 0x600000,
+					.max_irq = 96,
+					.max_priority = 7,
+					.hart_to_context = {
+						[0] = 1,
+						[1] = 3,
+						[2] = 5,
+						[3] = 7,
+						[4] = 9,
+						[5] = 11,
+						[6 ... 31] = -1,
+					}
+				},
+			},
 		},
 		.root_cell = {
 			.name = "qemu-riscv64",
-
 			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
+
+			.vpci_irq_base = 32,
 		},
 	},
 
@@ -51,15 +95,173 @@ struct {
 		{
 			.phys_id = 3,
 		},
+		{
+			.phys_id = 4,
+		},
+		{
+			.phys_id = 5,
+		},
 	},
 
 	.mem_regions = {
 		/* RAM */ {
 			.phys_start = 0x80000000,
 			.virt_start = 0x80000000,
-			.size = 0x3fa10000,
+			.size = 0x3fa00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* rtc@101000 */ {
+			.phys_start = 0x00101000,
+			.virt_start = 0x00101000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* uart@10000000 */ {
+			.phys_start = 0x10000000,
+			.virt_start = 0x10000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* test@100000 */ {
+			.phys_start = 0x00100000,
+			.virt_start = 0x00100000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* flash@20000000 */ {
+			.phys_start = 0x20000000,
+			.virt_start = 0x20000000,
+			.size = 0x02000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* flash@22000000, 2nd range */ {
+			.phys_start = 0x22000000,
+			.virt_start = 0x22000000,
+			.size = 0x02000000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-	}
+		/* MemRegion: 40040000-4005ffff: e1000e */
+		{
+			.phys_start = 0x40040000,
+			.virt_start = 0x40040000,
+			.size = 0x20000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 40060000-4007ffff: e1000e */
+		{
+			.phys_start = 0x40060000,
+			.virt_start = 0x40060000,
+			.size = 0x20000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* virtio_mmio@10001000 */
+		VIRTIO_MMIO(0x1000),
+		/* virtio_mmio@10002000 */
+		VIRTIO_MMIO(0x2000),
+		/* virtio_mmio@10003000 */
+		VIRTIO_MMIO(0x3000),
+		/* virtio_mmio@10004000 */
+		VIRTIO_MMIO(0x4000),
+		/* virtio_mmio@10005000 */
+		VIRTIO_MMIO(0x5000),
+		/* virtio_mmio@10006000 */
+		VIRTIO_MMIO(0x6000),
+		/* virtio_mmio@10007000 */
+		VIRTIO_MMIO(0x7000),
+		/* virtio_mmio@10008000 */
+		VIRTIO_MMIO(0x8000),
+
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbf900000, 0),
+	},
+
+	.irqchips = {
+		/* plic@c000000 */ {
+			.address = 0xc000000,
+			.id = 0 /* PLIC */,
+			.pin_base = 0,
+			.pin_bitmap = {
+				0
+				| 1 << 1 /* virtio_mmio@10001000 */
+				| 1 << 2 /* virtio_mmio@10002000 */
+				| 1 << 3 /* virtio_mmio@10003000 */
+				| 1 << 4 /* virtio_mmio@10004000 */
+				| 1 << 5 /* virtio_mmio@10005000 */
+				| 1 << 6 /* virtio_mmio@10006000 */
+				| 1 << 7 /* virtio_mmio@10007000 */
+				| 1 << 8 /* virtio_mmio@10008000 */
+				| 1 << 0xa /* uart@10000000 */
+				| 1 << 0xb /* rtc@101000 */
+				,
+				1 << (0x22 - 0x20) /* PCI INT C / slot 0 */
+				,
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* e1000e */
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.domain = 0x0000,
+			.bdf = 0x0010,
+			.bar_mask = {
+				0xfffe0000, 0xfffe0000, 0xffffffe0,
+				0xffffc000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 0,
+			.num_caps = 6,
+			.num_msi_vectors = 1,
+			.msi_64bits = 1,
+			.num_msix_vectors = 5,
+			.msix_region_size = 0x1000,
+			.msix_address = 0x40080000,
+		},
+	},
+
+	.pci_caps = {
+		{ /* e1000e */
+			.id = PCI_CAP_ID_PM,
+			.start = 0xc8,
+			.len = 8,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_MSI,
+			.start = 0xd0,
+			.len = 14,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_EXP,
+			.start = 0xe0,
+			.len = 20,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_MSIX,
+			.start = 0xa0,
+			.len = 12,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x100,
+			.len = 4,
+			.flags = 0,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x140,
+			.len = 4,
+			.flags = 0,
+		},
+	},
 };
diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
index 34dd7209..0b6c558b 100644
--- a/include/jailhouse/console.h
+++ b/include/jailhouse/console.h
@@ -50,6 +50,7 @@
 #define JAILHOUSE_CON_TYPE_SCIFA	0x0007
 #define JAILHOUSE_CON_TYPE_IMX		0x0008
 #define JAILHOUSE_CON_TYPE_IMX_LPUART	0x0009
+#define JAILHOUSE_CON_TYPE_RISCV_SBI	0x000a
 
 /* Flags: bit 0 is used to select PIO (cleared) or MMIO (set) access */
 #define JAILHOUSE_CON_ACCESS_PIO	0x0000
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-35-ralf.ramsauer%40oth-regensburg.de.
