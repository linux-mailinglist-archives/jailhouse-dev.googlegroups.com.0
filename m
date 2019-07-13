Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIV5VDUQKGQE4KPDQHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB567BA3
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:42 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id i44sf10584817eda.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041442; cv=pass;
        d=google.com; s=arc-20160816;
        b=b2kGuqRS7wegVoTglFp+t+Zn4vi5cQEzKcYFhtCMuYit45z8kOBCqJ2L2JYYuJ0u3c
         rZIXnUO1o41g0vsZ0uVyDW3K46M7nxEI6O4AMLu47JTE18aJns3q7s18eMx3rdJFEvQG
         NdVAm1HJAsb3jEPSIrMisdGBsEKWmB4T27jBDmg7pMpFkXZQSOC7Zf0pLJYhl+1lIXE4
         s5fa9p/YBsWAKgH21lB24V7y6SKVsfVjZSLBqqAwAzIBO9QazJNhHGTHG3CU4RoLEqWa
         P361WoBgcKxhXjOpRLLnCkdB199kDjko9SyF1J7JjdHoxO73h076Y1AggfOfyv0YKpVe
         2jSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KAX+NygHj+RjD2M47eHQxO2id5uWJfOLkZFwNRr4ylI=;
        b=h1OH6qq0rz1URpv2gDzUZzx5L75aih0v2jg4vlvJKjg88enw55asRablUmjIJIAA4h
         hsVKG2seDuDmfxsfcQ/WMX/Ftl4fLUbqAk0qnz6QOMqxHN/HWqWPlPYQL4VPlIoit3O8
         pux2tSNPOdxKdPtde2zEIi8n9WkfUFvj5kIXo8sn/1g7oiuWt96dl6wHYiApyChhVf+6
         /Sfcn8r4YbL/kjZtN/hjsyK1RXrTw/iN4tlezUp2h3eyvfPdjEC8Vi6Cz20LtKpapV60
         LtNaJiALJZW3xmRisKzhIbm33gLYLtbu9lHLvunAw7PUSDLiiODdewBJk4AYMTfEFtYv
         cv6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KAX+NygHj+RjD2M47eHQxO2id5uWJfOLkZFwNRr4ylI=;
        b=eeS3TbI5jIbq8DrgF9hcCIB3xSsrbaNDFMyZUeDOqoM6qGhJ4AsjIVCQqcKfXP7iK9
         KkUjwPLu6VekuLXONx3TanERlGuM/hnGV+IALgRi6Kn/M/hnoz2Ib1MnWdcpV7sPI606
         WzCCImzDSXJFBYpOQKQcPFOq0jQ6Pj5uKr6wWxJXMxAxuBhnTRHvvZh+UbUUpW2tmcxa
         CajwN8rapnSSHkIWLJdlcHbY9BU0b3D5zSmglmzmEGk4VS25bwpmcbWlh2hCMfx8AOZP
         dS3Tcl9TdgitRazW4IagXa7PYNEm7e2empthfcbeZ4EDq2MPrkTONgpYfR4HpI4i7qbt
         Bjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KAX+NygHj+RjD2M47eHQxO2id5uWJfOLkZFwNRr4ylI=;
        b=CI4VrMfOo7R0ZK13j+XYADzpKP7b+mK2M/Fj22bV2VfDvIS3aWluylrVXK2HEw7NfU
         6jNF2DN6rSS4/Xw8Fq4DH6C7sqC6M7lj83h663OgPVTJCDs4MaIUQewzkntKTfWlDGeK
         3OwMDmifzUzYOEhMtiKjfF9jVP41Oi3FEyEtPERkb7qpXmf1ZgGgg/Y1wl2Hcf2fC+Xr
         0Z5BSGY6JdRvbnprvhT1y0qpyJnXk1ZhmMdnOVxpafReGEi7fygMtNAQruW9v56s72X1
         WUxF6QbJbo5YQDQaZZ3fAQBwgG0tJ6FUnU0sRh/gXTxUNTayNTqpZh6KTtPxqOarRX1h
         NPYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXf/dkpz5WQUKZC21DPy14eIAfpb3ytDFLEZ4WQkOgApYZLqRyo
	M8YrS+uKb5mX/7ajaRjsdAo=
