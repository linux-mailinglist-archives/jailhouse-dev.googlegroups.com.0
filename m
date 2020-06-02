Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUF63H3AKGQEET7CKOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C9D1EBDD0
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:49 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id a17sf3527044lfr.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107408; cv=pass;
        d=google.com; s=arc-20160816;
        b=jzTG5lo5AgvhD5P+0DJBU2bcMaamr687bT4H48TBPm3XZkOHPKaqQ+qtKwQqKxIBXr
         WklyyGVo7B8Q5CM/8kZvkDoN06XNyqGYBnY6ONPpufbEa+leeABsSe13ehQbhkVDdPiP
         3RJldFePj+D8rvdKLYS1cB5SBD0Jd7HCjuEepLr4qeSn716Zh8KhO6+UVprFwOiZgugk
         qVgZoc6XabTqEuhN0M54ffEpI+CwQjZPSK3M3X8U1wy9H0YasBdLy9sOGBo43NY1crEd
         EToxM1MXcThNFJqTO0KtIQTNSwKojxtwP3PlHseg6bI1vpf/5nnwNhSi/tbFp1fboiv6
         0ChA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=9d47q9Rddpvmp28EsX9vr4UW7UeRiEOyohFYrDH5bwQ=;
        b=V8fMBIfGC8hsSHcRrA2xqf6OTQdzf947Ks6vGsabSZBba1p1r+njyTbDWlsMD0XPvT
         jJNQabz8qwOXSR6CrYVSnCU/8m6bWlssrS6BJjys3IHbGNWnqeHnC+g+XS45vRYlPvfA
         8/hzDtgtZiJVdCh1LZj/wKVg8WcYcO96P4oXw76ZdU38Of14tyuNQQMqAXC9nD63eRq+
         5cbv40s/AfFSyFkfsAa8TS6l0/yzUsnwTfoeJ1AatE7hzPjKFVRkpoG4Pse1W31A62vZ
         mcgS+YKtnDilSpg5bXC2eap+iVobUgyLgU1lqVRHA7xXmKsKbvw0XGR+jUsZoUPAH403
         IbWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9d47q9Rddpvmp28EsX9vr4UW7UeRiEOyohFYrDH5bwQ=;
        b=lUJoQlgg1fIfpSPEyBkPemOz++dlHQpha1lsUODxnJBm4LoqJrjqTuw7QoyiTPgEmQ
         jpOn+kJWDgT+8WpEWB/7uu/wna9cXlVgFGGqTv/85LZxdZHutFBlfcto+DPgqS4ihy7k
         B/5LBkZqwLrgMGTs+FP0KZFD86XalUxqEzR1AIc96qGzr2ZWCE5xfM5Rts9jXmdqmfqa
         uOUrjLDD3Huu2Edy+9RNS+NgQmlqkUwbO9ElhAPxJUwcO1PZTQcHHNKzYHjsKu4Tpmo+
         64FN7D7l1HBSB+WnsfNKNsqZKQXW5qfwm8U0CVMopZjqn5gZLw8hfEtUmdjW4LB5k5Ym
         ekkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9d47q9Rddpvmp28EsX9vr4UW7UeRiEOyohFYrDH5bwQ=;
        b=LQa55dkWedR9ufWGAifcYMWVBuGCv5fIpnbvH2Ei6RywXnPepoJ+0hBxKUps+bHN2L
         LwRE9aAkgM4de4eD7ueies/y/ap+Wkh5UXxxu1Dmch9D/g5D3BUEGDhjO3d1PpE83NqF
         +kPtG0nhHHuA5G4/+aySDgT/tzr+38hYKPVhxu4oDlHi0uRTqXB8T6Q7N8m4cw54dEWn
         xc+spn4rMCQHuXNHJv4QXsqTTDS1T9h+k0iqI6ZGgmTlXR8OwyFeYNc9grGubsstHTCT
         JSTIx3PTJkGYZqVIQaoeGMQqV5IlofMJXPmrZEG1jIkp3f1+D3a56pJjAVJf6VE2C6e3
         qbOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531WW1x1XrUdP/2g5U9WHT5+VEJFTKZPIIWg1yK+UKcXI19+F577
	Hv7kmXR8CokWYFWzDHRc6bs=
