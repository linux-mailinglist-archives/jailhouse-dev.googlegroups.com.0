Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNHB42KQMGQEM6YNP6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 322DF55BA05
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:25 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id e8-20020ac24e08000000b0047fad5770d2sf4729842lfr.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336564; cv=pass;
        d=google.com; s=arc-20160816;
        b=o6AtgmjugzmVeeYOQSzqOCRpy4V8AUQovxM8rsJKKz3w58YMbZf2mNUiXXA+lRLB3M
         iAyaKM1iLUzvmepnIul8POP4lRrR6aNxMt7ik7642xSMxFei7OwfVo5F1N3BolGRriJV
         kncwvEi6ACdlR6gYmA5pIDuipw+MKcca3zYL6LpB3Gs3elD9wHRNzgDWhyZZ2+OhUSBT
         DH1Nbt6KhJrPUItFW8/4EQ+HH0IF0m4MGU+SX4zcH5ivPEH4bfqxrl2WsobB6L2WjyXX
         SLnltVX7bxgi9jdq11e+9u1BEIsyyhDWf3FEeBNJ51pRV+a6XChA+84IGhwEY06FbXUT
         WgyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=alfLzaSHZCwYXTtTJ50utL9LBmSzamQztnn0muyD378=;
        b=b0kbLOGoWWYQjFK+oPTbnjCi055P6aYGUoohkw43W9Vc3Nw921P+OgkQ4JXALeNyjQ
         oCCkU9YAhjj0xKJr2tAhgTvi/CkKFoN8YvlonAGP0nvsNTLvnO7FtxBhT4tmGryTIJXx
         k1fWWlxzzShXMunAIH5BNOYd9AuxiRGasN/V4lkdUf3swejzekcaVMe5831u7noDcylI
         4yzcyASVuyb9DTqPm8RoF4PEh80XlBMb0sVD2tMezzUMNE8XaymXbDSyoIV7KOBSDUfO
         p0Jf27jEg7wTsR5woYgkKNf1V8u9YTg5xQ81j1Uxcp++bVkXjFeMUFuQSl7UUsAjXfzm
         sLQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=eMOosxV1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=alfLzaSHZCwYXTtTJ50utL9LBmSzamQztnn0muyD378=;
        b=H0oOsXez85qefBXzwKl2FugJ48iqCZJ1exFjFL5rj26Jb/s/LUFDAdYEdO1Y665HW7
         BpGcqWJSYvk2mh8omVt++buycmVFwrsoc3zsSz1vyYtVEEs2foLEqtNlKh+bmCo31kxZ
         Q3YRmW2aM8pIU1TKdnOP4nShaNkvVJbVB9wIKKhsjPRUU9gf0j6qhLPjdcBFkJ/2oLJ3
         zW3jvWnj1zys4iLP/qNUnAYrZG9OKiPEwH9u7BiyYxcRAOJWaRwFDUrtQwLrvMBEMfn7
         Lm1YD9N6yXfezAyHzgTCiVucguaa5flsVTt7LH5EMF/4pTigHAtZMeRBeWpRVIfaCrEv
         6wuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=alfLzaSHZCwYXTtTJ50utL9LBmSzamQztnn0muyD378=;
        b=keTL0Ef9g4m2jkZ1L5FRoL77FHyt9oCDEPmedkAaI29/MQRH06+ELbeR7rGRcT+F5y
         Wn35UugZ3TIdYS+4r8zGTZbNkpuFrW/LdOMApi/VLQn/dSXboR4tqN3Wub6EHZqsnnCn
         RuCMgCIWOPRPZAd+sBndXPh1PEgWVMBI5dT9Nd3ZQsKuwT12yRKT0LZ0T0QB9vgSUTcQ
         xfpH2DsiXkt2W4xVDZ6Hkre+WafwE9dntcGDzoOEpmt19c5RExPfveKlsjTyK8ytZgsf
         iiMdMNsH/j1AGW+/uOZDuE8gffa+JLGUKlYarqy8OJ2mpZ7LRY/VaK6/j5gGAF0TwcxH
         jdSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8WSSu/Fb9mtArubHyspe2WeegwZNSMy2v3/Nhkx65+Y4S6yBt1
	zUwKXVj44iS0k5IebJ3+Xv4=
