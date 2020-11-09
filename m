Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBUGPUX6QKGQEQSJ64XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id DC03A2AC061
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Nov 2020 17:01:20 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id s25sf3526828ljm.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Nov 2020 08:01:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604937680; cv=pass;
        d=google.com; s=arc-20160816;
        b=bpN+ufPL0mfJ7fG8zMmcb2WZe2sjtJMAfQ5ZbMRrp+WIcbhOLHL5jfGSRDAfOAkGRX
         smwzbmNKXUlyjsQf4HBLOjVWUMjmitkWhr8DcJdg6j3bzxTThPvjZik4lKwj53qxtrqM
         IYd4+A441SDfm/B7k7t6H9ShwrbUCk4eaBoAr0zqbyt4ngx/m37+2EnhMhVcQJjuSTDI
         CboZ81qWtveEzHQoX0f/qLNzasiQtyD9DQ7zY5Q0bsDOMVIbpH3FkEU004PFcUURUOBx
         XiisGL5vdBdROm1bnimxgjLjs/Dg5EBpqTtRkx/tNp+85Ex1k3L1YcqiwPirTXPTFPS6
         jVQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KyM5jw0o+NwBEwPOhf7IS8cAMVxW/2vGlrEJtJCcPpE=;
        b=zfommqD7HeLbaBIytUcGFskchU1BWuqeRbJwnpbugGrH/daOr+cM90lgeiuD/nhO2q
         QAWverqcuy8dtdaa+/83NkqPLt8imGvgZYfPRuA2ofO2tBfJ190LymrWVG0f4dQNYmO4
         uYcB9Io+pNppQvLK4H6ivO13oSPCPlAPEE2QDzpFPWWGEF+C434MjHxs91U0wDvUxDpi
         J0wAMmXyidmjCi7vG+/kfOk1rVbd6sCwJy9thasHZCjlsqT6kEjirHCmih1mzY7PnJ0I
         4Cplm1eie/igRQGl62LXmxuXzpH0WyxgKvYd4NVWjIpfABrQY2By5g7UpN8z9IRdZ5Y4
         FiiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=RqoreR6C;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KyM5jw0o+NwBEwPOhf7IS8cAMVxW/2vGlrEJtJCcPpE=;
        b=YHIxjsvS7ei+d2/bTgaXWq++yWsq4tos9S25yssDVvnU2FLxLRLkHqSz6Mzyg8nkOK
         WfdBC2TPUOlxgFWkjimC1wG0/2tCqar3AA2J8mVV6+HQHdOI3OaWDqPEGlA6xUG0GsFp
         g7TulG4yoxpBz94o6J7w5oHLu+j7PtbmVjeyD48wVk1EmGBxg8LhAFSrwFKzR5ghDiic
         VYm2ilCS47N4EujOI1o+ovPL+HXCgYxz5hkbxe8zJkZdVzbxK1LuPP7gdBbQ1Dzl2Td1
         i8zOEa1IAwoiZTReAL13mK8CkYbA2uQfKb2k9wp5/S65RxxabCSzJ69UMu7DJgxpUlSU
         8Bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KyM5jw0o+NwBEwPOhf7IS8cAMVxW/2vGlrEJtJCcPpE=;
        b=hV5jl54c4l67afSEmJyRbbAKLnPMOAV+2n169y3ytOPaNaxeUUIHr/UM0OULCSjGB4
         1e7v2RAnB3RiJ3NGux1pEFjtEeBQIYg/pig16JzLJ6rb1jrRMNpZ2oCMWdexi1kCUvrq
         EfAwKxQ89alqNRcKGvA/tTDGw2wY13P/ES5fk3tP+YFTTnb78XuhkjsG2Y2VxncbAxgo
         5mJaNmUEpnQ12MgD/qerOHJaH6fjV/VhG0LWKIBmbKd6TDrldTGnJyWAG9yXKfdYx5lj
         oupfmgP0SdXoaxiAFTnHAGXZmKmEfs7mTm68uJ2v/IYv1e5Cc/X2uviyFPXg4AdNwl5P
         Ssig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530nw2eZp00v1oJZRAKmGfjhUmCIo4du0GSiqiHR9ntJiUZMSEl6
	gpmD865NgiGzqYeDuWTJJfw=
