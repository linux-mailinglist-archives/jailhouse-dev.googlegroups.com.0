Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB46LZTYAKGQETZFSI5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5EA1311FD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:03 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id k18sf3655643wrw.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313203; cv=pass;
        d=google.com; s=arc-20160816;
        b=aCefYR7cuH87I9K/35dlh/mGf/M8ixyDbR/FlUmaYp0y9w5HkFBBFqacRiVpWsj1qR
         OVl0RkeI4l6rf7ZTtjch50n+dsvqic3gsZSq9sMVeFxNFgIXPuf+KVARWRcYXcjQUpGZ
         d26KZ1Z79+LYlxxWoDExdc6qvYc1Om3xw+6jHlOf3te4Sc7ygudOIIwq0dOO6m/tEzY9
         cAl3Dn7qYVcTmBxDmCJYVk1cxhzbPB1tdV2znThXi+20ncWEbbu7eAl8Y/o9IlpWIYnF
         73gT+HiyZk0hE3nOvNimY+msugG7kIb8ZAFwI8sSKCWuwMsXDFVvZdYPE6poTrEdGOzh
         GSyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=+Ii3bP6xZUGSPQQe4lucdhvpJEE2maHRQwKdI5Jrpv8=;
        b=YNaDkqUVequc8OISzneL5nudBXyB+5jN+YifFQwHKFmvNp6nQn7nVgQEfGbY+JGC7L
         Dbk3NgtjqQmKKHnSo8yeUR+7sNbfxUpOveYpDNzslnxaZhu26wtRK/yEN34VDM4jRk8V
         9NYE4lEYCEdWFzuteL47sdBUcxEyx5DIrlSQYZyJq7tFgJc/SL9iyUxtJ7aoDZQ17wC1
         s9UQDu1x2nC5f0UGXdZo5h7O5464bL6aPvRVDMNDpdbZBL3QvX+OQhZaLwIXCTtbtnbv
         bXMC94VPDFGIyw+d0da8Ozja/HyOYZp4ymvexd5wVRXKHYV5R0B9sRwQ7sHF+I7Y4+4V
         0NKA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+Ii3bP6xZUGSPQQe4lucdhvpJEE2maHRQwKdI5Jrpv8=;
        b=UDxYNTFUy6GvBblp5hIgcMG3X9puiI6FQvDsUrAF/9WSFRmuCw415/IOIc26PO/SUZ
         9m/FUT7oKUuxsvBRsg+tUhWN1UxmWxqmt5YiIb/n25zSLU+3SU4v0P91wY0ZFl8OnC9V
         wTuOi7FhXa2OvPwK24d0yFgBZPEPjlFon4DclcDK5NZcqSInezdRvcn0cRi5sJLdyE0s
         wFB6yhrCo6MylWrWOscY5+x+co/uWyA6Vw6yFZUMWlQn2oSHdFohe7U0rgrWLqFNGhL3
         t8lueNSOrLZoLsurH5i6L+qqL2QkkpJK1JuFJWKuaicAFNw+gwqd06wJdS3oyqJJWDYq
         OuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+Ii3bP6xZUGSPQQe4lucdhvpJEE2maHRQwKdI5Jrpv8=;
        b=pY028+WvUyNL+Ub6Vcpcl71DFWPOBZ5jsXkfEYr/zSAyHUQvEJYDII3FtaONzPBjm2
         lIxYEAm4a6nfBXXaT1JYwj2lQAWc90crnOofL1VdfGgimyZZGCj4PakcyF3rmufdRqhS
         9NOlJE61FaLgyLlRFoWgsmDVi2I1I7E9RotJ9OFifaz9hzRsH+k5E9UBVsTRmjFU30CW
         i8EII6N4xkXUeTTXBp2u5i07KcPW9FCtf4tZUNVJiQb8wSRyiWjhOgFX9A60O0EIlRaf
         7N5yFD6ob3oLhW37S5+Bq4J/8uJ1/l4yp9GWGuMuvjq6e1W25JW620ku8VmKpmI+0GTF
         Za0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUAVbwviB5vwzr6wUqDjIMu5Tf95t3TFMPh5amBsi6JoyxKbJDp
	crE0yqrrRtI+UrI5IJavfuU=
