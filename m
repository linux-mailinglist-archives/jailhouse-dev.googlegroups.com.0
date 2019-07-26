Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBMMO5TUQKGQEFNRJ7LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE676A76
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 15:59:13 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id b3sf34119367edd.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564149553; cv=pass;
        d=google.com; s=arc-20160816;
        b=THab9ods4xy0LSbOIohyGN2V1HFgj3qtMSMGMu2Nl5McwXFoRZauMWxzUo1Thv0tJj
         uivH/rDF+mNe3SHsph6eDEGEur3hF1f6iScaWB4MAWDpQ/zFOGvmTz0A/zcKBsh9hqS3
         43yDnRNhQSn7QkwO/ZNGwCzB1pqH26vKUmAEKhVRc/eWgltdakxI67HAydJmZLc3Kx5v
         zo6Yn3kdwPqwJbsb5pMTKd2FfvcJ2+rEDc9ye8tGbx8DVRigr551TZsNp/6+rYj7lP2E
         fvYL/DSLZnyvugXFFtDZjSjACz6Srqz6E3RYiIf1NUzRJh0W5XCFe+sEAcfYwJFFFrO7
         DM5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=PWmsKuD3IjHAowWfluUzpN+Tcmy9E7Fu0q+g8AgMrHA=;
        b=UwgNudG4yHJVjTQyIwujdz1SPstL3cw/pdSyxaO/FdYEVkXR1PeOYnf1JVNpzmGFxS
         H1JhRlWJWW68iaHTjUaNif0ODQaY+Me8LtBo4dmGv+n//DzecwORsVbgbFAETmpNsWkX
         +f5o0IJTaPcKAq2YmuoPYKpwlsJS1CusFv8vbsINh3ibieT4nDOPsgWc7OplokFurCZH
         54xyJohUgs0+eIWoQioJkbM7TR9c0vYb6zhbZTNm4MzZu59mP/FwFVIfd7tjSNosMguk
         8fS40bcMzJGYAGQWfzL7VNtKiQj4OsvfzsUissWoY6Kt/uJh6bVyEA8e/WePwhKmv7Io
         1AYQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PWmsKuD3IjHAowWfluUzpN+Tcmy9E7Fu0q+g8AgMrHA=;
        b=cxsUhxFPD2deAVDvFjg6vnEGoYg/iwNFXxX2QaBn8GJfAB7VWxWhaLogyFFhasxT+A
         Qha4pv75HwDbh5e3j56HdAez/NbovAibrGfTgxvJCaBgLzkLQDCEXpXvrMJa9/CrKaHM
         EGQAVRp+p3xWcES+PXRJiySHXB4liYwGjoSvK1d5C2DlWVFnE7DQHYcs3neS/JKkZ6DE
         WXn/GRClHpuVoaawxIyeFkjVtCFku7weNzA7ZBCby4U2p0yzu6KyuUJpKdv+egvEhchK
         PI4WZDbnm9RQ7zsujFyMjKQAWgPI+GEyDOBTUNiCdqhalHVx9HIcdsOLklDKvUCgNJaI
         j/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PWmsKuD3IjHAowWfluUzpN+Tcmy9E7Fu0q+g8AgMrHA=;
        b=msOz4WkJFDYfwnbRabQL10vZ87mtKhx5Ybo0wJaA2PIy0ePzUalXOTrSqwC/4NY3a0
         CYY/0Ht0Gz1kO2PIvgMcbPbH9Z7IeFppGiu/xvpW5nRNriy+O7OCRFHS/BSJMZtRHFg4
         UAw0BddkKD9Yo1RkLYf6WFzO8ycOgbEi9Aml5hjmPZjqTJwzW3s+jwlpciNxVhnzrg2s
         AH9iZi4fxeYQqgU9/2kg3YhM33EsN3OOOmTWa8LT5eNo2SHv7F/LawxOmOfrhwdhPoma
         EafIJTfDobHjRwYzpm8rNw55kR/3pbO0hNbqGlXq/iUArBFsdHFuZjwT/uBaEhM6/3tH
         DxeA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWiWnzL/y+YgPud2zkpomVvpVCfeDAPC0M7X2NMTqiYKGZD7Kwe
	Zyy2aeXqpj6DPC/8EelPPZA=
