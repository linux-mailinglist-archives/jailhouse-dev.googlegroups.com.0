Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNUEZXYAKGQEYJRGY3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 90363131370
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:38 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id l20sf20148333wrc.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320438; cv=pass;
        d=google.com; s=arc-20160816;
        b=WLqRoNoPxx5nONr7crDx718wAvbaogH0qxjDDYcZSmRDw2pVM/geBHnpe41416gIO1
         ccn+AdvIUdQAZpiiVL6o006XV4HSQYlUxMekB8IgtoAv3Cdj5D8/plqDJQqkeVMfc/qj
         QiaA35kEPaF6GfysnM9XlMsZYxtzteBGxJ+5uswX5uSUQYFZvVMyKSXKwj5WAiFoVyHW
         xZ9gk4mRiHuP6rnsfBGbgKK3yzFJ2cKWLPt1GepAB7tRvLNG6YxdQ4peSa/zS8tSfRhX
         aYi7iSWE8r7OHLeVQgnYVEfIJBGXZ9a7T9mcHBVLEKNnuYjN2YE8LwNQSM8++ULKlWAG
         Z1Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=RnsDLg1BJwefRqRRboYXOJ+eC7cxtshy5limk54m9CI=;
        b=INMDfh0l44K8pfEy3Av3NdJryJUVgGKaJ8vlzApWJ1F0QiPA2rqrIAUt4QLdN6QRL+
         UX6fJJrdC7SVt/UZQrKxM4eBdGuem5KRw5ZEEyFbYwRHopaH1lGfABUOlRFgWaob2O/k
         o9pH6ohHew7hUxidYMwBMwwggUjOh18V7aE/6kefsyaI56hzFQaQGJaUIlGwQtL+ayVO
         uOUPQ+lSii/BxhgPyvD5sIfRPwly35FaDJaP4P65HMNsmrcnud7B3SOhvytQCHQLRa00
         4Y5agqvOURO/QRMF7VDUn0vBueVkqPpTf+r+O0N/WDTCluahjI1mRASuyZYyTtVx05Fd
         lFpA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RnsDLg1BJwefRqRRboYXOJ+eC7cxtshy5limk54m9CI=;
        b=nPbIGS/YbqSP2b0jfSSZX1HZv8JdowwIjlg9Dhs1R7Cxx3e+2nStY7FHC4eVIVJE80
         r59iE2NWnfw+5CT3O6tq5Jk9GP2YbCCm0t9zmUDYpSQK5ouQoGGjGNLTDFWUwww3KI2H
         ATilFmD5WCPJfUmgjycV7+BVTVGsOr4y0LPONscnBX8CISqjW87F2pNGksl05z2havOj
         JfFKyisbPdaz7U0k2fdlmhv7vvp/tAjrd07aT3nch3f+I/ocgMrfN8AblaR16pagj8nt
         F2z9DbGl1yqKZAHki9JBkdcVOJFHimGOOUxsJOwaYsVi1O6+38DM/iQanwWJtM53y1C1
         UMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RnsDLg1BJwefRqRRboYXOJ+eC7cxtshy5limk54m9CI=;
        b=DPZKFoo61gCrUVfzf2Z5bmQbxuv6nM+H6kQcH8WbWSCNeLC91DeR3LURL4G1zyUiEF
         r2yY85EAGgxJwYMb97J9EAwzWQCLx/V5n5KiKMZNF0mkhgxq1ighXrQIVS5PBMbNW0/S
         +wgex2pNKcyG6WND82o373iKKDOymL3IX7HErG5FGQbO6Q2u4tC5sgS7yWxg6PbdFFS2
         WXCk6c/Fb5mJcLjlSaA73dfFYCG5eDq0QHEJhOAIkiZNVRzFM63hTs18tigA18qT7nIh
         tZncLuhmmgcBhDaN1IudT7jeHmmlxirm5nFHo6d2KeyX8n1W1DRNHDXdIATeCZpv3htg
         JTYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVq9QKyfdilOIILoHMarE5vtOuR+7uX6A0mB2kQcL7FSSKBN6lj
	SqP6tHQsFMSkl6AWz//oyYo=
X-Google-Smtp-Source: APXvYqyh+Se18M/siaWmaE062OAfkPi7eNxAiS+9KJMKuCppQSt38/Z3uYAyCuMUKDqmPEfZnIzEuA==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr36343265wmk.15.1578320438258;
        Mon, 06 Jan 2020 06:20:38 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf15:: with SMTP id l21ls5373862wmg.0.canary-gmail; Mon,
 06 Jan 2020 06:20:37 -0800 (PST)