X-Google-Smtp-Source: APXvYqyUtiGQCWgp/JM0/WIuDllAIJlOOrYIGnH/dE26nPH9SGlfecYMjXCJcAF/TLHxCbcFzrpECQ==
X-Received: by 2002:a05:6402:1446:: with SMTP id d6mr15590656edx.37.1563041442162;
        Sat, 13 Jul 2019 11:10:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:74d9:: with SMTP id z25ls2737912ejl.2.gmail; Sat, 13
 Jul 2019 11:10:41 -0700 (PDT)
X-Received: by 2002:a17:906:45cb:: with SMTP id z11mr13585838ejq.254.1563041441645;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041441; cv=none;
        d=google.com; s=arc-20160816;
        b=A9KA383zrllzGf1iuBt+DnOAPO0uU5+J9XzMJgKDHApdATG5B/XzCoQwCQOM8uCmJG
         qCBQaj9ePXRThSvDnn9MT3fx2yN9dj3tQwyKAmqHqT8ypuBNzT5q7rgiShmdPlYOSx+y
         5aP9GpmhP00H4qk1AwFilu+UfzQ87GfOHlpL4lsKfYJqSp56Hj+4Rff5/UrlBYzAxAR7
         2SgAv8TNGrOCNLEGT6aXvSHlLlAhBpFIwvuKC1VRV0cwJCw70xEpES12ad9mJcWHAwcP
         kR/8oy+riAuh0P1/YLFebZIwOD1MymHSJXgelR6I00JLbVha6DofwXDdyYDXhhfiowyv
         svjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=UtekCw5frrK7gOl3cejW/FyIn5g97F1vFcyCwTTx3uA=;
        b=Ixg7YmKy65Hg9OedYY7CCLTzUjaa0MysA9aH4x2KAywnu2sXW+MPh+FH9V+QG0oFau
         9nRh4uaoM49PVtbxkFNtCY4/WLH3ni/NyIZeIeNY3jZnbfuv5tXCdAkjEfgW2Sxb+ojB
         WldX1wRFFU+cHSd/8cOyVkqMIxqTNkVlM9ICord2uy9fh6/4DWU5bkzbXQafvRSv/tdd
         7DS66hRdsoix9kqmdgbID2mqJUmq7SfMcIM7jnLcUlWqQ2eO2/q9novHOvF0gn0iz05x
         VaEeSYfYDsOcBoYmVooKiLG5AQSV+NTwP8t9e4MYyLZ6uat5eG6AyGSVSSIZEbgW9Hcu
         Pjxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id a41si745559edc.5.2019.07.13.11.10.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsF1VYhzy2b;
	Sat, 13 Jul 2019 20:10:41 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 11/11] tools: update config generator
Date: Sat, 13 Jul 2019 20:10:37 +0200
Message-Id: <20190713181037.4358-12-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_PREDICATE 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Obvious what happens here: Align the root cell template and Jailhouse's
python parts.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 tools/jailhouse-cell-linux    |  2 +-
 tools/root-cell-config.c.tmpl | 22 +++++++++-------------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 49babd92..160b8869 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -565,7 +565,7 @@ class Irqchip:
 
 class Config:
     _HEADER_FORMAT = '6sH32s4xIIIIIIIIIQ8x32x'
-    _HEADER_REVISION = 10
+    _HEADER_REVISION = 11
 
     def __init__(self, config_file):
         self.data = config_file.read()
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index 81d3a92b..dea06e69 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -47,7 +47,7 @@ struct {
 	__u64 cpus[${int((cpucount + 63) / 64)}];
 	struct jailhouse_memory mem_regions[${len(regions)}];
 	struct jailhouse_irqchip irqchips[${len(irqchips)}];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio_whitelist pio_whitelist[6];
 	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
 	struct jailhouse_pci_capability pci_caps[${len(pcicaps)}];
 } __attribute__((packed)) config = {
@@ -109,7 +109,7 @@ struct {
 			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
-			.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+			.num_pio_whitelists = ARRAY_SIZE(config.pio_whitelist),
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
+	.pio_whitelist = {
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-12-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
