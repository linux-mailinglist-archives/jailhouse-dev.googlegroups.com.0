Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRB5VGROIQMGQEGFBBDYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3c.google.com (mail-oo1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 063374CE25D
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Mar 2022 04:05:28 +0100 (CET)
Received: by mail-oo1-xc3c.google.com with SMTP id r18-20020a056820039200b0031d6f9170eesf7136505ooj.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Mar 2022 19:05:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646449526; cv=pass;
        d=google.com; s=arc-20160816;
        b=p+bSJMDPJELl9UEzxT+UUX1Guv4HQquDsh74p3Dw/CVNXdBQlO5UEx2JgWB8vlTdLU
         u729PJ1qBYCIiaUckXPV5lXQa4Y6IzkVG++xmV9dHupzi+wG5nO6t20jGGln/Z4AMbOy
         bDZUOTToDczupjqb0HKNSBtqs1WIyhGdfy7v8lvOf4WJFAQwmwCikUnezH40g6Nx2uh8
         h5Itf3omwuBE+FsQGJdvle1LQ/AbFUqURD+/VqHNTIz5SixpCKJML6lB4MXlfRaBRN5g
         CNd72nhR/S3ImVBDma+FRau8YnlICyZnMXhWf1yGx4FcQDDstXdhHWt8avLzBZPFD6TZ
         CNLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DvUVoH645QL0YlMb8BKUn6EndPhE21hDbCT5lp/lQ2A=;
        b=SDzbRBGqEzZvZJzJ0hklDgq6ATFnuw0YoAAZ+SlFBqmSKfa+jhiOtTSQc4LqC5iiPu
         nlWvAUTprsODKodKccNo5C8JVEsUaOPjuwhXlpAEk1vdkDht9LIZlK+ng+X68wL5ihDb
         10yccBeoPNXBKIqLhRcwuD5avhI3/DFB8m6GcqyQdnO+Z/0w38rX7xT0lLg+76Z+7ba3
         mdZ1fiq7eUdz+hkMw2r23lyYQJbQS+Pd6GmHE6kaxYcYtfkWeN/ncRO1XmVfSXq+vml1
         FR1aQoAsQkGwkSVJWfEmSxqKzaS+4Flt3IIgmsEauaMPJodbCwL8DRR8amdh69LK65tx
         JvIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tyfZTS1B;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DvUVoH645QL0YlMb8BKUn6EndPhE21hDbCT5lp/lQ2A=;
        b=ULlW6wTaAXOle2ZIyRDuB9kdnYmFgnIdvzqC26qOaAlUhoMMiAacsvlSsyKEq6pTJl
         nKrvXPYddkXYiJLg2NM8cGi4WtF5FHi/FBA6kcjTfHWSVvOB5tdFnF2r/aobkeYea8zp
         s1tPYGH+wXOmSTbuTYamcd1nylQi3htjToWXHkz83Om0OXUqOLE3ifxF+Og5bN91c5z/
         cJWpHHjpPuU4L1nn6Yx2wZLRgbpYQYSSqG8e3xY7zbNTFOkirYxrXHenquCipq8/dnrq
         TNl1BllzVaUsbfvBhHVqzZP3u14xXWTFn+pBTk2/Pqa3lM2ffJZtk/fuJcwA0B+WD7x5
         8TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DvUVoH645QL0YlMb8BKUn6EndPhE21hDbCT5lp/lQ2A=;
        b=3J627In+3tScJLa9zmDvDmV/JY+G++R71BEppLK9bFnmek/2ZqFkI7bDGy0BzVhdX7
         N7ekeF0JVmSgxXUON4Ve5MA7q6MuCwa/Nmc4JG1dXWdqjvhn+91URclOrDPKX9reXe7R
         AtfiqfXrb89FC6uRl9qGaEO/jFgNdtMFI2UAda01zj6+zKDGX1FVsXecaon0vjHOlanN
         NE5WkmrH7PJJK4kLSG46pIkXxDkwCTmsyg5FCRKtuPVW9hjSt2Iu33+MjmLHP2ZXYmWT
         feZsmO40xmW8vXONyjx7mmRHdsw26f356Ij3XKnJREPD18tzOMgzpn3p4SRc5wSDUVZl
         RE/Q==
X-Gm-Message-State: AOAM531KPG9MnyR/LwvWno8nELBC8kXoM/tArTDkGqWB1lmGMcsjZGBp
	ltz9dMjNfAPu8l+p8YKc7B8=
X-Google-Smtp-Source: ABdhPJyy1A+f4PxwhmAjHSMWPcTZDm5R+If12uvay1mbiEqsHoiF0uQ25UBRzPioFSQ2sb7ZOSQYkA==
X-Received: by 2002:a05:6808:14cf:b0:2d9:a01a:489d with SMTP id f15-20020a05680814cf00b002d9a01a489dmr1333126oiw.232.1646449526531;
        Fri, 04 Mar 2022 19:05:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:2405:b0:d7:627b:b530 with SMTP id
 n5-20020a056870240500b000d7627bb530ls2372191oap.9.gmail; Fri, 04 Mar 2022
 19:05:26 -0800 (PST)
X-Received: by 2002:a05:6870:d582:b0:da:b3f:325b with SMTP id u2-20020a056870d58200b000da0b3f325bmr705897oao.267.1646449525905;
        Fri, 04 Mar 2022 19:05:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646449525; cv=none;
        d=google.com; s=arc-20160816;
        b=KE8ez8pN80EZS1YjYaAorjT1tMO9cvsuuY61/6T4G6JgT0wnB3s+htZbVnEHioALdy
         xSLIXf+04pxUu5+mbXk8vXwzbdvnxNos/JDRn1MZQPSREWVgi3uXyaIU38fynHnBaLh4
         ZoZd1mkBTVPF+fbNuJ9Q9ln3FlfWywHSZFg1KIUKZZCTDHh8wPGWnLSHGEL11fTelD+5
         lR1PaSKKBlzXyxtiNQ8WJyh0/oLoxKTv48aG4XB9jm7K5FAAA+cv14b9alTMWGLaeipZ
         hYKOYPxjUwrNu487b30a5A2cpY0G9BY2g7E3GR3m02FJDbriKpMuxVt20yIlz5P9zQ3I
         sB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=G0sLCpHB4XAa+WS9goTUJkzQBePcRhjtZ9/Ehqrkg+g=;
        b=ufMW+B1kPcpihwJb4W4UbdNvRVXvKqVUE15oHitq6GoVpETMS05XoNit8w/c94Cywt
         T0bpPqjvjXBSW8vSEoxKChrlDC4ntXq9MP39SXEJiZ+5AOO1mus38AdHH4nM0DIZQUuK
         bAgMk49hytS42UESKTvK/HdvLNG9DpK9pJ/OkbqrChdc6e0BDzVU+0y3R9RlnHNsMiR0
         3o5jxol8rh/vMBiC6LMEJm+Uz5I5jYnDkF534yXXD98paKD7a1uCQa28AAGLC8L46b32
         RaV+h1irCzJGiZilShk+GxUQu7xsOspsE0J/f6R3kF+q479fkOrM6eFjbHxcy1tn65qC
         onTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tyfZTS1B;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id 3-20020a9d0803000000b005b211866133si90257oty.1.2022.03.04.19.05.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Mar 2022 19:05:25 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22535PGL071465
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Mar 2022 21:05:25 -0600
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22535PhE031772
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Mar 2022 21:05:25 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 21:05:25 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 21:05:25 -0600
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22535Bvp123249;
	Fri, 4 Mar 2022 21:05:23 -0600
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v2 3/4] configs: arm64: add ivshmem demo to km-am654-idk platform
Date: Fri, 4 Mar 2022 19:04:57 -0800
Message-ID: <20220305030458.2938-4-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220305030458.2938-1-mranostay@ti.com>
References: <20220305030458.2938-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=tyfZTS1B;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

