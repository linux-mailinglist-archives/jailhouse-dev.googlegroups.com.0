Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBY55T6RQMGQEWRUJANQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DC770A0F4
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:08 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id ffacd0b85a97d-30479b764f9sf1438429f8f.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528868; cv=pass;
        d=google.com; s=arc-20160816;
        b=hfKyI26mia/jatmfdQWxqYJRlq0DlbWEYiCSlfoz8Fe/TgYNm8zM0eWyupKpuJpXZO
         j9KLvLGkSDLCRRehjy+FU37YTHEUbDjV85tnNLMueWnVl/PVlPGdzYVinL27r5rtcB7H
         UWJ1DEzRhzFpRj6k5vXGlIH1M74xNc7wgx8ElZ10dsoaIIGNWNv4mkaCzi3m+LoQ+3b8
         J/oHFCdYzgthhg0nCDGWxW/7nqXfgxPCcEgCVVAn+IcYXKTQ19uJPeZxlQScfoWaLFgU
         TTafwNqxPN5TH7KQLIKu76FbDtFlsBCHoL0Wd5WdropagCVDeD7I4E+MfSift0vHX0zR
         xfAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=TFJ8hMpTsymFP4aKsc0hI/9NJk5YETf3ZiEO5sewH/0=;
        b=o7p7V7DjcqJ7fsWhlx6XKZRmZJl0ZI5cYbUS8bVCfunOoUCIvb8NYjHIm0VOuImML7
         ZeRecxbp1az3z/NIgNiu3/Gi+HxonJwKPaSAoZpMrE2DobQIERUulocIRKT1KGjHZ+jQ
         OlWramJj/aH9wjuaaciYvdv4pI9euFl1pl6eKRwDL+e0aBgjMBZHI3uLq18Bt2Whabs/
         eOr/D+j88AA8CoeJRRykK8iuWad2e5CM55YqoPhRz20Hhwq/0SQDagyhEVc5HfAH2p9L
         ZaXcMR7q1Ta2lwrUAW8AF+7aUrN1LNZVCUBkaVNRY1WiiJlBsanZWH3KveyUfHq/fziI
         7uZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528868; x=1687120868;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFJ8hMpTsymFP4aKsc0hI/9NJk5YETf3ZiEO5sewH/0=;
        b=MaKzQxCGfpj25l2dmBZWSmiUM+yL1ES4rjNJ/UZxKxrBcj2kjvlT9F30zOBA+7SplD
         68Ccii91EL5iptrP0wc2nl+a7fnFhxznKev39KcNlvsnFeetA1CYvfUWp2J5yXpChluu
         B+Lm95ougScrWelFErgEv9iueANdYixh65tDy7U7r8d3noAz5ahW2wsixAq/A/dq3YMB
         6YkXAvzzmqbtaNHA6CS+d3FIQrm/1V7L/ejieWJ0skUnKlmHox/OpIU48vESU68WiIPB
         761+RFHBunZ5qFUkwtS8ra2brYIr0JnDL6BdKMLgLnAHxYJh3+gs19/jVgRX7wMyxEU1
         Fq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528868; x=1687120868;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFJ8hMpTsymFP4aKsc0hI/9NJk5YETf3ZiEO5sewH/0=;
        b=YD/WcFo1/LfJIpCc4mdY0c6i4n6QUv2k7xz7DfLvf/mshKBlKsbe53POyYe0PiY0Dn
         q11+LFU4ZyxlH49UsTLBGs15sfgfurpkKmPgxQCgfLtf5NSHc9h2pIAyFG+tgUa/W7j3
         FQC4twsudHdThf2b/BeU3TGxIWDSH0nBfUor4O11stX/N71I2ox99Erh53ZPBKw8WMpW
         yGDzx5rUxhxMdp3DZ43OQ5wwfNwMRHjs6bClfqFsBhB3YOGvgLDZlIaR+zRVUKtKhRd+
         iYsbNC9PVF2StOzqtvqY7IwmJJ8sOws/sZvSEGlS/Zd3VEGLS6YP+WUc7ixmzE9Vyv3A
         JVRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDz4pzbt8g9KuELFN7iFl6WJOxYkXea/181jd/AfQ7vyyzwCcD7O
	pz87Galkb5ykLwi7W9XOLj0=
