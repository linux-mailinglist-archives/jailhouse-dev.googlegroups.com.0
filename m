Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBV6X5XUAKGQEIXZEJ6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB175D1D2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:36:08 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id h47sf16470831qtc.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:36:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562078167; cv=pass;
        d=google.com; s=arc-20160816;
        b=g520zb4qYdHf0GUyxvWi7dJQmjcOGLGG/LOOAX0BbnEay10JH43hWosir5X1O5xGCf
         LWosPa3kmuXvpGBhDIEJQylqHLOKwTOYJ7ur7bmwwUbHpnrbeVNFazGpfgZoERpl+p+a
         RzpdisAs24JiDzMClJu4tVbvsZPbw92tlfmMuHaYJg4V6AW8zW18oX/3zGL4OGplg0iH
         ZXL0hlUqvYA9n8No+SS9uIk/sEtkNhuvLoaS6IezdK5mfH2bvSMdbnQe8GTxfUEEDgrJ
         OMU6KbHPonX9+REvN2HO4E6Ej/3dY8hATw4DZ5POSyTznOfoPx2sVKrnowau2HNqnRxe
         BecQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RCcRPIp9x/1VxoZL7gJ3PjMOlGMdSSOH29dUTOgItxE=;
        b=f3A/C8BJlrSihLA1j6oG756wrJh21wB0IBf1PnYIRpQK1qjn9mvb7ol+/6U+7Y0eNv
         pJGei9BFX8ZvTipWyIis0ppNhxb6GpVGhFnxCptEOTUwZSh4xiQM6Z8mFBMpzU3dScZe
         OmcmW2vZ2oGNfsFLSjTv+ZMDoKufaNdLBTJJYj4qRBrhT5IapSG0l9evshOPzVk9+P3b
         pSkJRSPQ9Ki36FBmDgm1HDNK1m00E92+AxfaPaLkQsnMwaTF/VSD+iHM/5jSORS9/R+B
         vzp1Qo1z9gYJXtAbFcr5p/YE6TDEsNA6Q6Cw0MpONOryq5FlSmJTBV1ncZTw26oHwWWi
         izeg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uuBj5NSp;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RCcRPIp9x/1VxoZL7gJ3PjMOlGMdSSOH29dUTOgItxE=;
        b=nygMwzaXJZF9FQAlV/pXiXYjh35SxyvpYXP6U0J8PWe1Cfo1lP/9j0kdnbq3l6u3St
         Y9nhnQ72FoQ3A3UnEusIAaSWKt1vFIFyTSIYEUq9x2hZwBY85TN4sBnv9enhzeT9EEmR
         SwTYe05wEnQW6HSk0rHMjIvedWjCKvks7bkooRvisGGBMEWVWnZaRGPKt3IdMuzV+BjC
         lGPgxccG5zvDPf8oj2kZIOgYydMYPzX4B3hLjijPrhqiAVHm9Qhpme7DWpQ+2+9Enu4w
         XQC9icprYACep0VYd1vMW0+MgAXh37RuyRxp57KtDHRx64QDtdrxyeR5x9ZZgMO4ARqy
         naMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RCcRPIp9x/1VxoZL7gJ3PjMOlGMdSSOH29dUTOgItxE=;
        b=Pn0A3wTCfqn9cClVDzuMQImuxbVuN+zWpOZKvx89jLBAVt3mGn7Q4njbOB69lk2iX/
         x0RyHjaHHiV5tUdais9uTKNHl/SHb5nZwFj2mLVdp4RpQMpWS5izv2+ecEVOwq8Qxk69
         ljrFrrFMt0RflxdCpLazolc/fHIMSPy5njSjMtRfGl9TxznpukROTn1Mr4Byaoxzzq1w
         y3s+WKlBTMG9a/FYjILVz98BCks2RvnSs0uKBxXtTG9gUHGCuuUcjBig6qVGTgxZFchx
         V7tRkpG06O1I+oupIGl0iMJTSxgf5v9jbzQ7EcFmwrAXtwoGbb+BCX58WUrZzuqJt/Gu
         wikQ==
X-Gm-Message-State: APjAAAUvbPaZ/cwLCV7cVhRhjOTfue08dLfIVwz2+kVehIMj7wZ9d7/9
	YcrHBRuqK+TRuVsxqmKc+ug=
X-Google-Smtp-Source: APXvYqyjIOBYY049bfb3xSn7WQ2vRaQhtE7a1WOb2rIzMV2G48n4VbUd5qCv6m7DZhv3a4ofK5FFaA==
X-Received: by 2002:a0c:887c:: with SMTP id 57mr25951389qvm.192.1562078167224;
        Tue, 02 Jul 2019 07:36:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:c782:: with SMTP id k2ls2454574qvj.3.gmail; Tue, 02 Jul
 2019 07:36:06 -0700 (PDT)
