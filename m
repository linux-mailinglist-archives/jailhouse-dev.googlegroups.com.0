Return-Path: <jailhouse-dev+bncBCB7D7MXMMIK5HML5ICRUBALWB7DO@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E317DA60
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Aug 2019 13:36:15 +0200 (CEST)
Received: by mail-pg1-x537.google.com with SMTP id a21sf38105151pgv.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Aug 2019 04:36:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564659374; cv=pass;
        d=google.com; s=arc-20160816;
        b=gArhzIeYdfYUQywl3uZdzZAKMgVge8xoEGDBJ8TumMWAmTVcSUdKbe/pzTenQ6audy
         1K/glq9lHENgghbD3Ms8DZOhMhUbMWbdXi3DlsJVcG5k02ls2bi3WoibvZqD27vc+2QC
         QE+se+UCGQeZhjP+MnC8ZoObdsn0/9Mfmlc1hascKxIHBXHHLI0fapRJ2hQtcK7XBARB
         5V898dUoTTn8Iq7gI6Yn4oq9liaVco7BWeCCg2IYjZUT3pLQ72RffpT6N5Xm7E1UC0bk
         r8iVADAP/+eNpYzlm/UGU38foLnPeea99y8fO8Op3Ef1BDYUm9g2kJaMUKjKstBsCR3R
         c+ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6UDEdNrrjr3qBQpGEFXXNDfZNeyCu3tOxVMcou83Nrc=;
        b=kF3XQMBLD+pJBwBdjDXvjp5yZnLvihHIbEAyNqZN3B1TgKnqUI6NBLgVyNebSAE/Zc
         fBTraPvg/9lB9HKg8ZraOonXPZ1EmnB1V+uKoLwLA2qpuscvqA4w5gJhmJHQ8HM602je
         ciP4es3B1XWTKJCwmStOFU0ds2+uSVEGQGX68UdH+7GWXpz3YOTfSt7/BxWyikdhXE38
         dj2tIy5odbSxu7ae5MNpdq0XIEGKvTDVFyFEjwazAtneG0IjNXcdx+uhrznSUSba+CxZ
         DgmC3DP7OYvLsufU044DYbOdWMTaIrYnROfEO4VRl23Kq97GbfWUpxEVwXVJNfy4M8pQ
         sNMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ABZuMZgx;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6UDEdNrrjr3qBQpGEFXXNDfZNeyCu3tOxVMcou83Nrc=;
        b=CbGyDYJ9fA02ZYA7uaYX6Rh89OBk4ZbV5pz8/pTmEWOqIBdZFEUByA4XcTFqR5t8ED
         IIzuPPIKJpdzx9TUC70D0UBMqOutCSn3MlvohO8FppegA368q5yL5momwabMPnrP4T9B
         i3hrUltdCwD5C4F8YrB9GaRLyAeMHtWYYZIVcTxtgsH4W2rrpaixeJpboIMkRNedpnZ+
         ZZb5Ezu8n/uIJGIANWB1ZTnY121SW8habZ+r2O2rLaNDeyK1gTE/kdv5CvtUlD+MVJ/p
         l169BV3zLCiqw+zVVq5fgiG2sdvsvzbTBARPYi1/P+CtPa3RB+d67//bHd4xnMZc8eMS
         r7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6UDEdNrrjr3qBQpGEFXXNDfZNeyCu3tOxVMcou83Nrc=;
        b=sI5tYwFeGfKPBtNpy02j5m37Nea7eHxe6M8EVDId6WU0WQMr/MeZqoJRYyNa4Urez8
         ipaIoTVmtfuJYlvTC8RSPMRiq4PQDyIM3XJeyLy105f9IVhrOjjnMi/gsEvMeRt90KAX
         D/FEDb/GKNGn3ldpQK/cy4SrEkP/cMMbEyZoPKRhyxW9UTZLj1wSTur+fLmC2g4/KYWE
         2jDZITqgzuvJCPWAPitiXChVQ6aI639bmLxPPl6pcKscw/FsaTKST8sDGl0TqDYVGigN
         m/S8nFqnmo5fWTZwU5+4xWGdaRFLaA+kklhuDZlWbAOh2o5pNS8cuE6y1Eha0Ss33Osz
         78BA==
