Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAPCYLTAKGQENIQXSWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 470E0155F0
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 00:11:14 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id l2sf11432445wrn.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 15:11:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557180674; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZXjpfVPQBmhfTa6n9ltY+KPNXH0UptNVgD8CVMabevsAdHsW5tcJM/FfL7+s4sgLIu
         1hUtw4SbVCSeC048sYAMy5XAQkvVyTBHnqcZfrCJBVUU+7RvAZwDelwywUdYSZPBkvf0
         SJbcTKqYs7Puaow+uBfl2jeIqTfpw1dEe6ufy6qswOwhdQ0NgOPx4+RA6Cy0hHBHFR4j
         KkZmT7/DGyMu9/NeDOTR5gMjxogjpl2Jh8OdUfcRGP69FROQHFFOXdZ1JOZuxX4JNK1M
         IY1ociHneGDTrjAqUg2OQvtMTY6wHI/1o4wbg00QeWHkad9hAor+l0A1k3ES9jQNmjEx
         xJ3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=kjb2iVNt96qqnknVjTppxP03Ho5qBnH3qZdPyKzwJl8=;
        b=dubW6qFswa2sO2zSx9tv8CVPxAST1tTT5PD9SanrXcosSPlVh6JBaH5RztMd7CC7Ju
         BCt4+gzh6wdMm1Z/cHg/WOAOkIJG8qjWltW91YIKAhxNI9c9/PA5LqNfZ7rNqROW055I
         wmp5dn1sYDFJ/YN7IFkJuh+iJLGMf+rXMcVMleI5TFApc7RucbE9nl9H4JRSTKDA76od
         vF0Q3oBRk+UDQvtC70fg00Nfi79+Sj1/Ye5xHiFIr+GlNZSFu/T3GJGMOVErxkSlDE8i
         dzznOBG5od07SxoMaYEsjwebcvOf0cr+xMSZTBqLSucOQ5/HMWvYKgmzLenUBOSraQy6
         abZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kjb2iVNt96qqnknVjTppxP03Ho5qBnH3qZdPyKzwJl8=;
        b=bEhxZ6HyH7dkSyUou3NXFcForCZMGL59yJefHVSzb8EFdE7yWZTKIpH1B9J2a94Y8g
         52ZZMYz13eCgeOXIHHgBGheLlBgQ23QhUSmeQtcflN+VIkZ0XO9i71Zmmv05u1Yne6qT
         5v6ISvtUC+wUVMeHZsT4SNC3j0fB7xdU3G6CL93d02uYm/XiswRHHXSSbGql3aLn9hLH
         JMH8U9GGdIYTjQDzxLBpF6QfV9CK4c1F4lqcN59RheL33ygzMhpl0Q55e2HXF+IjgpYp
         ynRSmsNuywFE29j4KF354Fz8NdTg/iGvbqMiwVBjBfBQBc0bzUzohxYem5tUWVkhbbmy
         XnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kjb2iVNt96qqnknVjTppxP03Ho5qBnH3qZdPyKzwJl8=;
        b=cudvTjNGFO9V6eKwF0tU0QE3UZOLbKv2wbU0Sqr8v5cjGwSNlTo+4m0Yf6ps90XXrr
         FuotU55jS08kfSZ5upse3Lx/ur/JMadCOD3sEuEtzz/wjOJ4N0bzCaJVPTcP3hGuC1z5
         fCpto3/ePeaiXZeeuKRcWGycjIwIzdKcCkNkjYKA24ZPeZh+D8KLW7Soj2B9ARZmY6LM
         KmZauBoLeCpAq3IUBvTb/vK4Ho9Cg15JJgBQVP83JsN6BNCbiHaXrd7J7PDlgjNvsS8D
         PhIAKcuvzds4he2ZnF+uuq4zngt9U9SUK3bl8ENydRPZVWvvIptEGsjo3AA0oanVRiPZ
         SkPg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVCZqMInm1kxdj5Zk63h67NKwy3jOtBL1sOI0dRJJ8o69ovEQzt
	RbQXCrXjpnsM7xOL+3U3HH0=
