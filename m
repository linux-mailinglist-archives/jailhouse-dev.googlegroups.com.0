Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBMMO5TUQKGQEFNRJ7LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 6164376A77
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 15:59:14 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id o2sf11684525lji.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 06:59:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564149554; cv=pass;
        d=google.com; s=arc-20160816;
        b=yIiyHMWd0YjEKOPDC9e0EXwJUWnpmCgL3z3vMH3mWzHhb5DsELaWz0W0Od9ngE25KA
         W+GKVRRNGwPUDgsSpfh32QqW7F3w3XpuDCAort6odfuSmhM0f59aPZvelTexkBn7XxSH
         SONPCG4DeDgoClsV2p0rTC1DrUbjntblmz/SWVJM9WuSVPaKVecCtjO1Oo1IPAQFdIsz
         Jjj4aMvlQHIaT6bJHNYf+V673ydw5CEN8GBKKcb/7+d7NgW8EmADIZd8BoK3MeFjMtFX
         ShvKGFjWia2jMF28f8xKk4zvtBOsxY+QxniPxLf/ZO5P+4Rh32FZDnKAj9WDVGZ8OLpg
         TW5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=nTmRi50T60LpIZ2d93FwZ0qbkaiSo1+IVqZMzjem7V4=;
        b=oNfzgrYc12I4bPws+Nk2PgYccTXhJgRT91U0Wg8lqo9O4/qAU3DTWFkKxVTJkaQb6/
         s9EelGTtUiSPKzaph33mX9uPxRrbaSjJoi15A+VfIDN4LYP+owqGKa82iCiupEcvN+Tx
         qcCtcn9tdp1zqFXNqQtZekcRwgWNkQMflL7poVWGqbTvwPrPqM5aQ4wtnJEELJkVjAuy
         dmioxhi25WTNWqhQz5IrQuel8nhBQgQTb8tR7nJkxbsAbIevuilxGM/Y3JkrDSZl/7v5
         kX955mG/YTKVcxKRVjGODV+WgEl6yhO6hYWcs2jreJIC/rx4BxV6bvv1GFM0Bv4hZ/SL
         qrNg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nTmRi50T60LpIZ2d93FwZ0qbkaiSo1+IVqZMzjem7V4=;
        b=f5XFwJic5OBngO1nVLgzS8vvWk/a4x7YOdr5ii05ARYYyBj5uCUoFSC6BVfAGJOL5A
         okai+YynXqvpueBH4jqTVCZsP4P2x5AB8H755iYqVt6YdOXk/SR9P6xqq7pe+WH7O8io
         AjqLfjSjx2IX96Md0Ycjkk8oUq5LApO30zx821ba9jDTXi1lrIwCeBUFt29cMpsXOiyV
         rlV9qr5ccT74r3PKjxHpgSK/VYz6O3Nqt9h1xocs3/U+DuCoYICyI6BHYsn78ap9aTgS
         D4ONt4HAkcQXUad9nuFm4WxPf/9B3DOxNp/n3TejD/3/K8WZJOC/wq/FWhi6lqTwSTdZ
         nmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nTmRi50T60LpIZ2d93FwZ0qbkaiSo1+IVqZMzjem7V4=;
        b=JwDJxYvHqAFBIQj+3D8+L18SyRxL6j/yoKiYRO+6QJT2HXM+D1TjQ2cQq5wTir6quW
         zBFzYlNu+Zsa/JWOZGK+g3ujgQJ/rE295zushWQqcnTVij10D4eiCDUm+h26IMub685B
         qJ+Kxr789ugqyqeziIptLqr3jWbgW/FmEvChKZnpF3SHSSwSp4WBEL/oqPG+WlDspd2j
         WZlmuo+LFCqf5LKL1qNI2dDaEgPd6sJ9cUJD9KAEAaDw+biF2brW5JeWbqXPN8I4nj80
         H8sa3XQlzOPj/3XdUfbCtPOZgqHsSvKZfpaBoKLbppzB5TkknVkbswX6I3XViibWqfGF
         JkGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV8hQ2Q/I/Lk0rneGQWMqXni4VnvH1bQ466Tbeh9hfl5teX1PdA
	0DHGAZfLJioV6DOMn9m6gP0=
X-Google-Smtp-Source: APXvYqwo+RWM6sGw42IsWO3DUqF1jUJAJ9LiAbM+tZeUU/UXua7DkoV4355ZdTgkqLlvQ+0wfgwbBA==
X-Received: by 2002:a2e:7818:: with SMTP id t24mr22166929ljc.210.1564149553963;
        Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6556:: with SMTP id z83ls6150473ljb.11.gmail; Fri, 26
 Jul 2019 06:59:13 -0700 (PDT)
