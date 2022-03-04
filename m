Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBC7NQWIQMGQE6R5XMHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id D38DD4CCBA3
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 03:16:43 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id a16-20020adff7d0000000b001f0473a6b25sf2476003wrq.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 18:16:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646360203; cv=pass;
        d=google.com; s=arc-20160816;
        b=PZgmchN1rsBRNM5SdRrVVTyV3iwMaYOXuEQWPMHzSyh21r9ogxYUhWEvuQci+E+g/x
         cTn1+x+mo5FuZ+RIs3Q8AM718sJyTDVt+4+gpKacficD6FNUQpjPJecvD9Lqkrec0ml9
         m1TdlaUGw7jwnpQ1twuRUjAlHJTDgL+WWxJSZVq0lT8yD4lTyKVeMEMb/TwmqJVLP9Jd
         rN/AfAF5JI1VJYDcH1t4YEUC2mf9EoKKRF5nk9AficBuL2V9WoECsUm32riLl/16eLSk
         T0lkHHgpUAHopfXhc0dmuC/ZUbaYXlX1OBtRRhxQdsx6zVX1eNcVSXImKDnmAj33cR1m
         JP1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=BC5D+HvgQwaENc7sKl7glAuJRMlkVutlSIopxlLZAdE=;
        b=w6Sg1J3Tuh4u647zOzKhUX5NQ7DyY37x2SYi8GXkSM3kgSnQMYYpZPgVtCJlnkFmu9
         pB3a21bDgSZYq+X874prm0gDAlsuIBXuG80W6BI0l8RgTvjbw6aQwSEiAVeLZGhY5C8G
         Si3eSSTzSDIbNgH73VWFGwQMPJ0xXfiKvFT4ILmAyJ3bYLP4j3fqHvZf5r0vprxE9QRv
         +uZD5e6E/26ePybtSKdQcchQRaEbiZCmD5VmYRyWIHTfuKT9mTxL4TY7ty3XEkfQqndM
         C7QQi9mYC0tpB/SuUlJR/gDIECrLWxSirhvAbOWEEw1oSiRiyg0M9FP2Xgk7tzwpxCh0
         hVPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q4EJ0XIx;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BC5D+HvgQwaENc7sKl7glAuJRMlkVutlSIopxlLZAdE=;
        b=VVpf4hlXxFzyR5mOVstoF9TecspyAXgn0SuPRI5WyL+3W0ezw+w0VBu0be37msQSQS
         gtEGibJJyA+csgjGcZJO7lwuFf54yIc/y+GF62YXsuruKaFOQxjU70Bbrpsaavm5FSoL
         gmd+2IFfxnw5TIZT8i1Fgay/wjFl4F23ORrPCUOxCGeGNJNveJlF5X4mHvTdzEcOG5IV
         btwVG5yvlQ7BD4x3SdCM/Lcm6Tb0PqYm8HAGoRcjAWcydvsUKehDk+w6odvvct+5vhBL
         ggN9AznD3p+4K01NgbV6c1gFA9g/1pN8VMO39t7NJLf/DSWMENVc/OhdXGODGCapNeEK
         o1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BC5D+HvgQwaENc7sKl7glAuJRMlkVutlSIopxlLZAdE=;
        b=j7u6x/25/kpzWYhSV6aeoFd2EzojU+LzqqRXmcfnWfwymMxWuFAPQRrdxX1gIXA/VA
         MNe04Y6ABmgr3fC+Kc9r1o9sqtbUt+55sRtSj3SCQdq75YQx+FyxcNht+E3flLQaJSmX
         XapEFslKjRoxdHC3luKNDdTifUa3stOb4ZbrXRLfYQaoLxH2R10FoKkXfRU9Na3yQUDw
         BTNXT8rZ2DgUrgQvg11F6fXUe3+FUzvT4LMBUy1p+b7mTzId492yxQxs3KmN8zdbtpAm
         wn/yyD9Nw7dxg9IpoPzJSWHSD20ecoX7r8pjOW4T09bRQjfSKUAoh7d16nafrmDyU6Ca
         mF9A==
X-Gm-Message-State: AOAM532MRmNFn1OvjmAuMMQtWk91We8859Rtp3gHK6AviReuMeqy93r+
	a2qagyLvHsiuytLE0fAeR1o=