X-Google-Smtp-Source: ACHHUZ7qNhRXB+tYFgE24tokcP1X6gmZ4ZOy8z1vPhdmC867PuCku2iZo5+u45Nl1Lg9U2Ues26+Zg==
X-Received: by 2002:adf:f9ce:0:b0:307:cea0:ee9a with SMTP id w14-20020adff9ce000000b00307cea0ee9amr437871wrr.7.1684528868206;
        Fri, 19 May 2023 13:41:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b27:b0:3f5:de41:8527 with SMTP id
 m39-20020a05600c3b2700b003f5de418527ls1516069wms.1.-pod-prod-03-eu; Fri, 19
 May 2023 13:41:06 -0700 (PDT)
X-Received: by 2002:a1c:6a16:0:b0:3f4:e3f5:763a with SMTP id f22-20020a1c6a16000000b003f4e3f5763amr2180394wmc.34.1684528866669;
        Fri, 19 May 2023 13:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528866; cv=none;
        d=google.com; s=arc-20160816;
        b=1GUbA34Lc8zE8lMzU7sLzgJrjDLmSRzDA/1kzsBjWqkGH+IwJP0l/umlWSbs8fIKGh
         hnT9sFA8QvPW6QpACEnFiG6OL4HnhoLh6Fh9nzIt7SRuaW6QVYhHtf/1X1a9Wfuog9Kv
         ch1He0FhMBoI2F33kf/AFhMLSynyCNyGN/QExcmPlZls37CJ2dpnrC+6w3Sao5naQQBr
         n8bVkm2RJ+uF2jKy73t95WK+N5WTkXVw81YWrHKvmdcVPmzmInTpY03Qw57q4WRumI30
         chcMfKTZ4TmKBKdWVflyPvJdTwEJhsj/5UEUpN/8utBv3mAGkfJlDTe+y1qgcbQXyW4l
         qqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=YMBPPsOyB+vByb0WgxAGWDhJg7PbxfWu7/DIcNLGh7U=;
        b=i9kyy3hnSp0Lnfuo7rswjq7iCHJv6m9peEr2n+9NElc/6/aUtZ+HZfqTjmb24r8j6r
         4c734192GNDmEBMtwL8BestVlusRdI4dmdNo5UZrGMJWR1Z5xeA1YEacZw7TooIgLku3
         0oWa6LOFrUHCdIkFSpjzWfpismtffuUO6SKfivEzqIsoYYU4+RANWb6nB01V3HXWuLmv
         0ox0H+/CZUDK9jhGIYg9EzuMEzAtxOjYLHFXPxGBshuFnxftOFQAeLlvyA+NbXTE6djH
         stJJysUSB9fc2BWim5S0H5M9boy6K0+rj9W7S5Zup3iwovf8Nm/3aFxz4bMwTjX1euLT
         513g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id he3-20020a05600c540300b003f42c1b8171si18631wmb.0.2023.05.19.13.41.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJds690SzyNg;
	Fri, 19 May 2023 22:41:05 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 66/73] configs: riscv: add ivshmem-net devices
Date: Fri, 19 May 2023 22:40:26 +0200
Message-Id: <20230519204033.643200-67-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
 configs/riscv/qemu-layout.h           |  1 -
 configs/riscv/qemu-linux-demo-aplic.c |  1 +
 configs/riscv/qemu-linux-demo-plic.c  |  1 +
 configs/riscv/qemu-linux-demo.h       | 32 ++++++++++++++++++++++++++-
 configs/riscv/qemu-plic-mc.c          |  1 +
 configs/riscv/qemu-plic-uc.c          |  1 +
 configs/riscv/qemu.h                  | 32 ++++++++++++++++++++++++++-
 9 files changed, 68 insertions(+), 3 deletions(-)

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
diff --git a/configs/riscv/qemu-layout.h b/configs/riscv/qemu-layout.h
index 02e9ba51..6f9e6466 100644
--- a/configs/riscv/qemu-layout.h
+++ b/configs/riscv/qemu-layout.h
@@ -21,7 +21,6 @@
 #define HV_OFFSET		0x200000 /* Recent OpenSBI place DTB there */
 #define HV_PHYS			(MEM_TOP - HV_OFFSET - HV_SIZE)
 