X-Gm-Message-State: APjAAAXJYMTeJiwtmZeTxzmXQmn4LwJlZMlnPM1Hmmp9vuzxzyaYMYg5
	yevSI13e+vmn5q1C3Ipy6HI=
X-Google-Smtp-Source: APXvYqw9IhhN6yxeNMnf636kDR7mqQVvH5uM13mF3+EdZPkNOCEoG7/uJM4QtE7WaWSkthHUScaJ0w==
X-Received: by 2002:a17:902:b20c:: with SMTP id t12mr126496950plr.285.1564659374181;
        Thu, 01 Aug 2019 04:36:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:1021:: with SMTP id b30ls20598889pla.1.gmail; Thu,
 01 Aug 2019 04:36:13 -0700 (PDT)
X-Received: by 2002:a17:902:7c05:: with SMTP id x5mr126836270pll.321.1564659373815;
        Thu, 01 Aug 2019 04:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564659373; cv=none;
        d=google.com; s=arc-20160816;
        b=kWnxA7y8jbnMXdHqemfrHVMU+OLThK/hh9tOcO8G/Jw8t8JlOvq1i5czgJtbfbM8Zv
         zIOYEOmGnA00ZiOinXDlj/9psL8AXUHn1vFnKBAo1r4Nal9SwW3+dIU52c93s5y66e5m
         uwEigAKYMT/4lHtpnq4ibuz7UXNuNVqaGug/mvwc9ryCKSXKHpRy5PCOSi5OeuVM0a7b
         82iaQTPSkgFQ+jHUWWfyBBprGn3P/eG6MHjzdzRhPlJSo1dMzBz0NNKJkzwjFYFRn81O
         1ceq4jBk68HPcOM7g3jUjihIWECeImoBl1IKfApEa9oVKFycyF/4UdtGLPw5jj2cYyBI
         c+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2iTbioL74nL4/1iQ2bIS+pYIoJHtCHIIdRdDXZ2XAz8=;
        b=h/YO02dw6hBso063TVJykqaxBkBQ6ECDPG+QYhB2KkL3qjED0NFFtrSv8WGZLUcVLW
         F4kR2hZ641IccEeFYbzcY0iv2BqTdybvgsCkT8cSZoGTJdWg/tDiAam0v8JUsBSrxa6N
         jCNCpmvNEIt6U8vMBtF1jU+r2mfFFLmhFDXjI443dYQKqhhloORYkFdt7VTBoolRa+GE
         lfvkA2j0GilRECWOPVNFLYUkHuezJttiI41R5HQygHR3W+sghjk3HbTufXCfGgltyn+w
         AjxJV2BsHBaJQxcS75mvo9WInPCIQepTjPlIPzntM9N2KDUKAcumEDNO1Fpbf/+ySYtR
         PXKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ABZuMZgx;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id q2si2301547pgq.3.2019.08.01.04.36.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 04:36:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71BaC8e094864;
	Thu, 1 Aug 2019 06:36:12 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71BaCCV061580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Aug 2019 06:36:12 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 06:36:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 06:36:12 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71Ba9uf028933;
	Thu, 1 Aug 2019 06:36:10 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v4 3/6] core: Add stream id list in the cell config
Date: Thu, 1 Aug 2019 17:05:31 +0530
Message-ID: <20190801113531.7361-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801112648.6569-1-lokeshvutla@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ABZuMZgx;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

When ARM IOMMU drivers are supported, it will setup the IO address
translation tables unique for each DMA context in the system.

A typical DMA context is identified by an integer called stream id.
To setup the correct IOMMU mapping, hypervisor should know
list of all the streamIDs that should be setup in the IOMMU.

Add an array of stream IDs in the cell config, bump up the config revision.
Change the python struct unpacking logic in the tools to reflect
revised config structure.

