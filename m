Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB4UGWDUAKGQE2TK4OUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id D18044DD2E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 00:06:42 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id r21sf6123724edp.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Jun 2019 15:06:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561068402; cv=pass;
        d=google.com; s=arc-20160816;
        b=tR5kF+s7GlbSR9ZDJWM1J1ogwdfNt5Wm9em4JXvMlmQqoMbFlmj4N6izlcA5ib/qVl
         rJP1jCMEHy6T4GhdJLy/G58pG6yTLd0lyPrXjF9F5IUEOIgaJyZ+nfI0slQ3ntKipPZj
         UgGjltbPThNCMqTGcSU3OuWcMXhazoEHBX1BeIbSTZkx2eb55De1f6kavAetyvPu3Er/
         kV16khzPZOGNHuTYdEEJjVlFOpbYG900JjEJszxJZvTI/xBsCnaqFSUhSG1ADlK5Qxlu
         QtMdATmFUmUURbqcHNv3d8+qwnMc+XHethBQzKpNIr16RKj1waLAyRlLIrvqmpPKR79i
         qCJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=oSlzYbD3rS3/mWtC8Fr22PS44FKgcvAWIciiECj9VcY=;
        b=snBoLlGNuhkB/l5PBLWm5qtd6MxoGX6H4dPoKpy31ELdyPQSfqOkfNSlWx1D497iEo
         8DxohG55ykhQe0aRZbav35E8vlhaG9dzwGLZNyj30c4godtEOsog7CSQN9LSJBcC5H5M
         qaN90gL/xToxpRwgw6h0ePe943P/3x94JKk78fU5kDh5y1S77FC+YtQvzb9U+F7min7l
         4+7wXVsuab8C7g+ewrsFYYZVGhiCIk8ZgaBEHGBPvhmwS8Wf7rIs9VgTKaFuHKXOKnJH
         dBy6vVNT3+gRD5FIFitIeGz4Ld6Fg6Dy3UxLuOpLCuETAO2aEzs4M567Q8MC7coV9ZWn
         G8TA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=KDu5+WqC;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oSlzYbD3rS3/mWtC8Fr22PS44FKgcvAWIciiECj9VcY=;
        b=kQQvPB4NGW28MrHQC9jkKWAEnlPHX7SL+Kp7vA1Gf58iJVL59K/PLz5aiFfBBmgrO6
         zpb0pt0Dfg13I6UIbaBzWGPZ+DptvzJn0kmCxv8rvNXDZWXo+9iLlj1tPw5ChgRvdM2L
         DgT1JuxRZgNL//imdGibc/4uOCBq8FKVTWenqXtOOKvs3XbPXBUGG9huGt87Zj8jM/zW
         KZtqrR2K05fbdsPIED1w1sCifwdxrR2QU0f7Hh3muoAI+5UGjloZPLNEkNyl5vO+KrYY
         vF+51vcBaS9VNReFwQzvDxTSTUS24dtGrVp7KrI+0cxiII9uwS6IlgpPfumBkRuJgTwB
         aqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oSlzYbD3rS3/mWtC8Fr22PS44FKgcvAWIciiECj9VcY=;
        b=V6fI+XJDES4Y4BMXJuQOuNwVmpeaO7gPXhe6D0mvgl2VMohZSEPB+cYpFr4xIDvu8a
         LsbjqOisDQedxfvSMIkbbFeGHEZ5oQfeJ17gmmE/Ko8pj0L8L8plxKm82aijMdhCgaM7
         m7G4+ZDyeGjXL7zRKTFqtcTLGBX2IPGqWKTu3LzCWPfZ4Z8LFjzrQk2QRuDLBkYGYcBt
         EE+faQPcbpSPe6dpu6Mv//V/+WW830IMpP1wN7nxuy+mnPGLo0/5mGph+RCZOZalBN3W
         5GIWUoVtIvzz8ojLZ3kL43wIjZh5ahKDxOUq/BsPpnYMPKt4hVrZRS/3/8xOTcu8rWq0
         0r3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX8rR3son6K7/Nob7ij8nkoM5a+PIknW3ZEaXKaqbbsLOvcJ+AS
	+Imfxx9ywO3adkX+RA5jvOE=
X-Google-Smtp-Source: APXvYqzf+9q5BIAcHy3LXF3HqJU2fvfA5PGa8+vvHVK+enfh9xqsn/AMOudepiHs4Z9EeZCs2Th7SQ==
X-Received: by 2002:a17:906:69c4:: with SMTP id g4mr26284918ejs.9.1561068402608;
        Thu, 20 Jun 2019 15:06:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:2cf:: with SMTP id b15ls2215418edx.3.gmail; Thu, 20
 Jun 2019 15:06:41 -0700 (PDT)