X-Google-Smtp-Source: ABdhPJw+pHrAyeskqkAP2F9cNnCHs55Y39dBlvkUjjRNbBgTfPiUP22KX/9+T7lKGWM2WXvRtcUMSA==
X-Received: by 2002:ac2:5457:: with SMTP id d23mr13847016lfn.18.1591107408702;
        Tue, 02 Jun 2020 07:16:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3047:: with SMTP id b7ls1528074lfb.1.gmail; Tue, 02
 Jun 2020 07:16:47 -0700 (PDT)
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr11779127lfi.204.1591107407839;
        Tue, 02 Jun 2020 07:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107407; cv=none;
        d=google.com; s=arc-20160816;
        b=jgpvJ3vhCFV+gX+W5Dy0UZ+VhihKBGFoDUXbAMOEQ8GUOT+wZ/1bqMLNsEcPY7P+VQ
         ouWTXteY4oazwnNoEVUKzXn8n0WzXkswEjgqJZae2v/IPzME1GgN1YgP8eDs75DTUl1i
         +v5IZgh9tBb2mnONJLm5L8IlUCXs7OXvm2JCd2BxGbIlFu925fBAYU3e1+a/tMfwD7J1
         GSCS5EfQbwsC3DkZanesGfzmnv/KekYVv7FAbFRCW2+bIhByQCPxp5S7WalM7U4UwIaC
         H0cnLUE2y4Nlc/vn/0VO9ketW3hQwo79T1b+FXfrXRUWiRE45iHXavp4HdwtKUSLwqD3
         OPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=YC3ruGKBRmuGirrSjy5s0VqMawzUh8B2xaO/bngmt9Y=;
        b=pBEiWeUQ8GArOy+xGUiaTX6MdWtuOgAkwEE2XCPbWKzQTaMbtEcc7ShtXC2VwzpEXH
         rodOJ3Ewt/SqO71CJRKthQDKd3Jo0hRV2b733Dc4PJevF/03K1+uWXwB6AWw1urMzX82
         pb84DPv4NDvMHWqqVQDF4NLgZ/6YzZ2g8CmgWVDtTuCN6GtGyFCm0uvZZ+hUhjIjwT4D
         786qWFbIrAuXpkGbnTqPX01isLURR4lvbou04Z0yKbW1qCmi2B/snKk0h9tA/o2PJ+nd
         feULiJ8kIyadZG/NyLVGqPJiQ4Q07XHQ1TDGKlfyndfQVBLJAlL3nGkuNjQJlK+SeaJm
         EN+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f16si173081lfm.0.2020.06.02.07.16.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 052EGlFL011499
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:47 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdE028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:46 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 05/15] pyjailhouse: config_parser: Translate struct.error into RuntimeError
Date: Tue,  2 Jun 2020 16:16:28 +0200
Message-Id: <decc4b2ff6fbcb6b2aff579e5cf0b36454132298.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

The enables error reporting at an appropriate abstraction level.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/config_parser.py | 85 +++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 0454c0a7..43dc1dbc 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -93,45 +93,48 @@ class CellConfig:
     def __init__(self, data):
         self.data = data
 
-        (signature,
-         revision,
-         name,
-         self.flags,
-         self.cpu_set_size,
-         self.num_memory_regions,
-         self.num_cache_regions,
-         self.num_irqchips,
-         self.num_pio_regions,
-         self.num_pci_devices,
-         self.num_pci_caps,
-         self.num_stream_ids,
-         self.vpci_irq_base,
-         self.cpu_reset_address) = \
-            struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
-        if str(signature.decode()) != 'JHCELL':
+        try:
+            (signature,
+             revision,
+             name,
+             self.flags,
+             self.cpu_set_size,
+             self.num_memory_regions,
+             self.num_cache_regions,
+             self.num_irqchips,
+             self.num_pio_regions,
+             self.num_pci_devices,
+             self.num_pci_caps,
+             self.num_stream_ids,
+             self.vpci_irq_base,
+             self.cpu_reset_address) = \
+                struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
+            if str(signature.decode()) != 'JHCELL':
+                raise RuntimeError('Not a cell configuration')
+            if revision != _CONFIG_REVISION:
+                raise RuntimeError('Configuration file revision mismatch')
+            self.name = str(name.decode())
+
+            mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
+                self.cpu_set_size
+            self.memory_regions = []
+            for n in range(self.num_memory_regions):
+                self.memory_regions.append(
+                    MemRegion(self.data[mem_region_offs:]))
+                mem_region_offs += MemRegion.SIZE
+
+            irqchip_offs = mem_region_offs + \
+                self.num_cache_regions * CacheRegion.SIZE
+            self.irqchips = []
+            for n in range(self.num_irqchips):
+                self.irqchips.append(
+                    Irqchip(self.data[irqchip_offs:]))
+                irqchip_offs += Irqchip.SIZE
+
+            pioregion_offs = irqchip_offs
+            self.pio_regions = []
+            for n in range(self.num_pio_regions):
+                self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
+                pioregion_offs += PIORegion.SIZE
+        except struct.error:
             raise RuntimeError('Not a cell configuration')
-        if revision != _CONFIG_REVISION:
-            raise RuntimeError('Configuration file revision mismatch')
-        self.name = str(name.decode())
-
-        mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
-            self.cpu_set_size
-        self.memory_regions = []
-        for n in range(self.num_memory_regions):
-            self.memory_regions.append(
-                MemRegion(self.data[mem_region_offs:]))
-            mem_region_offs += MemRegion.SIZE
-
-        irqchip_offs = mem_region_offs + \
-            self.num_cache_regions * CacheRegion.SIZE
-        self.irqchips = []
-        for n in range(self.num_irqchips):
-            self.irqchips.append(
-                Irqchip(self.data[irqchip_offs:]))
-            irqchip_offs += Irqchip.SIZE
-
-        pioregion_offs = irqchip_offs
-        self.pio_regions = []
-        for n in range(self.num_pio_regions):
-            self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
-            pioregion_offs += PIORegion.SIZE
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/decc4b2ff6fbcb6b2aff579e5cf0b36454132298.1591107398.git.jan.kiszka%40siemens.com.
