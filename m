Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAXCYLTAKGQEOTPZRLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id E1772155F1
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 00:11:14 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id w15sf5946709wrt.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 15:11:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557180674; cv=pass;
        d=google.com; s=arc-20160816;
        b=jLGx7sHtCphO+mkjdNvFJj8V/ijsNO1nwi+9e6Xv7qvh2I3X8nn49n00ro3RK4zUrj
         ntMoahaxxjK3fI7NHRPqhSigudwVscLj14BeLRmr+ejrJJWaSaFdWKqNvcn3LC/i+0cf
         GtkvBJ/jRCelXMfBys4hV85QT0Apm9mkojhTmFmfQWMseRL4pq+wO9TiF5dC6r/0S1TB
         Gm0hOpG27x7JM09X6qL5+cefSbDJFv0PWRJqmFAAHp0I1TxpW1r/j2j3E/5ElrqFPwjc
         hpnUKyAdV307S7Sg4q/mfbupEIupnapaneSZxr8ytWqDFqL/1IFMQXiaGgtY+qGPWnra
         iCqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=VkcAPqL7EykoT7H3T418dY3xGNCaBMtdKY6t5NMV9f4=;
        b=miZkNYTSSd5DKSOEP78f4aD6YimsUR/SgbMRGS4C3hbSDESWmCZwifh18WKlmIvkmV
         JP2tQjX8vj+RdeKRV6Ici2BcD25tDwne9V/O1+MEewNUuZ9LVYzr/6NkOPaeMOCfnAdq
         uT1i0ShEU8g4roeotfJFpZsbyXqPC+DS3PhhABDVxXYfmvfKCKC6yJ1ciaV+qX8pqioZ
         RHrJB4EELCVLA/kqyxIFpmIfwDKVt4ba3x0yrj//5niCzfSGxz7/XFOGeENuhPgvz8UF
         uZv/BaTrQ7owVxja5eI8uHrdJ2szIBSB3Ttsw8dq2pTgWP8hFGhu0iqhlfrHbi2fQo2B
         V8bQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VkcAPqL7EykoT7H3T418dY3xGNCaBMtdKY6t5NMV9f4=;
        b=tngZ+NZ2G/1b7Eecv3DWKdFUOhvovrV3S7eYrdnoLYDIQWUHeNmn9yBN/QRvv9s98f
         A/M/zHszco1CSZRkSEBT9QrpLhkulYFD/uPQD1u4rex+tWhuQPdBiEOibEn7hVRHfa5I
         tZoMsmqH+be2NzPNCqoj3q6nwizPmGSP8+1jH9UDtNbPylMK+i/9m6/SMhWjTgVrRRGr
         mJHWNVTLZoHQWeorPePXC1pez4QBT7PZRkSolifEiBvixclmLn4QTX4XOoBd0i3FKsem
         OJk4xrCJimDe4uqYkuI6l9QGJUXw3HFZC5gKXWm68Ym510BAqnawj7BxjPfNuAxkMc6Z
         LTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VkcAPqL7EykoT7H3T418dY3xGNCaBMtdKY6t5NMV9f4=;
        b=Pj7PLT52kOmRd92Lti8vVvtBlxTk2M4J+k2bfSM+icZDoBRqMmE/3j1WB85mWWaAda
         qZJ0Gq2xoPqW2+3Ryp++dJdWaXlEDyWgcm6ae+AYTzdAzHbOJYJYWMTnzBaOdYlCoQF9
         OKZkaOJ9AMG3H+lqnm5FTmARZLsYJFMhPiMZOIIrFZgCPsTItR6SsYSXfhQ53GYbcy9c
         zxJP4Rmt7GYpf93e6re+v4R4tCt6TDgq6KW8ztO/55NPQ4IFXzmd8WYGFTWG2P3FLx+v
         KitN/q5Ji8vXaC8k3KRQcS6VqEXYsoEoRqyVeZskylJvKKVJWiZrq0sSq5oqmoaBYcJR
         5f9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUrZfvoTYkPfpbxbiUE161w9qhyNde48/2SvwiasDV1LEeP940z
	r39cIaMRu7zVrxGbLGy5T4s=
X-Google-Smtp-Source: APXvYqzH8i8+mww/HXmsLTZmZq/y2YOL6XE0gdkChhl3Tj3brY2tQXNmV16HRzYbxI262Whon2FQ9Q==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr18903610wrm.228.1557180674646;
        Mon, 06 May 2019 15:11:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d4cb:: with SMTP id w11ls759473wrk.7.gmail; Mon, 06 May
 2019 15:11:14 -0700 (PDT)
