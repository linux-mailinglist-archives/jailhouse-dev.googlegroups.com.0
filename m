Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2EGRGPQMGQE4IQAOJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CFD68D691
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:17 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id l15-20020a056512110f00b004b6fe4513b7sf6304907lfg.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772777; cv=pass;
        d=google.com; s=arc-20160816;
        b=xWZTHGrsBfwvaK+COZRLvFKxvXQzu9lKLRmBqGgmK5p8+A3qMCwXarJuXuux5U1wXk
         G6YFfz5pCTRvcJy1SxSnZc9as9oCG/KKSDOHtcOOAR0l84/2hgoNuGqfeOXVZvQeE9LN
         o2heqBqZNQO2GgHQShDAv+K0s1HBsZAHnsPzRyktvZwouqm1YdGob5Axq0CWrinU2lJI
         5Vt0GSQmUnlw88ozFcDJKFVr1OdVMQCvGQHqgePauofWB5lIhrBtxlhKNfyMohCtqHoQ
         xJxYk7AUxBiBp9Kk3vLS8faBoJ9WOjBdtQuW9z6FE9ehHmyeQXazSW2o00mFEGeLBVWj
         IELw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LH+tLLQe+pUP3rU7Cn2Pq6J5+QBjRgt+olA/CBoFG+o=;
        b=EMU3/hRv2Lgg5CsRYsx3JQfXvCf+jA18SHzaZH6CXi+gJ2/SgTbZDRi3L5m1j+FIQK
         fSEgJn71Bu7aQRmM1N75xk7zXlo60ajHq/PHoMIhtWSIZFai0rQQ+utDQyh3W/MNPrCh
         X2z2i5Zf+tZQ65ENcW5uE3xmkNosbxD47MBCI6sIK7jANugSvYmZ7NzDmwbN31380ZQ3
         X8zNqjNMbXSkzrAx/Yt9V0zptMGLAPDzrC/2kEvD7RMOHRvr74icMvKwy/9H8XP1jQfO
         m0YoS+7RKmH0+Mm3Kh+sidR1zIrWFgyJfs55MGLBlrXoax15m4c4extVP4xcjC/XlyJt
         dC3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LH+tLLQe+pUP3rU7Cn2Pq6J5+QBjRgt+olA/CBoFG+o=;
        b=H6Hh5IhaZm8haKXUiiZTa4WKO4Uz0rZQhB051ztPAmss1SpYmWPtjyMcXCZGUBDCAx
         G/L17eDlwtBOXstu/K3/d2y2uePBb4f6cBsHx2AySai5/6ObNPK++yQHhPfKpfpa8q57
         NPKiv4YhvJiVZCPFuIe8fpjXjZd+enIbb6xziNsAFxqL0twjFBt+tsO4FecW2pmm2nDX
         SR+f+bGL9jDr5jNO/OXhlZNuThQh18Ek7tPFidFQ9A9NwU+BwYJY+W1dJjGxv+GO2wqS
         xnRG7xGRxKewdDHe5y2+KqsvGkpk4ATHaHVGj4lolHyHtH0W8LC3PN3JcCcdA0c/eeJv
         VUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LH+tLLQe+pUP3rU7Cn2Pq6J5+QBjRgt+olA/CBoFG+o=;
        b=xLhez6NylYauyMox/rSA/iZ2PWcY/G71GyLO+0SdvuO2qFF34t/hn4ExHu28T2CBG3
         blSVsgWCQMga9V6tYMFgHD2ZRMFBN5KVmIH0120IpWjfZcqq/FrDsGSCO69sFTBSWBEF
         885+MoTjIx0TFN3REjrihn5qnqeNp+SgwNzUjOBu7fVQscla3NAwdIlP3JnEPGZa7KIt
         XibIzC4b2EFYYIZU40sfJErBx0cpQEuFf0b9c+hSBaQE0FvwgCb9Cb2NyiRNNwtAuFC0
         Dl7yRsMDfSkp4gHfx0yZ2/767xsMBbTFZlAjJBFLqQj5NmkB5xD85exgTbiLSRisC+43
         ko4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWzsHB5tZS4+0gpxRFdX2ws2Ymfa9Ft9yYYPcpFfjXvPJEuUJXL
	6kCJ2Z/0P1VxKT8HXNrzvic=
