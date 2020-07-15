Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBXXGXX4AKGQEU5S2LXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D72216EE
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 23:21:34 +0200 (CEST)
Received: by mail-ej1-x639.google.com with SMTP id lg24sf1492176ejb.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 14:21:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594848094; cv=pass;
        d=google.com; s=arc-20160816;
        b=ANscagcS4AoOSq8+w6sX34nUaioqyE39wW8q1tVR+mfzXPU982isKNDrS2qtyapDYZ
         pCUNcLeLCecw2KIGJopYwp19FDzccqBSqkotWA1Q65TXwaBGoAPqdCIznW2isaZSDgUA
         W4GLXGGxa8JmTbRDzlwXb2DuXlNJxe525/qPbZOMTl/xKkb76oVvaXcyPFA0SAIsTSX9
         U98OLpdbCOpQHgD/99eeIL+maWoenf4JPfJ7uxpWDwV0Wybsf52m+5S2uigpaBmGFgNz
         3OZpUjN/4eeXkX4rdFXbOEvo5bi6EmqljsFo3zWrjuQ32C0LMVrvXXENQpAtrIf5q//k
         I86Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=3SsikOE3QSohm8+tzpDEvMazmcW0HNsda7eNSibt7cw=;
        b=ayObMCGN08rgoS9QTGUDkvnUB7x+pOBVqFQtolYB1g1rMXJj3mrZu0+I6r0F8bx4u1
         DM0k8btyXI2zMrMvp0urQR4sgsjsQ427GSxqQo31bJJmieXdQGNAKXVc5TcKrq0b9Git
         EHWFuu8njtCpKQFTA/IOKb8ro1H2d5J0f330RL33qy3CLnFNKPgEIw2+S4yex/LV0Ssv
         /vP2TTAwY3Hss/rm69Gk9pr+PdQnrrCwwQQEMGUqUuBM/WPxZgSIH3GBA+78xCoCEkEa
         sCHkYQdlJZt7TYfHHRvlOtn2hQuLc3uSW82VTESqf5wVGYypFAOXghDNSUlnOYhuVek5
         kkJA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="eN/skrZ4";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3SsikOE3QSohm8+tzpDEvMazmcW0HNsda7eNSibt7cw=;
        b=tDd2js4VoUpHygV+Vtz4aB46LPuNb6IQfxwSvOIxnEcv8VbnF7tHqgsuUxpCWyTKV4
         VYROJnjDDbQBK6Ek43yN+UboW+yWvHXRWPADPuvzFnL6NsyGipR8yRSKrXDTn/ON1PFM
         99QxdLHR8etShyhfa1t0NcXErBX1M23B2NM8C9jCsxex8J4MosbFUpjeO5m+5pi+aPqk
         1es4oOXcfwIX+ATrh6sjGlV4KGgiZgJ1vZZrbm0TeD9iuN2LwUIP5AoUtCQlHBPJtY9O
         K2p8GZc161CN3p7jIL9XPEiCohkyPL93Bao68vZCzD78d1C9n5ZEP2FLrfOfismXgw33
         zZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3SsikOE3QSohm8+tzpDEvMazmcW0HNsda7eNSibt7cw=;
        b=g4dEZ60EHI8ESxc+R9y2Mf1UpbqbVHta53Mxst7o12DHocWZ4dG7zGf80soYsbPNYx
         85oZuipmx+BdSbNlckCa5HJQJoakwA2gJqs9tZRbScrSeIkFnfylXQU2nrv7RBEefarj
         gHRTSyC9zLfJ2Ly0gq8fxc8OySRl1WtciYYwzyU4rlTGIP/8wf8gYjWRMBZ2lfT7GjTW
         Vor7EXvdS/8rkXMTnYnDu/gcNU14z/i+U3tkDoiVVYfrj7PQJWdNJBxc71UHcFLwscnu
         j9rjgAB6SocRJat2eBM1bMrwsJddaLH/8tfSbeZ5fxWu4j8aHrG82RQYq1rDMBZFl8Jf
         EzkQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530eMREWZMN4f3Mkdc2VHC3UG2sEeqRozHAC7QevWyCDJYVhCzy5
	aOFWLj0GS1mI7r6uHoq7y/o=
