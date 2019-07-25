Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPWF47UQKGQEDQKNQMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CE77552E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 19:11:27 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id u10sf5184802lfl.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 10:11:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564074687; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZmRIdxMUwxOelCqD8HxaDOQLzr4UpuUIxYEigVVOa4zjUrnmR/wJd+fTBFWE0TWVxE
         4LyrbXNAI+Cyjm5Vs3rM26fbLW0nCmM4Xv+SGWt5MLKbOsV5u0HiIvBuZvqEIDmDq7Qz
         VsN9M38GEcE5CAK+TTETWfWuS1E5Ps+53qGAKeY6ZDjf/p1U6mLQrc1qlwcbhG2ykw9P
         6J11gxmEVQbX5KMPHGI2ll9RF+uLCa3d2QLUuQaLZjF2oLcG1oApPUzkBmwHcBWKdIWn
         WcaQTYnRjQCLCdqbViDakqpatbl9GDoFrRMKH0ued3by7rH36Qu2foikuLmI0HINrJfl
         VS9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=vLExnJ3sdGlmrgxZoZ2uV3vAnBqLK/BEEwVykEgbi4c=;
        b=JKuyLRSJ/gylpItv9Ms22CyLSAaIT67P/FizSMcldiFnTDxz6VppvpgyPchrbKCZJn
         zp6XGrhkUegISq107JamxirVB/hKvkiWOJKf1AlsIX30UpVaK5pvHcDe1O0OfIHqDPHn
         dMcy3tLLeyHgc/DRGVEO4BbElco5gC9FOze2NkBcdo3Fp/gWrMIIpsPJ32PyypToJbH3
         Ge7c2XtKT1TmjZ3gsaeUUKF/jmDqDUDnfwHfAN5Ti0aRjrC5nF+3vRkwubk9aqi+aiJN
         5I6DZfLBk227XxMB7IOrDZNkFZsmop1TFOihUFqLN3Fs56B9O3cGN/88VrHqxLsD88Jv
         R8LQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vLExnJ3sdGlmrgxZoZ2uV3vAnBqLK/BEEwVykEgbi4c=;
        b=QrmDnAev0sEr+LWEKcZyCEIOIm7Bo/XdYZ1AOcTqbDXkAApDKCldTI/sjOF9iC+thy
         56iQyNM+g9OlHp6J90snXT63kZrMPfCS1KNmFh4+jjrCJC9XIXxmopqKHCR2OMOQtfjA
         H4j5ajTQsEA+dwAG6U0SO9XptfmMj6uSqK5ARP8LflTGnPeOgBJTFoO/ygTBIC1/I2ca
         XjA6D2j5Sg2OvcP/VBvKz0PV0ToEeMt0wePEtFocrEkvlhpArU10A8wcI2mXASBZ/bGS
         HPVTO1lfJoBnwqxZGBgdIs9j3z1SyjC161buBufkJvRa45IQQTIGVyllLWWDV2T2WiIN
         ccZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vLExnJ3sdGlmrgxZoZ2uV3vAnBqLK/BEEwVykEgbi4c=;
        b=pcfrQuMqkFdzHgCCUe39Xhm1MZkflTPAOwNQlPapgFlkO8zNxM6/DGGbjA7gRcnqFP
         5dHW8FRc7iCyG/yh/QYWXNbGNgNykXgvhE26AH8JQ5gendg9RHtZbUrAfYqGtXK/xNHX
         Z8hr9ylsKO4bRltxvv78J42QV9inwJtnn/fn7MhzCRJA+4mYT16CJWLjHmr2s8LL/xCU
         cEetZwdxCB98Ja+NyuTRwrU31s/bTtIHM7zPlXwf/WsE8AJte02RGT3n367c5DbMMhEs
         QaB0AKvoKlf4VaROu5PWReIHcs5GqilfqDwQnD4KX+Hm7hS/sC9NlEoZ2DeALR3W/ZPL
         /CNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXoZBSBU6rXryE3NuKYZ36Bsk7pk+ZbaHU+gf201jueKvh1cg2e
	tZUNtu8MiamS6td6R7T3DXg=
X-Google-Smtp-Source: APXvYqwoFiQ7D8KaoN38bVVvBN2EoHSL8mHX9oSp8cEe+P84Fp9ATajUNhyunla/qzetBqDNhV5NeA==
X-Received: by 2002:ac2:43d0:: with SMTP id u16mr10918723lfl.38.1564074686844;
        Thu, 25 Jul 2019 10:11:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:96d5:: with SMTP id d21ls5796390ljj.16.gmail; Thu, 25
 Jul 2019 10:11:26 -0700 (PDT)
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr47057119ljj.0.1564074686240;
        Thu, 25 Jul 2019 10:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564074686; cv=none;
        d=google.com; s=arc-20160816;
        b=0WECs3yNX2fiKudprAbPeTt5GL8GFrxrNMGmCFv5unqJto/NDNoBMqsex1QrdXH+gl
         3PaC+j1ZYQC9JIe06j76sYnh+m7WrrEe6mZOmxxelDUrFUMhv7SVGDp+xz/F7EDug605
         Qf7upKR550mZxdbHPNIpp09M/S6Z3+gH5RfPZpEXUEjYxx7pIJzDHBb7RwxcnAzuzskQ
         TDUTDR28uzZPGBpsxMDAl0eKNQ4YFcRXEA962csBtADVuHFf+y+Cqlszfu0wKuRKqq1J
         k0GbnF6ZXlESTSfTAPnNgQb+jW/Sq6JdkE1qPUIZcs7KZJVybqtKs8LJSUxcXwyYcZHg
         nL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=FKnfObSlgvpkARu/aS/AheV4NU1ngl0yIEosoz8r6vc=;
        b=HMM6x/cpntgusOmkXnWQ19k148W3c8mx6BdCuyK4vY9pMDIJRoCth14//VspXSe5Jc
         uOZHy9uOQ+X1pfcy6+qn6rEbMOWujT4P7eqBZ603HZ2aBNXBgKIULZbs+NhrWDIZPmhE
         COZ4C7ez08PHIF7oTacb5OAeipxaSVyHW805lDAmnakHjioFp5Z8tDjJ4EMNVp2mWGMl
         eM+LCmaLPJfqwd8/Rp7WdwaSAWaDxvsf/+nxwYrZMzQytXFC9akBsAieyODmEM29CdGT
         Z58ZqfzaDyCyxLRH3qvXiiImDm0F37uZ6yWuhwI6ag2iRm5NM0N5b81huqKGs4y7bpLR
         /UcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id r27si2067646ljn.3.2019.07.25.10.11.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 10:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45vdzK2cbGzy7F;
	Thu, 25 Jul 2019 19:11:25 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 4/4] tools: update config generator
Date: Thu, 25 Jul 2019 19:11:23 +0200
Message-Id: <20190725171123.9266-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190725171123.9266-1-ralf.ramsauer@oth-regensburg.de>
References: <20190725171123.9266-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.25.164815, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.25.5630002
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

Obvious what happens here: Align the root cell template.

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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190725171123.9266-5-ralf.ramsauer%40oth-regensburg.de.
