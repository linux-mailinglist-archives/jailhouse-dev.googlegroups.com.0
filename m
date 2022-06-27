Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBM7B42KQMGQE2J3YK4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D812055BA03
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:24 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id e10-20020a19674a000000b0047f8d95f43csf4721929lfj.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336564; cv=pass;
        d=google.com; s=arc-20160816;
        b=hsQWUiodgPKopiYsZK5g1zMDqkuWhtNGNul2S2rh9NMtcCbkqpEXXtXjFKM7lkomjc
         4E/ohmTGnWvpLoAfnsaaF/syDwmr4h89P89qMXsF2E9bwswThVsvC2l3xhwfa3Bk3+QT
         a3FjC05TBnpMN9a34LSG3L7JeluSLjps7HAW6/A5rBq/xpt4inSNqTCwkYRVHyd77oPb
         euIIhfNFhLD1reNVB+NoySXPyYfQR9L+YeY3t8qPAjjbinudoX0ZGqSAZNpfZ9xKg04k
         CnaBy9Xzy0VpL/ymn/lAk+EmYMbsIQ/L/T8J8zjx2N05AR54gbXJOTDxliwTpWxRaxW2
         +IsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=O6FI92Xje7LH11fvMnc2Yuu/cA9gLXuIfe+VAKAAfmc=;
        b=u+sXt2ylZXM4tAXENs1JuLc2JLFS9e02NoI8VwTTiwuJDKQ2Vm/FcFOYgk4yUpZ9ih
         6SVCFKns/btgTlFV1xDFBkLcPajC7Tsa/lL9x6MCQ5zpJo6uVJzW0qhI24G63vBzOu4c
         75dxW/z2jI6Up+Vy9ZcfhtJpwW1CzgAqRxPw08ROgg3lajK3z9ferFd2aSC2iKmM4sZj
         Qoh5gB/2X/ehHZy0k1cqIgqWlU7BZ3XfvqDEahTkFGWQSr9MExFXd+Y6SL+RsMCrfUHK
         qHcAF9IPhAopj5fQOvRuol/SCFfPb5B9nFryHXjyn/f1WV9dz1z7PsDqal6FTI76/Gh6
         fRNg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=lVUMegMv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O6FI92Xje7LH11fvMnc2Yuu/cA9gLXuIfe+VAKAAfmc=;
        b=sZcAYiHn0gwXieiSdEtOPhsKoT3mS/+G4UlqD9THUahFYBjos377QI5uDui1TFlGbP
         GsbI2Cn0Pn5BhmWky3EsVXIkV/YS+TB3WZaylrNlh+vL33NsUUHSy2jy3qTrTz0SH4s0
         GXptWbn2x0uuaeiJm4r1FOKh0slxleRw+oaGd7WMmvsxDDAlIra4c3r2KBMFgMTE1Caq
         p6BIwiEtf6TNcs3UU3Dew8uyFzb4WpRM9ubB5bl7DHBoynmw88v4k+ExuqLpTqMbOGdU
         0o/I2Er3DeB0w2bVy0A9A+LKJ3YJjbRf+itHoCcVG2afxJBxm9hXwSH5spzPqN5KYeMC
         oQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O6FI92Xje7LH11fvMnc2Yuu/cA9gLXuIfe+VAKAAfmc=;
        b=syEdWJcoX4K5Knqwa7CnOGKNNDEMojYZiEyLQA2TnKM4ildvtqbYmd8IgaiC6nZnyb
         DwH0QhTkkGqZcnjri/wNul81y+bzLnZjYn/Equ6dezJdens2rA6bTF67nAoZ4shNJHQb
         V4Q+fq5t6gCAxEfRTw0TowmW73cG///Ew3j/eSpl+NG1oX39GJ/DnSbHkzZnoRbiiNa9
         gplGwp6TxNaYpUV0IZPpXZuq1Gxm8vpPRUWWGM/l+unIiZPZqIPR8IX1MwcPzkElfaVg
         j+GmDiJcJICQ6TTBWTJXCRQogYSFwUb5umxk0z4J2+jouU4ZtglX79Gk3hEKlf50CjA/
         wjOQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9tcrl++CEVRdnSWLw8DJb7xQnpFypk9fgFD6yjnCqAlDrKQ2h6
	rl3jZf4GJ80bNGEN86w7EKg=
X-Google-Smtp-Source: AGRyM1vKKsTxadrhGYj0XIg0RJTfKl/zBG2ApNd5PaK0ijLQxDi1HbjjKKRXO/cdm6BK27wVUKIS9A==
X-Received: by 2002:a05:6512:793:b0:47f:82d0:fadb with SMTP id x19-20020a056512079300b0047f82d0fadbmr8536272lfr.545.1656336564317;
        Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls213967lfb.1.gmail; Mon, 27 Jun 2022
 06:29:22 -0700 (PDT)
X-Received: by 2002:a05:6512:10c1:b0:477:cdcf:2f9d with SMTP id k1-20020a05651210c100b00477cdcf2f9dmr8196133lfg.203.1656336562690;
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336562; cv=none;
        d=google.com; s=arc-20160816;
        b=h0/HAvtJNCuAacWbIDSUSYJceTsC1zApuiPzOQgimU7jOiuaTZm0w+FtGjhP1Kwk5Z
         YZhhaXAFEJdJOk7q44PDuwlwV53S57ljx/V0twENpBY7NMvBe5d8PPg2w7M49btt3MBh
         rdH2tWafuovdFA9G9nGWLY/oMbMycvrc0/AGUbdfYWIwItPihC4Halw+RV6mIHYecE9Y
         7jAHuK5p0oxr3k7fufFFC7+SAsV5hQ0InV4+7zXAMV38P3kwqsMHqTxxCWVgiwNf7YLm
         FxqEumn4RXHcl4D9i+Pux8PCs1o+Ni4fLzZyXpXyfLtJWKbW7BP7nWUMi8Z2dE+AhSJI
         c78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=feSIkk5aowVI9Ek2DqFatLO1fgPKyAw1F9MlcNDlN9k=;
        b=bnThSm2QXNFZpwN0obgB0ZoxnrfTh7dIzuyc3xeujbrOsO9Yq3/2dsRjunY6BnRjt9
         KFGeClYz+y8BDl7p6Y64slBFZZsV5I5nZb95raLEEZi5s4R0zPOjXgLWlAtfvQj2wCm8
         Tfabu+dJwHTkOBAtmFV9CBjmSm1QUcyC9+hLf2iiFDdIRyMQwhyfZk8VNumlgUcQXoxs
         PzmjNAcCAIj/RZ5p9j9KoyXWqPVBUYTgF27LQ75DgGhlGXnV1Y5uvp3jKTemUVoqaR54
         JrLZKojgz0viltUgpeivELB2mgH36wtArMN4bQEEV7w9MB6ubueHmC+zaChpXwcYSIx4
         T8Fg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=lVUMegMv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id bd10-20020a05651c168a00b0025a72c1807dsi426790ljb.2.2022.06.27.06.29.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVB0mHNzxxR;
	Mon, 27 Jun 2022 15:29:22 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:21 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 30/42] riscv: inmates: implement tiny-demo RISC-V
Date: Mon, 27 Jun 2022 15:28:53 +0200
Message-ID: <20220627132905.4338-31-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=lVUMegMv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-31-ralf.ramsauer%40oth-regensburg.de.