X-Google-Smtp-Source: ABdhPJw0Fwsw69XzXoxhCP5/ViqJ3ZghCbMxvFcd9ywAdcgqXMfuJ3wtVGoxFfpVYUjWNSfRRikZvA==
X-Received: by 2002:a05:651c:11d2:: with SMTP id z18mr6281111ljo.423.1604937680332;
        Mon, 09 Nov 2020 08:01:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:914c:: with SMTP id q12ls152100ljg.8.gmail; Mon, 09 Nov
 2020 08:01:18 -0800 (PST)
X-Received: by 2002:a2e:8789:: with SMTP id n9mr2209609lji.345.1604937678828;
        Mon, 09 Nov 2020 08:01:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604937678; cv=none;
        d=google.com; s=arc-20160816;
        b=yoS7UA/r35SmnOb0d3ejWQ7GCBpEDoRdVMGPkFuRiUKu2vRthcfTujXmAS7z9xdf04
         SdWfvygfM+zO554aa/Q3BP3hxTObD5SvBb4/JvlrWGhiD1Gb3CZwrJzdL2b1JJ0nf3rv
         pi/R+2I+lNZ2H3JmaFuDfcBS90MohSPtSyUlBp5tt5FEfC78tUokro9sPUIoUlb/s4rL
         iWRpXmmYB6CitpiqIaU9wbIYenXPuldsrW5XjVi6BsQlmjaOYHNjJr4wFDPeh+3SfFPK
         ys9Yl7I3jDybwn2RbLFM/uFslkn7ZisUj0UjGrcXXzy4t0YSBGp3DothB1Qs8Z21JxSG
         ZVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JPHn3lltinZ1Z9Krbt7TGPYwx5FKwMjmVU3xbnIdPW8=;
        b=Jcfeuh3HFKVoF+xJOqHPofkv9Azj/NZnjov312S68NFg9XFeWzicjlhiI/j8Dj6j83
         UjPyQ0za43fPP6zdKgnmPOXrB/UFm0V1Dx4np8qH7GLjkZ1JhR5xJKvckqHa28xFHGWA
         I2RhMnw1qVl83SdAVQT+29JYY/0DxlRXOJ3WYqH0f75xKeWOoEtwQ47OeYuCF1zakDSn
         AsO1GX4wUYAhND76w2+NL6JNQ0xHgDuyNDossdOzM4S1HLVaIRfHxOeIKkHcQo8HrLYw
         qKZHU2nSuXzj2r524UVoov0/6ndyiFXGC8DlqVmMG84Ftziia2ifQhGSjYYjTf4S+EsD
         1I7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=RqoreR6C;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id h4si311043ljl.1.2020.11.09.08.01.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 08:01:18 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CVG262JPwzyWq;
	Mon,  9 Nov 2020 17:01:18 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.876
X-Spam-Level: 
X-Spam-Status: No, score=-2.876 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001, LRZ_URL_PLAIN_SINGLE=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id xbSCqC93S5vB; Mon,  9 Nov 2020 17:01:17 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CVG2552QPzyR1;
	Mon,  9 Nov 2020 17:01:17 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2 2/3] configs: arm64: use union jailhouse_stream_id into MMU500 configs
Date: Mon,  9 Nov 2020 17:00:59 +0100
Message-Id: <20201109160100.103095-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109160100.103095-1-andrea.bastoni@tum.de>
References: <20201109160100.103095-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=RqoreR6C;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Additionally, compact ZCU SMMU IDs using the mask+id stream specification

Example of the mask-id stream_id configuration. Compact all 10h'07*
master IDs by masking-out the lower 4 bits.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/arm64/imx8qm-linux-demo.c       |  7 +++++--
 configs/arm64/imx8qm.c                  | 16 +++++++++++++---
 configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
 configs/arm64/k3-j7200-evm.c            |  2 +-
 configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
 configs/arm64/k3-j721e-evm.c            |  2 +-
 configs/arm64/ultra96.c                 | 11 +++++++++--
 configs/arm64/zynqmp-zcu102.c           | 15 +++++++++++++--
 8 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
