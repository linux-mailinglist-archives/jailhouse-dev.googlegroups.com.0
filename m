Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBR6KST5AKGQENGHEDHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id B969D251B40
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:50:47 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id c186sf1017993wmd.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:50:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598367047; cv=pass;
        d=google.com; s=arc-20160816;
        b=hkUcR9EbYjoCo2adOn26CO8/wEG1h9uj+neGB2M7WlvrGPa25uP/Q1pXrfZh1DKzIz
         mlkBf/rFBCgXcPpK8iyWQHDQcWHxvDmCIDQJNsL/+r6M1/7nFy4zXmKkSzuLgzlzxMyB
         pRWc8QyQkQbclpYjivEMq3r/vvAssgRVuD/L1rYWi8yBi/DOA/6UY2HFI8LjoBHMVkqQ
         kxHm5P9XbMJiWF2qcEF1oPgX6RzsMwSNuaHIKPCbQ0eXbPGeSy26hx2FlAFuxforN5jA
         o5mH1Fjt2E8pAUGBlWn/0wKM3mqsiAMD3zGaDRq7UYEulEfwZiWgsXTTYkEFx7NdrPG2
         VAAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=zzMgfs7OBAJJupvpwoSuS5LOlS/oI5X8rtyzj4OdBW8=;
        b=AYc+7spCCL/29smMT8q1+CH8mXbfvBfYc4qpfBBCPLvavUsaJv5/OaoPtXuipPmFuq
         bebZm7NiPcNd346pPh7PBZIymnUgDpy7x71opdlCvOXbLRcB5Hy4Nd3/iAnvPQIgvsGR
         sT77WPiEXeFegcs9+YkOJCi1qPBZmcwCHufFanl1HAbKgIuYClW1FCptbxHL/BCloqb+
         Ia5FPIS/0WW1/sI+Dj2JvLvgWpIArR2tD+N0XxBcoL8NEdo3cdJw4AD3TMB0q19uTM47
         eX2ZpMbutACnQxNhnCx6jpPY3aU7MiPqtO9l2XEzKJ92TczGFCwS65cKFt1E9fWK7MG+
         didg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=JgwnKbdO;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zzMgfs7OBAJJupvpwoSuS5LOlS/oI5X8rtyzj4OdBW8=;
        b=aYW/YPea3lY3Dq+pp3B/59iQqAj56tohiXmayosBhfXAjN2SAaaf0ubTC+Vcg4MqXN
         tv6wf4+WanytdAgATxE747/cq1UHh8Dq00Os/jh+psnRjTWOM3lJK1jSaXMvyB0tSG1a
         dFPHbDbCgtHKQK9NHJIVj0B28C7ZIIHR4wKdz3+5dDhg304q+vS+gubNsQIjw3ZlTmKy
         q3b8cE7eDKgZ3DsRIhxnNZzmwhysi1iIUork2EQgjj4TidbEt3O0AjE3VXkJ5s1n/dy+
         s0Mi56P1zgWnsYYFU/Hs6LwU26xppwiC4gKv0/AHyT3+5EOhDb2mWE4tUkhRlhEd+ASj
         6Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zzMgfs7OBAJJupvpwoSuS5LOlS/oI5X8rtyzj4OdBW8=;
        b=cSSo032Y+rdv3fvJvj0+tDJUI9DitTf8RTI5lGkaeUiRcerXNiTGp9/82wAWBvVv4L
         omfierp0uv76hXg16cB22h0w+x3hbY0PHehhAOHdslM3+7spQmKX+5cabiIXn2PL0UE2
         NObiYJY3ZJphYiHUKmZqIpdKhy/Y9s+qfCaV0ARd+VhluAt86BXkmtrq/BhIZtmEdIfV
         glsDrQDlgVqTgrYBoNo2dxfoDdwOIG4KECQ75v6V6wOsAy2X3rLU2x47pmTg6I2KQFdI
         pJML3Uz+lu8b4fTnguiouleepIvnyvLqvj2+Ydy8GhlBo5rOpweIa1EU2Izb7WuOmbdC
         i9mQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532xLiwoAgJQinR/lbCUWIsZzVvnZtTQlJv0TH6PMOv+nm2UzFkx
	J4wjGMluMEcMPUQQUU3P0W0=
X-Google-Smtp-Source: ABdhPJxUQybgxKI/PULektKkl+PawOugMhtd0Q0YKw/U1lR8/oIP0Sqk/zC1i7aUFR/xKPz1H5cMJA==
X-Received: by 2002:adf:f812:: with SMTP id s18mr11399444wrp.96.1598367047478;
        Tue, 25 Aug 2020 07:50:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls3191822wra.3.gmail; Tue, 25 Aug
 2020 07:50:46 -0700 (PDT)