X-Google-Smtp-Source: AGRyM1v0MyeIgaLSB7JlykcA6Ts1rbGhMPomC3IDUMfeV4CvzSsYIlJu4e2XH7d8osye8opxq/gTOw==
X-Received: by 2002:a05:6512:1053:b0:47f:915d:b14f with SMTP id c19-20020a056512105300b0047f915db14fmr3956693lfb.661.1656336564777;
        Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f16:b0:449:f5bf:6f6a with SMTP id
 y22-20020a0565123f1600b00449f5bf6f6als214348lfa.2.gmail; Mon, 27 Jun 2022
 06:29:23 -0700 (PDT)
X-Received: by 2002:a05:6512:2289:b0:481:1d4f:ac9d with SMTP id f9-20020a056512228900b004811d4fac9dmr2400127lfu.510.1656336563248;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336563; cv=none;
        d=google.com; s=arc-20160816;
        b=Hb074LUwiKiJXAFl6w9ehEYwDjrWp7tOFKqzQUWk77fyKIrcyH/Ukb/Xqv1P/souo6
         P95Fu69+Ad/a0DPLr+QKrOH6lft/NUOzOPlJ7C/+bUPn403cWTxKgcbTbafAgK0Ui+BC
         uZ+EqVpljHeViLP1oHe0KOzUfANrITzEW8EOs66q+WL7XSSVrzuFTJi83vzM/6km57LI
         t6EGsmkgcml0quW3dlgGowG1Zuu7pmvNtCC5xYmE/FjgBePBWXI+PyfG+JfGWCZdy8Y7
         OgaLprhYdIbN0LIUGlFFKzCp/UuQ0S4pev4jIkhDww21z4vXRAg/WX8/M+e/mEeCe6vw
         VI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=N/ZD5CCIqkbLAj+RyMVa6FiRVCRr+oqLqOBoSYyI6H4=;
        b=0wgERJQg4Sztrs1mwXxOP4tm9QHaLcnU/fQj+NyZ9LNVsT/Xj73HhWrNRAX1UI9iWA
         BlTbTsA7TvuO1f7OwaATBH2s1h3xyHm5Zn9kRnRhtOekJgX2ZG0dRY5ltf7m4sNWXJB3
         Jv9hpqqdQuIAvmfyzIzQmLLhgFOpxSRhfBydQ0pQ8K1OcgAhPa3XRcW+H8//y3UmQ1Lq
         eFYZkFcgYV0ya++ONpJvsijNsBJQqru9VKh9X+noKJzfno+1naXo/loXq1yb7Sbj5dea
         jR5mLZxRv4xnynR9sKWQslji2P1u0BnDXiI2apUAFR/hHk6jT/EEz1cvW6SZ9IgMhhvF
         g9bQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=eMOosxV1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id k10-20020ac24f0a000000b0047ad98bddbasi537980lfr.0.2022.06.27.06.29.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVB4sr8zxwx;
	Mon, 27 Jun 2022 15:29:22 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:22 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 33/42] riscv: inmates: implement Linux Loader
Date: Mon, 27 Jun 2022 15:28:56 +0200
Message-ID: <20220627132905.4338-34-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=eMOosxV1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

The boot protocol is simple:
 - a0 hold the hart id
 - a1 hold the DTB

That's it.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/tools/riscv/Makefile       | 19 +++++++++++++++++++
 inmates/tools/riscv/linux-loader.c | 25 +++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 inmates/tools/riscv/linux-loader.c

diff --git a/inmates/tools/riscv/Makefile b/inmates/tools/riscv/Makefile
index e69de29b..4a722777 100644
--- a/inmates/tools/riscv/Makefile
+++ b/inmates/tools/riscv/Makefile
@@ -0,0 +1,19 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013-2015
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
+INMATES := linux-loader.bin
+
+linux-loader-y := linux-loader.o
+
+$(eval $(call DECLARE_TARGETS,$(INMATES)))
diff --git a/inmates/tools/riscv/linux-loader.c b/inmates/tools/riscv/linux-loader.c
new file mode 100644
index 00000000..1434cb0a
--- /dev/null
+++ b/inmates/tools/riscv/linux-loader.c
@@ -0,0 +1,25 @@
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
+	void (*entry)(u64 hartid, u64 dtb);
+	unsigned long dtb;
+
+	entry = (void *)cmdline_parse_int("kernel", 0);
+	dtb = cmdline_parse_int("dtb", 0);
+
+	entry(hart_id, dtb);
+}
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-34-ralf.ramsauer%40oth-regensburg.de.