X-Google-Smtp-Source: APXvYqzmj6avXmzpVVpLCpTN3zskIXHrSwT9JKvNTXbgB4ff2bBtoibQ7jP+cJ8U62utRSSzLOCS+A==
X-Received: by 2002:a05:6000:11c9:: with SMTP id i9mr1950665wrx.164.1578313203229;
        Mon, 06 Jan 2020 04:20:03 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ebc5:: with SMTP id v5ls12874166wrn.8.gmail; Mon, 06 Jan
 2020 04:20:02 -0800 (PST)
X-Received: by 2002:a5d:51cc:: with SMTP id n12mr105320141wrv.177.1578313202508;
        Mon, 06 Jan 2020 04:20:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313202; cv=none;
        d=google.com; s=arc-20160816;
        b=dFHS2MNmx8KbJvVHfN5yy/5mI9S9MSCafqJtFiBv07YgaXBAtn7wG9C4TDmyqwpnLF
         uBs6BaJ59Rn7JcCtbXAvQeZr1IwbxbJ9SVmCeRL9kP7pRSfDnqyFJxMcLUJi5OkJey/s
         OX9Px9Otg2eGZf83Vq9dqRyyY8ANqI2Q60AHTmHGVKpEuXteJuB6qL2891BerRpZ/2Q3
         f60El+8xAWdB2Ak/XR3Lh11IuwSU3dBf9aF8J7jQXzUZOJvZ9FUjfXIDcNaFCpcGPDXt
         4QagxPJPWpfqXngYb+oIzfVMbjZ5ERGWqs6R5OjvXKyL7sTg59i4f4x3UOYtH2ItTEMx
         gExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=e1/mrdrwDxbnvJLT/nIPbm+tQJYMCPf9rj76BddCkEE=;
        b=QvnzaMxnF9hDg1OahKwaoD+D7XhSkI7Fqvy15VEDUEb3vLn3W67o/tfn0zO8UZT1e5
         o42tPVWzBvJM8JO+23u03beBHPiPmecNdTFfkMhXQi7DROSHPnFEx4/H2m8G3PbzGJDe
         E4erj3wHOE0pgHgDTt2/x3zkRg1AZ2GS93W0DiEEv1hVPtAjOqvXsOOy29cPBm3kfdDR
         2QOrDrtzl3qpngLuI3M/wdG4Xvjzof040ZUy7/iWIgCPDJnFWr4KpgHpLdSPdSSHzJKL
         cBTum3NzMcV4YSc+P7mKJoNAo0tz+SYfusXPJ/1YLlN9sCoZ+B0lt2VcFO+Egvdx2Uwv
         Dvow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x5si1046532wmk.1.2020.01.06.04.20.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:02 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK23d025056
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:02 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEx029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:01 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 25/38] core, configs: ivshmem: Add state table
Date: Mon,  6 Jan 2020 13:18:06 +0100
Message-Id: <ce1c12464e690fa53614200ed2fafb8b9e31093b.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Replace the register-based remote state read-back with a state table
that is located in read-only shared memory. Every peer has an entry in
this table. The entry position is based on the ID. This way, all peers
can read the other's state without causing a VM exit.

The state table is located at the beginning of the share memory region.
Its mapping size can be retrieved via a register in the the vendor cap.