Add ivshmem demo device in addition to the ivshmem network
device.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 configs/arm64/k3-am654-idk-linux-demo.c | 55 ++++++++++++++++++++++---
 configs/arm64/k3-am654-idk.c            | 49 ++++++++++++++++++++--
 2 files changed, 95 insertions(+), 9 deletions(-)

diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index d03fd4cd..fdf5fea8 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -23,9 +23,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_memory mem_regions[17];
 	struct jailhouse_irqchip irqchips[3];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -54,6 +54,39 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x8dfa00000,
+			.virt_start = 0x8dfa00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x8dfa10000,
+			.virt_start = 0x8dfa10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Peer 0 */ {
+			.phys_start = 0x8dfa20000,
+			.virt_start = 0x8dfa20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Peer 1 */ {
+			.phys_start = 0x8dfa30000,
+			.virt_start = 0x8dfa30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* Peer 2 */ {
+			.phys_start = 0x8dfa40000,
+			.virt_start = 0x8dfa40000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
 		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 1),
 		/* RAM load */ {
@@ -120,7 +153,10 @@ struct {
 			.address = 0x01800000,
 			.pin_base = 160,
 			.pin_bitmap = {
-			1 << (190 - 160), 0x0, 0x00, 0,
+			/* vpci */
+			1 << (189 - 160) |
+			1 << (190 - 160),
+			0x00, 0x00, 0,
 			},
 		},
 		{
@@ -133,11 +169,20 @@ struct {
 	},
 
 	.pci_devices = {
+		/* 00:00.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
 		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 1 << 3,
-			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 0,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 5,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index 0d6ae59a..bdd526a3 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -18,9 +18,9 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[5];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -65,6 +65,37 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x8dfa00000,
+			.virt_start = 0x8dfa00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x8dfa10000,
+			.virt_start = 0x8dfa10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Peer 0 */ {
+			.phys_start = 0x8dfa20000,
+			.virt_start = 0x8dfa20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Peer 1 */ {
+			.phys_start = 0x8dfa30000,
+			.virt_start = 0x8dfa30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* Peer 2 */ {
+			.phys_start = 0x8dfa40000,
+			.virt_start = 0x8dfa40000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
 		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 0),
 		/* RAM */ {
@@ -206,12 +237,22 @@ struct {
 	},
 
 	.pci_devices = {
+		/* 0001:00:00.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
 		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 1 << 3,
-			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 0,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 5,
 			.shmem_dev_id = 0,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220305030458.2938-4-mranostay%40ti.com.
