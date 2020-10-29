Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVVP5P6AKGQE5V2C4PY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F64C29EEDF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 15:55:19 +0100 (CET)
Received: by mail-ej1-x63d.google.com with SMTP id ha4sf1257012ejb.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 07:55:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603983319; cv=pass;
        d=google.com; s=arc-20160816;
        b=XdDklK9vOthvsHvs95KTuJ8WWVnkiv05au0ltQLE/og95a5k8a7Sc3ByP8nawxRzuC
         AVY2qLGeROed+AdAwWsZPPhF/tX3mFEkrQSXveITJwrq4viYSiHWmEAWaAZ0NIvJuX7l
         qBHM8zYAwpnuOyCP3Okim+0+/h1MZbpl81BVBDNNFqqf5NFRoLVZ6n5Y598dOQSQgaei
         GRIKym1fdZBciYrlnS++G0C2Udf+W2pVlka3AsKl14+X4617TlFIYQb7TehJqxMgnlkh
         ICQH094eNtl4yvZ+R9Fnuu9NQ8nV3miXTKdIbVKctxZ9PHs2hcMf7z+cw4x3tS7IoZBb
         ct7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=BUXz6WFDi6ISbWV6pgkjlucRt/4X7yK/3xf1j+x3ubQ=;
        b=fjRLzdeBX9NIPGYs5L5JbrpOaRRmsbkmE3VBgEh/LTuB4dnaCp+u0bayANXglyPMAj
         IS8kysUIQcIDXl/OFRaeEsvw38iFV1KydGaLO9YkMmovUA+6ycsk3FdFNqR3MYSGy61q
         128UzY61a6HyI6mNb50D+D+e0kUnma7imEsILBB6o0dsQQnZzA7HQsjIFycp2H63ABxW
         ZbDPg671FgTSxQ8apUT9IPmg8My/YIBAEBf91pSRXqucNquzuAlGt4xb60kJxkZAEtH0
         7Mb+69suet1KLJLEUSBqml6kFiIh2759DS239O6moPTX+2E+GpXRBEH68MCgfOnxtC1F
         VlLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BUXz6WFDi6ISbWV6pgkjlucRt/4X7yK/3xf1j+x3ubQ=;
        b=HHvnwISbmos+ZSQ3hRLclKR0x12l+pwfezad5cUtxRfSbCeiKPzRbRvuupqKty+ymi
         oLo9wvKmVCLeCu4NS+T1UsxMFstXzvTG3bApnEC6tbMoeIzjFwARJkJ97f5IFv7a/yFv
         LBAvmW6Y69SdxArlhGdNFPqZhMrWvaz/4FjJxv07M0ZzFaeCJd35IoryD6M7oE4pgQZu
         HzHLfcWIy6JMypJhT1SCt56oMazc/jRaH97uI8c+kEEZvUC+A9T/r4M8HJdRYsqPUDjY
         YbMLWa0Cb5y82O8/9edSem5Qmel542+zUH03549k/SdTIuiGCzUONv9EZoa7+6zxO60v
         +wFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BUXz6WFDi6ISbWV6pgkjlucRt/4X7yK/3xf1j+x3ubQ=;
        b=bd+MO6CIjHOOPKoklv7/WfhTB5HTXtwW6QfcPmtpVOatwjF3aZLcKErcmeylHSL/T+
         LDkeW5qbU3EdJ1NxDKwjTSkJoKj5U77jbO1ZiCftJR4ig4F1CA3/3jKgrN1Xroh5CbqV
         nIpJPy6IaLORMFBBb9cn1N9HhX2bEAEDIMWu1ukxKe/1qR3rO5SGhRVSBdpiUUcBZRh1
         Fd/CHSkXxop9pYKoGtKQDH2HCc/k5B3qw86KzYihLvFvXXY674xxCucpXnGXoHZJvA6w
         7Q6802g7uJnOlhpxKBnvetKaADj53YVoidvRDyZmNaAP4XhX4u/EughP4P6kL8CoSiVC
         Rp3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530uqsl7ys94Yfr+JkK4BlAwdOSyZoeT3giMWaBvcny1EtHnc8yP
	P2jnfcEivwQ+klCabk/mhyw=