X-Received: by 2002:a2e:995a:: with SMTP id r26mr49666927ljj.107.1564149553489;
        Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564149553; cv=none;
        d=google.com; s=arc-20160816;
        b=kUMsL4ENwST/B4hKP3ormsiKfSy2Hb+gV2UWaCnxSczaWMdShmpMEgiZy+z3mY52Fm
         BW2V5Q5VZtHd6soo1HVsdxw2tGcMbqsN2is19vYdgIUeTUIyP5I/xvWuMvyX9rCAIcck
         G4RjouI4EAiH5bXG9kR9sySQQNC1hbiwUNM6R68mWXSvD+Y5uAEUynLeBHsTX530uD2L
         0NJKeejq1jHTOTLOnO16nYr1ufxd7AE9ZmLVI4ssDzu61Wd5p9mZSsDi3KRrbWy+9ps1
         bCYQMjwa4vceq+BB/D3oE5xIBUya2AX3ooTBs8FH7adwpEOjq/BRjKs7vtV0ahut7VAX
         le+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=+hEh8YQMhMk2BI+VuzLm5kzzjC3SalPEIEY6oPgY53Y=;
        b=DAH1UIpgIlbS5/6DG+UxI+LuV9ovrjoK93awxf6lx18sqnfyL++L/gbU7kWKdhzh/B
         /2FUF3kc8e/F4hkweFB0VHnm4KUi8fXvlO43THxsIcyvxnmbkcRHbMt5wBrcncn20UrY
         e3WQyhbCb60OdOFlI7ETUmhxL6p2viSXA/80/rziDgUipzpW0bVJ6UtUsKqZAg13h0mj
         szAuwb5leM+W4AxkiQf1lLa/Z5iSmaHwRQn2Xx+N600SQQ6fHJlG6E/0dKn/uJ/XDqGn
         cP68L1/BnnczLD270W6DCqCZDef77jzEcZJcdeWUxYoxOKfjKSLpJzxW13aEu9Xz2ab/
         v7MQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id v29si2642562lfq.2.2019.07.26.06.59.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45w9g44Dktzy8l;
	Fri, 26 Jul 2019 15:59:12 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 5/5] tools: update config generator
Date: Fri, 26 Jul 2019 15:59:11 +0200
Message-Id: <20190726135911.16810-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
References: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.26.135117, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.26.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_PREDICATE 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Obvious what happens here: Align the root cell template.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 tools/jailhouse-cell-linux    |  4 ++--
 tools/root-cell-config.c.tmpl | 22 +++++++++-------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 49babd92..ee2c52fd 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -565,7 +565,7 @@ class Irqchip:
 
 class Config:
     _HEADER_FORMAT = '6sH32s4xIIIIIIIIIQ8x32x'
-    _HEADER_REVISION = 10
+    _HEADER_REVISION = 11
 
     def __init__(self, config_file):
         self.data = config_file.read()
@@ -578,7 +578,7 @@ class Config:
          self.num_memory_regions,
          self.num_cache_regions,
          self.num_irqchips,
-         self.pio_bitmap_size,
+         self.num_pio_regions,
          self.num_pci_devices,
          self.num_pci_caps,
          self.vpci_irq_base,
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index 512b9f0d..d24a3666 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -47,7 +47,7 @@ struct {
 	__u64 cpus[${int((cpucount + 63) / 64)}];
 	struct jailhouse_memory mem_regions[${len(regions)}];
 	struct jailhouse_irqchip irqchips[${len(irqchips)}];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[6];
 	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
 	struct jailhouse_pci_capability pci_caps[${len(pcicaps)}];
 } __attribute__((packed)) config = {
@@ -109,7 +109,7 @@ struct {
 			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
-			.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
 		},
@@ -152,17 +152,13 @@ struct {
 		% endfor
 	},
 
-	.pio_bitmap = {
-		[     0/8 ...   0x3f/8] = -1,
-		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
-		[  0x48/8 ...   0x5f/8] = -1,
-		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI status/control */
-		[  0x68/8 ...   0x6f/8] = -1,
-		[  0x70/8 ...   0x77/8] = 0xfc, /* RTC */
-		[  0x78/8 ...  0x3af/8] = -1,
-		[ 0x3b0/8 ...  0x3df/8] = 0x00, /* VGA */
-		[ 0x3e0/8 ...  0xcff/8] = -1,
-		[ 0xd00/8 ... 0xffff/8] = 0, /* HACK: PCI bus */
+	.pio_regions = {
+		PIO_RANGE(0x40, 4), /* PIT */
+		PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
+		PIO_RANGE(0x64, 1), /* I8042 */
+		PIO_RANGE(0x70, 2), /* RTC */
+		PIO_RANGE(0x3b0, 0x30), /* VGA */
+		PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
 	},
 
 	.pci_devices = {
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190726135911.16810-6-ralf.ramsauer%40oth-regensburg.de.