X-Received: by 2002:adf:df85:: with SMTP id z5mr13543099wrl.127.1557180674269;
        Mon, 06 May 2019 15:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557180674; cv=none;
        d=google.com; s=arc-20160816;
        b=idYsYKgLyFeXc7agNdmG1mcVWSMzQR8cotska1Sx46LHOmJIE5ZtW3JiGFzja1e00N
         XwIA1m2QNEthMD3BQKB46mwF5p38xASjljNzxpCe/4LtS3AsyLjcWCaUosyF4enh5g5/
         hzomrJ9jTytvFXNyqPiLmEQ/8s4XDQmnUMPbPvdMG5Px5r95IYxPBwPnXycXCA6a60tc
         F4oX3ov9rfJC1W72vJ00+h8JhOUylhvcAHVs4GpJifSzAWu02gkraOuAnoycwIx99m0o
         /2DotYKyaQ+I9w2J+iKp7gFdbPt/c2sxDbOYaP96nzaMofEY2JMsSiiVs4aQDPZzUhwf
         DRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=K+I0ovxoMkWc627hpfgku0VnvR+3oBZfvVd4uIjb/QQ=;
        b=XV4GYtBlP1BjiA+lBPNW3wfuyV+3E+tYE1B6GIJKRDYPNpIc1ke629kC2ER/Qeu/yy
         piEosR3jsznMaY/fYfmeu2yrEq8uAkr2xYdAKrepR+LRFlgcrVttHtBleAsuaPMllZ4y
         Leea/niN3mI15LWl2Wl+dJbRrmvrKuXvBKYr3Kb8d8yX1obkEEFdmgb9WDoz4pN2gO/D
         6gmpWUxssCe53plnGNnTuqZu1E+6Q8Vm/Aabr4ev4zOgUKGEisySO5TcrV+NfCtICpij
         K6sGmWuVJIKmO8QjUTVPpYX+Ho5KJ52rCwbFtoji3AtR57XwpS9wMF7kdc4Uyj89KC83
         EL2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id x18si472916wmh.2.2019.05.06.15.11.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 15:11:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44ycQ84bX7zyB7;
	Tue,  7 May 2019 00:11:12 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 6/7] pyjailhouse: autogenerate pci_cap_ids.py
Date: Tue,  7 May 2019 00:11:09 +0200
Message-Id: <20190506221110.19495-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.6.220017, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.5.6.5600003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Convert pci_cap_ids.py to a shell script that should be called with
cell-config.h.

The script will extract PCI_CAP_IDs with grep & sed, fill the template and
print the generated python file. The Makefile will redirect the output to the
final destination.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 .gitignore                 |  1 +
 pyjailhouse/pci_cap_ids.py | 67 --------------------------------------
 tools/Makefile             | 14 ++++++--
 tools/gen_pci_cap_ids.sh   | 58 +++++++++++++++++++++++++++++++++
 4 files changed, 71 insertions(+), 69 deletions(-)
 delete mode 100644 pyjailhouse/pci_cap_ids.py
 create mode 100755 tools/gen_pci_cap_ids.sh

diff --git a/.gitignore b/.gitignore
index 494b9356..678f7436 100644
--- a/.gitignore
+++ b/.gitignore
@@ -19,6 +19,7 @@ include/jailhouse/config.h
 hypervisor/hypervisor.lds
 inmates/lib/arm/inmate.lds
 inmates/lib/arm64/inmate.lds
+pyjailhouse/pci_cap_ids.py
 tools/jailhouse
 tools/jailhouse-gcov-extract
 tools/jailhouse-config-collect