X-Google-Smtp-Source: AK7set/xlY4UBS1zLeDCGtgYPXVigxOIKPpktMvA7P9ujVPOyePQGNCPXNnZpgBsqstnHRPxEGHr9Q==
X-Received: by 2002:ac2:5102:0:b0:4d5:835c:d9d2 with SMTP id q2-20020ac25102000000b004d5835cd9d2mr404576lfb.263.1675772776848;
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4bcf:0:b0:4c8:8384:83f3 with SMTP id o15-20020ac24bcf000000b004c8838483f3ls72286lfq.3.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:15 -0800 (PST)
X-Received: by 2002:ac2:528a:0:b0:4bb:8d56:d859 with SMTP id q10-20020ac2528a000000b004bb8d56d859mr695277lfm.6.1675772775049;
        Tue, 07 Feb 2023 04:26:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772775; cv=none;
        d=google.com; s=arc-20160816;
        b=qUieq2uwqXTNeKAgCTFs6cOou/fhu6rrokFu0vm4J4PIW2Jow0VxpcibkKnhHXLZiw
         QSQpOcCwWfRuRJRrBR0YBh+k0DJ1U3nySWq1/malzuzauwVXDHVvUJtqJN2bb2n4E/a3
         zNaDgBuf+090uCFv0jvP0tEoJhQe0fG4b/uIgPC/nlRhSU6nyx/+9ccDYhOh/ViXxHKE
         yMFU9S2BSRNJrrCsZsO8e5yNLdly//i/2i6hp8rXPQ3WkCYDtUQ9u9uYAsWkfUG49Uv/
         8aOGJCyi/DK4eHcLOq0RT/0Rjy6+sT/JulpoZRUUS35chNCoVyaUNLbhuA1wkLqvrGZT
         lmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=cS+4s0ei79ZvvrhXpGMrDZJnB2HnkDDKqqN1M2Zfyh8=;
        b=yGrzmXzFtffJm2KMIEiei7GTphL5PHutEsDHVV1E//tT/t+ge65RWx+HZ7fMibwKWh
         M0QvfKQlLmcYNO/FWdxpIHMkvXcZ0/h208ho3z7ysqJltJeOBDwJJ3D5OOruavqrpCqq
         a2sKqgosNSBjOExRHLVoDdBOmyiWZacgzWXYeVpWHdDlG2KpK/PnmAP8tWKYAPK88vHx
         0TDraJbx/BFOcoiGb7ht1DcGaNHhLOM6XE51YIFSbJ8hRuZNb7tYaNWzUuss/Y87AghF
         9aSRXBTHvVYdR6au11ndBff+mQzvQ8JwoVWJ3VS9XxEcPm+irWgRL2lvDxKo8uLIAIC5
         lnLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id k31-20020a0565123d9f00b004cb0f0982f3si639212lfv.4.2023.02.07.04.26.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:15 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RV1qqNzxvr;
	Tue,  7 Feb 2023 13:26:14 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Stefan Huber <stefan.huber@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [RFC v2 33/47] inmates: riscv: implement tiny-demo RISC-V
Date: Tue,  7 Feb 2023 13:25:29 +0100
Message-Id: <20230207122543.1128638-34-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_CONSEQUENCES_A 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0,
 __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

From: Stefan Huber <stefan.huber@oth-regensburg.de>

add necessary files for developing tiny-demo inmate. Consists of
modified copies from x86/arm.