X-Google-Smtp-Source: ABdhPJw1h67ogIqsvpmLCgjncio40sFAw0CBMWNotRdnoJgv9/KgkzVLdGixCC8pwSzfk0erDtxdgQ==
X-Received: by 2002:a17:906:1a59:: with SMTP id j25mr798638ejf.398.1594848094604;
        Wed, 15 Jul 2020 14:21:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6a8e:: with SMTP id p14ls1694222ejr.9.gmail; Wed, 15
 Jul 2020 14:21:34 -0700 (PDT)
X-Received: by 2002:a17:906:4dd4:: with SMTP id f20mr913406ejw.170.1594848093971;
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594848093; cv=none;
        d=google.com; s=arc-20160816;
        b=t/+zt8oRvd7kuj85rkJdMCJhUkEfMjXOZjyxtBHql5fSH7bIoLwuC6dM/8u5o0RK99
         Gty1JeMgbyhs/hcWRzYAKIYYnwAfyyg6KtKJysec8aiLK0qSDn9HQao6oYlLmwgtQ9mE
         /Y9InH5KCaPfSnYZ/dcladMCh9Jd4s28ND699Cx+xxUpy6bM/gUBZsjjFux3ArGbrwtA
         7PdvIEDuuA9sfYq5R/vAAnpUE5bJ4+mA0BiArb47SsIZRX0t2/3YVtbID6uIS7r1ULGg
         MXTrNnhtgULHu6N3+MKmkZUmNMrDeZynKIyjsRyHG3N56Xwz3fT9tgJXVtpkQlLgd6FK
         OEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BpZlfEm4C/6w6peLD4l7cV5bl1dJgsVx/Q7X5hdz4eM=;
        b=uOpAH7Z/+pjFa42AW9AV7mYtj2vvEym+XN6jxIV1G9Dl3rA88gKHPBs4h0u7VsU1I0
         7E0MHW7O835YcR+ZFL6ZIyKXPke4U0p12B/LVCqKcTYm+in3jUYfewxcZeBnOa04fth8
         AL+txpfAEfmU6srZfAhVuGXlxDFTkgzVnmG/OZyNJ589ppNsrWw9DgSg7Trd9Xiq2zt+
         jaVpUdyVlVj4/lOxeWc/taBROGIbW6dNjPnmwm2hSbjMMYDs389eCQwgZZiHqa92LkyB
         eQlbgMJfOUic0qEItCwt+xqGfIiR3L7+78oRuUcXv2tI5V4fPc1mJBZl6a6308rtvq7d
         J80A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="eN/skrZ4";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id x21si160165eju.0.2020.07.15.14.21.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4B6Vgd46hTzxxc
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jul 2020 23:21:33 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 15 Jul
 2020 23:21:33 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 7/7] tools: config-check: add CPU overlap and boundary check
Date: Wed, 15 Jul 2020 23:21:19 +0200
Message-ID: <20200715212119.48052-8-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
References: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="eN/skrZ4";
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

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 14 ++++++++++++--
 tools/jailhouse-config-check | 34 +++++++++++++++++++++++++++++++---
 2 files changed, 43 insertions(+), 5 deletions(-)

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
index 380f4a77..d7f405fd 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -66,6 +66,7 @@ for cfg in args.cellcfgs:
 
 ret=0
 
+# Memory checks
 print("Overlapping memory regions inside cell:", end='')
 found=False
 for cell in cells:
@@ -79,10 +80,10 @@ for cell in cells:
             if (mem.virt_overlaps(mem2)):
                 overlaps.append("virtually")
             if overlaps:
-                print("\n\nIn cell '%s', region %d" % (cell.name, idx))
+                print("\nIn cell '%s', region %d" % (cell.name, idx))
                 print(str(mem))
-                print(" and ".join(overlaps) + \
-                    " overlaps with region %d\n" % idx2 + str(mem2), end='')
+                print(" and ".join(overlaps) +
+                      " overlaps with region %d\n" % idx2 + str(mem2), end='')
                 found=True
                 ret=1
 print("\n" if found else " None")
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
+            print("\nIn cell '%s' and '%s' following CPUs overlap: %s" %
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
+        print("\nIn cell '%s': %s" % (cell.name, str(diff)), end='')
+        found = True
+        ret = 1
+if found:
+    print("\nNote: root cell CPU set: %s\n" % str(root_cell.cpu_set))
+else:
+    print(" None")
+
 exit(ret)
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200715212119.48052-8-andrej.utz%40st.oth-regensburg.de.
