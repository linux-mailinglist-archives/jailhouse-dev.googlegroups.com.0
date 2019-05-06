Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAHCYLTAKGQES76I2KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id DC104155EC
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 00:11:12 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id s21sf13088458edd.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 15:11:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557180672; cv=pass;
        d=google.com; s=arc-20160816;
        b=Lf9PogvVyskQ3q8hlp1E+cS9hQmR0EXKE0JcXaohV2GCzx8Evl/deJ60LWLSN2ATA9
         2iLZn+Zh+But8WUT2IAQN65GHXK4pSBgzuu0onmNXmk8vTGqT8lRrG9JRdVtMYxF1QWo
         WO7VKqSy+oekJAk7D8+cp3cVInMPQF+EuvI5xdRm75cVqYV09QY0/p7ocOJ7myvW/ElD
         oFTdbH8rIDmUQoMg+eYXhvjtXWuv1MZxcfyI4csGxy6smTpkHIfnsXi7BUwxCneo4fRz
         th2d2kOXHEF0VHGwBLgL1yuOkFXSyEELwnQHcLQ5eYID3T3THgiQfQdX8jybACEtjP9c
         YVbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=HTEpbG+TaXNnqgB1e9DyoyGUMi5gS00iDZGr0N9Gjng=;
        b=Hc1LlZ8PekGSOEinkPebISk/BZdymytijgisYTevaLhlex8sJsc/P6BAyMSpWyryo1
         Yy2wgWExM8K+8NmlMRZdubrWkwRPhUwJD/mSpHwDo63E0nhMUC6Up8Zv0pRbrCJhya2z
         v88eyxWlH6mwzLbZepwrJoEXiHnAGB97kp4nhqU4X9cMbGfL1bamG2GQSRymgMSpDiIu
         bd5CBTUDwqjCmaqTTh1CtCMaL1LDLkvRmmqX1aB4rHbb8tcan09WCF2L0fdws15hhriI
         te+DL4XZld9fpv6IWiNxTIIWaTQYnAjHQFPZg+3wW1OjlCtJh4H0wfjitM+HWdga4R83
         s/iA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HTEpbG+TaXNnqgB1e9DyoyGUMi5gS00iDZGr0N9Gjng=;
        b=jNc+1XO61bXWSbn1xWDxaLyHIrTUmOTH+pVE4z4c5ZA/Xq948VPOq2H4wgSmNyZaY4
         39z8+wJkgEK7Hjm8Jh0Nq33UimX1DQjP1Jj/umBaHUQBmwVwAta2a9AYDz/5crh35ESf
         lzla6UKxU0oWeibXIE8aF/5UAz4N5gvj/2iY+uP4FXplgahorwWRtdfUsZEnvbZe+aw+
         cW0z/9UWLDzsbFAH7PHtf1DdKeW1gfi9EPYSh9cxHPvc2BIsI3zmwPcfPVhE8FH4dNy9
         KEILkEUtSFzgDcZ88tGy30+c9JWiSFwZsS/XwjJIp3WlNhUkxPZoSdQ1Ay5pcmZ6qMeL
         MPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HTEpbG+TaXNnqgB1e9DyoyGUMi5gS00iDZGr0N9Gjng=;
        b=ixkCc6p8myESkz/V45U39BiJ4/Erf+2vfW3y/eHkiSLG1mJv9fnki3THdvKdYwUeim
         2u55lOQdLi8kgz9AJ+xoTYvyKKaWU8WnLFGUGzaOVU5v5DZvDYe5hRYZuAVeswAufR9S
         ZIE3ujzvgsFbaxOOSKEMLw1Q+pqA5RP/tL8eg377vCVUoZZ/wiQn7xrsBjECe/QsMjdF
         ZuomKYHwPwIG0GnPUGoA/Lh90maZjpLq+dbmAm6A4bR/8ZHOsGFpkIM9t7sI19QIJwo1
         i1jG8H2iTCtmQNCJqmQdTsDNDYzCneneQVO2U/XAD7aRK5mqJ5lOIS7+QsXfYStP4EAC
         4q2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWSY4xDyrhPVr72pYCZ4W6lWqNrSdXKtqCoYZV9QMlJK1Au3x4D
	sdWJIqhImJiM4B+Bo684eXU=
