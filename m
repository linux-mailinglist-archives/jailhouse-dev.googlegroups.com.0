Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB3EGRGPQMGQE4HZBHYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B74168D69E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:21 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id bd21-20020a05600c1f1500b003dc5cb10dcfsf7150561wmb.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772780; cv=pass;
        d=google.com; s=arc-20160816;
        b=yiRCpQvuPes0dO0UaYWVPC+MFAcdI+OKUuBBGeX6TYbOtg8jivyfWPnWrYH8Ji7ZtK
         S741sKxe1aGjyI0CgEy9ZVn9WOBf5SAv5q8dn3cGHEEjCaelQcBXfKcqfemp/EPbjUQ0
         okYrox+agqNWb5xLy2t947IhMI9x7osb/QVfOHxMntQBZrDBj+Xr98/pJmuNX0KQBgMo
         dr1P5CFwdAR49cwHTs4160z1NzfuPatQQ56RFZoQ1dk5U22euARZktyZdU7oBhW1PUvS
         cy9JjBzlMa8u09zZL9esp01oFR2BIet5v3hj1vHJEOU4y+taNFLedcgj5d2eIzFE38J0
         3AUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OoU3GKL852JXrhuXa5U3Y7dB/iyGIEkozyKS37gOwJ0=;
        b=AbBZxNVv3nt/liEyd07tPSF8lqoG0FNJecINCzgA8IsUuDe6G7QDsvnys6ArizxISI
         hva5Bf9vr+j87962BGtVzVJORJIhjW+lySPT5Kl8Dmbe5FDIPkTTnDdB8bwZN5ARe9KN
         EpDqRkT5d/PzReBIetQ/Xc3ZlbiqPyXJxDFjc3WI75CHTc6RRqGSyAitQZfaDlAQdDmy
         HFXuNUzkOWmAEGvpTPJrWQ1l3EIE5URfphax5CXLd2/eWGEmbIFg+5NPW6kNYcDolH2k
         t2CWvbxt6yUZQ+k9dYZiVmcWp+esaNmuJQyYPWG0omAyn7d6BZmrpTHJoxJemASvsPAe
         0nlg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoU3GKL852JXrhuXa5U3Y7dB/iyGIEkozyKS37gOwJ0=;
        b=QrHSJrbDPQWFln6kPlF7stHT9L5iAkBGaVzqstVNtwlnUUkdagc2diEBiP7xCjDXHO
         /tZ4u/dELM0lbGlUiQvEvmkplZz6oOO3RP5ihO4+HtXa6CmswO87J9agm4lsQu4QA4z3
         yt2N3hfr4EtGXiviXa0gImDztje8JVjRZrGpq+QfvKTgtdOekB3/VgTSbCde//+9jYjP
         kLu8AyUTOph7KT13S8QKbgPSKUK+hQJJsdF9W6qnw0n9k8z/kGwPwdQT6SjQ6fI13qKV
         zwhga3PooxGEtgMll7zWyvV9sXjwW/DTWJrqYz7LQwL5HVhiCtuqX/YdXNY3cm3mLvLc
         Kk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoU3GKL852JXrhuXa5U3Y7dB/iyGIEkozyKS37gOwJ0=;
        b=omaYc1xG9G0ZFjCQ0ZrbwU19Cd97kLFQMUBnsp1e6VUqo+/9yLtwNWVmHU9FKxb3+h
         RTKcvCpOk3vX5WqMw8nF6aRoqUpCOwf2AMOluZ1CUjsp6SCcTErIGI+215TUdrkFXPrH
         vGc3bCwJ0g3VXoaJ6nVJphg8g7OFO6pHFLaMurnMxYEx0URRNNZ9Kk+Xk2OpQDxDOV3A
         b+KeWOGHXqsPgA8bv1zQkavAzxbFDTXJ/uByHAEieP9BMh6WcqNuLuqNY4UrjI/fPNo4
         0b105Ww1eXYe7mM/LGeqwi0O43ftnfKp8afbS7UerAPSnnwAYHjPicUrUUXyijlsOytV
         WAEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVi7Xl9ZvKeb16GYmwieZsSy3S4xOBvii2EdW48vZ6/mbZbvsZy
	WpWqPlz67bXZmGd0wrJXquM=