X-Google-Smtp-Source: ABdhPJwfOLapw81ZFqvhVHAKCbXW9MJVknIUXdkzhL73LKRFSbFp1G443jmU2IsLVi3QxGkkAlpsPA==
X-Received: by 2002:aa7:c14a:: with SMTP id r10mr4450550edp.345.1603983319039;
        Thu, 29 Oct 2020 07:55:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:848:: with SMTP id f8ls1688851ejd.4.gmail; Thu, 29
 Oct 2020 07:55:18 -0700 (PDT)
X-Received: by 2002:a17:906:19d1:: with SMTP id h17mr4746581ejd.184.1603983317968;
        Thu, 29 Oct 2020 07:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603983317; cv=none;
        d=google.com; s=arc-20160816;
        b=Pm1tyJ92k3f9gUvz8dGnLqa5NaCmyo33RRIC9ecoZH0COwat4zBy3TV+CEi8aICwaa
         pu/cor3JrJJxKzzs7Tq2+/TNuTW/3IKprD1UV7t3H+1q55j5ZjeCAFUPga0l1F5bXf9D
         c1Yfh8WHFa0btv7zVKiy6qWdWGcaOkZWdnpnonVghTaXdHMsiqEmF8V1mjFLLmVpqzdb
         PIAKCekdQojlyYlpK688/Y/s1y5PFD0AWe3HGtqC9gj8Ouk/V4cxz2eAMn29lQwKhA7H
         10Rfn5M9GxCvqiws8Dc0nGgHiJuQoHmSZwdccrpcXJHK/tbGMPHnH/0knnkYHufXPeiO
         8TdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=o2Eo7SlC43n6rDZKDfvHzW1GM1K1GW7Qw7KGJpJOyJQ=;
        b=L3cTuo1Jg5zZ77pfGb0fLFdR7xcVsgtL1bie9Jo6JI4IIU+cdN3nJtwzLpIUdUJKkV
         WGsgKeTq+JrBwCrBi3reTNJ+beR+F+beog1NfGvX9rMGra8aaNn1enPlCQ6Nyc+SAvvn
         I+qO2bqPWKmxcchegwiY3DwwZMMFOHxMAZOEc7SJN+fr6EP6hR6r0LPREHAHFDfh/PpH
         xArLSrnfUlWgvg+krVfZ+gKfFyKXd39XWFovJIYWQMoc6cJqmFGXnEZ1kBaa5yDG/AP5
         8unyWYtGzUyZ4cA+PiexEKelCteul7mPZ1OhqiAitSyYfw2w7ExmItz2uhTN2dRNbwqP
         EGMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id u13si42443edb.0.2020.10.29.07.55.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 07:55:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from sd6.hs-regensburg.de (unknown [IPv6:2001:638:a01:8061:5c51:6883:5436:5db])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4CMT512q2xzyBM;
	Thu, 29 Oct 2020 15:55:17 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 2/2] inmates: x86: add cache access time test
Date: Thu, 29 Oct 2020 15:55:15 +0100
Message-Id: <20201029145515.386953-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029145515.386953-1-ralf.ramsauer@oth-regensburg.de>
References: <20201029145515.386953-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.10.29.144817, AntiVirus-Engine: 5.77.0, AntiVirus-Data: 2020.10.29.5770001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_TO_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_NO_NAME 0, __TO_REAL_NAMES 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

On x86_64 systems, this test inmate measures the time that is required to read
a value from main memory. Via rdtsc, it measures the CPU cycles that are
required for the access. Access can either happen cached, or uncached. In case
of uncached access, the cache line will be flushed before access.

This tool repeats the measurement for 10e6 times, and outputs the
average cycles that were required for the access. Before accessing the
actual measurement, a dummy test is used to determine the average
overhead of one single measurement.