X-Google-Smtp-Source: APXvYqxrCd+zaUja4nKAJLcQSFRJtc0vW6topUyhfLhxmxyVt9DsFN8vwmnOHOPrDWxEd3kHFLcsOw==
X-Received: by 2002:a17:906:7681:: with SMTP id o1mr69738405ejm.207.1564149553525;
        Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8ea5:: with SMTP id w34ls3116600edw.13.gmail; Fri, 26
 Jul 2019 06:59:12 -0700 (PDT)
X-Received: by 2002:a50:aa14:: with SMTP id o20mr83058064edc.165.1564149552895;
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564149552; cv=none;
        d=google.com; s=arc-20160816;
        b=Db9wl2/AjHEQUrvknlM3LX2TaHrks/8SWgYQXbnhvj9xLiuL5/yqiFW4F/dN0WU3Nb
         kZhaxS2eh933EkuuBlSSbF+uPRq9MZAzW3RXqw19D2qkSA/0IS9Td5bVjT1nc5CqqaAD
         GpL/b9A25DgWBa30TQp3rei8ZPM1rcpfs13qXH+loElgk7EsbZm94HlioX5jMl5Cfccd
         /QO2WpRwW44O187bfoaVIrOgEdr8VJSDeCY+Vo0iOlfBTKHETIBC7RxXhIlI0s5RJzVD
         6d4WpGYQlbMkW0ekmcZ0SnM3qwcQXP37djZIt/MHSIbsLYivjpScKFjkt6Embz6zL8N7
         nolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=IJ2HlleSg2O+5lfCrOAyjwoUt7uWV2m3QzIKNMzbXtM=;
        b=ZuwvHm3x2aZsJbarDZDVF0OLU+tqsAT4P7njcnJcfN3STKj6B/dfUo8fOSz3ng4TLY
         PkHHA6aYO3x+De0qX6u/z91lYS3ElsIhAL6yZxWnDq0xiosUxy9QoEAEQUcmWZ073ZJC
         2fTIDSVdo5L5T6gX46xI+mk7QMp4jS/Rs0gJzwS4yOdfEO4bS74C1MmHHhLYcuGW9igp
         SAYQs+/wdyH4Ex9/36FyVwKoc4KuFLs608tuj2O3TUqilAdJDK94zwJrzjUJH/RsHCjD
         QMY89A2kYYqZfi/Gt2gvMfUbImvLg9HmtaujR2bIb7oD9PYjAiTC0AUpkt4ElU0n2wxF
         y+Kw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id k51si201444edd.0.2019.07.26.06.59.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45w9g42JD3zy8k;
	Fri, 26 Jul 2019 15:59:12 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 4/5] x86: pio: use a whitelist instead of a permission bitmap
Date: Fri, 26 Jul 2019 15:59:10 +0200
Message-Id: <20190726135911.16810-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
References: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.26.135117, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.26.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_MEDIA_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Whitelist-based permissions align better with the Jailhouse philosophy.

This patch switches the permission bitmap (which basically was (almost) a
duplicate of the final io_bitmap) to a structure that whitelists a port range,
given a base port and a length.

As a side effect, this patch drastically reduces the size of config files:
8404  -> 224   apic-demo.cell
8488  -> 312   e1000-demo.cell
11450 -> 3290  f2a88xm-hd3.cell
11634 -> 3474  imb-a180.cell
8424  -> 252   ioapic-demo.cell
8480  -> 296   ivshmem-demo.cell
8788  -> 608   linux-x86-demo.cell
8488  -> 308   pci-demo.cell
9730  -> 1586  qemu-x86.cell
8392  -> 212   smp-demo.cell
8404  -> 224   tiny-demo.cell