X-Google-Smtp-Source: AK7set+VuJ0AgiaZAm/Dy6BDLZvvP3wrA9ZcyLzlv+CPfDzpvbX1Vvb8pDICnwo1D+Q/NU7Ll/ar5Q==
X-Received: by 2002:adf:f386:0:b0:2bf:964f:36f3 with SMTP id m6-20020adff386000000b002bf964f36f3mr92611wro.554.1675772780836;
        Tue, 07 Feb 2023 04:26:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:35cc:b0:3cf:9be3:73dd with SMTP id
 r12-20020a05600c35cc00b003cf9be373ddls10050675wmq.3.-pod-canary-gmail; Tue,
 07 Feb 2023 04:26:19 -0800 (PST)
X-Received: by 2002:a05:600c:5389:b0:3df:9858:c038 with SMTP id hg9-20020a05600c538900b003df9858c038mr13777463wmb.13.1675772779235;
        Tue, 07 Feb 2023 04:26:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772779; cv=none;
        d=google.com; s=arc-20160816;
        b=YWOUigYHixQpZmBonCHVvFKaznnyOhuE+uQoZMx48W7aJuTZ7Uk8dS47SoMWO23V2Y
         AZEut35KXIfdJYikcZiNNMT6LxyeG9+bum1QoAvaOSO7HO843/RRdt+SOpCXp+VxOswG
         icQF59pxzrtWWp3u62P0RONBl0jf5suZYx8iUI9bnHUZT00UmSOIRS8dMmBB+dL+iNpq
         +VL8SlUp32nn6eGTUYSWDTeyHzP2DCjUy6pP6vExHzbSf5kYr1Esul4zijeZG0ojSgeY
         r/e85/9dzK7BNA9AzAYP3dx8yn6XLnm0R+RKjItXXfCcQBtXIUoTyPTtz4wQDSf+2ElR
         R/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=fW7pwfbSvq0+NE0vpGfwwTiwL1K9aMQ0cQ0GvSljo7w=;
        b=jzN05gehixFzeaUmIiq+mNXzrJi8M6USIlrq9/dFa6Tc0JWQj0Y3CrIdt9ldYN5wHX
         u9zt1IN3O0X4p1CXTj23lWghP4B5TJbFqznHtsJCxHGKpEQrqeFOzXv3kOFUYyw02Go+
         EHvr+acwuQr7GF2N2minMESXMBStSqL1pWiobGow+qnbH+a3nRiuLHE9rqN1YdhVuVzS
         C7/i+bSQcYNPGD3T0qEMz/HtRVlz9AxOg7GL+DDk9S+L2I9IEXlpNitbSEbe3TNCWxY2
         Cu9DaN6iqVXchO89QKsWbdGbopHGbw4PZPU+rvrsP+QR2bjb4S6tQdDzyTKdJFqPKzsJ
         72Qg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id n35-20020a05600c502300b003dfee13a6b4si646599wmr.1.2023.02.07.04.26.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:19 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RZ5R2Hzxvr;
	Tue,  7 Feb 2023 13:26:18 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 47/47] configs: riscv: add ivshmem-net devices
Date: Tue,  7 Feb 2023 13:25:43 +0100
Message-Id: <20230207122543.1128638-48-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

For demonstration purposes only.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/riscv/qemu-aplic-mc.c         |  1 +
 configs/riscv/qemu-aplic-uc.c         |  1 +
 configs/riscv/qemu-linux-demo-aplic.c |  1 +
 configs/riscv/qemu-linux-demo-plic.c  |  1 +
 configs/riscv/qemu-linux-demo.h       | 24 ++++++++++++++++++++++++
 configs/riscv/qemu-plic-mc.c          |  1 +
 configs/riscv/qemu-plic-uc.c          |  1 +
 configs/riscv/qemu.h                  | 24 ++++++++++++++++++++++++
 8 files changed, 54 insertions(+)

diff --git a/configs/riscv/qemu-aplic-mc.c b/configs/riscv/qemu-aplic-mc.c
index 34c3bc9d..85077f00 100644
--- a/configs/riscv/qemu-aplic-mc.c
+++ b/configs/riscv/qemu-aplic-mc.c
@@ -1,3 +1,4 @@
 #define QEMU_MC
 #define QEMU_APLIC
+#define QEMU_IVSHMEM
 #include "qemu.h"
diff --git a/configs/riscv/qemu-aplic-uc.c b/configs/riscv/qemu-aplic-uc.c
index a26dcaa0..580cfe11 100644
--- a/configs/riscv/qemu-aplic-uc.c
+++ b/configs/riscv/qemu-aplic-uc.c
@@ -1,3 +1,4 @@
 #define QEMU_UC
 #define QEMU_APLIC
+#define QEMU_IVSHMEM
 #include "qemu.h"