X-Google-Smtp-Source: APXvYqyHmDk5aQRT5TJhJyq09Qu2h9VwKY9fQY+8cMgp7JRsLT6EMf9LYbw+Tt5y2hdp+t710WEM2Q==
X-Received: by 2002:a1c:6783:: with SMTP id b125mr18923035wmc.41.1557180673955;
        Mon, 06 May 2019 15:11:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f701:: with SMTP id v1ls322950wmh.1.experimental-gmail;
 Mon, 06 May 2019 15:11:12 -0700 (PDT)
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr12149063wmc.36.1557180672855;
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557180672; cv=none;
        d=google.com; s=arc-20160816;
        b=pu5V0jz1ohkZyJKhpp4pZeQ+jy4ugaTfEDZo/RFsPHcFLwQFInGp7zHwL0YC+pQvB1
         0bWPV7OlriUXiti/ikrxyheMuJt2AME1fA23MyH+okCAvxd+mVUxp6Z7SbDpaI1zW6/U
         zNxNQHeTk9RVt2ImP+o2na3bszPiQZEuLt1WW5dJgaUC2Cioz2m2pznFmNGsQqKNuH3+
         Pki4le7PalAi7CLQYivD5vCm5jU3KQIzdX8tm9sfK0WBlNjAAO6S70rQ+Vb2lJqGc6un
         0yKIEI53AWCY5Ol/6BRSip/8WYl5Rz9ZW07ECfI4c6rzMp93KuEkno7gDCGFe0OelHQK
         7NGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=cD0wbOo7rA+t3WuCGe0l2/6j3gyYFY/PtR8ofwAPCV0=;
        b=nub9wz4Ds2NXJllquK40o1e3lyE0FUEW8xmVNBgL/hkc1h92P+A8nOjkKhKLwPVnic
         sEdzQtV4EdraWj3oHPrvGZe0ILiFSeA5WSoTv4BPfRTDWLvqGrY8WXHGfB7Oh7XTCYAq
         fNkelAQJ343sonXSyERhHC9efZF/S+ZSDsaFZ3S/7g2ay8nAkn4RnyWCQZtY9Rm+p26P
         1gHFeCBvGcyxM1Pf3+5vSLhHPas+cqVitWrd0x016G/fszwqc7gixEVx5mH4XUvONxtX
         cTyijkG6PuoIoTpjHUuf5wuBdQga/2SsQdkQQvFvL4sIMMavbRzeoKb2SpSw7q2OsZnY
         0NQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id z11si268829wmf.1.2019.05.06.15.11.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44ycQ82rdgzyBH;
	Tue,  7 May 2019 00:11:12 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 5/7] pyjailhouse: let the generator produce speaking names for PCI caps
Date: Tue,  7 May 2019 00:11:08 +0200
Message-Id: <20190506221110.19495-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.6.220017, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.5.6.5600003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Definitions on C-side are in place, so let the generator produce those
definitions.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/pci_cap_ids.py    | 67 +++++++++++++++++++++++++++++++++++
 pyjailhouse/sysfs_parser.py   | 21 ++++++-----
 tools/root-cell-config.c.tmpl |  6 +---
 3 files changed, 80 insertions(+), 14 deletions(-)
 create mode 100644 pyjailhouse/pci_cap_ids.py

diff --git a/pyjailhouse/pci_cap_ids.py b/pyjailhouse/pci_cap_ids.py
new file mode 100644
index 00000000..3b824718
--- /dev/null
+++ b/pyjailhouse/pci_cap_ids.py
@@ -0,0 +1,67 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) OTH Regensburg, 2019
+#
+# Authors:
+#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+
+from .extendedenum import ExtendedEnum
+
+
+class PCI_CAP_ID(ExtendedEnum):
+    _ids = {
+        'PM'     : 0x01, # Power Management
+        'VPD'    : 0x03, # Vital Product Data
+        'MSI'    : 0x05, # Message Signalled Interrupts
+        'HT'     : 0x08, # HyperTransport
+        'VNDR'   : 0x09, # Vendor-Specific
+        'DBG'    : 0x0A, # Debug port
+        'SSVID'  : 0x0D, # Bridge subsystem vendor/device ID
+        'SECDEV' : 0x0F, # Secure Device
+        'EXP'    : 0x10, # PCI Express
+        'MSIX'   : 0x11, # MSI-X
+        'SATA'   : 0x12, # SATA Data/Index Conf.
+        'AF'     : 0x13  # PCI Advanced Features
+    }
+
+
+class PCI_EXT_CAP_ID(ExtendedEnum):
+    _ids = {
+        'ERR'     : 0x01, # Advanced Error Reporting
+        'VC'      : 0x02, # Virtual Channel Capability
+        'DSN'     : 0x03, # Device Serial Number
+        'PWR'     : 0x04, # Power Budgeting
+        'RCLD'    : 0x05, # Root Complex Link Declaration
+        'RCILC'   : 0x06, # Root Complex Internal Link Control
+        'RCEC'    : 0x07, # Root Complex Event Collector
+        'MFVC'    : 0x08, # Multi-Function VC Capability
+        'VC9'     : 0x09, # same as _VC
+        'RCRB'    : 0x0A, # Root Complex RB?
+        'VNDR'    : 0x0B, # Vendor-Specific
+        'CAC'     : 0x0C, # Config Access - obsolete
+        'ACS'     : 0x0D, # Access Control Services
+        'ARI'     : 0x0E, # Alternate Routing ID
+        'ATS'     : 0x0F, # Address Translation Services
+        'SRIOV'   : 0x10, # Single Root I/O Virtualization
+        'MRIOV'   : 0x11, # Multi Root I/O Virtualization
+        'MCAST'   : 0x12, # Multicast
+        'PRI'     : 0x13, # Page Request Interface
+        'AMD_XXX' : 0x14, # Reserved for AMD
+        'REBAR'   : 0x15, # Resizable BAR
+        'DPA'     : 0x16, # Dynamic Power Allocation
+        'TPH'     : 0x17, # TPH Requester
+        'LTR'     : 0x18, # Latency Tolerance Reporting
+        'SECPCI'  : 0x19, # Secondary PCIe Capability
+        'PMUX'    : 0x1A, # Protocol Multiplexing
+        'PASID'   : 0x1B, # Process Address Space ID
+        'DPC'     : 0x1D, # Downstream Port Containment
+        'L1SS'    : 0x1E, # L1 PM Substates
+        'PTM'     : 0x1F  # Precision Time Measurement
+    }
+
+    def __str__(self):
+        return ExtendedEnum.__str__(self) + ' | JAILHOUSE_PCI_EXT_CAP'
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 4bb50605..9051cb83 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -22,6 +22,8 @@ import struct
 import os
 import fnmatch
 
