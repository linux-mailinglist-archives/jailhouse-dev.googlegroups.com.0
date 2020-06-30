Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2555P3QKGQEW7IIPNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5320EEB7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:42:51 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id s16sf5268688wrv.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:42:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499371; cv=pass;
        d=google.com; s=arc-20160816;
        b=XxmgwK1SAZp6GavTU25T3CAEkXiyJOSgGle4paqIdHFi+MJ4G6PTn+9a1O+hBUKS2W
         ejicgOb68kPYq+MkbASTohqi7rq3r6paTwV1igJsCENPILK26RGuElj6R+rMGzEk77mU
         ScSChjP78ruzcbiiYjApzpoZnyaWpeSbOKrlzGXez2JRd05l6VTRfgtEfUn7Y6qVw3r+
         5nExUXHXJdgKk3nNWYl7qT/KliYUIUQ19sDZ0g5rZSgIMaDUXuExJ5T0E2VBTy4wtuW0
         DjD1xNI5fkZQkbGp0AVgUnF82SCkXocj7H54KkyysWPzocX2yt0N9jupTyNqf3BUEBTH
         ozSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OAGAtCPBjSP/pPVKmiX2+K39hBd96wjsXekNDXYMEUI=;
        b=Pw8ZBizfZS7EQUfcMNgI71tbgSixhlQAGfVvqMLVyPbkzDTGsxX5QX+XtQpxtyhrF4
         laEqzfGirw/l9G3aRPS95Mu3Y8IPlk+Qt4k3IsxmDzzCf6EyxCs4rJqRrmw026ZTw3AZ
         09kgdC7D2cE3gIDLQqxXLQU1NYgL2nVVbeam0OwTBDelfwaOenhkLbwVr74IxwIlUj0z
         QjwjRO22wki9cFcLcTPkQkzORlIeAEJpmka2YnlSXE51Rl0H1V34mClkgD5UyEO8oKA2
         Z0r3x4+1+/3eUofsYzEtNwbD8/hGnvMgaX05zfji5MAa2DFN39ti0uziD4XjvC7Jutve
         cNhg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=L4NbjNqt;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OAGAtCPBjSP/pPVKmiX2+K39hBd96wjsXekNDXYMEUI=;
        b=VHiJeekXVuj7k1kvbIBwAyLDsfNlqnquNby99ijyJt4JbfxYkhH8Vs1CcFvKGeipvB
         dPkOr1JmuUhADCc/2ffSYUeeKZWnKalt+Ja/XQO+fVjyjNappPW7TyKEAWMIjlttfc8R
         F+yClq/7lgPAU/noCi4n1/SKgkcmN76aCsj+swuhnOGamUpTAmlxpCSL7TDUoeifh41A
         jZ9MfTWYoLUYQJINlMKg64sQtAAZziSQfVl1Wz0H2ckXjzv58578N4vOagGXQ/TItkZe
         49g1pYihIk209aJRDc8ZQQZWulXILI0ffCXnzC5NcNzFfeskjnDfEEMfCwW/tGAyATS5
         YeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OAGAtCPBjSP/pPVKmiX2+K39hBd96wjsXekNDXYMEUI=;
        b=KNk2e2mwXrX1f1yQm3WEgjHZQM0Zvy3Hq29wGgteC/m7qbpnxihqEkky20sPbXZ5Hw
         hTOuv0Y4ue36jF29sQShBVENcqkQeAinM0Om7LKbhMnNAzh32BZsx4vStDJnOl9zJdpj
         q9vQO2mn1oVxaDxIg/s95UN1NoivGlY0JJmGFBR608TcXyCMQD1/jUd41FGzlnkLCWt7
         ehv9+V6nNbHNwAJIl3KR9I8nL7bTx1MUtsud3SLUgnhYQT7lkJL12W0r4ZgNJ5TCiyGF
         o5kTZo0HP+F5ROMKZXYX9IV4Y6WiqY3/iY9WjBPbuuFJF/rmhFfHt5h4uCFwH1QSD/eZ
         3S7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ovn1VPS9hXE6WuCcaV5yjZ0lRHWquTItEX8IFsMwz+7U3A/TH
	RYAbR7WJXQbik9y10WOf/+I=
X-Google-Smtp-Source: ABdhPJyIeFZQ2vNO8lvIuuqCHB7vSqPepASHyH12oqS00OyMP6AkgHkafbErhEOiuKjioUW3hDId1g==
X-Received: by 2002:a5d:6603:: with SMTP id n3mr21034098wru.142.1593499371423;
        Mon, 29 Jun 2020 23:42:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6507:: with SMTP id x7ls9725450wru.0.gmail; Mon, 29 Jun
 2020 23:42:51 -0700 (PDT)
