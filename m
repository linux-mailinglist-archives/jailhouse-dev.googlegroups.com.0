Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVFV2HTAKGQE3MVUL3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BBB18E7D
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 18:52:36 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id d13sf454672lfi.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 09:52:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557420756; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ea+UKNdAGt4LmA2+s7Mj5dFismhCCoEw3yFEDUVqNDHRHkPhmCHIEzdSvoIZX1/UtP
         gwRgbF1GsGyY2K5Wz7tuEJ/qHXxj7QadqAiv1sIjqsIjd5/tHk4W5FH6PLQNxUjq3Ir4
         +PR4yO24Wc0uUmAkh2kxH0r2t8Vo9E0z8bPfXd0sBAs6SYDVa6hokUUEShzlRC2yvPWd
         +nKZLgkgTIBMFUCZ0aj+2W2XHidbED5n5AvWkJT5B7bR+WBBfli9dEmgTPzWDizMYeTo
         3gYiL0G9ftX+gg0doQyj5XtCzcWwXJIMJLMq0ZrQZgkfMhRXg81vodVr+N/cm5AKmHWS
         p9ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=BsAfB3NXRTfpaCRy61CpmoFEHTwThHGdWJra6MBvq1M=;
        b=ynRPj2zBXHAtcwjtU+P7I4EzqlCBihLM9aG977NlA4HnMBp+np7Gx+yZPkuaiA/qAD
         Ci0OFz5J0YCzzeh9MwuDNqwvc4ggyn4ou+DlUCG6Bxd+zJ4XjjstimJGPJEPdwxCawpp
         bD7dmgTYjb9uX6bDS3/OIw+bpz4gmB+rmxv9ohquuwD7dcOxCSjQYkJxc0ejTuc5pqfk
         VXm4i24Id9hor7nEBU3N3M+v9HOELSEVHWLLK22QEWk4VxS8uqVr7inkm/PQEdnDSODd
         296yOMXfeL+H3J1isdGbUuoLwnC+zpEP3G2PAiQDIHnF6aK6AaR/lucO+LqhxuC7imkK
         ivrw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BsAfB3NXRTfpaCRy61CpmoFEHTwThHGdWJra6MBvq1M=;
        b=j4ghDuNVThYEwpvbpAHtp1AjgCku2iZpjiM2l4vEw0nVJOGx6K5H7Yq4qLqEI7ScnW
         xFf1/Cp6FA4Q4/10EY2whCG8mfW0n7AVahHQn4nx0jezNq/OYaoaScw0NIycGeSOAe5L
         X0OK975wAL3JyzPMHkukP59jxJ4FGhJ5vbO/bTOve8yReBie37HdhkR/MZaOQuWJn4eJ
         0P2wQJuiu0HSMSiQ1qs0D4VwbIlziT4phqURkHdID35PMXT4RkcCxqOeXFu5DC/kYZNu
         8TRb9YS/SkqJabhz+v4yPtFk515l7EFCN4gRePBm78QdGQlBgjFB0PSuzi5Z19FTEBW0
         tr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BsAfB3NXRTfpaCRy61CpmoFEHTwThHGdWJra6MBvq1M=;
        b=p6KL7D57IPq7G/WdZug8d1hzjk808nfPSz85++ubnfz596M6skDhYwZCIxspBt6wCD
         k/dTdXJ/pPsIv0+2YFDSE/96SBqqN3k4WxOCDTPpECXVISWqVhDywr6suH8hXYFwQoDz
         5Wm7nvU2nfWWMl3ltl4zLG0jUE7XA9194/CAwGwQP34xLl/h1BAZWMAxVxoMhrSvWdLt
         6HLsws4jtVKDCOfyWOkweE/yHYFCSM0oboecjHSybpkTo8qE09ydwHNMSVU1dedue2zX
         s/DqqNe8v+FBmTQ5KZub97I1DIuyE3LslzttPi8Ez0EOgFM4ZTZz0EBoh8q6MGxdcUZ/
         NKiA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVADTdlFn881FCP6iYkEopqLdJ+kFNr6eNpw9upbnwEq9GgGhDh
	eyNeBD8Z4CKTtWqQNfZJ8Ok=
