Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWHNTL6AKGQEQFVWDZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C7328DB45
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:12 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id y83sf281542wmc.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664152; cv=pass;
        d=google.com; s=arc-20160816;
        b=ptkRUNbe3DixxLItXSstdKkxRnmt9KbXCwXsv59G13C27CG2qbVrnGTwuBW5I5LZT+
         byeMrvdWvi2JjCrWAsYC6gIWWF6HGvUth83YgKnLNsYK78TUbsBXzrVHRBdnmHhAZNhR
         eQZclluQ7+pn7N7ayqxtOOaL1txFV7GKZSXugF8kDTF3ksAiWXv2XOq55H4wx0m1NbOb
         ylRS/FySDIF7qNCVx+/CPmNpw1SP10rUr/sCM4y1QIHhq3MZUgj3hZQZzTJMhN8aoBTP
         +jMcDAmry+EbFXrFJYBgRmxIGW0vxarpIFACTbQ+E4GykzG7+CA92mG8IlQNl3Ipeiuu
         /8wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=yyYUWITP0Oy10auwtpzEcEqj3qk2/QzrQI7Mvwwrpxk=;
        b=LebeGHW8/1MoSlRuOnQuIQu+roXHY8eR/owkJfJZsKANaYXtey2w6sA/2OhPiPuv1V
         5gZMPQkOa7ucuw+WS4z04GZh90CUtnUI7v+cCvhGzd97NHPHoUVkJczqIh8Vj+MUKAOe
         V2vGVkxg1t4YjA2gh5O4elryeRwxEgTc0bK9mYnAVmegH+499044Tmg+CaAYP4+2hLPu
         e4LygU/pBsqG98EnykDJrMwXaOptUUotJfYbtFsvH04uIVa+1ZXoYC63AvQiGUrDsD7N
         TY+SQBOlQp/+ZOUF6Yr9RCj1Pt2g4W2MNrw6+qidJGfHVWjn831mtW/L72LqUBFegEiX
         jU4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yyYUWITP0Oy10auwtpzEcEqj3qk2/QzrQI7Mvwwrpxk=;
        b=b246HB4+WqWWbinBCdnhnH9SehP934GqkLEqoQeOaxu6xO5YjDD62WDRPae3yRrnGK
         jQJw8XjyIXwaWCrr5nqv/++jESoiQF3nB6PUH9ODilfhuY2lePctXbi80eqnvXWTPBCA
         xR7og4iKA4oOY2mCgCj2T0pns9fjXGdRs8ZeSL3yRLuxypoFzfPIa26vWEqRbpRzmizO
         sRMpJSIAi4LgvJQhw32wvgzx8vq/dLeKdDSfsTyH0b99t2TbpUY/9P/9lZLY8Ic/jsL6
         5lienKV8LVBgtC7I1v86+qyyAqM1Udg05sa7d+OAGw2WEKSKGNNIEE0Tlsllt1x+uwQB
         4h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yyYUWITP0Oy10auwtpzEcEqj3qk2/QzrQI7Mvwwrpxk=;
        b=ClGcx6XqhVsg+vlOYUpHxsyIR6PReaZEvGxd08c2CYcQY1lbXiGW82RZwr9lMs9Onn
         aEM3C2PvdFHIPwPmLL+Oid8yS2xCa5s92iQFg9XWF2iGFxbuzymhVnEz7CoN1nXRGASk
         1AhHOBzlZFQAhCYXZ0Jo7N+WpYYvWA0Jfcz7zlUCqcikhstSEMW+233NtVwbE7lZP3pg
         QYF45YCMBdUjC+tj0H7y26eg+fH05IOcaCwZXFvvaSaO3SpirXM5aiqwgnZL0IrWco6w
         j2xGZJ1Kakk3K9GGBya9tDRcL29TZyTEJUh5nGpRcbpk54Z7EcE/knDDOpezNqq6alAo
         e1lw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533eKInzIuHn0T5+6Maz+js8lukqAbnBps2ln31dsm858VfYvcxy
	yde4nfV+xmFyKJFjE1OISjs=