X-Received: by 2002:a5d:6846:: with SMTP id o6mr20454969wrw.370.1593499371030;
        Mon, 29 Jun 2020 23:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499371; cv=none;
        d=google.com; s=arc-20160816;
        b=NAoker6gGg2uodEP8QYkDUEW7KbgSBcEtaZM47yVGu/X7csGRKGlSScDERcasV62BE
         QmA3GijcOvWGQmgux8XYOYwtrdsGKfZ/u9Y7AqPThIchLB3ivIcspZoNyAw5K4qpTJsP
         AieI+OYSY9Ix7te3BELEgF8VDKwxdl1XMG4fWhUNJv7P6ZHs2r346Axec3u6V1jXel0J
         3g8Zn4CYD9IPWKGn1YyF9FRQWxpLGg8co5baDXCLVE4BKpUy1rbY957l88HSiL6XNxCd
         mDkkp6KQobn/JdkiX3aZuPOvV4lt9lYEeZD/pxYCa7NBd6de8Mp4qSos2FTVCsTNEaR8
         ZEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vVlL3GWP0PcYwr3mLpKC2HA/9OQNCeQ+09+SAgkYIEQ=;
        b=I7W+eL5B5vy0RWgo81JNzTKkv0RkoUmDbCHhMnaP9BvD88ocVFZew+YFM/tANJOvr9
         QzM/ct/uxb3G9V38CzkvMuDcvBHnsWXw07uJkm8RZl4oFCPH5wGYD65ZTv2BbyAg0/U6
         Ab853Ubqf5u+r7Nz3soocHNeDNtejpaz6Q1psF4DEOv515+aOKUgBn18gJg3xp7luoCe
         tcyKe/fKdkWmY1ns/23ssooGJKqZ/sHpFeIhyhfee3G9nyXa+ZKH8nF/w0MJvxHgUViI
         tf+kJlRFUDRWiw59CZIvi+qN+9xWS4Hc+CsXfTY50snzm5LRWuIJV9HO3S4+8rKvlfs5
         YUgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=L4NbjNqt;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id y6si102268wrh.5.2020.06.29.23.42.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:42:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 49wvtf5cTkzy31
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:42:50 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:42:50 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 08/11] tools: config-check: add CPU overlap and boundary check
Date: Tue, 30 Jun 2020 08:42:28 +0200
Message-ID: <20200630064228.4742-8-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=L4NbjNqt;
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

Also includes some minor PEP8 formatting.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 14 +++++++++--
 tools/jailhouse-config-check | 48 ++++++++++++++++++++++++++++--------
 2 files changed, 50 insertions(+), 12 deletions(-)

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
index 380f4a77..224c5fb5 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -64,10 +64,11 @@ for cfg in args.cellcfgs:
     cells.append(cell)
     print("  Non-root cell: %s (%s)" % (cell.name, cfg.name))
 
-ret=0
+ret = 0
 
+# Memory checks
 print("Overlapping memory regions inside cell:", end='')
-found=False
+found = False
 for cell in cells:
     for mem in cell.memory_regions:
         idx = cell.memory_regions.index(mem)
@@ -79,16 +80,16 @@ for cell in cells:
             if (mem.virt_overlaps(mem2)):
                 overlaps.append("virtually")
             if overlaps:
-                print("\n\nIn cell '%s', region %d" % (cell.name, idx))
+                print("\nIn cell '%s', region %d" % (cell.name, idx))
                 print(str(mem))
-                print(" and ".join(overlaps) + \
-                    " overlaps with region %d\n" % idx2 + str(mem2), end='')
-                found=True
-                ret=1
+                print(" and ".join(overlaps) +
+                      " overlaps with region %d\n" % idx2 + str(mem2), end='')
+                found = True
+                ret = 1
 print("\n" if found else " None")
 
 print("Overlapping memory regions with hypervisor:", end='')
-found=False
+found = False
 for cell in cells:
     for mem in cell.memory_regions:
         if mem.phys_overlaps(sysconfig.hypervisor_memory):
@@ -96,8 +97,35 @@ for cell in cells:
             print(str(mem))
             print("overlaps with hypervisor memory region")
             print(str(sysconfig.hypervisor_memory), end='')
-            found=True
-            ret=1
+            found = True
+            ret = 1
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064228.4742-8-andrej.utz%40st.oth-regensburg.de.