X-Google-Smtp-Source: APXvYqz+0IzIRrbJUY1o8Yk4TIDdPBUvzNO4RFrrW+LbMXEDMAUwp+MBfpBkmKw68a1ntk4yoCTyBA==
X-Received: by 2002:a50:89b7:: with SMTP id g52mr29029374edg.291.1557180672605;
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:a501:: with SMTP id y1ls1494796edb.9.gmail; Mon, 06 May
 2019 15:11:12 -0700 (PDT)
X-Received: by 2002:aa7:d711:: with SMTP id t17mr29065852edq.80.1557180672114;
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557180672; cv=none;
        d=google.com; s=arc-20160816;
        b=PaOTUaITEOSI72250qdfRqNMAqJMgEw85SsdloUOeNAH4uyHTOvCxzMvwJz503qeTL
         4aC/eWPHJ6AA1ujnV4IoEIMLBZN/ueKPhuP8XA3s5OrkgDSG8mc7k5JN3hUJs+/ETkSO
         8Ejqx841ksYAiS4t8ODV5qVUo0ROrX5+zTWLtfQeYKYqdQNDIg+CgnI8E7sQJiImB3r3
         054M1DZ+K4X0qIKTkmRHeMW9p+T5KJgwb9fhgvuvDgk6gXkhcnhGCAB+T0Y0zbgwpKvz
         N84YhFmWbvOe9ce/nhwoZ3zXN5zRh5ZGA6POAiNQ68np11xuU+5fUH2ZtIaSHbYyaquc
         ktwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=N7d7Y0Kp65PxnxTrWqSLKfRGKX3aoobwLYga46d3eMc=;
        b=Kzvg92HKw+nfbRtVUOS1Mm6iUIuGgCNt29om2Caux4G8i9P4dVc1yU0ubV6TMeM5Uw
         MhMjZmm6ecRAf5AU4Sc5toiy4LKx102Ot0iAEeUXYAG5w1ientpGjdk1KsjLQ+ME6RaX
         z8nGOYbEuKNlM6jqh5ZUPDATCRhA3FP8wmEzN6rBLRAimeTuWJ0Sc3Qx02Tvknu/Azf+
         X9GTymjH+5R+1it6XfcKXsjdwhRowTeo7mAqcQjyLdRlYAsNDIAO1JVKXoMOPvzFf4UN
         FcF/fDgBZVyWJWllgiz0myLZJn+XkjkvaD1lI/1enDVyNEsfxdE7dShxISX1QofHupoO
         5guA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id r4si419035edh.5.2019.05.06.15.11.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44ycQ73wJ8zyB8;
	Tue,  7 May 2019 00:11:11 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 1/7] pci, configs: unmystify magic constants
Date: Tue,  7 May 2019 00:11:04 +0200
Message-Id: <20190506221110.19495-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.6.220017, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.5.6.5600003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Some sugar for the guidance of the reader. Use speaking name instead of
hard-coded constants.

This patch was supported by:
$ git grep -l "\.id = 0x1"  | xargs sed -i 's/id = 0x1,/id = PCI_CAP_ID_PM,/'
$ git grep -l "\.id = 0x3"  | xargs sed -i 's/id = 0x3,/id = PCI_CAP_ID_VPD,/'
$ git grep -l "\.id = 0x5"  | xargs sed -i 's/id = 0x5,/id = PCI_CAP_ID_MSI,/'
$ git grep -l "\.id = 0x8"  | xargs sed -i 's/id = 0x8,/id = PCI_CAP_ID_HT,/'
$ git grep -l "\.id = 0x9"  | xargs sed -i 's/id = 0x9,/id = PCI_CAP_ID_VNDR,/'
$ git grep -l "\.id = 0xa"  | xargs sed -i 's/id = 0xa,/id = PCI_CAP_ID_DBG,/'
$ git grep -l "\.id = 0xd"  | xargs sed -i 's/id = 0xd,/id = PCI_CAP_ID_SSVID,/'
$ git grep -l "\.id = 0xf"  | xargs sed -i 's/id = 0xf,/id = PCI_CAP_ID_SECDEV,/'
$ git grep -l "\.id = 0x10" | xargs sed -i 's/id = 0x10,/id = PCI_CAP_ID_EXP,/'
$ git grep -l "\.id = 0x11" | xargs sed -i 's/id = 0x11,/id = PCI_CAP_ID_MSIX,/'
$ git grep -l "\.id = 0x12" | xargs sed -i 's/id = 0x12,/id = PCI_CAP_ID_SATA,/'
$ git grep -l "\.id = 0x13" | xargs sed -i 's/id = 0x13,/id = PCI_CAP_ID_AF,/'