X-Received: by 2002:a0c:8a26:: with SMTP id 35mr26549832qvt.158.1562078166913;
        Tue, 02 Jul 2019 07:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562078166; cv=none;
        d=google.com; s=arc-20160816;
        b=l8QFf5LRmA/x+SpAO/5hH2n5EeafHe0lpyfgXC+cqCqH1lFrRaTCtRX7R0zDNrnwxq
         qY6A6V993cVlc3hLio37rbVw99Tr+RtAzHozUzA7l4GIROXAKEo2CTKHFaZhxVc2/N+K
         ZK9u7x5nqzO1sdSvK9+qC7Vd4CGCaGNLVUEfn6/GPYXL6Dw854w3hLgyBnOV8HaJfDp1
         N+RluOV4sy/JpK/vZGTBZaLA76quR4/KwfjBY+JYKxqSrYJYnGIgmXveH1uCjHYuXlK3
         SMRunVOrpxNP4PTAzO9wJu4/JJvICK6w8x2oVvipBvNi+ux2wnG2+fVENSuPmg0MtnaA
         4N3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QpY4EMBmiGMSLp1NedutCnu9Jgutg2Y12QSLib7Wldw=;
        b=CFvAGLiomAZFwXDJndiYX1hS8mZVwZccMseQbsFHCgP6KcjZJ2VFY3eYjQW97SEGyV
         4S40PuZGr8BbLs9BROlKIE9JhdSP/l3pG+AaLcQjmyw8dkcrpDke4foTwkXr2mzzNYZ7
         uD6fHmNVWdqYaHEHFU7HT6fEI3TbelhDBGJmOvu0Sn2/NEQD0HPfgrDWh+BHemRQ+FRZ
         gd8VELq/TP5R50DpbAPLyRzgy4ceCG2VAsMr8B1jzJDRwY1HgdsxroiwZXhp7pVTnnpN
         Hwv8tUi7zAzZERtAA79nhxNMqtD16PbFgbK/gW2k0jiUJFVLCbOydLBo1TkaYUz5OPM4
         cc+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uuBj5NSp;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id z145si649736qka.3.2019.07.02.07.36.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:36:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62Ea6gP086497;
	Tue, 2 Jul 2019 09:36:06 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62Ea6ee120751
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2019 09:36:06 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 09:36:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 09:36:06 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62EZtHZ022917;
	Tue, 2 Jul 2019 09:36:04 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH 3/6] core: Add stream id list in the cell config
Date: Tue, 2 Jul 2019 20:06:04 +0530
Message-ID: <20190702143607.16525-4-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190702143607.16525-1-p-yadav1@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=uuBj5NSp;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

When IOMMU drivers are supported, it will setup the IO address
translation tables unique for each DMA context in the system.

A typical DMA context is identified by an integer called stream id.
To setup the correct IOMMU mapping, hypervisor should know
list of all the streamIDs that should be setup in the IOMMU.

Add an array of stream IDs in the cell config, bump up the config revision.
Change the python struct unpacking logic in the tools to reflect
revised config structure.

[p-yadav1@ti.com: Add size define for stream_ids]

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
---
 include/jailhouse/cell-config.h | 6 +++++-
 tools/jailhouse-cell-linux      | 4 ++--
 tools/jailhouse-hardware-check  | 2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 198fef5c..caf2fba8 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -50,7 +50,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update HEADER_REVISION in tools.
  */
-#define JAILHOUSE_CONFIG_REVISION	10
+#define JAILHOUSE_CONFIG_REVISION	11
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -74,6 +74,9 @@
 
 #define JAILHOUSE_CELL_DESC_SIGNATURE	"JHCELL"
 
+#define JAILHOUSE_MAX_STREAMIDS				32
+#define JAILHOUSE_INVALID_STREAMID			(~0)
+
 /**
  * The jailhouse cell configuration.
  *
@@ -95,6 +98,7 @@ struct jailhouse_cell_desc {
 	__u32 pio_bitmap_size;
 	__u32 num_pci_devices;
 	__u32 num_pci_caps;
+	__u32 stream_ids[JAILHOUSE_MAX_STREAMIDS];
 
 	__u32 vpci_irq_base;
 
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 49babd92..4b6f504b 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -564,8 +564,8 @@ class Irqchip:
 
 
 class Config:
-    _HEADER_FORMAT = '6sH32s4xIIIIIIIIIQ8x32x'
-    _HEADER_REVISION = 10
+    _HEADER_FORMAT = '6sH32s4xIIIIIIII128xIQ8x32x'
+    _HEADER_REVISION = 11
 
     def __init__(self, config_file):
         self.data = config_file.read()
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
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190702143607.16525-4-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