X-Google-Smtp-Source: APXvYqyr46lqu+BYkQ2xB1MQryU8OrKIgtOFMK+/vFWL5Sh43AyRftZ22cJMNExZxPPS0p9t9p1h6Q==
X-Received: by 2002:a2e:9188:: with SMTP id f8mr3027661ljg.100.1557420756431;
        Thu, 09 May 2019 09:52:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:f807:: with SMTP id a7ls286982lff.11.gmail; Thu, 09 May
 2019 09:52:35 -0700 (PDT)
X-Received: by 2002:a19:760e:: with SMTP id c14mr3143275lff.48.1557420755915;
        Thu, 09 May 2019 09:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557420755; cv=none;
        d=google.com; s=arc-20160816;
        b=vcIgvudWRnCzF/18xnkK0dKhbmZmsk5asSPuwBPeOZjVZ2QJWe68nULMeuTY+LjO2r
         LkULziSp3uGn5H8peYA2d3l+nw4tuValznW/7m0dLQZt+aY2/flC8Y1ZxgHg0Ldx9N3b
         Xtd5aBMBfblQQ3UGYNAVZKBvHul6C9eUAM/j3V/k/eGoUc4c7jMqCXD0woGWSco+QcXI
         pv5BzHqDJKxlwPHyYN/3gQCsY5jCP/28wvaNlYk+r7crunLd2XhkklxA6ItMH3z6BXQY
         3bUI3j268ON4qmNgXGktnUDK8BB025wtqtChqSsj6By84Gdss3Qe3IKJo3FPz3owCgNY
         bQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=B9P76GpvLV0wma+84lwBpsk5/4QOsnCNkITROMxAMQs=;
        b=D9jA+/gZIdZl8NlHYHkgLzY/tHy59zVnMs/vZbRy3UdxcmXjMZlHoKMKqF6GSQUs1y
         QJhviQLV45Jb6+o/bXpZau6rw5pvTn+7KNwaV5L1rMl8E4S3EaCI+/L+uu47UJQ8uNf3
         ftbWsYuhGzx6UI3y8KW1bVsdY0zzI1hKw9sf0p8PCSEmKQrswXkGRnce38nsIY/zyJ4x
         STr7PMENqpwrx8VZcAvNfR6fOib7h/KBwi6nAgLDYQJAV9fSqAy2YNy2BkMKh0BjyOsN
         1cBJrQQFwdq85TbeSUldQAJrVh4JnIoL1FOCV69r4o16ScEhVTH4Wpgj2WFlRcWLikQW
         3AqQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id w26si730739lji.4.2019.05.09.09.52.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450KC60pGzzyBc;
	Thu,  9 May 2019 18:52:34 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 5/6] pyjailhouse: let the generator produce speaking names for PCI caps
Date: Thu,  9 May 2019 18:52:30 +0200
Message-Id: <20190509165231.18572-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
References: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.164517, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Therefore, we autogenerate pyjailhouse/pci_defs.py.

The generator will extract PCI_CAP_IDs with grep & sed, fill the template and
print the generated python file. The Makefile will redirect the output to the
final destination.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 .gitignore                    |  1 +
 pyjailhouse/sysfs_parser.py   | 21 ++++++++-------
 tools/Makefile                | 14 ++++++++--
 tools/gen_pci_defs.sh         | 50 +++++++++++++++++++++++++++++++++++
 tools/root-cell-config.c.tmpl |  6 +----
 5 files changed, 76 insertions(+), 16 deletions(-)
 create mode 100755 tools/gen_pci_defs.sh

diff --git a/.gitignore b/.gitignore
index 494b9356..c8a96df0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -19,6 +19,7 @@ include/jailhouse/config.h
 hypervisor/hypervisor.lds
 inmates/lib/arm/inmate.lds
 inmates/lib/arm64/inmate.lds
