Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWV5T6RQMGQENKOBQFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A88770A0EC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:03 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id 4fb4d7f45d1cf-506a7b4f141sf4478739a12.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528862; cv=pass;
        d=google.com; s=arc-20160816;
        b=zrWlf86qifLQQ6sFE9TdOBX2ciLTzHiNjwBd+Fcz/Rh7M72X6KUcYmJGPEe7oCF6w3
         jAHvquvzHAx03sOu4EAJVvFP5BmXLXWkFt2LCW1YnzQtLcLfPB7UE3jdt6dZhhp9dPf2
         3oRMFfP2MZP47rhIsV44Hh5DDj/0GVaBcUW77wZCJJfvuvwbDPvKVC0udLqctXEJ5XmP
         LdvrQDCeJEAp2/MvZdzR5ArvR45PQOPHu/YNZl5HApm1+faHh3W2fRVag2Bz7QIx26qK
         BG/TGFS1JQQMROfYLIwQRCnVh3HY6M3BaclzFPIgBlZpRG+G+3yPz4xWk+RQz8KXydSe
         6o6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=vSq+43cYgYzhsiQMgG1IjSjb+W7OrZnIL7Joegeu68s=;
        b=n5OHFmtRkLVSMokwmjhx30DHHL2PmT2ChSlbLPv7QU37a6rpWoqyPzp19bHqb6ax5n
         vgb5vWqE4Y2tcgS+6FWq/ZJSEsattusATQvjc6NCMRVw+26qaGgC3mphNHkIwiFoVagA
         FU5I5zA0qT9r4qL9RPEBo1Tv+wzHJShRCa3HVJig6S+e7ve13oXQEnHKV1NrL4H5idmJ
         JSwtQ4wzM96OiUZML/QoGI0K5BNBtVhHHXPafEY2t59ZqNxGCjlQQZkF12KhpRwpMJph
         Cg0Tmvbb06sV51gBy5Gmvd0mRZNfHfk1iPD+Uk+MChw0o+roOyEA3Bv0HIWNMlgT/PfI
         9Wmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528862; x=1687120862;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSq+43cYgYzhsiQMgG1IjSjb+W7OrZnIL7Joegeu68s=;
        b=Z4M90E95OY6NqRuXgB6HPIsGjVxOj+52ggZciOyYnYRqPRBdaunfzsS+3StHcjU5m9
         FbWq704v3/Zsanz7c8F1GnS5q5m8CXWHNm3/uohvgl/Bdm9//lbtYKyTvR4PcPbAXaxj
         bm1WJnFHsG1WZyWRgYQi3xiYLX2wHYHOpA/nX/rqbwgHl1x0gV480C469a9YGWkLczRW
         4esiJOOb3pc7vsPXTHkhHSekXNo5qIxgqevLiy8h4DqbFFCejZvggZccRNkd6Zak44KS
         sEkt8AfTI3qD6NFlPX5yFqvXZaWo9f3cGE5I6t5yf4EWMYFM037jUlnsb7kbfVrER3G3
         61wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528862; x=1687120862;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSq+43cYgYzhsiQMgG1IjSjb+W7OrZnIL7Joegeu68s=;
        b=kAAj+K54yl5Elff7USoZe0J6nTxbw1//5hu60eZhDDptXcfw4Id+LY8y7YXL8xLDhg
         n2rSlseWLK3QTV8HAcu52zc5vdCNjGFpMom2fK+7F/ZiHEosSWYehtgTV61O9eJn0S9n
         VRtT0ebDkLd2HgzIfORV1ohHl4ThBvnk0Ql375ae/CtIDWcHvSJQUnowb8yAgBD6JCL3
         tj0PNOblTcxxtMAETr5/Mb5IbLClg6BC7CKV84dKhX1Ka6AvdeGCXdgQhcjLOacOd2lr
         3hP9oiK3fut/U8kLYNCFmu+gc3bOKPAEWdZ7XZIHvn2pXhVv2BszjaleqsxVq6D93fo4
         3BLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwjdAB0LBxO1qbrJGQT3dUWLES/ENPfs+0OnUkzchDtkgvMI9lT
	0//2OQjFXp7GPITfjI29gJI=
X-Google-Smtp-Source: ACHHUZ4u2z63mDhM+9BDGuUfqFEWvlKWCTkJgm1DFHsMbhvFPaF+Foyxp37TeHtGdbmZNjbiIdybxg==
X-Received: by 2002:a17:907:2bcb:b0:96a:7839:c71c with SMTP id gv11-20020a1709072bcb00b0096a7839c71cmr1041612ejc.2.1684528862504;
        Fri, 19 May 2023 13:41:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d894:0:b0:50b:c6d7:3964 with SMTP id u20-20020aa7d894000000b0050bc6d73964ls6177428edq.0.-pod-prod-09-eu;
 Fri, 19 May 2023 13:40:57 -0700 (PDT)
X-Received: by 2002:aa7:da16:0:b0:510:f3a6:d50 with SMTP id r22-20020aa7da16000000b00510f3a60d50mr2306631eds.36.1684528857620;
        Fri, 19 May 2023 13:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528857; cv=none;
        d=google.com; s=arc-20160816;
        b=JVYk+K2Ufn4YAqgPGswrH8dO5zfn3ytK+Q8AjT6wGL2Drn3WwTXk5ycTrYz7TVEV1C
         dJIL5U7jaa2wFfsCYK0pHZZLts1WXRSPwZJeR4yrtbjDBeK2dKcNUe2Yi39s/ds0sNt3
         eSMH78YU5/o++RdEeq90G83U7en+oJ8xAWTJEIeiukmWzgTiiuAQHwjPxKJhCcEDsHlD
         hqppEz66fDB44J5OvYLqCzXnj44e6qzBa0tWHwEv6Et/Sf8bVeQImmuFduKVg9jYt0Rp
         9ftkaqxzmFVRxnahWDT+iOef5O2o4tSZFoO9dU2WZcUSdf2uDmyhWd6r01awec1ZUzB9
         RdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=KI/LTwbYLW6/xDD3JhtREAR3q0ffOFYGgLgtzsdPATQ=;
        b=XC7nW90avsjl+kvi67orskHBQCalsVg2cBYAmzeOFJZt4RE9eP+X3rBox4xMm6dtAN
         BWNJ4hLiDOnhl3SFk4wq2DwKosMbwRWhzl6Bx9iG4XA0v+yc4FzAANkSa5FnRAIX46kg
         7HNT82OcWZ2OcJsqhHQomsn0Tp5II1TtRjmV0+GQJu7PS+Wh5zpv2IPKIMvq3dv1ir8d
         v48yvp/VjQbrPaN30dInxxX40ltOz2MOUQfKBDEBj8rQCCcg2/NLA+OqyX6sFAzjPMHd
         UUs/fvh9F7ZVp0ESVfrzAd+RpzUcIVYAAPtiZ6UEPyRnarFc6cML++zDH38gPpf0fp4v
         iQMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id g1-20020a056402320100b0050bd0abf2b4si20974eda.3.2023.05.19.13.40.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdh63S4zxwN;
	Fri, 19 May 2023 22:40:56 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Stefan Huber <stefan.huber@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 52/73] inmates: riscv: implement tiny-demo RISC-V
Date: Fri, 19 May 2023 22:40:12 +0200
Message-Id: <20230519204033.643200-53-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_CONSEQUENCES_A 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-53-ralf.ramsauer%40oth-regensburg.de.