X-Google-Smtp-Source: ABdhPJxm36OGw2P5izqqbvYSErxjC2ZutcWYkKHG/n7cqn9zFMepJuEimtMPOLk9memi9plgFmoQYw==
X-Received: by 2002:a1c:7416:0:b0:380:e4e7:374c with SMTP id p22-20020a1c7416000000b00380e4e7374cmr5806354wmc.63.1646360203620;
        Thu, 03 Mar 2022 18:16:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d0c5:0:b0:1f0:7735:e337 with SMTP id z5-20020adfd0c5000000b001f07735e337ls575967wrh.1.gmail;
 Thu, 03 Mar 2022 18:16:42 -0800 (PST)
X-Received: by 2002:adf:ec05:0:b0:1ef:5a9b:2906 with SMTP id x5-20020adfec05000000b001ef5a9b2906mr26859889wrn.624.1646360202449;
        Thu, 03 Mar 2022 18:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646360202; cv=none;
        d=google.com; s=arc-20160816;
        b=EA+m7fwrpnf5kc5QS3rjc/dpok99IHRMSbRbD6v1ezzrkc+m14igh6xgLfsbuivuDx
         H6hAY6sTXz2Zws6330NqQrGk0pS1QBPxQddx6Fg6yAd1TItomUJuLOlc7AohOvkY/WvQ
         ZXmdK2KWX/EZbwS1DG/5LwRbfZO6T7vzFoVnQeDXw+VZpZ1auZJIdaAYuMwWF0UYRrtO
         jzgqpjrZqiCVuYWSFEkaXgPW7ROuBc06Euqlxt2i7Fuy6IU9sq8s3aE6AxchTmlHRzvK
         salguo4VqAJRAHkmuUCAhJrE7r1LOHSjEKQXYkeeU4/YTk/nPKVOMY3Ebx+ilv9PA41q
         O1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MpzecE6rQF2L7jvbllFtBhtLi8pD7mEzxzuIBco9+4Q=;
        b=I6UjsnNYiTgd6PK/iXbp8CxMQ9Pv9JERaGZKhn6076OctLbJ9jTadyIzbEAmDsbeAE
         QgBIsd4ucBj7juCRxfhL/6Qlns5avo7gMaPVj0A16RITf9otqMpLllF2tc+oO3XSKmzb
         uD2inKUmcF3T6UXY92rzmx9HRHVyf7QQbyt1nCD1sKm7RCswB2j8NUD525fYiii/BNdu
         A2iyi1YrMxRsXEEQicQr8VNYvUNHoueyB909WGg3//Qy1o0VPKMopAOkee4mRJGkHCVj
         zw2qi2PrgEmynvNrEBGBeZVer6aTIaShKiPSjWClo7ZCRy56+qHhsSc0OzWtNItTm9xR
         UobQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q4EJ0XIx;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id az15-20020a05600c600f00b003897fd78dfcsi24103wmb.2.2022.03.03.18.16.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 18:16:42 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2242GetU067474
	for <jailhouse-dev@googlegroups.com>; Thu, 3 Mar 2022 20:16:40 -0600
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2242GeCU033633
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Thu, 3 Mar 2022 20:16:40 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 3
 Mar 2022 20:16:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 3 Mar 2022 20:16:40 -0600
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2242GOij018363;
	Thu, 3 Mar 2022 20:16:38 -0600
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH 4/4] configs: arm64: add ivshmem demo to km-am654-idk platform
Date: Thu, 3 Mar 2022 18:16:15 -0800
Message-ID: <20220304021615.2862-5-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304021615.2862-1-mranostay@ti.com>
References: <20220304021615.2862-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=q4EJ0XIx;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted
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
index 4fc23e0b..227b8447 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -23,9 +23,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[13];
+	struct jailhouse_memory mem_regions[18];
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
@@ -134,7 +167,10 @@ struct {
 			.address = 0x01800000,
 			.pin_base = 160,
 			.pin_bitmap = {
-			1 << (168 - 160) | 1 << (190 - 160), 0x00, 0x00, 0,
+			1 << (168 - 160) |
+			1 << (189 - 160) |
+			1 << (190 - 160),
+			0x00, 0x00, 0,
 			},
 		},
 		{
@@ -147,11 +183,20 @@ struct {
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
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220304021615.2862-5-mranostay%40ti.com.
