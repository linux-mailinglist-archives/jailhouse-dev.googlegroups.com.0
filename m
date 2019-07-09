Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBJNWSLUQKGQESDGSSWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6834A6373C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 15:48:22 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id u14sf12059944ybu.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 06:48:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562680101; cv=pass;
        d=google.com; s=arc-20160816;
        b=Eu3dd0ov1eygWXmHw19CHqY+EZPgCdvAdCijBm6dsGykgdL+F0/s/fRULkWe5LQQSq
         GAPiTQZRcd2evw0DeFBwndESrcydMV2Wvz+vW6Tuu6kczu5s5GXt/h90saeviNnc8ssw
         f6DIMfF4hGY7qcerh40SQ+qporxet27CG1KDokcv38qCU1XJ65d1kZTBo2KqAP78Ycjr
         YkDezB1grNYw//3IdAbvjIT6NVJ4Ia9vVhfa9y7Ba+o/aHDd5PalNZFbn0LxYK6w/UW/
         x0GIjNkIyySIS1/bCf204fzb5vKsGYvwpELrEQ0SdHNKgRZZ1ypViZqFBW/qY46eBFnX
         5T+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7t0bLk3oXzHWralcBQkhf+/g+3zBSDEJNB643VhDNBo=;
        b=JFbhWIhHhR/olk8LqRjnsMGBFXo6ffk2qSznyq/psFlUnxLipxEeoTcChHBhN9iT2T
         axiIaECwKkyEbDe2m5eFUeAjuDGKmev51uAJ1zc3lGntkd/qy2lDiRNICpft7plYWnkm
         k0rYsN8sg41yq3yS3GcOmLXR42W0RqtNASUbfekp+ZpViyoUbhvtZPY6YvNxcBPI6d1o
         jO0Crp+4cw51OYFnxX4x0kCszZsmIs8qOGcQW25ASDmrxFPSZh+AXr2FIcS62RLN5/f6
         JKujrH7njwHMQpEAmLNFCbq8ARjTaTuSuu2tJAAN+Vi1VwnWE4meV7B4VkzKL/Qm7N2J
         6TfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xKtpZ1tE;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7t0bLk3oXzHWralcBQkhf+/g+3zBSDEJNB643VhDNBo=;
        b=A6UfIV/B7xz5R3lv9PZ3rMsaaK7d+fUveP1eCqcMY5QMWb7JXjkikb9ffG6USnr5lW
         gwuHUvxiVlpCOP3+MKHoE5YlibKvmaZAUaurdVgpEt1ORPymasAQJQ9dIn+RRvbRS0oR
         j+hBr0k76+AcxmNTiWpUO3wz1qcBx4peMxH/BmG5xZJmCEfd5PMe8h4ykVKYnkkdFI5W
         T4+DlJEKhtSjPp2R0TtP27FBAPo7thK32KicJ/zdselPg9mdXNvXCx9TIe1Ty6dH2YcS
         EjedbWjiCeryuQ+7SQms2nTJ/Bvm3aedosh6dQDss9D6016LkCKOH66dowsBE12vJDmu
         twVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7t0bLk3oXzHWralcBQkhf+/g+3zBSDEJNB643VhDNBo=;
        b=fmvT80gWICMGgdz0MBR/4xVmoE6m3XorCUwe00qxIk35+SBT/ghNvLQa4Hrthlm675
         iYbhZ52zDtUSQDaIVyRSa3etPmlh7Q5/45RIAbyetwEpnBpgxT+i6SPYnl3K0m1HWwwZ
         lvK4oaj/2B0/el+VbswEIMfcRslKt/iywmzX3mEj0INn/A8yj/bPH+6hWxM3NlsJyf4l
         s70Z164wV6ln6CUAIKinUZro0GTctBZMdZp1T5MqwYe20LdQcD2IMGfKim5GhEpJflw5
         aJNMurPg/9/gM3aiQzVka0aKJJwnGj7RpiTFq9pkvhgheJa4KBY1jlSMwz6UUCloxqK8
         ZI2g==
X-Gm-Message-State: APjAAAUHuM2RVzv6dVy9NITtoV8cAiCacvTmGwzkTMF8W4tH9ZD8XxIq
	A3alYBASkNDYm8pt8bP9UHw=
X-Google-Smtp-Source: APXvYqzniMt4ginDYPCabW43X/bLyvvO90yr3F/KEIFXX3QytCTxOSQf4iWCZsMe5k8mbj1kkVCi7w==
X-Received: by 2002:a81:6a56:: with SMTP id f83mr15301942ywc.400.1562680101294;
        Tue, 09 Jul 2019 06:48:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:9d12:: with SMTP id i18ls2542236ybp.8.gmail; Tue, 09 Jul
 2019 06:48:20 -0700 (PDT)
