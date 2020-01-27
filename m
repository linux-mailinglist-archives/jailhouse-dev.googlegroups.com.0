Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBTWYXPYQKGQEYWBHAWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC4614A588
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:57:36 +0100 (CET)
Received: by mail-qk1-x73b.google.com with SMTP id r145sf6183249qke.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:57:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580133455; cv=pass;
        d=google.com; s=arc-20160816;
        b=zh3hWgAhILP51++c0NYYZIMvINPVgY1sg6/AHUiAhtT3msYZLf2+G7/eJ5oGyWDxnV
         bfW7cDIYqTwckTrsGNnNBjeBGdLL7lUANpWRX+f9UgNKYjNpMAGTXbS+MxthS+ED3zp1
         pEKJSRBUXDCelUN5TBi9GUXIoXoEyF+b0cgQnzMcjIVEMa2/WaGDOUoJN3XJg58V0DHp
         60Ld2gVTHK1SBiIjO/lEdI1JJHU4kMEBSHVj8kQqgRCynkIbCuLpykkSygdFbPDx83OQ
         OCKx4v2G1ZfmPEKR/woN0FRy3NrAvS1nSozoYDbXvzstJG8W6fmo/0e8kB4Ycq7FQFsL
         BXHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pTA0GK/gfnPzkiLid11fo9lXIVFNn/Qu8Da3xd5XmKI=;
        b=FMMe+0XlaCkYcKvhmh/Itc0WatxAsk5/sEAhKF7b3iyJSt+le8pKC2dhXAj0JfNyM8
         66UklNp2cOUlSc9xyup2LN4skodjVCxgbnst3S7uecKr5KmQOHiqNV4pAnphN5j8wCey
         ZVg2apOqF61nS8Td19O2mO8Jn/4RZ3OkW1mBl2ooP+RG52/Qu05kX4WfYDajjkdXHod1
         ysHDhYEBhIJmU2Dbn+bhwAOcSuG2INJQUrHgqIkZ3hf0CxF2fPGsN5dZFwwMwX4Ocltm
         1wsP2cbsiBGBPnkJi3aqtZN3k/CDH1z2Z84Ut1NWm1gQxehXXqFReGiPeWaCPxGpZ9YM
         WYRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZBTlnwL8;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pTA0GK/gfnPzkiLid11fo9lXIVFNn/Qu8Da3xd5XmKI=;
        b=IM2i51/UT0puxDAhTX84cYn/u9z+uuzSdE9oZRkuRDz8Yi3hylsR/20tJ6GPcNwV49
         n1bOPePE0IPfivQM9KaPbQFyXBZR6b7y6QNjd6CFaNoXH6JbguCGn7qXb6vC37d+qZkb
         g9w5l8Eg+pPIB0+OAsBSK2iyDQXhmaqNe+8jcGyrkKbzxVb7PSfenHcJmLDg3hN4k3vO
         ufOaHMA87+YpvII5WMguW7DHQC7DcG8PR1GQUv5bvUc0susGW+zYLj/EjyrbyGQmfGf+
         eMk1lddlFrQupGsI61S7KjMiQQQUJoDXmV0cw2CepcUWTZOp0hLFdRVbSkb3SFcfWxHs
         XkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pTA0GK/gfnPzkiLid11fo9lXIVFNn/Qu8Da3xd5XmKI=;
        b=Ek1Wl586IR9x1L8cbo+bbeRmWZH5Khl14acIBaZ2ZOkmEkvuWKlBBDXGWJYJWURieh
         bfTtrrj+vR5fOlelawOtcgJJ7ga6yW09c9YjN0uEPyz9sIM9juCyPkPbVirxCLFDLmer
         IHb0/luRnNWaxcjQx9P3f7JRNq97Ba9zxS4OrMzMemJi16/8e0LJKTiCulY59FHJ39/l
         qGVrewZyrbY9CVcLH4c3fG1H3i+0wHzPltOmEgHxWQghk8xUKzM1+7L0TuEDcyXUEMQ8
         4u2Kj4SRu8Qtj2ucRHSwg1mqTjPdPvc/ig4aggVctY2lej+7UVtbAINqbtHGuMeNDTev
         vFuw==
X-Gm-Message-State: APjAAAXuJvrLmfnUSggoT45kLNKt8K01m0DqrmCVMuDCX0SKSQbyau8c
	rCJ1tFuboxN1aYUJfRlWSZQ=
X-Google-Smtp-Source: APXvYqyPwY1BzwQed2AJTtU2TZ6fb3JpLbzNpqu5ikB16eyRnxPW16jjnDmonio7TDlpbus1kXyrXw==
X-Received: by 2002:a37:7006:: with SMTP id l6mr16774236qkc.51.1580133454971;
        Mon, 27 Jan 2020 05:57:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:cd13:: with SMTP id b19ls2045726qvm.5.gmail; Mon, 27 Jan
 2020 05:57:34 -0800 (PST)