diff --git a/pyjailhouse/pci_cap_ids.py b/pyjailhouse/pci_cap_ids.py
deleted file mode 100644
index 3b824718..00000000
--- a/pyjailhouse/pci_cap_ids.py
+++ /dev/null
@@ -1,67 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) OTH Regensburg, 2019
-#
-# Authors:
-#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
-#
-# This work is licensed under the terms of the GNU GPL, version 2.  See
-# the COPYING file in the top-level directory.
-
-from .extendedenum import ExtendedEnum
-
-
-class PCI_CAP_ID(ExtendedEnum):
-    _ids = {
-        'PM'     : 0x01, # Power Management
-        'VPD'    : 0x03, # Vital Product Data
-        'MSI'    : 0x05, # Message Signalled Interrupts
-        'HT'     : 0x08, # HyperTransport
-        'VNDR'   : 0x09, # Vendor-Specific
-        'DBG'    : 0x0A, # Debug port
-        'SSVID'  : 0x0D, # Bridge subsystem vendor/device ID
-        'SECDEV' : 0x0F, # Secure Device
-        'EXP'    : 0x10, # PCI Express
-        'MSIX'   : 0x11, # MSI-X
-        'SATA'   : 0x12, # SATA Data/Index Conf.
-        'AF'     : 0x13  # PCI Advanced Features
-    }
-
-
-class PCI_EXT_CAP_ID(ExtendedEnum):
-    _ids = {
-        'ERR'     : 0x01, # Advanced Error Reporting
-        'VC'      : 0x02, # Virtual Channel Capability
-        'DSN'     : 0x03, # Device Serial Number
-        'PWR'     : 0x04, # Power Budgeting
-        'RCLD'    : 0x05, # Root Complex Link Declaration
-        'RCILC'   : 0x06, # Root Complex Internal Link Control
-        'RCEC'    : 0x07, # Root Complex Event Collector
-        'MFVC'    : 0x08, # Multi-Function VC Capability
-        'VC9'     : 0x09, # same as _VC
-        'RCRB'    : 0x0A, # Root Complex RB?
-        'VNDR'    : 0x0B, # Vendor-Specific
-        'CAC'     : 0x0C, # Config Access - obsolete
-        'ACS'     : 0x0D, # Access Control Services
-        'ARI'     : 0x0E, # Alternate Routing ID
-        'ATS'     : 0x0F, # Address Translation Services
-        'SRIOV'   : 0x10, # Single Root I/O Virtualization
-        'MRIOV'   : 0x11, # Multi Root I/O Virtualization
-        'MCAST'   : 0x12, # Multicast
-        'PRI'     : 0x13, # Page Request Interface
-        'AMD_XXX' : 0x14, # Reserved for AMD
-        'REBAR'   : 0x15, # Resizable BAR
-        'DPA'     : 0x16, # Dynamic Power Allocation
-        'TPH'     : 0x17, # TPH Requester
-        'LTR'     : 0x18, # Latency Tolerance Reporting
-        'SECPCI'  : 0x19, # Secondary PCIe Capability
-        'PMUX'    : 0x1A, # Protocol Multiplexing
-        'PASID'   : 0x1B, # Process Address Space ID
-        'DPC'     : 0x1D, # Downstream Port Containment
-        'L1SS'    : 0x1E, # L1 PM Substates
-        'PTM'     : 0x1F  # Precision Time Measurement
-    }
-
-    def __str__(self):
-        return ExtendedEnum.__str__(self) + ' | JAILHOUSE_PCI_EXT_CAP'
diff --git a/tools/Makefile b/tools/Makefile
index 08fd361c..af9da8db 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -66,7 +66,7 @@ HAS_PYTHON_MAKO := \
 	&& echo yes)
 
 ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
-always += jailhouse-config-collect
+always += jailhouse-config-collect ../pyjailhouse/pci_cap_ids.py
 HELPERS += jailhouse-config-collect
 
 else  # !HAS_PYTHON_MAKO
@@ -98,6 +98,11 @@ define cmd_gen_man
 	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
 endef
 
+quiet_cmd_gen_pci_cap_ids = GEN     $@
+define cmd_gen_pci_cap_ids
+	$^ $(src)/../include/jailhouse/cell-config.h > $@
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
+	$(src)/../pyjailhouse/pci_cap_ids.py
 	$(call if_changed,gen_collect)
 
+$(src)/../pyjailhouse/pci_cap_ids.py: $(src)/gen_pci_cap_ids.sh
+	$(call if_changed,gen_pci_cap_ids)
+
 targets += $(MAN8_PAGES)
 always +=  $(MAN8_PAGES)
 
diff --git a/tools/gen_pci_cap_ids.sh b/tools/gen_pci_cap_ids.sh
new file mode 100755
index 00000000..c6d71341
--- /dev/null
+++ b/tools/gen_pci_cap_ids.sh
@@ -0,0 +1,58 @@
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
+
+class PCI_EXT_CAP_ID(ExtendedEnum):
+    _ids = {
+${PCI_EXT_CAP_IDS}
+    }
+
+    def __str__(self):
+        return ExtendedEnum.__str__(self) + ' | JAILHOUSE_PCI_EXT_CAP'
+END
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