+from .pci_cap_ids import PCI_CAP_ID, PCI_EXT_CAP_ID
+
 root_dir = "/"
 
 def set_root_dir(dir):
@@ -368,7 +370,7 @@ def parse_ivrs(pcidevices, ioapics):
                 if d.bdf() == iommu_bdf:
                     # Extract MSI capability offset
                     for c in d.caps:
-                        if c.id == 0x05:
+                        if c.id == PCI_CAP_ID.MSI:
                             msi_cap_ofs = c.start
                     # We must not map IOMMU to the cells
                     del pcidevices[i]
@@ -580,11 +582,12 @@ class PCICapability:
             msix_address = 0
             f.seek(cap)
             (id, next) = struct.unpack('<BB', f.read(2))
-            if id == 0x01:  # Power Management
+            id = PCI_CAP_ID(id)
+            if id == PCI_CAP_ID.PM:
                 # this cap can be handed out completely
                 len = 8
                 flags = PCICapability.RW
-            elif id == 0x05:  # MSI
+            elif id == PCI_CAP_ID.MSI:
                 # access will be moderated by hypervisor
                 len = 10
                 (msgctl,) = struct.unpack('<H', f.read(2))
@@ -593,7 +596,7 @@ class PCICapability:
                 if (msgctl & (1 << 8)) != 0:  # per-vector masking support
                     len += 10
                 flags = PCICapability.RW
-            elif id == 0x10:  # Express
+            elif id == PCI_CAP_ID.EXP:
                 len = 20
                 (cap_reg,) = struct.unpack('<H', f.read(2))
                 if (cap_reg & 0xf) >= 2:  # v2 capability
@@ -601,7 +604,7 @@ class PCICapability:
                 # access side effects still need to be analyzed
                 flags = PCICapability.RD
                 has_extended_caps = True
-            elif id == 0x11:  # MSI-X
+            elif id == PCI_CAP_ID.MSIX:
                 # access will be moderated by hypervisor
                 len = 12
                 (table,) = struct.unpack('<xxI', f.read(6))
@@ -637,8 +640,9 @@ class PCICapability:
                           'Extended Capability ID %x' % id)
                     continue
 
+                id = PCI_EXT_CAP_ID(id)
                 next = version_next >> 4
-                if id == 0x0010:  # SR-IOV
+                if id == PCI_EXT_CAP_ID.SRIOV:
                     len = 64
                     # access side effects still need to be analyzed
                     flags = PCICapability.RD
@@ -648,7 +652,6 @@ class PCICapability:
                     flags = PCICapability.RD
                 f.seek(cap + 4)
                 content = f.read(len - 4)
-                id |= PCICapability.JAILHOUSE_PCI_EXT_CAP
                 caps.append(PCICapability(id, cap, len, flags, content, 0))
 
         f.close()
@@ -674,9 +677,9 @@ class PCIDevice:
         self.msix_region_size = 0
         self.msix_address = 0
         for c in caps:
-            if c.id in (0x05, 0x11):
+            if c.id in (PCI_CAP_ID.MSI, PCI_CAP_ID.MSIX):
                 msg_ctrl = struct.unpack('<H', c.content[:2])[0]
-                if c.id == 0x05:  # MSI
+                if c.id == PCI_CAP_ID.MSI:
                     self.num_msi_vectors = 1 << ((msg_ctrl >> 1) & 0x7)
                     self.msi_64bits = (msg_ctrl >> 7) & 1
                 else:  # MSI-X
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index 5a8e1412..7727cdf0 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -198,11 +198,7 @@ struct {
 		/* ${comment} */
 		% endfor
 		{
-			% if (c.id & 0x8000) != 0:
-			.id = ${hex(c.id & 0x7fff)} | JAILHOUSE_PCI_EXT_CAP,
-			% else:
-			.id = ${hex(c.id)},
-			% endif
+			.id = ${c.id},
 			.start = ${hex(c.start)},
 			.len = ${c.len},
 			.flags = ${c.flags},
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