+pyjailhouse/pci_defs.py
 tools/jailhouse
 tools/jailhouse-gcov-extract
 tools/jailhouse-config-collect
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 4bb50605..2ddb9e38 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -22,6 +22,8 @@ import struct
 import os
 import fnmatch
 
+from .pci_defs import PCI_CAP_ID, PCI_EXT_CAP_ID
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
diff --git a/tools/Makefile b/tools/Makefile
index 08fd361c..bc894378 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -66,7 +66,7 @@ HAS_PYTHON_MAKO := \
 	&& echo yes)
 
 ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
-always += jailhouse-config-collect
+always += jailhouse-config-collect ../pyjailhouse/pci_defs.py
 HELPERS += jailhouse-config-collect
 
 else  # !HAS_PYTHON_MAKO
@@ -98,6 +98,11 @@ define cmd_gen_man
 	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
 endef
 
+quiet_cmd_gen_pci_defs = GEN     $@
+define cmd_gen_pci_defs
+	$^ $(src)/../include/jailhouse/pci_defs.h > $@
+endef
+
 targets += jailhouse.o
 
 $(obj)/jailhouse: $(obj)/jailhouse.o
@@ -114,9 +119,14 @@ always += jailhouse-gcov-extract
 $(obj)/jailhouse-gcov-extract: $(obj)/jailhouse-gcov-extract.o
 	$(call if_changed,ld)
 
-$(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse-config-collect.tmpl
+$(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create \
+	$(src)/jailhouse-config-collect.tmpl \
+	$(src)/../pyjailhouse/pci_defs.py
 	$(call if_changed,gen_collect)
 
+$(src)/../pyjailhouse/pci_defs.py: $(src)/gen_pci_defs.sh
+	$(call if_changed,gen_pci_defs)
+
 targets += $(MAN8_PAGES)
 always +=  $(MAN8_PAGES)
 
diff --git a/tools/gen_pci_defs.sh b/tools/gen_pci_defs.sh
new file mode 100755
index 00000000..584f934f
--- /dev/null
+++ b/tools/gen_pci_defs.sh
@@ -0,0 +1,50 @@
+#!/bin/bash
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
+CELL_CONFIG_H=$1
+
+function find_defines() {
+	header=$1
+	prefix=$2
+	search="#define\s\+${prefix}\(\S*\)\s\+\(\S*\).*"
+	replace="        '\1'\t: \2,"
+
+	grep $prefix $header | sed -e "s/$search/$replace/"
+}
+
+PCI_CAP_IDS=$(find_defines $CELL_CONFIG_H PCI_CAP_ID_)
+PCI_EXT_CAP_IDS=$(find_defines $CELL_CONFIG_H PCI_EXT_CAP_ID_)
+
+cat <<END
+# This file is autogenerated. If you need to change it, edit
+# tools/gen_pci_cap_ids.py.sh instead.
+
+from .extendedenum import ExtendedEnum
+
+
+class PCI_CAP_ID(ExtendedEnum):
+    _ids = {
+${PCI_CAP_IDS}
+    }
+
+    def gen_cfg(self):
+        return str(self)
+
+
+class PCI_EXT_CAP_ID(ExtendedEnum):
+    _ids = {
+${PCI_EXT_CAP_IDS}
+    }
+
+    def gen_cfg(self):
+        return ExtendedEnum.__str__(self) + ' | JAILHOUSE_PCI_EXT_CAP'
+END
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index b80d7889..20c04b7e 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -196,11 +196,7 @@ struct {
 		/* ${comment} */
 		% endfor
 		{
-			% if (c.id & 0x8000) != 0:
-			.id = ${hex(c.id & 0x7fff)} | JAILHOUSE_PCI_EXT_CAP,
-			% else:
-			.id = ${hex(c.id)},
-			% endif
+			.id = ${c.id.gen_cfg()},
 			.start = ${hex(c.start)},
 			.len = ${c.len},
 			.flags = ${c.flags},
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509165231.18572-6-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