diff --git a/configs/riscv/qemu-linux-demo-aplic.c b/configs/riscv/qemu-linux-demo-aplic.c
index 81442a13..f8711402 100644
--- a/configs/riscv/qemu-linux-demo-aplic.c
+++ b/configs/riscv/qemu-linux-demo-aplic.c
@@ -1,2 +1,3 @@
 #define QEMU_APLIC
+#define QEMU_IVSHMEM
 #include "qemu-linux-demo.h"
diff --git a/configs/riscv/qemu-linux-demo-plic.c b/configs/riscv/qemu-linux-demo-plic.c
index f4c0331a..608efff0 100644
--- a/configs/riscv/qemu-linux-demo-plic.c
+++ b/configs/riscv/qemu-linux-demo-plic.c
@@ -1,2 +1,3 @@
 #define QEMU_PLIC
+#define QEMU_IVSHMEM
 #include "qemu-linux-demo.h"
diff --git a/configs/riscv/qemu-linux-demo.h b/configs/riscv/qemu-linux-demo.h
index 9385d8d4..fc9ed6eb 100644
--- a/configs/riscv/qemu-linux-demo.h
+++ b/configs/riscv/qemu-linux-demo.h
@@ -18,9 +18,17 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	struct jailhouse_cpu cpus[2];
+#ifdef QEMU_IVSHMEM
+	struct jailhouse_memory mem_regions[8];
+#else
 	struct jailhouse_memory mem_regions[4];
+#endif
 	struct jailhouse_irqchip irqchips[1];
+#ifdef QEMU_IVSHMEM
+	struct jailhouse_pci_device pci_devices[1];
+#else
 	struct jailhouse_pci_device pci_devices[0];
+#endif
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -56,6 +64,10 @@ struct {
 	},
 
 	.mem_regions = {
+#ifdef QEMU_IVSHMEM
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbf900000, 1),
+#endif
 		/* RAM low */ {
 			.phys_start = 0xbf800000,
 			.virt_start = 0x0,
@@ -86,6 +98,18 @@ struct {
 	},
 
 	.pci_devices = {
+#ifdef QEMU_IVSHMEM
+		{ /* IVSHMEM (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0000,
+			.bdf = 0x10 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+#endif
 	},
 
 	.irqchips = {
diff --git a/configs/riscv/qemu-plic-mc.c b/configs/riscv/qemu-plic-mc.c
index c29be90a..26c807d7 100644
--- a/configs/riscv/qemu-plic-mc.c
+++ b/configs/riscv/qemu-plic-mc.c
@@ -1,3 +1,4 @@
 #define QEMU_MC
 #define QEMU_PLIC
+#define QEMU_IVSHMEM
 #include "qemu.h"
diff --git a/configs/riscv/qemu-plic-uc.c b/configs/riscv/qemu-plic-uc.c
index f9842775..c6fa7339 100644
--- a/configs/riscv/qemu-plic-uc.c
+++ b/configs/riscv/qemu-plic-uc.c
@@ -1,3 +1,4 @@
 #define QEMU_UC
 #define QEMU_PLIC
+#define QEMU_IVSHMEM
 #include "qemu.h"
diff --git a/configs/riscv/qemu.h b/configs/riscv/qemu.h
index 45d15564..44fb4fb4 100644
--- a/configs/riscv/qemu.h
+++ b/configs/riscv/qemu.h
@@ -27,9 +27,17 @@ struct {
 #elif defined(QEMU_MC)
 	struct jailhouse_cpu cpus[6];
 #endif
+#ifdef QEMU_IVSHMEM
+	struct jailhouse_memory mem_regions[12];
+#else
 	struct jailhouse_memory mem_regions[8];
+#endif
 	struct jailhouse_irqchip irqchips[1];
+#ifdef QEMU_IVSHMEM
+	struct jailhouse_pci_device pci_devices[2];
+#else
 	struct jailhouse_pci_device pci_devices[1];
+#endif
 	struct jailhouse_pci_capability pci_caps[6];
 } __attribute__((packed)) config = {
 	.header = {
@@ -113,6 +121,10 @@ struct {
 	},
 
 	.mem_regions = {
+#ifdef QEMU_IVSHMEM
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbf900000, 0),
+#endif
 		/* RAM */ {
 			.phys_start = 0x80000000,
 			.virt_start = 0x80000000,
@@ -206,6 +218,18 @@ struct {
 			.msix_region_size = 0x1000,
 			.msix_address = 0x40080000,
 		},
+#ifdef QEMU_IVSHMEM
+		{ /* IVSHMEM (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0000,
+			.bdf = 0x10 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+#endif
 	},
 
 	.pci_caps = {
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-48-ralf.ramsauer%40oth-regensburg.de.