index f13ca7bc..e8e8b217 100644
--- a/configs/arm64/imx8qm-linux-demo.c
+++ b/configs/arm64/imx8qm-linux-demo.c
@@ -19,7 +19,7 @@ struct {
 	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[1];
+	union jailhouse_stream_id stream_ids[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -194,6 +194,9 @@ struct {
 	},
 
 	.stream_ids = {
-		0x10,
+		{
+			.mmu500.mask = 0x7f8,
+			.mmu500.id = 0x10,
+		},
 	},
 };
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
index d63c73cf..2ec4f4dd 100644
--- a/configs/arm64/imx8qm.c
+++ b/configs/arm64/imx8qm.c
@@ -20,7 +20,7 @@ struct {
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[3];
+	union jailhouse_stream_id stream_ids[3];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -54,7 +54,6 @@ struct {
 					.type = JAILHOUSE_IOMMU_ARM_MMU500,
 					.base = 0x51400000,
 					.size = 0x40000,
-					.arm_mmu500.sid_mask = 0x7f80,
 				},
 			},
 
@@ -209,6 +208,17 @@ struct {
 	},
 
 	.stream_ids = {
-		0x11, 0x12, 0x13,
+		{
+			.mmu500.mask = 0x7f8,
+			.mmu500.id = 0x11,
+		},
+		{
+			.mmu500.mask = 0x7f8,
+			.mmu500.id = 0x12,
+		},
+		{
+			.mmu500.mask = 0x7f8,
+			.mmu500.id = 0x13,
+		},
 	},
 };
diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
index 90a0ce4c..ace9cd3a 100644
--- a/configs/arm64/k3-j7200-evm-linux-demo.c
+++ b/configs/arm64/k3-j7200-evm-linux-demo.c
@@ -26,7 +26,7 @@ struct {
 	struct jailhouse_memory mem_regions[19];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[1];
+	union jailhouse_stream_id stream_ids[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
index c3ac331d..d0c8aee3 100644
--- a/configs/arm64/k3-j7200-evm.c
+++ b/configs/arm64/k3-j7200-evm.c
@@ -21,7 +21,7 @@ struct {
 	struct jailhouse_memory mem_regions[32];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[1];
+	union jailhouse_stream_id stream_ids[1];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 5b6aa82e..1b8b3c4c 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -27,7 +27,7 @@ struct {
 	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[2];
+	union jailhouse_stream_id stream_ids[2];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index ab13fedd..aa5b47a9 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -22,7 +22,7 @@ struct {
 	struct jailhouse_memory mem_regions[40];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[30];
+	union jailhouse_stream_id stream_ids[30];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index db65ae01..19be84ae 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -21,7 +21,7 @@ struct {
 	struct jailhouse_memory mem_regions[11];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[2];
+	union jailhouse_stream_id stream_ids[2];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -161,6 +161,13 @@ struct {
 	},
 
 	.stream_ids = {
-		0x870, 0x871
+		{
+			.mmu500.mask = 0x0,
+			.mmu500.id = 0x870,
+		},
+		{
+			.mmu500.mask = 0x0,
+			.mmu500.id = 0x871,
+		},
 	},
 };
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index bdcb04b3..1a5d29b3 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -23,7 +23,7 @@ struct {
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
-	__u32 stream_ids[8];
+	union jailhouse_stream_id stream_ids[3];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -147,6 +147,17 @@ struct {
 	},
 
 	.stream_ids = {
-		0x860, 0x861, 0x870, 0x871, 0x874, 0x875, 0x876, 0x877
+		{
+			.mmu500.mask = 0x0,
+			.mmu500.id = 0x860,
+		},
+		{
+			.mmu500.mask = 0x0,
+			.mmu500.id = 0x861,
+		},
+		{
+			.mmu500.mask = 0xf,
+			.mmu500.id = 0x870,
+		},
 	},
 };
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201109160100.103095-2-andrea.bastoni%40tum.de.