X-Received: by 2002:a05:600c:244:: with SMTP id 4mr33353133wmj.40.1578320437537;
        Mon, 06 Jan 2020 06:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320437; cv=none;
        d=google.com; s=arc-20160816;
        b=fm88WZgCN1SiJOQuMlCt+8w+/YaN1cOcE+cm+9KHrbn7AovmmyWdUQdj1KFMRg2KWs
         +3ra0FxeM/jTCNoMakd61i5aBQ4HRj9ijWNeonsTmgpR5XAitrZEecgh+N19vYYJsx2a
         Dpig9dgFQWMz3L1guocUi9aFawZAkMpPMx/ec8WeANLWuaCGl0QEkoyqeQdXTvZnIzx1
         BqmD+jF0DByEn0LOHv0esbW8wyngB0OHpyVQ2yeaYPgwFxBhRA+hz/aR971Q3yX0vylE
         IAIrVZIku4kLDQbOLhC832yXLBRPo2qq5Tf2sGRQMvvWhPnoA5lp+DAyslQx16mcjcgz
         nJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=4gpaDTD8MzMzM84eBejZ4Wdh2XaZMeDU3pGvuWzOoDA=;
        b=b6Sfa9cMD4HkZrwqByDGqgdYINvTbSmGa7lrj1komn5UJ3ff7lmJAI0NSy4LeBQQwF
         945qbVTWNEoNa2tJ25kgl8h5HWn61/n1oldNFXvllid2+fBBuU9iJ+HvhWrB3MMx60DE
         REHAs9YlFeNxZDBJR5yh1xlV2IPS3+Q2kHQL9r7nBVHjzoFdrnDDvmjsFHzhkQH9kNu1
         dHCYz1eI1kwf+YogAB8Y4cz6NzRt3iMm+M0DuXYTBGjkZnL/5amaRc8i+mHyS713m0ON
         a1lFVOaY04de+auBMOyqEJ3TwfnKnb3GCYu8kquFUIOJAr0p89sOx2sqCdwxO6TBXhqm
         FWaA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 80si765797wme.4.2020.01.06.06.20.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKbZH019170
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:37 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjB008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:37 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 03/19] configs: x86: Add virtio console device between qemu-x86 and linux-x86-demo
Date: Mon,  6 Jan 2020 15:20:19 +0100
Message-Id: <09efa2549a9da07e9a7da956b4994fda73e43cd0.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This enables the root cell to provide a virtio console via ivshmem to
the non-root Linux cell.

To make space for this shared memory and another upcoming one, move the
demo inmates one MB down in physical memory.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/x86/linux-x86-demo.c | 40 ++++++++++++++++++++++++++++++++++------
 configs/x86/qemu-x86.c       | 35 +++++++++++++++++++++++++++++++----
 2 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 7a6f1efd..c542967d 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -19,17 +19,17 @@ struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
-	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_memory mem_regions[20];
 #else
-	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_memory mem_regions[16];
 #endif
 	struct jailhouse_cache cache_regions[1];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[3];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
-	struct jailhouse_pci_device pci_devices[3];
+	struct jailhouse_pci_device pci_devices[4];
 #else
-	struct jailhouse_pci_device pci_devices[2];
+	struct jailhouse_pci_device pci_devices[3];
 #endif
 	struct jailhouse_pci_capability pci_caps[6];
 } __attribute__((packed)) config = {
@@ -54,6 +54,22 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region (virtio-con front) */
+		{
+			.phys_start = 0x3f0e0000,
+			.virt_start = 0x3f0e0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0e1000,
+			.virt_start = 0x3f0e1000,
+			.size = 0xf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{ 0 },
+		{ 0 },
 		/* IVSHMEM shared memory regions (demo) */
 		{
 			.phys_start = 0x3f0f0000,
@@ -168,13 +184,25 @@ struct {
 	},
 
 	.pci_devices = {
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0,
+			.bdf = 0x0d << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 3,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
+				VIRTIO_DEV_CONSOLE,
+		},
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
 			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 16,
-			.shmem_regions_start = 0,
+			.shmem_regions_start = 4,
 			.shmem_dev_id = 2,
 			.shmem_peers = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
@@ -185,7 +213,7 @@ struct {
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 2,
-			.shmem_regions_start = 5,
+			.shmem_regions_start = 9,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index fe069773..4ef6b283 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -22,10 +22,10 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[23];
+	struct jailhouse_memory mem_regions[27];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[12];
-	struct jailhouse_pci_device pci_devices[9];
+	struct jailhouse_pci_device pci_devices[10];
 	struct jailhouse_pci_capability pci_caps[11];
 } __attribute__((packed)) config = {
 	.header = {
@@ -74,6 +74,21 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region (virtio-con back-end) */
+		{
+			.phys_start = 0x3f0e0000,
+			.virt_start = 0x3f0e0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x3f0e1000,
+			.virt_start = 0x3f0e1000,
+			.size = 0xf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{ 0 },
+		{ 0 },
 		/* IVSHMEM shared memory regions (demo) */
 		{
 			.phys_start = 0x3f0f0000,
@@ -295,13 +310,25 @@ struct {
 			.msix_region_size = 0x1000,
 			.msix_address = 0xfebda000,
 		},
+		{ /* IVSHMEM (virtio-con back-end) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0,
+			.bdf = 0x0d << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 3,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
+				VIRTIO_DEV_CONSOLE,
+		},
 		{ /* IVSHMEM (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0000,
 			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 16,
-			.shmem_regions_start = 0,
+			.shmem_regions_start = 4,
 			.shmem_dev_id = 0,
 			.shmem_peers = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
@@ -312,7 +339,7 @@ struct {
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 2,
-			.shmem_regions_start = 4,
+			.shmem_regions_start = 9,
 			.shmem_dev_id = 0,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/09efa2549a9da07e9a7da956b4994fda73e43cd0.1578320435.git.jan.kiszka%40siemens.com.