X-Received: by 2002:a5b:c4c:: with SMTP id d12mr13625374ybr.83.1562680100833;
        Tue, 09 Jul 2019 06:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562680100; cv=none;
        d=google.com; s=arc-20160816;
        b=apNGf3xgnQvmP/10jalEMm6MpC+XGYBh4F8/eMD32xjn38C51ZyFQeqNdLM1FuZbxH
         h1htI6VvHjD+/BJPA03Udy7wVxwc/O9WGv4hQ1cBiPNI6uf/MiPOWWCUEhe6DALMdTac
         4OjrBSosGiZsLfQNZWSIUwHvVdtsZLwYj11uY0nIJu0VKpECBbC8OCHxJrmSuNAwliJK
         ToVWHKfGmfEcekOfJB9KfINxxgV4ti62Joetl9EfQyRcVXm6rKmvhV8XFfrH5H9wHJzj
         IghLjBRyc6Y3qZo53g/AncTowS1fPGw5tRVsTB4VIh4GKd+hr8dvexpRfUrVlxIVYDEc
         USRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bP3KZuPTR89K/gr1rTYcVhXqofz12vM9pCyqX/yiFZ0=;
        b=jUdIi9kBK9kjc4C7dthjI490DJN/xBxqn77BSn0V8O8b18ApSaTJbPL4GFO8cbcBpd
         Mloe1WHdf1z2KfZyFG8+pGtMwSPLrghYFAFKiQayYOh+eEk/tfxcLL9mT27KaVH9ZTjc
         wpRyOCXhLeMGnF8GNFgc3ZoIlHmwxtXxq0hU+qfN6A3tLOLee0pJLPl4gLd0IOQjl+y+
         zKmgZtd0CYeEeaNiZPMKD3q4cd+xk2KXubewKcufpf877pFlOGjf89/p7NTmK36LyI+8
         +VB0YhgLpGn1fxQDBHHLn9jo+XKVbg1t7k2Ztw+5ehKLlU8MWo1phoUGkXwdp1fkYYe9
         nL6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xKtpZ1tE;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id z4si881407ybg.2.2019.07.09.06.48.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x69DmJ40060206;
	Tue, 9 Jul 2019 08:48:19 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x69DmJIj026177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2019 08:48:19 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Jul
 2019 08:48:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Jul 2019 08:48:18 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x69Dm9P2107982;
	Tue, 9 Jul 2019 08:48:17 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v3 3/6] core: Add stream id list in the cell config
Date: Tue, 9 Jul 2019 19:18:33 +0530
Message-ID: <20190709134836.10485-4-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709134836.10485-1-p-yadav1@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=xKtpZ1tE;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted
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

When ARM IOMMU drivers are supported, it will setup the IO address
translation tables unique for each DMA context in the system.

A typical DMA context is identified by an integer called stream id.
To setup the correct IOMMU mapping, hypervisor should know
list of all the streamIDs that should be setup in the IOMMU.

Add an array of stream IDs in the cell config, bump up the config revision.
Change the python struct unpacking logic in the tools to reflect
revised config structure.

[p-yadav1@ti.com: Make the stream_ids array resizeable]

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
---
v2:
- Make stream_ids array resizeable.
- Add for_each_stream_id loop generating macro.

 hypervisor/arch/arm-common/include/asm/iommu.h |  5 +++++
 include/jailhouse/cell-config.h                | 15 +++++++++++++--
 tools/jailhouse-cell-linux                     |  5 +++--
 tools/jailhouse-hardware-check                 |  2 +-
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
index d33ec17c..f86120ec 100644
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
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem);
 int iommu_unmap_memory_region(struct cell *cell,
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index c988f7c5..a559720c 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -50,7 +50,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update HEADER_REVISION in tools.
  */
-#define JAILHOUSE_CONFIG_REVISION	10
+#define JAILHOUSE_CONFIG_REVISION	11
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -74,6 +74,8 @@
 
 #define JAILHOUSE_CELL_DESC_SIGNATURE	"JHCELL"
 
+#define JAILHOUSE_INVALID_STREAMID			(~0)
+
 /**
  * The jailhouse cell configuration.
  *
@@ -95,6 +97,7 @@ struct jailhouse_cell_desc {
 	__u32 pio_bitmap_size;
 	__u32 num_pci_devices;
 	__u32 num_pci_caps;
+	__u32 num_stream_ids;
 
 	__u32 vpci_irq_base;
 
@@ -276,7 +279,8 @@ jailhouse_cell_config_size(struct jailhouse_cell_desc *cell)
 		cell->num_irqchips * sizeof(struct jailhouse_irqchip) +
 		cell->pio_bitmap_size +
 		cell->num_pci_devices * sizeof(struct jailhouse_pci_device) +
-		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability);
+		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability) +
+		cell->num_stream_ids * sizeof(__u32);
 }
 
 static inline __u32
@@ -339,4 +343,11 @@ jailhouse_cell_pci_caps(const struct jailhouse_cell_desc *cell)
 		 cell->num_pci_devices * sizeof(struct jailhouse_pci_device));
 }
 
+static inline __u32 *
+jailhouse_cell_stream_ids(const struct jailhouse_cell_desc *cell)
+{
+	return (__u32 *)((void *)jailhouse_cell_pci_caps(cell) +
+		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability));
+}
+
 #endif /* !_JAILHOUSE_CELL_CONFIG_H */
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 49babd92..e4e59663 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -564,8 +564,8 @@ class Irqchip:
 
 
 class Config:
-    _HEADER_FORMAT = '6sH32s4xIIIIIIIIIQ8x32x'
-    _HEADER_REVISION = 10
+    _HEADER_FORMAT = '6sH32s4xIIIIIIIIIIQ8x32x'
+    _HEADER_REVISION = 11
 
     def __init__(self, config_file):
         self.data = config_file.read()
@@ -581,6 +581,7 @@ class Config:
          self.pio_bitmap_size,
          self.num_pci_devices,
          self.num_pci_caps,
+         self.num_stream_ids,
          self.vpci_irq_base,
          self.cpu_reset_address) = \
             struct.unpack_from(Config._HEADER_FORMAT, self.data)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190709134836.10485-4-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