If no whitelist is given, all PIO access will be denied. Additionally, increase
the config file revision header.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/x86/apic-demo.c         | 16 +++----
 configs/x86/e1000-demo.c        | 19 +++-----
 configs/x86/f2a88xm-hd3.c       | 27 +++++------
 configs/x86/imb-a180.c          | 27 +++++------
 configs/x86/ioapic-demo.c       | 22 ++++-----
 configs/x86/ivshmem-demo.c      | 13 ++----
 configs/x86/linux-x86-demo.c    | 16 +++----
 configs/x86/pci-demo.c          | 16 +++----
 configs/x86/qemu-x86.c          | 41 ++++++----------
 configs/x86/smp-demo.c          | 16 +++----
 configs/x86/tiny-demo.c         | 16 +++----
 hypervisor/arch/x86/vcpu.c      | 83 +++++++++++++++++++++------------
 include/jailhouse/cell-config.h | 17 +++----
 tools/jailhouse-hardware-check  |  2 +-
 14 files changed, 149 insertions(+), 182 deletions(-)

diff --git a/configs/x86/apic-demo.c b/configs/x86/apic-demo.c
index 8840c632..3660a74f 100644
--- a/configs/x86/apic-demo.c
+++ b/configs/x86/apic-demo.c
@@ -20,7 +20,7 @@ struct {
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[2];
 	struct jailhouse_cache cache_regions[1];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -32,7 +32,7 @@ struct {
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 		.num_pci_devices = 0,
 
 		.console = {
@@ -70,13 +70,9 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...  0x2f7/8] = -1,
-		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
-		[ 0x300/8 ...  0x3f7/8] = -1,
-		[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
-		[ 0x400/8 ... 0xe00f/8] = -1,
-		[0xe010/8 ... 0xe017/8] = 0, /* OXPCIe952 serial1 */
-		[0xe018/8 ... 0xffff/8] = -1,
+	.pio_regions = {
+		PIO_RANGE(0x2f8, 8), /* serial 2 */
+		PIO_RANGE(0x3f8, 8), /* serial 1 */
+		PIO_RANGE(0xe010, 8), /* OXPCIe952 serial */
 	},
 };
diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
index 93bb4cfa..7ea43e38 100644
--- a/configs/x86/e1000-demo.c
+++ b/configs/x86/e1000-demo.c
@@ -20,7 +20,7 @@ struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[3];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[4];
 	struct jailhouse_pci_device pci_devices[1];
 	struct jailhouse_pci_capability pci_caps[1];
 } __attribute__((packed)) config = {
@@ -34,7 +34,7 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
 
@@ -72,16 +72,11 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...  0x2f7/8] = -1,
-		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
-		[ 0x300/8 ...  0x3f7/8] = -1,
-		[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
-		[ 0x400/8 ... 0xbfff/8] = -1,
-		[0xc000/8 ... 0xc03f/8] = 0, /* e1000 */
-		[0xc040/8 ... 0xdfff/8] = -1,
-		[0xe000/8 ... 0xe007/8] = 0, /* OXPCIe952 serial2 */
-		[0xe008/8 ... 0xffff/8] = -1,
+	.pio_regions = {
+		PIO_RANGE(0x2f8, 8), /* serial 2 */
+		PIO_RANGE(0x3f8, 8), /* serial 1 */
+		PIO_RANGE(0xc000, 0x3f), /* e1000 */
+		PIO_RANGE(0xe000, 8), /* OXPCIe952 serial 2 */
 	},
 
 	.pci_devices = {
diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index 315d0e29..4332cdc4 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -25,7 +25,7 @@ struct {
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[35];
 	struct jailhouse_irqchip irqchips[2];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[8];
 	struct jailhouse_pci_device pci_devices[26];
 	struct jailhouse_pci_capability pci_caps[27];
 } __attribute__((packed)) config = {
@@ -65,7 +65,7 @@ struct {
 			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
-			.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
 		},
@@ -352,20 +352,15 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...   0x1f/8] = -1,
-		[  0x20/8 ...   0x27/8] = 0xfc, /* HACK: PIC */
-		[  0x28/8 ...   0x3f/8] = -1,
-		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
-		[  0x48/8 ...   0x5f/8] = -1,
-		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI status/control */
-		[  0x68/8 ...   0x6f/8] = -1,
-		[  0x70/8 ...   0x77/8] = 0xfc, /* RTC */
-		[  0x78/8 ...  0x3af/8] = -1,
-		[ 0x3b0/8 ...  0x3df/8] = 0x00, /* VGA */
-		[ 0x3e0/8 ...  0xcf7/8] = 0, /* HACK: PCI bus */
-		[ 0xcf8/8 ...  0xcff/8] = -1,
-		[ 0xd00/8 ... 0xffff/8] = 0, /* HACK: PCI bus */
+	.pio_regions = {
+		PIO_RANGE(0x20, 8), /* HACK: PIC */
+		PIO_RANGE(0x40, 4), /* PIT */
+		PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
+		PIO_RANGE(0x64, 1), /* i8042 */
+		PIO_RANGE(0x70, 2), /* RTC */
+		PIO_RANGE(0x3b0, 0x30), /* VGA */
+		PIO_RANGE(0x3e0, 0x918), /* HACK: PCI bus */
+		PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
 	},
 
 	.pci_devices = {
diff --git a/configs/x86/imb-a180.c b/configs/x86/imb-a180.c
index e0d86e3a..05f7279a 100644
--- a/configs/x86/imb-a180.c
+++ b/configs/x86/imb-a180.c
@@ -24,7 +24,7 @@ struct {
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[42];
 	struct jailhouse_irqchip irqchips[1];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[8];
 	struct jailhouse_pci_device pci_devices[26];
 	struct jailhouse_pci_capability pci_caps[26];
 } __attribute__((packed)) config = {
@@ -54,7 +54,7 @@ struct {
 			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
-			.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
 		},
@@ -382,20 +382,15 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...   0x1f/8] = -1,
-		[  0x20/8 ...   0x27/8] = 0xfc, /* HACK: PIC */
-		[  0x28/8 ...   0x3f/8] = -1,
-		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
-		[  0x48/8 ...   0x5f/8] = -1,
-		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI status/control */
-		[  0x68/8 ...   0x6f/8] = -1,
-		[  0x70/8 ...   0x77/8] = 0xfc, /* RTC */
-		[  0x78/8 ...  0x3af/8] = -1,
-		[ 0x3b0/8 ...  0x3df/8] = 0x00, /* VGA */
-		[ 0x3e0/8 ...  0xcf7/8] = 0, /* HACK: PCI bus */
-		[ 0xcf8/8 ...  0xcff/8] = -1,
-		[ 0xd00/8 ... 0xffff/8] = 0, /* HACK: PCI bus */
+	.pio_regions = {
+		PIO_RANGE(0x20, 2), /* HACK: PIC */
+		PIO_RANGE(0x40, 4), /* PIT */
+		PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
+		PIO_RANGE(0x64, 1), /* i8042 */
+		PIO_RANGE(0x70, 2), /* RTC */
+		PIO_RANGE(0x3b0, 0x30), /* VGA */
+		PIO_RANGE(0x3e0, 0x918), /* HACK: PCI bus */
+		PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
 	},
 
 	.pci_devices = {
diff --git a/configs/x86/ioapic-demo.c b/configs/x86/ioapic-demo.c
index aacbc587..60745cb5 100644
--- a/configs/x86/ioapic-demo.c
+++ b/configs/x86/ioapic-demo.c
@@ -21,7 +21,7 @@ struct {
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[2];
 	struct jailhouse_irqchip irqchips[1];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[5];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -33,7 +33,7 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
-		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 		.num_pci_devices = 0,
 
 		.console = {
@@ -73,17 +73,11 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...  0x2f7/8] = -1,
-		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
-		[ 0x300/8 ...  0x3f7/8] = -1,
-		[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
-		[ 0x400/8 ...  0x5ff/8] = -1,
-		[ 0x600/8 ...  0x607/8] = 0xf0, /* acpi-evt */
-		[ 0x608/8 ...  0x7ff/8] = -1,
-		[ 0x800/8 ...  0x807/8] = 0xf0 /* apci-pm1a */,
-		[ 0x808/8 ... 0xdfff/8] = -1,
-		[0xe000/8 ... 0xe007/8] = 0, /* OXPCIe952 serial2 */
-		[0xe008/8 ... 0xffff/8] = -1,
+	.pio_regions = {
+		PIO_RANGE(0x2f8, 8), /* serial 2 */
+		PIO_RANGE(0x3f8, 8), /* serial 1 */
+		PIO_RANGE(0x600, 4), /* acpi-evt */
+		PIO_RANGE(0x800, 4), /* apci-pm1a */
+		PIO_RANGE(0xe010, 8), /* OXPCIe952 serial2 */
 	},
 };
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index 6fcd76bf..77b61b6f 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -20,7 +20,7 @@ struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[3];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[2];
 	struct jailhouse_pci_device pci_devices[1];
 	struct jailhouse_pci_capability pci_caps[0];
 } __attribute__((packed)) config = {
@@ -34,7 +34,7 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
 
@@ -73,12 +73,9 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...  0x2f7/8] = -1,
-		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
-		[ 0x300/8 ...  0x3f7/8] = -1,
-		[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
-		[ 0x400/8 ... 0xffff/8] = -1,
+	.pio_regions = {
+		PIO_RANGE(0x2f8, 8), /* serial 2 */
+		PIO_RANGE(0x3f8, 8), /* serial 1 */
 	},
 
 	.pci_devices = {
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 80d6a589..2299544e 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -25,7 +25,7 @@ struct {
 #endif
 	struct jailhouse_cache cache_regions[1];
 	struct jailhouse_irqchip irqchips[1];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[3];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
 	struct jailhouse_pci_device pci_devices[2];
 #else
@@ -44,7 +44,7 @@ struct {
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
-		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
 	},
@@ -134,14 +134,10 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...  0x2f7/8] = -1,
-		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
-		[ 0x300/8 ...  0x3f7/8] = -1,
-		[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
-		[ 0x400/8 ... 0xe00f/8] = -1,
-		[0xe010/8 ... 0xe017/8] = 0, /* OXPCIe952 serial1 */
-		[0xe018/8 ... 0xffff/8] = -1,
+	.pio_regions = {
+		PIO_RANGE(0x2f8, 8), /* serial 2 */
+		PIO_RANGE(0x3f8, 8), /* serial 1 */
+		PIO_RANGE(0xe010, 8), /* OXPCIe952 serial1 */
 	},
 
 	.pci_devices = {
diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
index 7ed93d56..92fba8e5 100644
--- a/configs/x86/pci-demo.c
+++ b/configs/x86/pci-demo.c
@@ -20,7 +20,7 @@ struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[3];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[3];
 	struct jailhouse_pci_device pci_devices[1];
 	struct jailhouse_pci_capability pci_caps[1];
 } __attribute__((packed)) config = {
@@ -34,7 +34,7 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
 
@@ -71,14 +71,10 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...  0x2f7/8] = -1,
-		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
-		[ 0x300/8 ...  0x3f7/8] = -1,
-		[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
-		[ 0x400/8 ... 0xdfff/8] = -1,
-		[0xe000/8 ... 0xe007/8] = 0, /* OXPCIe952 serial2 */
-		[0xe008/8 ... 0xffff/8] = -1,
+	.pio_regions = {
+		PIO_RANGE(0x2f8, 8), /* serial 2 */
+		PIO_RANGE(0x3f8, 8), /* serial 1 */
+		PIO_RANGE(0xe010, 8), /* OXPCIe952 serial2 */
 	},
 
 	.pci_devices = {
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 7e0e25bc..883ca6c2 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -24,7 +24,7 @@ struct {
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[1];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[12];
 	struct jailhouse_pci_device pci_devices[9];
 	struct jailhouse_pci_capability pci_caps[11];
 } __attribute__((packed)) config = {
@@ -62,7 +62,7 @@ struct {
 			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
-			.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
 		},
@@ -196,30 +196,19 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...   0x1f/8] = 0, /* floppy DMA controller */
-		[  0x20/8 ...   0x3f/8] = -1,
-		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
-		[  0x48/8 ...   0x5f/8] = -1,
-		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI status/control */
-		[  0x68/8 ...   0x6f/8] = -1,
-		[  0x70/8 ...   0x77/8] = 0xfc, /* rtc */
-		[  0x78/8 ...  0x1c7/8] = -1,
-		[ 0x1c8/8 ...  0x1cf/8] = 0x3f, /* vbe */
-		[ 0x1d0/8 ...  0x1d7/8] = 0xfe, /* vbe */
-		[ 0x1d8/8 ...  0x2f7/8] = -1,
-		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
-		[ 0x300/8 ...  0x3af/8] = -1,
-		[ 0x3b0/8 ...  0x3df/8] = 0, /* VGA */
-		[ 0x3e0/8 ...  0x3ef/8] = -1,
-		[ 0x3f0/8 ...  0x3f7/8] = 0, /* floppy */
-		[ 0x3f8/8 ...  0x3ff/8] = -1,
-		[ 0x400/8 ...  0x407/8] = 0xfb, /* invalid but accessed by X */
-		[ 0x408/8 ... 0x5657/8] = -1,
-		[0x5658/8 ... 0x565f/8] = 0xf0, /* vmport */
-		[0x5660/8 ... 0xbfff/8] = -1,
-		[0xc000/8 ... 0xc0ff/8] = 0, /* PCI devices */
-		[0xc100/8 ... 0xffff/8] = -1,
+	.pio_regions = {
+		PIO_RANGE(0x0, 0x1f), /* floppy DMA controller */
+		PIO_RANGE(0x40, 0x4), /* PIT */
+		PIO_RANGE(0x60, 0x2), /* HACK: NMI status/control */
+		PIO_RANGE(0x64, 0x1), /* i8042 */
+		PIO_RANGE(0x70, 0x2), /* rtc */
+		PIO_RANGE(0x1ce, 0x3), /* vbe */
+		PIO_RANGE(0x2f8, 0x8), /* serial2 */
+		PIO_RANGE(0x3b0, 0x8), /* VGA */
+		PIO_RANGE(0x3f0, 0x8), /* floppy */
+		PIO_RANGE(0x402, 0x1), /* invalid but accessed by X */
+		PIO_RANGE(0x5658, 0x4), /* vmport */
+		PIO_RANGE(0xc000, 0xff), /* PCI devices */
 	},
 
 	.pci_devices = {
diff --git a/configs/x86/smp-demo.c b/configs/x86/smp-demo.c
index 7ba309ee..e3ba41fd 100644
--- a/configs/x86/smp-demo.c
+++ b/configs/x86/smp-demo.c
@@ -19,7 +19,7 @@ struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[2];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -31,7 +31,7 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 		.num_pci_devices = 0,
 
 		.console = {
@@ -61,13 +61,9 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...  0x2f7/8] = -1,
-		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
-		[ 0x300/8 ...  0x3f7/8] = -1,
-		[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
-		[ 0x400/8 ... 0xdfff/8] = -1,
-		[0xe000/8 ... 0xe007/8] = 0, /* OXPCIe952 serial2 */
-		[0xe008/8 ... 0xffff/8] = -1,
+	.pio_regions = {
+		PIO_RANGE(0x2f8, 8), /* serial 2 */
+		PIO_RANGE(0x3f8, 8), /* serial 1 */
+		PIO_RANGE(0xe010, 8), /* OXPCIe952 serial2 */
 	},
 };
diff --git a/configs/x86/tiny-demo.c b/configs/x86/tiny-demo.c
index 7150d741..c36a73db 100644
--- a/configs/x86/tiny-demo.c
+++ b/configs/x86/tiny-demo.c
@@ -20,7 +20,7 @@ struct {
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[2];
 	struct jailhouse_cache cache_regions[1];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -34,7 +34,7 @@ struct {
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 		.num_pci_devices = 0,
 
 		.console = {
@@ -72,13 +72,9 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...  0x2f7/8] = -1,
-		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
-		[ 0x300/8 ...  0x3f7/8] = -1,
-		[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
-		[ 0x400/8 ... 0xdfff/8] = -1,
-		[0xe000/8 ... 0xe007/8] = 0, /* OXPCIe952 serial2 */
-		[0xe008/8 ... 0xffff/8] = -1,
+	.pio_regions = {
+		PIO_RANGE(0x2f8, 8), /* serial 2 */
+		PIO_RANGE(0x3f8, 8), /* serial 1 */
+		PIO_RANGE(0xe010, 8), /* OXPCIe952 serial2 */
 	},
 };
diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 2e3a1880..17a3a305 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -26,6 +26,12 @@
 #include <jailhouse/percpu.h>
 #include <asm/vcpu.h>
 
+#define for_each_pio(pio, config, counter)		\
+	for ((pio) = jailhouse_cell_pio(config),	\
+	     (counter) = 0;				\
+	     (counter) < (config)->num_pio_regions;		\
+	     (pio)++, (counter)++)
+
 static u8 __attribute__((aligned(PAGE_SIZE))) parking_code[PAGE_SIZE] = {
 	0xfa, /* 1: cli */
 	0xf4, /*    hlt */
@@ -76,15 +82,23 @@ out_err:
 	return NULL;
 }
 
+static void pio_allow_access(u8 *bm, const struct jailhouse_pio *pio,
+			     bool access)
+{
+	void (*access_method)(unsigned int, volatile unsigned long*) =
+		access ? clear_bit : set_bit;
+	unsigned int length, start_bit = pio->base;
+
+	for (length = pio->length; length > 0; length--, start_bit++)
+		access_method(start_bit, (unsigned long*)bm);
+}
+
 int vcpu_cell_init(struct cell *cell)
 {
 	const unsigned int io_bitmap_pages = vcpu_vendor_get_io_bitmap_pages();
-	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
-	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
+	const struct jailhouse_pio *pio;
 	unsigned int n, pm_timer_addr;
-	u32 size, iobm_size;
 	int err;
-	u8 *b;
 
 	cell->arch.io_bitmap = page_alloc(&mem_pool, io_bitmap_pages);
 	if (!cell->arch.io_bitmap)
@@ -97,30 +111,30 @@ int vcpu_cell_init(struct cell *cell)
 	}
 
 	/* initialize io bitmap to trap all accesses */
-	iobm_size = io_bitmap_pages * PAGE_SIZE;
-	memset(cell->arch.io_bitmap, -1, iobm_size);
+	memset(cell->arch.io_bitmap, -1, io_bitmap_pages * PAGE_SIZE);
 
-	/* copy io bitmap from cell config */
-	size = pio_bitmap_size > iobm_size ?  iobm_size : pio_bitmap_size;
-	memcpy(cell->arch.io_bitmap, pio_bitmap, size);
+	/* cells have no access to i8042, unless the port is whitelisted */
+	cell->arch.pio_i8042_allowed = false;
 
-	/* always intercept access to i8042 command register */
-	cell->arch.io_bitmap[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
+	for_each_pio(pio, cell->config, n) {
+		pio_allow_access(cell->arch.io_bitmap, pio, true);
 
-	/* but moderate only if the config allows i8042 access */
-	cell->arch.pio_i8042_allowed =
-		pio_bitmap_size >= (I8042_CMD_REG + 7) / 8 ?
-		!(pio_bitmap[I8042_CMD_REG / 8] & (1 << (I8042_CMD_REG % 8))) :
-		false;
+		/* moderate i8042 only if the config allows it */
+		if (pio->base <= I8042_CMD_REG &&
+		    pio->base + pio->length > I8042_CMD_REG)
+			cell->arch.pio_i8042_allowed = true;
+	}
+
+	/* but always intercept access to i8042 command register */
+	cell->arch.io_bitmap[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
 
 	if (cell != &root_cell) {
 		/*
 		 * Shrink PIO access of root cell corresponding to new cell's
 		 * access rights.
 		 */
-		for (b = root_cell.arch.io_bitmap; pio_bitmap_size > 0;
-		     b++, pio_bitmap++, pio_bitmap_size--)
-			*b |= ~*pio_bitmap;
+		for_each_pio(pio, cell->config, n)
+			pio_allow_access(root_cell.arch.io_bitmap, pio, false);
 	}
 
 	/* permit access to the PM timer if there is any */
@@ -135,18 +149,25 @@ int vcpu_cell_init(struct cell *cell)
 
 void vcpu_cell_exit(struct cell *cell)
 {
-	const u8 *root_pio_bitmap =
-		jailhouse_cell_pio_bitmap(root_cell.config);
-	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
-	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
-	u8 *b;
-
-	if (root_cell.config->pio_bitmap_size < pio_bitmap_size)
-		pio_bitmap_size = root_cell.config->pio_bitmap_size;
-
-	for (b = root_cell.arch.io_bitmap; pio_bitmap_size > 0;
-	     b++, pio_bitmap++, root_pio_bitmap++, pio_bitmap_size--)
-		*b &= *pio_bitmap | *root_pio_bitmap;
+	const struct jailhouse_pio *cell_wl, *root_wl;
+	unsigned int interval_start, interval_end, m, n;
+	struct jailhouse_pio refund;
+
+	/* Hand back ports to the root cell. But only hand back those ports
+	 * that overlap with the root cell's config. This is done by pairwise
+	 * comparison of the cell's and the root cell's whitelist entries. */
+	for_each_pio(cell_wl, cell->config, m)
+		for_each_pio(root_wl, root_cell.config, n) {
+			interval_start = MAX(cell_wl->base, root_wl->base);
+			interval_end = MIN(cell_wl->base + cell_wl->length,
+					   root_wl->base + root_wl->length);
+			if (interval_start < interval_end) {
+				refund.base = interval_start;
+				refund.length = interval_end - interval_start;
+				pio_allow_access(root_cell.arch.io_bitmap,
+						 &refund, true);
+			}
+		}
 
 	page_free(&mem_pool, cell->arch.io_bitmap,
 		  vcpu_vendor_get_io_bitmap_pages());
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index a95db470..4b69654a 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -50,7 +50,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update HEADER_REVISION in tools.
  */
-#define JAILHOUSE_CONFIG_REVISION	10
+#define JAILHOUSE_CONFIG_REVISION	11
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -92,7 +92,7 @@ struct jailhouse_cell_desc {
 	__u32 num_memory_regions;
 	__u32 num_cache_regions;
 	__u32 num_irqchips;
-	__u32 pio_bitmap_size;
+	__u32 num_pio_regions;
 	__u32 num_pci_devices;
 	__u32 num_pci_caps;
 
@@ -277,7 +277,7 @@ jailhouse_cell_config_size(struct jailhouse_cell_desc *cell)
 		cell->num_memory_regions * sizeof(struct jailhouse_memory) +
 		cell->num_cache_regions * sizeof(struct jailhouse_cache) +
 		cell->num_irqchips * sizeof(struct jailhouse_irqchip) +
-		cell->pio_bitmap_size +
+		cell->num_pio_regions * sizeof(struct jailhouse_pio) +
 		cell->num_pci_devices * sizeof(struct jailhouse_pci_device) +
 		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability);
 }
@@ -319,10 +319,11 @@ jailhouse_cell_irqchips(const struct jailhouse_cell_desc *cell)
 		 cell->num_cache_regions * sizeof(struct jailhouse_cache));
 }
 
-static inline const __u8 *
-jailhouse_cell_pio_bitmap(const struct jailhouse_cell_desc *cell)
+static inline const struct jailhouse_pio *
+jailhouse_cell_pio(const struct jailhouse_cell_desc *cell)
 {
-	return (const __u8 *)((void *)jailhouse_cell_irqchips(cell) +
+	return (const struct jailhouse_pio *)
+		((void *)jailhouse_cell_irqchips(cell) +
 		cell->num_irqchips * sizeof(struct jailhouse_irqchip));
 }
 
@@ -330,8 +331,8 @@ static inline const struct jailhouse_pci_device *
 jailhouse_cell_pci_devices(const struct jailhouse_cell_desc *cell)
 {
 	return (const struct jailhouse_pci_device *)
-		((void *)jailhouse_cell_pio_bitmap(cell) +
-		 cell->pio_bitmap_size);
+		((void *)jailhouse_cell_pio(cell) +
+		 cell->num_pio_regions * sizeof(struct jailhouse_pio));
 }
 
 static inline const struct jailhouse_pci_capability *
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index b86756ac..afd1139b 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -136,7 +136,7 @@ class Sysconfig:
     X86_MAX_IOMMU_UNITS = 8
     X86_IOMMU_SIZE = 20
 
-    HEADER_REVISION = 10
+    HEADER_REVISION = 11
     HEADER_FORMAT = '6sH'
 
     def __init__(self, path):
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190726135911.16810-5-ralf.ramsauer%40oth-regensburg.de.