X-Received: by 2002:a50:a53a:: with SMTP id y55mr125438127edb.147.1561068401826;
        Thu, 20 Jun 2019 15:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561068401; cv=none;
        d=google.com; s=arc-20160816;
        b=XseI3w+Q2V0JRJtoTHhv9R6uBPQXv1X2F47bL3X92YaCIqQxyMiozO59/9pSDLLOMl
         kvNxrDYSukF0UEAIwBUMKICcQxNbw4Oa0nIzkqCbWbCrW5CkP7An8MfZWVP3/2IxXiIQ
         jN8LQwDpnkz16kc2vd+TSbAV989/jAKbyJ/nmjmIMTGOe6J5704tyHBee6DHcSSGwxvm
         UKfYnPYasyOv9hAUjp+zwjmjd40NBFVK1dmQQpMLlfbNf1SAD5Te19a02xZZaWIR4RRH
         D3zTdQ2rUFeAClyBnRumgvaNsHyd024unS3h0RlybHgPBtQqOdN5NbyfhFEVzT9tApYJ
         hVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=pfHQs4yo2ymUmmVflBofT97KS+xjkcaWEPWsXUfhxuU=;
        b=nWGqBbgl3HrldhV7yDPLgQ/je3VPLdWp0gVCFow6nxLqfvZFzvV9HPtyDqUTnLt2Fc
         P4PRKeH9Js1x2yeAdHYHaMxXiLVs8wtr4Utbd91TsrOZrRgTfz3T9TFQHulCuoJD3pqG
         tNyaVbaK5Sj8RVcW29/3yRzM2OlLYCi2R0GnN+i0rfdqTETRaED7Uku8KHQ3gV4Srqng
         6OW6NptcSLSm/M/Na/kdfsiq0/dkCPTgazbMyREkEcmj0WLTNAZGq+bdeCqaV0OGQAQX
         pchmp5ZtK4BNl/VogkHNtZ4/BdlNLkLhBfcz4FTrqdXwQa8pFd0q/kNEwT4iceMfW4UO
         D/fg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=KDu5+WqC;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id k51si111755edd.0.2019.06.20.15.06.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 15:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45VGB90zw3zyDp;
	Fri, 21 Jun 2019 00:06:41 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 21 Jun
 2019 00:06:40 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@web.de>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 1/2] pyjailhouse: sysfs_parser: generalize IOMemRegion as IOMap
Date: Fri, 21 Jun 2019 00:06:13 +0200
Message-ID: <20190620220614.23450-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=KDu5+WqC;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

This allows us to use the 'iomem' file format parsing more flexible
i.e. for ioports.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 3db61980..d612c6d3 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -97,8 +97,8 @@ def input_listdir(dir, wildcards):
 
 
 def parse_iomem(pcidevices):
-    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(
-        IOMemRegionTree.parse_iomem_file())
+    (regions, dmar_regions) = IOMapTree.parse_iomem_tree(
+        IOMapTree.parse_iomap_file('/proc/iomem', MemRegion))
 
     rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region = False
@@ -788,7 +788,7 @@ class IOAPIC:
         return (self.iommu << 16) | self.bdf
 
 
-class IOMemRegionTree:
+class IOMapTree:
     def __init__(self, region, level):
         self.region = region
         self.level = level
@@ -840,22 +840,22 @@ class IOMemRegionTree:
         return [before_kernel, kernel_region, after_kernel]
 
     @staticmethod
-    def parse_iomem_line(line):
+    def parse_iomap_line(line, io_type):
         a = line.split(':', 1)
         level = int(a[0].count(' ') / 2) + 1
         region = a[0].split('-', 1)
         a[1] = a[1].strip()
-        return level, MemRegion(int(region[0], 16), int(region[1], 16), a[1])
+        return level, io_type(int(region[0], 16), int(region[1], 16), a[1])
 
     @staticmethod
-    def parse_iomem_file():
-        root = IOMemRegionTree(None, 0)
-        f = input_open('/proc/iomem')
+    def parse_iomap_file(file_path, io_type):
+        root = IOMapTree(None, 0)
+        f = input_open(file_path)
         lastlevel = 0
         lastnode = root
         for line in f:
-            (level, r) = IOMemRegionTree.parse_iomem_line(line)
-            t = IOMemRegionTree(r, level)
+            (level, r) = IOMapTree.parse_iomap_line(line, io_type)
+            t = IOMapTree(r, level)
             if (t.level > lastlevel):
                 t.parent = lastnode
             if (t.level == lastlevel):
@@ -887,8 +887,7 @@ class IOMemRegionTree:
 
             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
-                regions.extend(
-                    IOMemRegionTree.find_regions_by_name(tree, name))
+                regions.extend(IOMapTree.find_regions_by_name(tree, name))
 
         return regions
 
@@ -918,16 +917,15 @@ class IOMemRegionTree:
 
             # generally blacklisted, with a few exceptions
             if (s.lower() == 'reserved'):
-                regions.extend(
-                    IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
+                regions.extend(IOMapTree.find_regions_by_name(tree, 'HPET'))
                 dmar_regions.extend(
-                    IOMemRegionTree.find_regions_by_name(tree, 'dmar'))
+                    IOMapTree.find_regions_by_name(tree, 'dmar'))
                 continue
 
             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
                 (temp_regions, temp_dmar_regions) = \
-                    IOMemRegionTree.parse_iomem_tree(tree)
+                    IOMapTree.parse_iomem_tree(tree)
                 regions.extend(temp_regions)
                 dmar_regions.extend(temp_dmar_regions)
                 continue
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190620220614.23450-1-andrej.utz%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