Signed-off-by: Stefan Huber <stefan.huber@oth-regensburg.de>
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 .gitignore                          |   1 +
 inmates/demos/riscv/Makefile        |  19 ++++
 inmates/demos/riscv/tiny-demo.c     |  19 ++++
 inmates/lib/include/inmate_common.h |   1 +
 inmates/lib/riscv/Makefile          |  46 ++++++++
 inmates/lib/riscv/Makefile.lib      |  64 ++++++++++++
 inmates/lib/riscv/header.S          |  44 ++++++++
 inmates/lib/riscv/include/inmate.h  | 157 ++++++++++++++++++++++++++++
 inmates/lib/riscv/inmate.lds.S      |  74 +++++++++++++
 inmates/lib/riscv/printk.c          |  61 +++++++++++
 inmates/lib/riscv/setup.c           |  43 ++++++++
 inmates/lib/riscv/uart.c            |  47 +++++++++
 12 files changed, 576 insertions(+)
 create mode 100644 inmates/demos/riscv/tiny-demo.c
 create mode 100644 inmates/lib/riscv/Makefile.lib
 create mode 100644 inmates/lib/riscv/header.S
 create mode 100644 inmates/lib/riscv/include/inmate.h
 create mode 100644 inmates/lib/riscv/inmate.lds.S
 create mode 100644 inmates/lib/riscv/printk.c
 create mode 100644 inmates/lib/riscv/setup.c
 create mode 100644 inmates/lib/riscv/uart.c

diff --git a/.gitignore b/.gitignore
index 245733cb..80224289 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,6 +20,7 @@ include/jailhouse/config.h
 hypervisor/hypervisor.lds
 inmates/lib/arm/inmate.lds
 inmates/lib/arm64/inmate.lds
+inmates/lib/riscv/inmate.lds
 pyjailhouse/pci_defs.py
 tools/demos/cache-timings
 tools/demos/ivshmem-demo
diff --git a/inmates/demos/riscv/Makefile b/inmates/demos/riscv/Makefile
index e69de29b..2f0bac84 100644
--- a/inmates/demos/riscv/Makefile
+++ b/inmates/demos/riscv/Makefile
@@ -0,0 +1,19 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013, 2014
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+include $(INMATES_LIB)/Makefile.lib
+
+INMATES := tiny-demo.bin
+
+tiny-demo-y	:= tiny-demo.o
+
+$(eval $(call DECLARE_TARGETS,$(INMATES)))
diff --git a/inmates/demos/riscv/tiny-demo.c b/inmates/demos/riscv/tiny-demo.c
new file mode 100644
index 00000000..e4af2642
--- /dev/null
+++ b/inmates/demos/riscv/tiny-demo.c
@@ -0,0 +1,19 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *  Stefan Huber <stefan.huber@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <inmate.h>
+
+void inmate_main(void)
+{
+	printk("Hello from this tiny cell!\n");
+}
diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index 1c20a0af..8f474264 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -72,6 +72,7 @@
 #define MSIX_CTRL_FMASK		0x4000
 
 #ifndef __ASSEMBLY__
+
 typedef s8 __s8;
 typedef u8 __u8;
 