-/* In preparation for IVSHMEM */
 #define IVSHMEM_NET_PHYS	(HV_PHYS - MIB)
 
 #define INMATE_TINY_SIZE	MIB
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
index 68575dc6..12acc2fe 100644
--- a/configs/riscv/qemu-linux-demo.h
+++ b/configs/riscv/qemu-linux-demo.h
@@ -16,12 +16,26 @@
 #include <jailhouse/cell-config.h>
 #include "qemu-layout.h"
 
+#define MEM_REGIONS_BASE	4
+
+#ifdef QEMU_IVSHMEM
+#define IVSHMEM_REGIONS		4
+#else
+#define IVSHMEM_REGIONS		0
+#endif
+
+#define MEM_REGIONS		(MEM_REGIONS_BASE + IVSHMEM_REGIONS)
+
 struct {
 	struct jailhouse_cell_desc cell;
 	struct jailhouse_cpu cpus[2];
-	struct jailhouse_memory mem_regions[4];
+	struct jailhouse_memory mem_regions[MEM_REGIONS];
 	struct jailhouse_irqchip irqchips[1];
+#ifdef QEMU_IVSHMEM
+	struct jailhouse_pci_device pci_devices[1];
+#else
 	struct jailhouse_pci_device pci_devices[0];
+#endif
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -57,6 +71,10 @@ struct {
 	},
 
 	.mem_regions = {
+#ifdef QEMU_IVSHMEM
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(IVSHMEM_NET_PHYS, 1),
+#endif
 		/* RAM low */ {
 			.phys_start = INMATE_LINUX_LOW_PHYS,
 			.virt_start = 0x0,
@@ -87,6 +105,18 @@ struct {
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
index ceae015f..6f481769 100644
--- a/configs/riscv/qemu.h
+++ b/configs/riscv/qemu.h
@@ -21,6 +21,16 @@
 #include <jailhouse/cell-config.h>
 #include "qemu-layout.h"
 
+#define MEM_REGIONS_BASE	9
+
+#ifdef QEMU_IVSHMEM
+#define IVSHMEM_REGIONS		4
+#else
+#define IVSHMEM_REGIONS		0
+#endif
+
+#define MEM_REGIONS		(MEM_REGIONS_BASE + IVSHMEM_REGIONS)
+
 struct {
 	struct jailhouse_system header;
 #ifdef QEMU_UC
@@ -28,9 +38,13 @@ struct {
 #elif defined(QEMU_MC)
 	struct jailhouse_cpu cpus[6];
 #endif
-	struct jailhouse_memory mem_regions[9];
+	struct jailhouse_memory mem_regions[MEM_REGIONS];
 	struct jailhouse_irqchip irqchips[1];
+#ifdef QEMU_IVSHMEM
+	struct jailhouse_pci_device pci_devices[2];
+#else
 	struct jailhouse_pci_device pci_devices[1];
+#endif
 	struct jailhouse_pci_capability pci_caps[6];
 } __attribute__((packed)) config = {
 	.header = {
@@ -114,6 +128,10 @@ struct {
 	},
 
 	.mem_regions = {
+#ifdef QEMU_IVSHMEM
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(IVSHMEM_NET_PHYS, 0),
+#endif
 		/* RAM */ {
 			.phys_start = 0x80000000,
 			.virt_start = 0x80000000,
@@ -214,6 +232,18 @@ struct {
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-67-ralf.ramsauer%40oth-regensburg.de.