While at it, tell struct.calcsize to not use padding for size calculation.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[p-yadav1@ti.com: Make the stream_ids array resizeable]
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 hypervisor/arch/arm-common/include/asm/iommu.h |  5 +++++
 include/jailhouse/cell-config.h                | 15 +++++++++++++--
 tools/jailhouse-cell-linux                     |  5 +++--
 tools/jailhouse-hardware-check                 |  2 +-
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
index 67ac34eb..9f3e8790 100644
--- a/hypervisor/arch/arm-common/include/asm/iommu.h
+++ b/hypervisor/arch/arm-common/include/asm/iommu.h
@@ -18,6 +18,11 @@
 #include <jailhouse/config.h>
 #include <jailhouse/cell-config.h>
 
+#define for_each_stream_id(sid, config, counter)			       \
+	for ((sid) = (jailhouse_cell_stream_ids(config)[0]), (counter) = 0;    \
+	     (counter) < (config)->num_stream_ids;			       \
+	     (sid) = (jailhouse_cell_stream_ids(config)[++(counter)]))
+
 unsigned int iommu_count_units(void);
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem);
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index e325bd08..73dc8ca1 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -50,7 +50,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update HEADER_REVISION in tools.
  */
-#define JAILHOUSE_CONFIG_REVISION	11
+#define JAILHOUSE_CONFIG_REVISION	12
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -74,6 +74,8 @@
 
 #define JAILHOUSE_CELL_DESC_SIGNATURE	"JHCELL"
 
+#define JAILHOUSE_INVALID_STREAMID			(~0)
+
 /**
  * The jailhouse cell configuration.
  *
@@ -95,6 +97,7 @@ struct jailhouse_cell_desc {
 	__u32 num_pio_regions;
 	__u32 num_pci_devices;
 	__u32 num_pci_caps;
+	__u32 num_stream_ids;
 
 	__u32 vpci_irq_base;
 
@@ -286,7 +289,8 @@ jailhouse_cell_config_size(struct jailhouse_cell_desc *cell)
 		cell->num_irqchips * sizeof(struct jailhouse_irqchip) +
 		cell->num_pio_regions * sizeof(struct jailhouse_pio) +
 		cell->num_pci_devices * sizeof(struct jailhouse_pci_device) +
-		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability);
+		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability) +
+		cell->num_stream_ids * sizeof(__u32);
 }
 
 static inline __u32
@@ -350,4 +354,11 @@ jailhouse_cell_pci_caps(const struct jailhouse_cell_desc *cell)
 		 cell->num_pci_devices * sizeof(struct jailhouse_pci_device));
 }
 
+static inline const __u32 *
+jailhouse_cell_stream_ids(const struct jailhouse_cell_desc *cell)
+{
+	return (const __u32 *)((void *)jailhouse_cell_pci_caps(cell) +
+		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability));
+}
+
 #endif /* !_JAILHOUSE_CELL_CONFIG_H */
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index ee2c52fd..4863e17f 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -564,8 +564,8 @@ class Irqchip:
 
 
 class Config:
-    _HEADER_FORMAT = '6sH32s4xIIIIIIIIIQ8x32x'
-    _HEADER_REVISION = 11
+    _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
+    _HEADER_REVISION = 12
 
     def __init__(self, config_file):
         self.data = config_file.read()
@@ -581,6 +581,7 @@ class Config:
          self.num_pio_regions,
          self.num_pci_devices,
          self.num_pci_caps,
+         self.num_stream_ids,
          self.vpci_irq_base,
          self.cpu_reset_address) = \
             struct.unpack_from(Config._HEADER_FORMAT, self.data)
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index afd1139b..37e02b7d 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -136,7 +136,7 @@ class Sysconfig:
     X86_MAX_IOMMU_UNITS = 8
     X86_IOMMU_SIZE = 20
 
-    HEADER_REVISION = 11
+    HEADER_REVISION = 12
     HEADER_FORMAT = '6sH'
 
     def __init__(self, path):
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190801113531.7361-1-lokeshvutla%40ti.com.