diff --git a/inmates/lib/riscv/Makefile b/inmates/lib/riscv/Makefile
index e69de29b..9ff57721 100644
--- a/inmates/lib/riscv/Makefile
+++ b/inmates/lib/riscv/Makefile
@@ -0,0 +1,46 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2015, 2016
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# Alternatively, you can use or redistribute this file under the following
+# BSD license:
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+#
+# 1. Redistributions of source code must retain the above copyright
+#    notice, this list of conditions and the following disclaimer.
+#
+# 2. Redistributions in binary form must reproduce the above copyright
+#    notice, this list of conditions and the following disclaimer in the
+#    documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+# THE POSSIBILITY OF SUCH DAMAGE.
+#
+
+include $(INMATES_LIB)/Makefile.lib
+
+always-y := lib.a inmate.lds
+
+lib-y := $(common-objs-y)
+lib-y += header.o printk.o setup.o uart.o
+
+lib-y += ../cmdline.o ../printk.o ../setup.o ../string.o ../uart-8250.o
diff --git a/inmates/lib/riscv/Makefile.lib b/inmates/lib/riscv/Makefile.lib
new file mode 100644
index 00000000..9a87d8ff
--- /dev/null
+++ b/inmates/lib/riscv/Makefile.lib
@@ -0,0 +1,64 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013, 2014
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# Alternatively, you can use or redistribute this file under the following
+# BSD license:
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+#
+# 1. Redistributions of source code must retain the above copyright
+#    notice, this list of conditions and the following disclaimer.
+#
+# 2. Redistributions in binary form must reproduce the above copyright
+#    notice, this list of conditions and the following disclaimer in the
+#    documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+# THE POSSIBILITY OF SUCH DAMAGE.
+#
+
+include $(ALWAYS_COMPAT_MK)
+
+-include $(GEN_CONFIG_MK)
+
+#KBUILD_CFLAGS += -m64 -mno-red-zone
+LINUXINCLUDE += -I$(INMATES_LIB)/include
+
+define DECLARE_TARGETS =
+ _TARGETS = $(1)
+ always-y := $$(_TARGETS)
+ # $(NAME-y) NAME-linked.o NAME.bin
+ targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
+            $$(_TARGETS:.bin=-linked.o) $$(_TARGETS)
+endef
+
+# prevent deleting intermediate files which would cause rebuilds
+.SECONDARY: $(addprefix $(obj)/,$(targets))
+
+# obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
+.SECONDEXPANSION:
+$(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
+		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a) FORCE
+	$(call if_changed,ld)
+
+$(obj)/%.bin: $(obj)/%-linked.o FORCE
+	$(call if_changed,objcopy)
diff --git a/inmates/lib/riscv/header.S b/inmates/lib/riscv/header.S
new file mode 100644
index 00000000..3a12f51f
--- /dev/null
+++ b/inmates/lib/riscv/header.S
@@ -0,0 +1,44 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+.section ".boot", "ax"
+
+	.globl __reset_entry
+__reset_entry:
+	la	sp, __stack_top
+	j	c_entry
diff --git a/inmates/lib/riscv/include/inmate.h b/inmates/lib/riscv/include/inmate.h
new file mode 100644
index 00000000..dac9f146
--- /dev/null
+++ b/inmates/lib/riscv/include/inmate.h
@@ -0,0 +1,157 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#ifndef _JAILHOUSE_INMATE_H
+#define _JAILHOUSE_INMATE_H
+
+#define __stringify_1(x...)	#x
+#define __stringify(x...)	__stringify_1(x)
+
+#define COMM_REGION_BASE	0x100000
+
+#define PAGE_SIZE		(4 * 1024ULL)
+
+typedef signed char s8;
+typedef unsigned char u8;
+
+typedef signed short s16;
+typedef unsigned short u16;
+
+typedef signed int s32;
+typedef unsigned int u32;
+
+typedef signed long long s64;
+typedef unsigned long long u64;
+
+#define SR_SIE	0x00000002UL
+
+#define csr_read(csr)                                           \
+({                                                              \
+	register unsigned long __v;                             \
+	__asm__ __volatile__ ("csrr %0, " __stringify(csr)      \
+			      : "=r" (__v) :                    \
+			      : "memory");                      \
+	__v;                                                    \
+})
+
+#define csr_write(csr, val)                                     \
+({                                                              \
+	unsigned long __v = (unsigned long)(val);               \
+	__asm__ __volatile__ ("csrw " __stringify(csr) ", %0"   \
+			      : : "rK" (__v)                    \
+			      : "memory");                      \
+})
+
+#define csr_clear(csr, val)                                     \
+({                                                              \
+	unsigned long __v = (unsigned long)(val);               \
+	__asm__ __volatile__ ("csrc " __stringify(csr) ", %0"   \
+			      : : "rK" (__v)                    \
+			      : "memory");                      \
+})
+
+#define csr_set(csr, val)                                       \
+({                                                              \
+	unsigned long __v = (unsigned long)(val);               \
+	__asm__ __volatile__ ("csrs " __stringify(csr) ", %0"   \
+			      : : "rK" (__v)                    \
+			      : "memory");                      \
+})
+
+static inline void disable_irqs(void)
+{
+	csr_clear(sstatus, SR_SIE);
+}
+
+static inline void cpu_relax(void)
+{
+	int dummy;
+
+	asm volatile ("div %0, %0, zero" : "=r"(dummy));
+	asm volatile ("" ::: "memory");
+}
+
+static inline void __attribute__((noreturn)) halt(void)
+{
+	while (1)
+		asm volatile ("wfi" : : : "memory");
+}
+
+static inline u8 mmio_read8(void *address)
+{
+	return *(volatile u8 *)address;
+}
+
+static inline u16 mmio_read16(void *address)
+{
+	return *(volatile u16 *)address;
+}
+
+static inline u32 mmio_read32(void *address)
+{
+	return *(volatile u32 *)address;
+}
+
+static inline u64 mmio_read64(void *address)
+{
+	return *(volatile u64 *)address;
+}
+
+static inline void mmio_write8(void *address, u8 value)
+{
+	*(volatile u8 *)address = value;
+}
+
+static inline void mmio_write16(void *address, u16 value)
+{
+	*(volatile u16 *)address = value;
+}
+
+static inline void mmio_write32(void *address, u32 value)
+{
+	*(volatile u32 *)address = value;
+}
+
+static inline void mmio_write64(void *address, u64 value)
+{
+	*(volatile u64 *)address = value;
+}
+
+#include <inmate_common.h>
+
+#endif /* !_JAILHOUSE_INMATE_H */
diff --git a/inmates/lib/riscv/inmate.lds.S b/inmates/lib/riscv/inmate.lds.S
new file mode 100644
index 00000000..cb6e7a76
--- /dev/null
+++ b/inmates/lib/riscv/inmate.lds.S
@@ -0,0 +1,74 @@
+/*
+ * Jailhouse RISC-V support
+ *
+ * Copyright (C) 2022 OTH Regensburg
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <inmate_common.h>
+
+SECTIONS {
+	. = CONFIG_INMATE_BASE;
+	.boot		: { *(.boot) }
+
+	. = CONFIG_INMATE_BASE + 0x100;
+	.cmdline	: {
+		*(.cmdline)
+		BYTE(0); /* empty string in case no buffer is provided */
+	}
+
+	bss_start = .;
+	.bss		: {
+		*(.bss)
+	}
+
+	. = ALIGN(4);
+	.text		: {
+		*(.text)
+	}
+
+	.rodata		: {
+		*(.rodata)
+	}
+
+	.data		: {
+		*(.data)
+	}
+
+	. = ALIGN(4096);
+	. = . + 0x1000;
+	__stack_top = .;
+}
+
+ENTRY(__reset_entry)
diff --git a/inmates/lib/riscv/printk.c b/inmates/lib/riscv/printk.c
new file mode 100644
index 00000000..5eb31537
--- /dev/null
+++ b/inmates/lib/riscv/printk.c
@@ -0,0 +1,61 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <inmate.h>
+#include <uart.h>
+
+static void reg_out_mmio8(struct uart_chip *chip, unsigned int reg, u32 value)
+{
+	mmio_write8(chip->base + reg, value);
+}
+
+static u32 reg_in_mmio8(struct uart_chip *chip, unsigned int reg)
+{
+	return mmio_read8(chip->base + reg);
+}
+
+void arch_console_init(struct uart_chip *chip)
+{
+	struct jailhouse_console *console = &comm_region->console;
+
+	if (cmdline_parse_bool("con-regdist-1",
+	    CON_USES_REGDIST_1(console->flags))) {
+		chip->reg_out = reg_out_mmio8;
+		chip->reg_in = reg_in_mmio8;
+	}
+}
diff --git a/inmates/lib/riscv/setup.c b/inmates/lib/riscv/setup.c
new file mode 100644
index 00000000..705c5630
--- /dev/null
+++ b/inmates/lib/riscv/setup.c
@@ -0,0 +1,43 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2012
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <inmate.h>
+
+void arch_init_early(void)
+{
+}
diff --git a/inmates/lib/riscv/uart.c b/inmates/lib/riscv/uart.c
new file mode 100644
index 00000000..4c394dee
--- /dev/null
+++ b/inmates/lib/riscv/uart.c
@@ -0,0 +1,47 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2018-2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <inmate.h>
+#include <uart.h>
+
+DECLARE_UART(8250);
+
+struct uart_chip *uart_array[] = {
+	&UART_OPS_NAME(8250),
+	NULL
+};
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-34-ralf.ramsauer%40oth-regensburg.de.
