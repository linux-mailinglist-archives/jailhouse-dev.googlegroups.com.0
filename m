Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBZVXXH3AKGQEY4IY2TI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id A76061E41FD
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:24:07 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id 6sf10340555oth.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:24:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582246; cv=pass;
        d=google.com; s=arc-20160816;
        b=gmRlc9oXtK3+wao7Zl+lz2fX/MmmpDX7g9jS6hqKTk4oMjEDMZuLtZs2QNxL9lTqIA
         GYXnoSUorhjsusWZpXaeA1IHlbV0ACDdkSckDZSPTdgel9Q16pDZXUKgYweJ1qKVMyKW
         /vafhs6SMfSI4gbWm+iiahQsgP1qDv0LD6C9qLX1h0g5P5BfawWrn08tvDRuDusk6HAC
         IGOXFa/Cxg28fsUblGWIiUQ9wJytuaah0xeJRWnpFZaELHhEUnW/NDO3RvkLNQt/y8fm
         stMkRpDwoZbM4027hmTn2RUuzTUW8oJ2ddziVx4T0TRULB2QOWduJ+USdqJvzicD668r
         RsRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ub0p4nqIUDTKIRw2aGgg8Hg2RMfvQVJU5k/K2cprc54=;
        b=chNx49m2PXlMyeWsUuvKxRrhQAJ3niY9QzguMJAAbGmu/JAS6xH/01x+yq/fE8S1iz
         fMsFFwgGYNrphiWXmDD6e5VTzb32jkau4FExqneQWvto/ed3NsOLp8ZoZImGzy4S1puK
         YBvr2btbdn1YJfoQfuP2FB3kP/tyKicjSOzZl2EIDRu/6wsppsYKh4WBztRdGVYdmjwo
         N2ap6Z47T9ifeCmSOFi7GFEziVGIq+ZokXaBb9xeLvc5LDobjqcGieami4B8nMDnJP6U
         XDKBcTT4DI+ZVvRa/6DvNxFBLGVGeraHiHKPlDkfXcyqcWspzfB1Sx8c6hfpf05vJGTG
         31Qg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="b/ZmxKmM";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ub0p4nqIUDTKIRw2aGgg8Hg2RMfvQVJU5k/K2cprc54=;
        b=V71KmXmcKMlIjRLB3EhCRucoku2GwT3gJibfnNipxCySDG4omygtjH5R3/b8dHH7LC
         KYddOpsyg/wnM6qTKxnyK7Pa7KgZPsZT0KsSePTxwIE+uwe/r1TAfNBudAp65hi/UpZy
         so8g5AvOkv0ksJ6Z3Fl8Z2wL1peAAc52hByjParpyy488BedAyZz1ID352ftoBKRbG9B
         tdCa0Roik9SssAaYV/65B3rQD6ZIB/aTVfBU7MaSxtUcKR/8PhgZyqtCMEDDNLI+y8TD
         1cuR64xChU0+AEv9l7L2BBZRg/up85Mtaw+SMuTaeTkZsnbXMEdKyOCuSelHi/9aO/XZ
         PyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ub0p4nqIUDTKIRw2aGgg8Hg2RMfvQVJU5k/K2cprc54=;
        b=phEY40A31WqeFMIA6K4KKn8Dgn5CPJS4Df2BufDGTHnoOE/yO8+SjRFfug7z5KgCco
         MGdzJsbbrWOKZeaq+Ed1esQeidlAvUHSTIteWIaozv3rrhh9NVewvgv3/Z3I3aSAIzrD
         TFeWcobZ0+2Qr6vJqKiwrb6RTGdfFpltZ35twwnCRg9SORgnm3zfLWTY1CR0j95QhKyv
         XuQrVW05Fg9HTK8+uo55y+bWaqGccXxyQ7S0I+ORWYIkviXSebv/NDeXjpv5dK6TlRni
         DgoLjijlLBvC7G0wBXAGmxh+qwWLIuor8fFs17186Io9yo7uB1oOtkGYUhteHW8WtQJa
         5ReA==
X-Gm-Message-State: AOAM533VjEd8rRuhf0hT9XW62+Jeh3TmwI9h5akq8IfRzmzumZ2qjdJA
	b4l/STUEHfiD1YpEblrFBr0=
X-Google-Smtp-Source: ABdhPJzO4Az3AY9/bfJn9Xx/mrdSLrS31/WjMnlubYqm8FTX4hO5S2WwzNB/9aejNKjkwlEFzcUWkA==
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr2535892oic.18.1590582246488;
        Wed, 27 May 2020 05:24:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:4810:: with SMTP id v16ls2786633oia.5.gmail; Wed, 27 May
 2020 05:24:06 -0700 (PDT)