Extended cap ids were manually replaced.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/x86/e1000-demo.c        |  2 +-
 configs/x86/f2a88xm-hd3.c       | 54 ++++++++++++++++-----------------
 configs/x86/imb-a180.c          | 52 +++++++++++++++----------------
 configs/x86/linux-x86-demo.c    | 12 ++++----
 configs/x86/pci-demo.c          |  2 +-
 configs/x86/qemu-x86.c          | 20 ++++++------
 include/jailhouse/cell-config.h | 16 ++++++++++
 7 files changed, 87 insertions(+), 71 deletions(-)

diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
index 1c602883..54823721 100644
--- a/configs/x86/e1000-demo.c
+++ b/configs/x86/e1000-demo.c
@@ -99,7 +99,7 @@ struct {
 
 	.pci_caps = {
 		{ /* Intel e1000 @00:19.0 */
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xd0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index d5320d7b..258e33c8 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -739,19 +739,19 @@ struct {
 	.pci_caps = {
 		/* PCIDevice: 00:00.2 */
 		{
-			.id = 0xf,
+			.id = PCI_CAP_ID_SECDEV,
 			.start = 0x40,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x54,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x8,
+			.id = PCI_CAP_ID_HT,
 			.start = 0x64,
 			.len = 2,
 			.flags = 0,
@@ -759,56 +759,56 @@ struct {
 		/* PCIDevice: 00:01.0 */
 		/* PCIDevice: 00:01.1 */
 		{
-			.id = 0x9,
+			.id = PCI_CAP_ID_VNDR,
 			.start = 0x48,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x58,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xa0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		/* PCIDevice: 00:03.1 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x58,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xa0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0xd,
+			.id = PCI_CAP_ID_SSVID,
 			.start = 0xb0,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x8,
+			.id = PCI_CAP_ID_HT,
 			.start = 0xb8,
 			.len = 2,
 			.flags = 0,
@@ -816,38 +816,38 @@ struct {
 		/* PCIDevice: 00:10.0 */
 		/* PCIDevice: 00:10.1 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x70,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0x90,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0xa0,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 00:11.0 */
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x50,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x12,
+			.id = PCI_CAP_ID_SATA,
 			.start = 0x70,
 			.len = 2,
 			.flags = 0,
@@ -855,58 +855,58 @@ struct {
 		/* PCIDevice: 00:12.2 */
 		/* PCIDevice: 00:13.2 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0xc0,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0xa,
+			.id = PCI_CAP_ID_DBG,
 			.start = 0xe4,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 00:14.2 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		/* PCIDevice: 00:18.3 */
 		{
-			.id = 0xf,
+			.id = PCI_CAP_ID_SECDEV,
 			.start = 0xf0,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 01:00.0 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x40,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x50,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x70,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0xb0,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x3,
+			.id = PCI_CAP_ID_VPD,
 			.start = 0xd0,
 			.len = 2,
 			.flags = 0,
diff --git a/configs/x86/imb-a180.c b/configs/x86/imb-a180.c
index 9073a4ac..b083d341 100644
--- a/configs/x86/imb-a180.c
+++ b/configs/x86/imb-a180.c
@@ -615,25 +615,25 @@ struct {
 		/* PCIDevice: 00:01.0 */
 		/* PCIDevice: 00:01.1 */
 		{
-			.id = 0x9,
+			.id = PCI_CAP_ID_VNDR,
 			.start = 0x48,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x58,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xa0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
@@ -641,81 +641,81 @@ struct {
 		/* PCIDevice: 00:02.3 */
 		/* PCIDevice: 00:02.4 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x58,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xa0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0xd,
+			.id = PCI_CAP_ID_SSVID,
 			.start = 0xb0,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x8,
+			.id = PCI_CAP_ID_HT,
 			.start = 0xb8,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 00:10.0 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x70,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0x90,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0xa0,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 00:11.0 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x60,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x12,
+			.id = PCI_CAP_ID_SATA,
 			.start = 0x70,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x50,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x13,
+			.id = PCI_CAP_ID_AF,
 			.start = 0xd0,
 			.len = 2,
 			.flags = 0,
@@ -723,27 +723,27 @@ struct {
 		/* PCIDevice: 00:12.2 */
 		/* PCIDevice: 00:13.2 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0xc0,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0xa,
+			.id = PCI_CAP_ID_DBG,
 			.start = 0xe4,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 00:14.2 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		/* PCIDevice: 00:18.3 */
 		{
-			.id = 0xf,
+			.id = PCI_CAP_ID_SECDEV,
 			.start = 0xf0,
 			.len = 2,
 			.flags = 0,
@@ -754,31 +754,31 @@ struct {
 		/* PCIDevice: 01:00.3 */
 		/* PCIDevice: 02:00.0 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x40,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x50,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x70,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0xb0,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x3,
+			.id = PCI_CAP_ID_VPD,
 			.start = 0xd0,
 			.len = 2,
 			.flags = 0,
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index af8c6da4..67e2d849 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -180,37 +180,37 @@ struct {
 
 	.pci_caps = {
 		{ /* e1000e */
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0xc8,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xd0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0xe0,
 			.len = 20,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0xa0,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
+			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
 			.start = 0x100,
 			.len = 4,
 			.flags = 0,
 		},
 		{
-			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
+			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
 			.start = 0x140,
 			.len = 4,
 			.flags = 0,
diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
index c5719459..df026f15 100644
--- a/configs/x86/pci-demo.c
+++ b/configs/x86/pci-demo.c
@@ -96,7 +96,7 @@ struct {
 
 	.pci_caps = {
 		{ /* Intel HDA @00:1b.0 */
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x60,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 68b8f18d..bd789cdf 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -316,7 +316,7 @@ struct {
 
 	.pci_caps = {
 		{ /* ICH HD audio */
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x60,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
@@ -327,55 +327,55 @@ struct {
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{ /* AHCI */
-			.id = 0x12,
+			.id = PCI_CAP_ID_SATA,
 			.start = 0xa8,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x80,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{ /* virtio-9p-pci */
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0x98,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{ /* e1000e */
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0xc8,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xd0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0xe0,
 			.len = 20,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0xa0,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
+			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
 			.start = 0x100,
 			.len = 4,
 			.flags = 0,
 		},
 		{
-			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
+			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
 			.start = 0x140,
 			.len = 4,
 			.flags = 0,
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 66e13c3d..488e43f6 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -178,6 +178,22 @@ struct jailhouse_pci_device {
 
 #define JAILHOUSE_PCICAPS_WRITE		0x0001
 
+#define PCI_CAP_ID_PM			0x01 /* Power Management */
+#define PCI_CAP_ID_VPD			0x03 /* Vital Product Data */
+#define PCI_CAP_ID_MSI			0x05 /* Message Signalled Interrupts */
+#define PCI_CAP_ID_HT			0x08 /* HyperTransport */
+#define PCI_CAP_ID_VNDR			0x09 /* Vendor-Specific */
+#define PCI_CAP_ID_DBG			0x0A /* Debug port */
+#define PCI_CAP_ID_SSVID		0x0D /* Bridge subsystem vendor/device ID */
+#define PCI_CAP_ID_SECDEV		0x0F /* Secure Device */
+#define PCI_CAP_ID_EXP			0x10 /* PCI Express */
+#define PCI_CAP_ID_MSIX			0x11 /* MSI-X */
+#define PCI_CAP_ID_SATA			0x12 /* SATA Data/Index Conf. */
+#define PCI_CAP_ID_AF			0x13 /* PCI Advanced Features */
+
+#define PCI_EXT_CAP_ID_ERR		0x01 /* Advanced Error Reporting */
+#define PCI_EXT_CAP_ID_DSN		0x03 /* Device Serial Number */
+
 struct jailhouse_pci_capability {
 	__u16 id;
 	__u16 start;
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