X-Received: by 2002:a5d:46ce:: with SMTP id g14mr11708443wrs.188.1598367046787;
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598367046; cv=none;
        d=google.com; s=arc-20160816;
        b=wQBRRxNNsFDrnbHBy4GiVgqaEdviWkhW2ZCbvKKtCw/6ebgqiN9s847tT77/zdgZdU
         eQUY0UuxiZVBIhw5jQgPg3upqGH96x97TmZTLjZ3rTXAIZudn+S1KhiLaPlUzdvPdzam
         X7Ih4KAnZSIB5KhSjkd8XG+iYBfPu66aB0hMjERem0O2ZiO8Q0mW1jBJ5gZOK/z+/I8f
         kminYgb3wzzWYzt/Ks8j/914oM998eyPY2dGcD/glMo0mEbvlu836ewRqd/4f3/4c98T
         VkcxnfJywlpcwLVX4dspW1NS5s7IJwqRI/jLTcsVIythyk6J+CEcfIMz+As1AfUnTtxp
         mjUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZAyj8xiegnYvMnlOI1MyMKI4WccR3S0AQ4NCOJ27g4Y=;
        b=J9z+LlHbqcQ4wX6ZN34U9fLW/8Bb7FC/dlSnfPfwFPCbaKgrU31DMschFy6xMRCfGV
         Gfo/Sg9phHkK31YULml8rkk5sWaQeeh0stBxKirDL4b28jaWEOIM0+ScV60F4afohZ7A
         wBU8nBKWrUqdpco9WMAZ1GHfG7wlMlJJBt2333swsg9MAzQ2JI/Xm1mMdKMERNU3yNLN
         pymhZR/xkayTo5yFjU/vmi+A1G0pqJoc4+X/K0V9ZuCfFVQKJDgBmGMbaiceD3jvIGzl
         sqneeeYg0W6R2NBQISpX/kdTdUTzpWxHIc2WCPIgyEJ0a/t56mh5f7vsobfqYWlNNQVo
         5uYg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=JgwnKbdO;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id b20si75958wme.0.2020.08.25.07.50.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4BbX3p398qzy9K
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 16:50:46 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:50:46 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 7/7] tools: config-check: add CPU overlap and boundary check
Date: Tue, 25 Aug 2020 16:50:32 +0200
Message-ID: <20200825145032.115837-8-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
References: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=JgwnKbdO;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Adds two checks for CPU specification:
 - overlap check detects two inmates using the same CPU(s)
 - boundary check detects CPU usage outside of what system
   config provides

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 14 ++++++++++++--
 tools/jailhouse-config-check | 28 ++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 2b47d9b6..2a0e6ec9 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -192,17 +192,19 @@ class PIORegion(CStruct):
 
 class CellConfig(CStruct):
     # slots with a '_' prefix in name are private
-    __slots__ = 'name', '_flags', '_cpu_sets', \
+    __slots__ = 'name', '_flags', 'cpu_set', \
                 'memory_regions', 'cache_regions', 'irqchips', 'pio_regions', \
                 '_pci_devices', '_pci_caps', '_stream_ids', \
                 'vpci_irq_base', 'cpu_reset_address',
     _BIN_FIELD_NUM = len(__slots__)
     _BIN_FMT = struct.Struct('=32s4xIIIIIIIIIIQ8x32x')
     _BIN_FMT_HDR = struct.Struct('=6sH')
+    _BIN_FMT_CPU = struct.Struct('=Q')
     _BIN_SIGNATURE = b'JHCELL'
 
     def __init__(self):
         self.name = ""
+        self.cpu_set = set()
         self.memory_regions = []
         self.irqchips = []
         self.pio_regions = []
@@ -213,7 +215,15 @@ class CellConfig(CStruct):
     def parse(cls, stream):
         self = cls.parse_class(cls, stream)
         self.name = self.name.decode().strip('\0')
-        stream.seek(self._cpu_sets, io.SEEK_CUR) # skip CPU set
+
+        cpu_fmt = cls._BIN_FMT_CPU
+        cpu_set_num = int(self.cpu_set / cpu_fmt.size)
+        self.cpu_set = set()
+        for set_idx in range(cpu_set_num):
+            cpu_bits = cpu_fmt.unpack_from(stream.read(cpu_fmt.size))
+            for bit in range(cpu_fmt.size * 8):
+                if cpu_bits[0] & (1 << bit) > 0:
+                    self.cpu_set.add(bit)
 
         self.memory_regions = \
             cls.parse_array(MemRegion, self.memory_regions, stream)
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 380f4a77..33d9110f 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -66,6 +66,7 @@ for cfg in args.cellcfgs:
 
 ret=0
 
+# Memory checks
 print("Overlapping memory regions inside cell:", end='')
 found=False
 for cell in cells:
@@ -100,4 +101,31 @@ for cell in cells:
             ret=1
 print("\n" if found else " None")
 
+# CPU checks
+print("Overlapping CPUs between cells:", end='')
+found = False
+for cell in non_root_cells:
+    cell_idx = cells.index(cell)
+    for cell2 in cells[cell_idx + 1:]:
+        overlap = cell.cpu_set & cell2.cpu_set
+        if overlap:
+            print("\n\nIn cell '%s' and '%s' following CPUs overlap: %s" %
+                  (cell.name, cell2.name, str(overlap)), end='')
+            found = True
+            ret = 1
+print("\n" if found else " None")
+
+print("CPUs not in root cell CPU set:", end='')
+found = False
+for cell in non_root_cells:
+    diff = cell.cpu_set - root_cell.cpu_set
+    if diff:
+        print("\n\nIn cell '%s': %s" % (cell.name, str(diff)), end='')
+        found = True
+        ret = 1
+if found:
+    print("\nNote: root cell CPU set: %s\n" % str(root_cell.cpu_set))
+else:
+    print(" None")
+
 exit(ret)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200825145032.115837-8-andrej.utz%40st.oth-regensburg.de.