X-Received: by 2002:aca:4747:: with SMTP id u68mr2562835oia.139.1590582246074;
        Wed, 27 May 2020 05:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582246; cv=none;
        d=google.com; s=arc-20160816;
        b=k4H6lr1QnVg23xfv+rskfIfrnvwgdZHBo/4AYdCgJXojvIXXPevk2yYJUyD8A13J/8
         qMqi6JvlV6ccZ2gXX/8B3WFyk7gVbAB1aCAs6xrsoFADKv67EMdNuqFcDDrM4smyvOLJ
         WUTpcChOyQ6qhXLornmQLmpu4iy3BMQ9q2YsFfuG9WVcTykxtDmXp55/OyBxyNliTVDT
         WsIygPC3pQaOSicvfxKwhtVSNABsnX7klVNB9GymHs89PluwzUE9bZkqoPwKTmEqDpIt
         /YZh13e3MIwMj8Vantr/oMhptxfhRvEXHrdxu5Wfc/+bNuxFrJBVQl9oGyNZKmaeprWu
         XdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M6WOE0ObN1fsvMQuhA3w+KZFsKAqvWflzt2T95JotJE=;
        b=Ri/uOPCg6cDLYrMar47RNu8k8oT9vrVtY+Ct919NmCmA8W+UCuUvgm9cIbfUPQFfDy
         g9pCK1/H0bcBq8nQlWk9KP3bjDMov0uH+QEniTjPFKyl/Mcu0gU1QvpoFRQxHN0Qe7Ew
         K5VzG/l+DcJ8WEWggMi7E8Jxb+QT0GpeEACdv36htcUfzFHNKVEAXMgXR99XUvld5gJl
         l6fpJRAL4lnLWl13qS4f9VosLuyIebshg53tUziuf+HWZnjAO9epCt3E0nuedK8368jz
         pxFJcZDHxogPlTwFq02f67aNCXKsuNBVhar4Jy+dt894Ve37iezGZOZDpddjlHGhvCsZ
         FAPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="b/ZmxKmM";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id l21si252836otp.0.2020.05.27.05.24.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCO5oS026072;
	Wed, 27 May 2020 07:24:05 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RCO52I112191
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 07:24:05 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:24:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:24:04 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCNxM2076356;
	Wed, 27 May 2020 07:24:03 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 2/5] configs: arm64: k3-j721e-linux: Add USB mem_regions
Date: Wed, 27 May 2020 17:53:55 +0530
Message-ID: <20200527122358.14723-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527122358.14723-1-nikhil.nd@ti.com>
References: <20200527122358.14723-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="b/ZmxKmM";       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Define the jailhouse_memory regions for the USB toplevel MMRs
This fixes the crash when root cell or inmate cell tries to
access the USB devices.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-linux-demo.c | 16 +++++++++++++++-
 configs/arm64/k3-j721e-evm.c            | 20 +++++++++++++++++---
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index f494b0cb..4a5aa3d9 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,7 +24,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[25];
+	struct jailhouse_memory mem_regions[27];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
 	__u32 stream_ids[2];
@@ -86,6 +86,20 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
+		/* usbss1 */ {
+			.phys_start = 0x04114000,
+			.virt_start = 0x04114000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usbss1 */ {
+			.phys_start = 0x06400000,
+			.virt_start = 0x06400000,
+			.size = 0x00030000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
 		/* main_gpio2 */ {
 			.phys_start = 0x00610000,
 			.virt_start = 0x00610000,
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 4f9755a8..2b67ac8e 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[36];
+	struct jailhouse_memory mem_regions[38];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[1];
 	__u32 stream_ids[30];
@@ -128,17 +128,31 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
+		/* usbss0 */ {
+			.phys_start = 0x04104000,
+			.virt_start = 0x04104000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
 		/* usbss0 */ {
 			.phys_start = 0x06000000,
 			.virt_start = 0x06000000,
-			.size = 0x00400000,
+			.size = 0x00030000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usbss1 */ {
+			.phys_start = 0x04114000,
+			.virt_start = 0x04114000,
+			.size = 0x00001000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
 		/* usbss1 */ {
 			.phys_start = 0x06400000,
 			.virt_start = 0x06400000,
-			.size = 0x00400000,
+			.size = 0x00030000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527122358.14723-3-nikhil.nd%40ti.com.