The cell config format for PCI devices is extended: shmem_region becomes
shmem_regions_start, pointing to two memory regions now, the read-only
state table and the read/write shared memory. The two memory regions
must be consecutive because the size of the first one is used by ivshmem
drivers to derive the offset of the second one.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/bananapi-linux-demo.c             |  4 +-
 configs/arm/bananapi.c                        |  4 +-
 configs/arm/emtrion-rzg1e-linux-demo.c        |  4 +-
 configs/arm/emtrion-rzg1e.c                   |  4 +-
 configs/arm/emtrion-rzg1h-linux-demo.c        |  4 +-
 configs/arm/emtrion-rzg1h.c                   |  2 +-
 configs/arm/emtrion-rzg1m-linux-demo.c        |  4 +-
 configs/arm/emtrion-rzg1m.c                   |  4 +-
 configs/arm/jetson-tk1-linux-demo.c           |  4 +-
 configs/arm/jetson-tk1.c                      |  4 +-
 configs/arm/orangepi0-linux-demo.c            |  4 +-
 configs/arm/orangepi0.c                       |  4 +-
 configs/arm64/amd-seattle-linux-demo.c        |  4 +-
 configs/arm64/amd-seattle.c                   |  4 +-
 configs/arm64/espressobin-linux-demo.c        |  4 +-
 configs/arm64/espressobin.c                   |  4 +-
 configs/arm64/hikey-linux-demo.c              |  4 +-
 configs/arm64/hikey.c                         |  4 +-
 configs/arm64/jetson-tx1-linux-demo.c         |  4 +-
 configs/arm64/jetson-tx1.c                    |  4 +-
 configs/arm64/k3-am654-idk-linux-demo.c       |  4 +-
 configs/arm64/k3-am654-idk.c                  |  4 +-
 configs/arm64/k3-j721e-evm-linux-demo.c       |  4 +-
 configs/arm64/k3-j721e-evm.c                  |  4 +-
 configs/arm64/macchiatobin-linux-demo.c       |  4 +-
 configs/arm64/macchiatobin.c                  |  4 +-
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  7 ++-
 configs/arm64/miriac-sbc-ls1046a.c            |  4 +-
 configs/arm64/qemu-arm64-linux-demo.c         |  4 +-
 configs/arm64/qemu-arm64.c                    |  4 +-
 configs/arm64/ultra96-linux-demo.c            |  4 +-
 configs/arm64/ultra96.c                       |  4 +-
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    |  6 +--
 configs/arm64/zynqmp-zcu102-linux-demo.c      |  6 +--
 configs/arm64/zynqmp-zcu102.c                 |  6 +--
 configs/x86/ivshmem-demo.c                    | 12 +++--
 configs/x86/linux-x86-demo.c                  |  8 ++--
 configs/x86/qemu-x86.c                        | 16 +++++--
 hypervisor/ivshmem.c                          | 69 +++++++++++++++++----------
 include/jailhouse/cell-config.h               | 12 +++--
 40 files changed, 150 insertions(+), 114 deletions(-)

diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index a6714736..1b609902 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -106,7 +106,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index 3dd3a2a3..fdf8978b 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[17];
+	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -201,7 +201,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index 5b24db92..c946f6d0 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[11];
+	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -155,7 +155,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index 528b2f45..5b3bf03c 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[19];
+	struct jailhouse_memory mem_regions[20];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -229,7 +229,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index c971bcc0..623f8886 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[13];
+	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -169,7 +169,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index c2b3e16a..9ab36d25 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -355,7 +355,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index 1dc57b4c..73ad3c5b 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[13];
+	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -169,7 +169,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index 21d05116..4c6b7c58 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[24];
+	struct jailhouse_memory mem_regions[25];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -264,7 +264,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index 2e0a898c..48844a66 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -109,7 +109,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index 18a36449..ca368fcf 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -21,7 +21,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[22];
+	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -253,7 +253,7 @@ struct {
 			.domain = 1,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index 1b0a27f6..09087a28 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -97,7 +97,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index 441f211c..b878f70c 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[9];
+	struct jailhouse_memory mem_regions[10];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -142,7 +142,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index b6c6b2e0..7acae6e1 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[9];
+	struct jailhouse_memory mem_regions[10];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -138,7 +138,7 @@ struct {
 			.bdf = 0x0078,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index 37cbb91a..5d810a64 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[17];
+	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[3];
 } __attribute__((packed)) config = {
@@ -216,7 +216,7 @@ struct {
 			.bdf = 0x0078,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index dc12d2b3..2d84665c 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -99,7 +99,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index c9e62077..082c9479 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[4];
+	struct jailhouse_memory mem_regions[5];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -109,7 +109,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index d6cc9f2d..623b4b5b 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -96,7 +96,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index 057dcd05..c570e905 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -115,7 +115,7 @@ struct {
 			.domain = 1,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index b0518c4d..cb4c356c 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -25,7 +25,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -113,7 +113,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index 60a8906d..801a5774 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -21,7 +21,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[43];
+	struct jailhouse_memory mem_regions[44];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -392,7 +392,7 @@ struct {
 			.domain = 1,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index d546add6..bea2c984 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -23,7 +23,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[9];
+	struct jailhouse_memory mem_regions[10];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -137,7 +137,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index 4dea206a..85f663f1 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[5];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -211,7 +211,7 @@ struct {
 			.domain = 1,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 58b5f2c4..ec0e3a39 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,7 +24,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[22];
+	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -261,7 +261,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 65afe570..f22e9962 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[33];
+	struct jailhouse_memory mem_regions[34];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -349,7 +349,7 @@ struct {
 			.domain = 3,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index 9da732d9..2ebabb0d 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -107,7 +107,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index 893b116d..2fca01a2 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -118,7 +118,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index 71981611..9eb96734 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -114,12 +114,11 @@ struct {
 
 	.pci_devices =
 	{
-		/* 00:00.0 */
-		{
+		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index 1e3aa9c4..ea64d44a 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[52];
+	struct jailhouse_memory mem_regions[53];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -454,7 +454,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index e0c95039..c3b06c11 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -100,7 +100,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 4b0826cd..786bddb2 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[4];
+	struct jailhouse_memory mem_regions[5];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -109,7 +109,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index 4aea2922..a9ce834e 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -99,7 +99,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index ef49b824..890c121c 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
+	struct jailhouse_memory mem_regions[4];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -101,7 +101,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index 5248952d..a02da41d 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -95,7 +95,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
@@ -103,7 +103,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 1,
+			.shmem_regions_start = 2,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index f9b804a4..d11d7c64 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -101,7 +101,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
@@ -109,7 +109,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 1,
+			.shmem_regions_start = 2,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index efd81389..1eb165af 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -120,7 +120,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
@@ -129,7 +129,7 @@ struct {
 			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 1,
+			.shmem_regions_start = 2,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index e53965ff..0e0644b9 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
+	struct jailhouse_memory mem_regions[4];
 	struct jailhouse_pio pio_regions[2];
 	struct jailhouse_pci_device pci_devices[1];
 	struct jailhouse_pci_capability pci_caps[0];
@@ -50,11 +50,17 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region */
+		/* IVSHMEM shared memory regions (demo) */
 		{
 			.phys_start = 0x3f0f0000,
 			.virt_start = 0x3f0f0000,
 			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0f1000,
+			.virt_start = 0x3f0f1000,
+			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
@@ -85,7 +91,7 @@ struct {
 			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 		},
 	},
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 70cfc4ad..468f01f7 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -19,9 +19,9 @@ struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
-	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_memory mem_regions[9];
 #else
-	struct jailhouse_memory mem_regions[4];
+	struct jailhouse_memory mem_regions[5];
 #endif
 	struct jailhouse_cache cache_regions[1];
 	struct jailhouse_irqchip irqchips[1];
@@ -54,7 +54,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region */
+		/* IVSHMEM shared memory regions (networking) */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
 		/* low RAM */ {
 			.phys_start = 0x3a600000,
@@ -141,7 +141,7 @@ struct {
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 4aa789b1..1c6f0d84 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -22,7 +22,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[12];
 	struct jailhouse_pci_device pci_devices[9];
@@ -74,14 +74,20 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region (demo) */
+		/* IVSHMEM shared memory regions (demo) */
 		{
 			.phys_start = 0x3f0f0000,
 			.virt_start = 0x3f0f0000,
 			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x3f0f1000,
+			.virt_start = 0x3f0f1000,
+			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* IVSHMEM shared memory region (networking) */
+		/* IVSHMEM shared memory regions (networking) */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
 		/* RAM */ {
 			.phys_start = 0x0,
@@ -277,7 +283,7 @@ struct {
 			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 0,
+			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
@@ -287,7 +293,7 @@ struct {
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 1,
+			.shmem_regions_start = 2,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 8d8481c7..8d3dae00 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -38,6 +38,7 @@
 #define IVSHMEM_CFG_MSIX_CAP		(IVSHMEM_CFG_VNDR_CAP + \
 					 IVSHMEM_CFG_VNDR_LEN)
 
+#define IVSHMEM_CFG_SHMEM_STATE_TAB_SZ	(IVSHMEM_CFG_VNDR_CAP + 0x04)
 #define IVSHMEM_CFG_SHMEM_RW_SZ		(IVSHMEM_CFG_VNDR_CAP + 0x08)
 #define IVSHMEM_CFG_SHMEM_ADDR		(IVSHMEM_CFG_VNDR_CAP + 0x18)
 #define IVSHMEM_CFG_VNDR_LEN		0x20
@@ -54,8 +55,7 @@
 #define IVSHMEM_REG_MAX_PEERS		0x04
 #define IVSHMEM_REG_INTX_CTRL		0x08
 #define IVSHMEM_REG_DOORBELL		0x0c
-#define IVSHMEM_REG_LSTATE		0x10
-#define IVSHMEM_REG_RSTATE		0x14
+#define IVSHMEM_REG_STATE		0x10
 
 struct ivshmem_link {
 	struct ivshmem_endpoint eps[IVSHMEM_MAX_PEERS];
@@ -91,6 +91,31 @@ static void ivshmem_remote_interrupt(struct ivshmem_endpoint *ive)
 	spin_unlock(&ive->remote_lock);
 }
 
+static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
+{
+	const struct jailhouse_pci_device *dev_info = ive->device->info;
+	u32 *state_table = (u32 *)TEMPORARY_MAPPING_BASE;
+
+	/*
+	 * Cannot fail: upper levels of page table were already created by
+	 * paging_init, and we always map single pages, thus only update the
+	 * leaf entry and do not have to deal with huge pages.
+	 */
+	paging_create(&this_cpu_data()->pg_structs,
+		      ive->shmem[0].phys_start, PAGE_SIZE,
+		      (unsigned long)state_table, PAGE_DEFAULT_FLAGS,
+		      PAGING_NON_COHERENT);
+
+	state_table[dev_info->shmem_dev_id] = new_state;
+	memory_barrier();
+
+	if (ive->state != new_state) {
+		ive->state = new_state;
+
+		ivshmem_remote_interrupt(ive);
+	}
+}
+
 int ivshmem_update_msix(struct pci_device *device)
 {
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
@@ -145,19 +170,11 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 		else
 			mmio->value = 0;
 		break;
-	case IVSHMEM_REG_LSTATE:
-		if (mmio->is_write) {
-			ive->state = mmio->value;
-			ivshmem_remote_interrupt(ive);
-		} else {
+	case IVSHMEM_REG_STATE:
+		if (mmio->is_write)
+			ivshmem_write_state(ive, mmio->value);
+		else
 			mmio->value = ive->state;
-		}
-		break;
-	case IVSHMEM_REG_RSTATE:
-		/* read-only remote state */
-		spin_lock(&ive->remote_lock);
-		mmio->value = ive->remote ? ive->remote->state : 0;
-		spin_unlock(&ive->remote_lock);
 		break;
 	default:
 		/* ignore any other access */
@@ -315,7 +332,6 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 {
 	const struct jailhouse_pci_device *dev_info = device->info;
 	struct ivshmem_endpoint *ive, *remote;
-	const struct jailhouse_memory *mem;
 	struct pci_device *peer_dev;
 	struct ivshmem_link *link;
 	unsigned int id;
@@ -323,11 +339,10 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 	printk("Adding virtual PCI device %02x:%02x.%x to cell \"%s\"\n",
 	       PCI_BDF_PARAMS(dev_info->bdf), cell->config->name);
 
-	if (dev_info->shmem_region >= cell->config->num_memory_regions)
+	if (dev_info->shmem_regions_start + 2 >
+	    cell->config->num_memory_regions)
 		return trace_error(-EINVAL);
 
-	mem = jailhouse_cell_mem_regions(cell->config) + dev_info->shmem_region;
-
 	for (link = ivshmem_links; link; link = link->next)
 		if (link->bdf == dev_info->bdf)
 			break;
@@ -361,7 +376,8 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 
 	ive->device = device;
 	ive->link = link;
-	ive->shmem = mem;
+	ive->shmem = jailhouse_cell_mem_regions(cell->config) +
+		dev_info->shmem_regions_start;
 	device->ivshmem_endpoint = ive;
 	if (remote->device) {
 		ive->remote = remote;
@@ -400,14 +416,17 @@ void ivshmem_reset(struct pci_device *device)
 		device->msix_vectors[0].masked = 1;
 	}
 
-	ive->cspace[IVSHMEM_CFG_SHMEM_RW_SZ/4] = (u32)ive->shmem->size;
+	ive->cspace[IVSHMEM_CFG_SHMEM_STATE_TAB_SZ/4] = (u32)ive->shmem[0].size;
+
+	ive->cspace[IVSHMEM_CFG_SHMEM_RW_SZ/4] = (u32)ive->shmem[1].size;
 	ive->cspace[IVSHMEM_CFG_SHMEM_RW_SZ/4 + 1] =
-		(u32)(ive->shmem->size >> 32);
-	ive->cspace[IVSHMEM_CFG_SHMEM_ADDR/4] = (u32)ive->shmem->virt_start;
+		(u32)(ive->shmem[1].size >> 32);
+
+	ive->cspace[IVSHMEM_CFG_SHMEM_ADDR/4] = (u32)ive->shmem[0].virt_start;
 	ive->cspace[IVSHMEM_CFG_SHMEM_ADDR/4 + 1] =
-		(u32)(ive->shmem->virt_start >> 32);
+		(u32)(ive->shmem[0].virt_start >> 32);
 
-	ive->state = 0;
+	ivshmem_write_state(ive, 0);
 }
 
 /**
@@ -431,7 +450,7 @@ void ivshmem_exit(struct pci_device *device)
 		remote->remote = NULL;
 		spin_unlock(&remote->remote_lock);
 
-		ivshmem_remote_interrupt(ive);
+		ivshmem_write_state(ive, 0);
 
 		ive->device = NULL;
 	} else {
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index f82bbe8d..da100e18 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -133,7 +133,13 @@ struct jailhouse_memory {
 	{								\
 		.phys_start = start,					\
 		.virt_start = start,					\
-		.size = 0x100000,					\
+		.size = 0x1000,						\
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,	\
+	},								\
+	{								\
+		.phys_start = (start) + 0x1000,				\
+		.virt_start = (start) + 0x1000,				\
+		.size = 0xff000,					\
 		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |	\
 			JAILHOUSE_MEM_ROOTSHARED,			\
 	}
@@ -185,8 +191,8 @@ struct jailhouse_pci_device {
 	__u16 num_msix_vectors;
 	__u16 msix_region_size;
 	__u64 msix_address;
-	/** Memory region index of shared memory device. */
-	__u32 shmem_region;
+	/** First memory region index of shared memory device. */
+	__u32 shmem_regions_start;
 	/** ID of shared memory device (0..1). */
 	__u8 shmem_dev_id;
 	__u8 padding;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ce1c12464e690fa53614200ed2fafb8b9e31093b.1578313099.git.jan.kiszka%40siemens.com.