And that's pretty useful, because this tool gives a lot of insights of
differences between the root and the non-root cell: With tiny effort, we
can also run it on Linux.

If the 'overhead' time differs between root and non-root cell, this can
be an indicator that there might be some timing or speed differences
between the root and non-root cell.

If the 'uncached' or 'cached' average time differs between the non-root
and root cell, it's an indicator that both might have different hardware
configurations / setups.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
since v2:
  - Move host code to tools/demos :-)

since v1:
  - Move host code to tools/

since RFC:
  - move the inmate to demos instead of tests


 .gitignore                  |  1 +
 inmates/demos/x86/Makefile  |  4 +++-
 tools/Makefile              |  9 +++++++--
 tools/demos/cache-timings.c | 29 +++++++++++++++++++++++++++++
 4 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 tools/demos/cache-timings.c

diff --git a/.gitignore b/.gitignore
index 1d8905ab..245733cb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -21,6 +21,7 @@ hypervisor/hypervisor.lds
 inmates/lib/arm/inmate.lds
 inmates/lib/arm64/inmate.lds
 pyjailhouse/pci_defs.py
+tools/demos/cache-timings
 tools/demos/ivshmem-demo
 tools/jailhouse
 tools/jailhouse-gcov-extract
diff --git a/inmates/demos/x86/Makefile b/inmates/demos/x86/Makefile
index f53b739e..47b79869 100644
--- a/inmates/demos/x86/Makefile
+++ b/inmates/demos/x86/Makefile
@@ -13,7 +13,8 @@
 include $(INMATES_LIB)/Makefile.lib
 
 INMATES := tiny-demo.bin apic-demo.bin ioapic-demo.bin 32-bit-demo.bin \
-	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin
+	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin \
+	cache-timings.bin
 
 tiny-demo-y	:= tiny-demo.o
 apic-demo-y	:= apic-demo.o
@@ -22,6 +23,7 @@ pci-demo-y	:= pci-demo.o
 e1000-demo-y	:= e1000-demo.o
 ivshmem-demo-y	:= ../ivshmem-demo.o
 smp-demo-y	:= smp-demo.o
+cache-timings-y := cache-timings.o
 
 $(eval $(call DECLARE_32_BIT,32-bit-demo))
 32-bit-demo-y	:= 32-bit-demo.o
diff --git a/tools/Makefile b/tools/Makefile
index 8cf5df84..62585369 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -35,6 +35,13 @@ KBUILD_CFLAGS += $(call cc-option, -fno-pie)
 KBUILD_CFLAGS += $(call cc-option, -no-pie)
 
 BINARIES := jailhouse demos/ivshmem-demo
+targets += jailhouse.o demos/ivshmem-demo.o
+
+ifeq ($(ARCH),x86)
+BINARIES += demos/cache-timings
+targets += demos/cache-timings.o
+endif # $(ARCH),x86
+
 always-y := $(BINARIES)
 
 HAS_PYTHON_MAKO := \
@@ -104,8 +111,6 @@ define cmd_gen_man
 	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
 endef
 
-targets += jailhouse.o demos/ivshmem-demo.o
-
 $(obj)/%: $(obj)/%.o
 	$(call if_changed,ld)
 
diff --git a/tools/demos/cache-timings.c b/tools/demos/cache-timings.c
new file mode 100644
index 00000000..2c591dab
--- /dev/null
+++ b/tools/demos/cache-timings.c
@@ -0,0 +1,29 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2020
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <stdbool.h>
+#include <stdio.h>
+
+#define printk printf
+
+typedef unsigned int u32;
+typedef unsigned long long u64;
+
+void inmate_main(void);
+
+#include "../inmates/demos/x86/cache-timings-common.c"
+
+int main(void)
+{
+	inmate_main();
+	return 0;
+}
-- 
2.29.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201029145515.386953-2-ralf.ramsauer%40oth-regensburg.de.
