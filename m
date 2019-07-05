Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBRGD7XUAKGQEFFV467I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5FB6081D
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 16:42:14 +0200 (CEST)
Received: by mail-qk1-x738.google.com with SMTP id h198sf9663219qke.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 07:42:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562337733; cv=pass;
        d=google.com; s=arc-20160816;
        b=fRK1L92rcZoAu7hqVNOfIwyYQd9LAOHpDPoRQznoHID4CETXJrdBAncOaS39OvDgXU
         G9PQ7LqKmsqRYxjiBIsDEbKSrluiobvBVVY5HaRJW4tX6AT8WX3/a4cNwQI47TXnKdSJ
         tk+3fBU9dXEy6t/hS6RshlzLVy+B8AaDdZzV2gfORJFr/maojipToURz6x3HMByCVC1y
         AvuvsDhqtkPyKz99lEGVyoMJrDyrR3Gngise2w5osGUDfAgqqy9761KK2aSz9Cu8KGNP
         MkW9Vvudn6Ooa4eWmc9M/SRPAq58Y9D6/6LafPvh4xTrtHo1/eF3eNutsK12Bq+ah0oA
         Y4oA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=JFo2JuJqaHV+t3Z4YoGOVTLDpeJ+33y9q5Hs5LUME1E=;
        b=RkzAyqT7DYAyvk5fRMqZ95dC3C8GgNCvGCAQP2nipGp+v2dRYE0PWPXCZ5VvLmg9df
         8rPDPw0GKm8nkTmoydU77gP15uI/43BA/AMrza4chifqNS6AuBfA4jnj0FAqmJ/73KTe
         bQ2BKJARJ2YJ2eKR2cP2fX9GafsRVE9E7Wwjwm4fB6Is5OutIBXy/C2nItGvwFAxqkbF
         z5cfuDnsgi/B7eb0J/nOp6yem27YYLaGVJYmdBf5FFe91++QGvG3E90BgVHFwF1z58Om
         k+0I5dxOsUlqFIMEksYwt9EUI48aJwBKWBxeP6I+l43+SfM6a1GZVabHh6Fj3aF8NWHK
         ZWiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xadQHSgI;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JFo2JuJqaHV+t3Z4YoGOVTLDpeJ+33y9q5Hs5LUME1E=;
        b=jdrTYFOgnJDJuqhgWj70ZtIalZjCQUPa318pwNGPkzopMYWw9T0af+lyEfz291mDFO
         Hkq/FtNx4kqlo6wRjjQvv/nX2FuqvfBwKfioAbBim7WZKKTzy2YEA50RjaPA6qRaawIl
         7E1w8BZU2A88JaEj3PspqgclOlclUUmoaM3qbiNmYbCv4VgRpdTGTzm/X9IFVZw6IqPl
         +yYsjGPrsEndrZEIiuxuIFwTuAuZjbELSF73iRQs2MwkI2BrnPsXLGJzYPzQDSCjXToR
         lS5LHUkSsJ6VQmP3DBxlqBvWqpdAhhzKWe2XsYHWUwoCOxcmIel+z9IlxuLyhjO0gZKe
         L/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JFo2JuJqaHV+t3Z4YoGOVTLDpeJ+33y9q5Hs5LUME1E=;
        b=G5ZJPyhCMc8FhO/D0q1FNjQoKbN6B/jaeMmKaYR/ndwFM+sotMbxzgnn98U+VviUcF
         yB8UdWv7PNAyk79RwB4P5Q7ezf9/jNOysqc7nDI78fOznrvQisjD5/+hPqwqttTflO4S
         Zpk23hSTQCfDjrXV9y6V81qD3oZ025t3iw92tud41MaBCHKu+Mko0pEuTbS2WVo7UYZL
         qoPtVYyKwKhe7UF+6Ap9YukQjSQ80zSRYbLERg3Kd1K5590+CRedDTRo1GMH/wJ4yPFb
         wzc0lU7eQUqwg2aq0My9aflop5pkKmf1mvmKmqmJ6gjRBg9pv4i/SmkvnAzpWPu6EUjn
         JL1Q==
X-Gm-Message-State: APjAAAU2eJYMie/+LDiok9Iy6LpoievNku2y3TVc2DREKQrE0tKAYhKw
	qUkJYIg8EdMHLE5dQaJwBY4=
X-Google-Smtp-Source: APXvYqy25wAb/gcjDnQvjHyICwRSKKBD7k8oXQdAsY1ggZ9qssKmc+lvNIA90pT3AWPNDDf6MVgYnA==
X-Received: by 2002:a05:620a:12f7:: with SMTP id f23mr3317734qkl.499.1562337732873;
        Fri, 05 Jul 2019 07:42:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:5d4:: with SMTP id 203ls523772qkf.10.gmail; Fri, 05 Jul
 2019 07:42:12 -0700 (PDT)
X-Received: by 2002:a37:9c0c:: with SMTP id f12mr2636211qke.442.1562337732558;
        Fri, 05 Jul 2019 07:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562337732; cv=none;
        d=google.com; s=arc-20160816;
        b=OFsRoY4t89r8l/EU/ptDq0VWuubT9vlrq2irSPH7+7kpmTCUL1Z4steRlEHFPqMZvq
         9kqakiGxaBwwp0FsLRPjXXdUKp15jryLEyrmUzWTwLIcaZSOuO+BIN0aYebqaazf+XoG
         O4j4gHW6zQay9GMie1mHMPH9sJoGJZ8l4EmfVUOTTx8RXB/1hhARsnpnHBloJuN2HOZo
         6nSPj53YD/7/9me6gLjeL9vQSLYmveyGUNepthZQi+kvNeIjmd3yiR+C74HjUwjo2dj3
         7Xa3EKJW2MZZewWQdWTvnlHousAHw0YbY0JwMEv9hRi6KWRvUzNwDH34vIjwZb5BGx3M
         b7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bP3KZuPTR89K/gr1rTYcVhXqofz12vM9pCyqX/yiFZ0=;
        b=sn/32nT2bwMI3KIO3P+Od2o8kfsSdGz0/qp3qjIDr3a0VyG3IKxQ0EOEKO+uQtLrqu
         kMvilFwbbl8J4joHJypAqUx+PTRj4+9VlNHCRcXd3Ck5JzuqiAPv3Pj+6LKwzZzJbnJE
         OJqbCjnqXT3nxzo9Aj/ER/3h1UXkfggaZsqql//RnqB2lZker+J+oqJeNzkplAlaKa06
         AYHhrS8L/xGYMeaQ7GVG5wXhtn/fcJNz95FgtHr0mj4iD5ae0eRmK/9rq0iyzQccxL3P
         trB2qwgTtYGdCwqgUOegfdbxSWJ2iPyABH5ErGolStWk5PayKVSvCIdP0HOfPR1s59UV
         phQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xadQHSgI;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id g41si519967qte.4.2019.07.05.07.42.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 07:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x65EgCSe105182;
	Fri, 5 Jul 2019 09:42:12 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x65EgBxM051338
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Jul 2019 09:42:11 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Jul
 2019 09:42:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 5 Jul 2019 09:42:11 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x65Eg1o2067904;
	Fri, 5 Jul 2019 09:42:09 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v2 3/6] core: Add stream id list in the cell config
Date: Fri, 5 Jul 2019 20:12:22 +0530
Message-ID: <20190705144225.7126-4-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705144225.7126-1-p-yadav1@ti.com>
References: <20190705144225.7126-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=xadQHSgI;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190705144225.7126-4-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