X-Google-Smtp-Source: ABdhPJxlV/WYf7W/1ut/p5EuXpQfxgka/JBpcAkb9GTWCXyptHoAj0fFDvn0A4hRFk//d9hMEVD4gQ==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr4392971wrm.53.1602664152463;
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a544:: with SMTP id j4ls3146341wrb.3.gmail; Wed, 14 Oct
 2020 01:29:11 -0700 (PDT)
X-Received: by 2002:adf:e88a:: with SMTP id d10mr4333568wrm.247.1602664151329;
        Wed, 14 Oct 2020 01:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664151; cv=none;
        d=google.com; s=arc-20160816;
        b=aRpKT/FtduK+V/IcKDTkVlxhhL/jt8JIsKydOnfiw+PvBbdkf1NIM+gmzhS8CsoHMX
         tbmW/XD5JwI9q2GdY8uLpYLe/knsq3iqPb6cHDr5UagaKG7oakktf3WfMXCTu4/JUdHX
         M4ooFeGXsiuhdytt1+Eh7lBLR9/RMVZevc5nW1FWilye5Vx7uBIWdrL1nsbGUbCkY/vo
         19Iov63xHoQTghJzykAa9MGsQYRMeEEqy55pZNk58+SSf4xfqhdYi5sfAnSHEBlMJ2wv
         Y2YOvLPMyLLIkEohC7uvEcfpgPg+ZJEU0yRMrxVk7U3viONHvWedBdHCyC5fj6lT4tB5
         YOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=6y00Q0xlhgZC+5AAciMWKPPlLXXqFkycmmQGK4M34e0=;
        b=tdm/ji3eCNCpLY7NHK1ha+ABLL41zZAqSHghDkDb32gkTVivdFqV5SkvpnrH5CZoaU
         0XMGO6vvS8G84d+Y2aqzUtEn5zV8/58YUveBSuczdyLtBFpex4CrUniJjWv367Ozw5o+
         6VS3KQPP/8E38rWg6mhf7hvYGLBuCPaOQ9h//4OyCVQ5081PS90KeFCNj9Aj8zD302xM
         Es4cjKRt1zWLHAGo/7opw1qFzKOLknlf9dG+1AEk56iWrGi3siIOmN280MkU9tYa5rY7
         88Km6pMdowq1GIwvAIBwsW1oBSiQqRVTWbon2psW2dAUIUsF+tZwWeqvNtJxPGGjNdcp
         k7YQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w206si42022wmb.2.2020.10.14.01.29.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TB3b001469
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:11 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIl002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:10 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 01/46] configs: arm64: Add SMMU configuration for Ultra96
Date: Wed, 14 Oct 2020 10:28:25 +0200
Message-Id: <f0c7800586d10a1d53b6cbc5dd515404d4a8994c.1602664149.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

This only lists the SDIO interfaces for now - more isn't working with
mainline so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/ultra96.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index f917dc34..db65ae01 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -21,6 +21,7 @@ struct {
 	struct jailhouse_memory mem_regions[11];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[2];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -41,6 +42,15 @@ struct {
 			.pci_mmconfig_base = 0xfc000000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
+
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_ARM_MMU500,
+					.base = 0xfd800000,
+					.size = 0x20000,
+				},
+			},
+
 			.arm = {
 				.gic_version = 2,
 				.gicd_base = 0xf9010000,
@@ -57,6 +67,7 @@ struct {
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
 
 			.vpci_irq_base = 136-32,
 		},
@@ -148,4 +159,8 @@ struct {
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
+
+	.stream_ids = {
+		0x870, 0x871
+	},
 };
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f0c7800586d10a1d53b6cbc5dd515404d4a8994c.1602664149.git.jan.kiszka%40siemens.com.