X-Received: by 2002:ad4:5144:: with SMTP id g4mr16610164qvq.179.1580133454481;
        Mon, 27 Jan 2020 05:57:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580133454; cv=none;
        d=google.com; s=arc-20160816;
        b=P4o3Gq/Xdeh3Bmro3Tg65f4IPQgOr6XHVpzDTQWk2SYt4rxAQAV2uFiadv2w25+Eys
         ElmNI8DJaPna4UTdm+N+KhiWUg+4mIemakFezQoaOKnlACryc8mcXCtYVJBfO38VOlSA
         cgkyukZZjaDcyuOljfzDSkNxUfbXRTo0Br89cMiQ2GDMwgY30Lj8fDhS4IcIb4C/49d0
         kwH/8xzvjXrKLdTpiGMPgZ/R/PBuhtvoJp9V02k7lm9HzHgOJVM/MoriQo4O6+19SQuV
         WCOee+3TS12xJk8IXTldz81Lg/efi1e/7ZUMOx+6SN4FlnLT4pW1ymDtHH1gPJGM0GQ+
         dhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1CWxV7udte/qG9g+IpwApIXxhD7iCw04h2ZPtnrf7nc=;
        b=cMifMwYOsDch5eQPxPF//1BII5chGrwytrkB32LWflNApgYmvjJJA/i+C0aFJOB9ID
         0Tneh765YypWGRVVmzN2Mo3QGwmPEb/VSg6A9DHxysX/AQZtBMY6mmb9aHBmmwJSiSWb
         dsNaW4kB7fxB9cV+X5olSE+o/mMK44cTVkTqW1rcl9pbmO/kfzln3ScNOsfj/MpRe6ba
         C0TqAkj6w3dQ7N9TPbuoAgsL7hx3rq2KMh4jJfraI7AsYUwc7xeUWojg65WYgZGGanGc
         VGxnuJnGhBWEeS39TI0mcfaKHpnfpyVhSW91FHvvUuIZwniRGGx1ROK6Ks4VfzGGLkjl
         Fn6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZBTlnwL8;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id c22si287813qkk.0.2020.01.27.05.57.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:57:34 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RDvX1b056560;
	Mon, 27 Jan 2020 07:57:33 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RDvXRI071534
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2020 07:57:33 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 07:57:33 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 07:57:33 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RDvS1t090460;
	Mon, 27 Jan 2020 07:57:32 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [RFC PATCH v1 2/4] core: Introduce regmaps in cell config for partitioning registers
Date: Mon, 27 Jan 2020 19:26:09 +0530
Message-ID: <20200127135611.21302-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127135611.21302-1-nikhil.nd@ti.com>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ZBTlnwL8;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
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

Typical SoCs tend to have hardware blocks where you have to
partition the resources at a register level.
e.g. pinmux, clock control, and other common registers need to be
partitioned at register level granularity.

Adding jailhouse_mem_region for each register does not make sense
because of the high number of such registers. A simple bitmap
would be useful to describe the individual register ownership.

Add support for jailhouse_regmap, where each bit indicates ownership
of a register in the region specified.

Update the HEADER_REVISION and struct parser formats to reflect new
struct jailhouse_cell_desc

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 include/jailhouse/cell-config.h | 22 ++++++++++++++++++++--
 tools/jailhouse-cell-linux      |  5 +++--
 tools/jailhouse-hardware-check  |  2 +-
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 30ec5d06..18d63dde 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -50,7 +50,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update HEADER_REVISION in tools.
  */
-#define JAILHOUSE_CONFIG_REVISION	12
+#define JAILHOUSE_CONFIG_REVISION	13
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -96,6 +96,7 @@ struct jailhouse_cell_desc {
 	__u32 num_pci_devices;
 	__u32 num_pci_caps;
 	__u32 num_stream_ids;
+	__u32 num_regmaps;
 
 	__u32 vpci_irq_base;
 
@@ -241,6 +242,14 @@ struct jailhouse_pci_capability {
 #define JAILHOUSE_APIC_MODE_XAPIC	1
 #define JAILHOUSE_APIC_MODE_X2APIC	2
 
+struct jailhouse_regmap {
+	__u64 reg_base;
+	__u32 reg_count;
+	__u8 reg_size;
+	__u32 flags;
+	__u32 reg_bitmap[8];
+} __attribute__((packed));
+
 #define JAILHOUSE_MAX_IOMMU_UNITS	8
 
 #define JAILHOUSE_IOMMU_AMD		1
@@ -344,7 +353,8 @@ jailhouse_cell_config_size(struct jailhouse_cell_desc *cell)
 		cell->num_pio_regions * sizeof(struct jailhouse_pio) +
 		cell->num_pci_devices * sizeof(struct jailhouse_pci_device) +
 		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability) +
-		cell->num_stream_ids * sizeof(__u32);
+		cell->num_stream_ids * sizeof(__u32) +
+		cell->num_regmaps * sizeof(struct jailhouse_regmap);
 }
 
 static inline __u32
@@ -415,4 +425,12 @@ jailhouse_cell_stream_ids(const struct jailhouse_cell_desc *cell)
 		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability));
 }
 
+static inline const struct jailhouse_regmap *
+jailhouse_cell_regmaps(const struct jailhouse_cell_desc *cell)
+{
+	return (const struct jailhouse_regmap *)
+		((void *)jailhouse_cell_stream_ids(cell) +
+		 cell->num_stream_ids * sizeof(__u32));
+}
+
 #endif /* !_JAILHOUSE_CELL_CONFIG_H */
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 007a5c46..91bc4a6d 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -573,8 +573,8 @@ class PIORegion:
 
 
 class Config:
-    _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
-    _HEADER_REVISION = 12
+    _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIIQ8x32x'
+    _HEADER_REVISION = 13
 
     def __init__(self, config_file):
         self.data = config_file.read()
@@ -591,6 +591,7 @@ class Config:
          self.num_pci_devices,
          self.num_pci_caps,
          self.num_stream_ids,
+         self.num_regmaps,
          self.vpci_irq_base,
          self.cpu_reset_address) = \
             struct.unpack_from(Config._HEADER_FORMAT, self.data)
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index 375816e2..2db103c0 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -136,7 +136,7 @@ class Sysconfig:
     X86_MAX_IOMMU_UNITS = 8
     X86_IOMMU_SIZE = 20
 
-    HEADER_REVISION = 12
+    HEADER_REVISION = 13
     HEADER_FORMAT = '6sH'
 
     def __init__(self, path):
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200127135611.21302-3-nikhil.nd%40ti.com.
