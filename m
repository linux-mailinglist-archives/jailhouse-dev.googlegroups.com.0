Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUMS3D5AKGQEGFW2VZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314025F7BE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:20:02 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id s8sf5525707wrb.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:20:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599474002; cv=pass;
        d=google.com; s=arc-20160816;
        b=ckGSF+f3uJ+XsyKmeFLvHWjNP5D7bJC06a+rXT7RVHsCJIkDFxByemxFtgERoqOPdn
         PQAbKKbOdSB7RuClQYQUenGjJT2ktNvSbUcZjXkD2/h9mhvm05zu9ZHpVwIArIejUpBA
         4OE5iQGWL5NiERlC8y1/a6KPqZHuI/3rZYNJwlTuF+lFTx8oekyKPZudQ1+lPXoOYxsj
         NBfGEXYyiiqW22K5xdFHuCQGhHvqSQi23SfD85xBBerJgrUS4C8DnJMZdcPevVoGEDkH
         2IS+phn9NloMhBdt98ET0bOowAjw9wpW0KDczB0+tKtmvpePb+324tRE4wfI9pxceHE6
         OGOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=js9gUAWLOBvfdJjLQLReCuiRIOWCZxiE3RLSSTnrNwY=;
        b=axsvBnWDrTJZOIju2duC1VoIxrRsaRuiVf0k8PIMdaG+ZtQuUWZRpG1SLiZSYdfTov
         7Rvf5K/+X6e6i2l7CWdWkIl8UVdKoVbeE/XKKbwpPVKv7C2JzpkUTL3in/xwIRBfExR8
         0tTuAl/6dJHiPi1C4PE/gcDHL5xfm21E36cGpXl4/KnJVsudgeM7t4VNT4PPGk9G6wfR
         QRbdr96KkkzJ6NhfvGjJP3304roONZ6Nfp1O9ldNPTbUGEQLsWXMkceXC9ZvDOIqr0G+
         MKt4M5Kd9QljRaNvDYE7Ztgng/71M3GlxP7O0YSw22Xp7EsRw+SD0DEDYJqMMgcoIUy1
         LajA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=js9gUAWLOBvfdJjLQLReCuiRIOWCZxiE3RLSSTnrNwY=;
        b=DH7RyUwxoF1+jDZWXG05+Pkwl0M/pLcReb8Bx5AX3lKETZWS6kYMH2zR+okX9nRP0z
         pFgIXwIR2eahQE4tB5K/XxTw2R3FvMzmD+RdZHo4p9P+xEntaO58zkYejb6Z95T7cOgW
         bgvTYJRH9fibJhfnfWAqyF/jFhl5KaZ7czpHJSmvFQNqOz+piChbVmFzAP95qu7tX9M0
         NKmV49mqOAxaIVU6CdED3AEUoApGuTjk3hKUGdAw4us3IhtuqdVGRmYiIkjogrWaIdlZ
         5rzLcAaHOR5BzmzDuHNy4mTM/xLaXngOaTDoNdWC+9P4/hQCB965/5dBc0v5pgX3Oeca
         Ffhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=js9gUAWLOBvfdJjLQLReCuiRIOWCZxiE3RLSSTnrNwY=;
        b=BgoiIG7jaojXLs6OrUQqRaO7wOIPAuC1B3szDtN1xfuWCuTI6FZ/Mrr1IOI0IVqWEH
         63kCfUrstBlCg2wLD0ygHLpaLYeiy26CZu2B/47NBPfMVq/aYtwOjXWghJgzyXI/1NO1
         MFvAgv3hAKVqXas4EGdbiVZG2f7q9sDyGvQZWpF0F4JdJ8omyZvtS3xbFKwBkqNar9Xz
         ztKxPyUACccpCWeVpXbkRQcuOJThRbnsrWFdvaKnfFMU0pHHhenMAO3n7XtP23ejGikq
         zBf9sbIFAwhGn7QqN7Z3IK4dGyfD0KEfIEhF0U4lFGAiptHACp3+0152JyIay2fAvEzk
         tWuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5320QD0MBM9lRN/hriUfLPC5eNUx6zjJMrjmiQGeo3kTvIWEkik9
	2AsypjoM0b92VrxfrTM567k=
X-Google-Smtp-Source: ABdhPJxbHe31ICUvtRFAkpm4Qa9LEyTzy8orHoTmNlxABsHkVuu+nhsXOFYXVP/z/pMh1DVSjlOBEg==
X-Received: by 2002:adf:f548:: with SMTP id j8mr1456649wrp.114.1599474001888;
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a58a:: with SMTP id o132ls7897940wme.3.gmail; Mon, 07
 Sep 2020 03:20:01 -0700 (PDT)
X-Received: by 2002:a7b:c241:: with SMTP id b1mr5765922wmj.98.1599474001031;
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474001; cv=none;
        d=google.com; s=arc-20160816;
        b=jwn+eOLR3O6WgPwWE3PoIVrAGGjHTIUmqfA0z7zEAl+gAw8ywzgpR5xNLHR2SKZEG6
         GPp3M4wR3CDa38W6FNqtrY2dVxW9fZQxQ5sAp1nRY4PEkWU4Gu/tmshs7Ham80BzOTkG
         GRw6Tadt4MAXrWtff07/wrSrwyKv5140l+uqNeNHAEkO8iVitQZBt6Cfin6z5EDLV5/B
         a4kLsjPYm9zYWO3JurKDC6MnaBYZsokAcNUCbBmL3A9n8Ae9d+HOfgMnoRFtRb0yg4i/
         GpHPf7repM46bUvcp/4SUzqCyc0UGJpOv/mC6jE0Zi2VE3HxA9FSQOkEY+rjVTt1+qbN
         MLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=tzw4iA7YyTSXdHBx/Hoj8HLbxWVx6agNzgtZIPLuzG4=;
        b=vTNc/krkZK+VUYEzZoFBiN0WNAQoT4H72TG6N955874bsV7R6hW+pY51iPci11vYtF
         ReHtH9lloQpUk7YZ8SU2gne6JYUxamryfhjSc0NyL7gyDofbWwqP4kFwdKfnywurOn4d
         foEs7sO6dl9kdKy2hkHX8wt6QekrG6PstvRhwmk0+ffjWrS06CNUfBKWAQqkHnZOOgre
         HJRWO9cFqKwmlN55+H1hS8QMPJZOHuwsjBPmCJbUaxOFEZONN59PGSzxDyFAg/WY3Chf
         W3u76dnLpngtGVG2uW48hzRWd9A2Y+t/kXITaiFIIS0PNM4HTiNGTKnKq0l4vf50Y4FC
         seug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f134si824809wme.4.2020.09.07.03.20.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 087AK0Ku008205
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:00 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087AJx2D024503
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:00 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/8] driver: Adjust to kernel 5.8 and 5.9
Date: Mon,  7 Sep 2020 12:19:53 +0200
Message-Id: <bf1953f94603d8222e545d531221f93ed640f97e.1599473999.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599473999.git.jan.kiszka@siemens.com>
References: <cover.1599473999.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Several things changed and require tuning:

 - __get_vm_area is gone, switch to __get_vm_area_caller which now
   requires another kernel patch to export it (pointless to try
   RESOLVE_EXTERNAL_SYMBOL since 5.7)

 - cr4_init_shadow was hidden from modules; set/clear VMXE directly
   instead so that the shadow is aligned to the real state; no action
   needed on AMD as EFER is carrying SVME

 - include asm/apic.h explicitly for lapic_timer_period

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/main.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/driver/main.c b/driver/main.c
index ec302639..edb1e4d4 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -42,6 +42,7 @@
 #endif
 #ifdef CONFIG_X86
 #include <asm/msr.h>
+#include <asm/apic.h>
 #endif
 
 #include "cell.h"
@@ -199,6 +200,12 @@ static long get_max_cpus(u32 cpu_set_size,
 	return -EINVAL;
 }
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,8,0)
+#define __get_vm_area(size, flags, start, end)			\
+	__get_vm_area_caller(size, flags, start, end,		\
+			     __builtin_return_address(0))
+#endif
+
 void *jailhouse_ioremap(phys_addr_t phys, unsigned long virt,
 			unsigned long size)
 {
@@ -250,7 +257,13 @@ static void enter_hypervisor(void *info)
 
 #if defined(CONFIG_X86) && LINUX_VERSION_CODE >= KERNEL_VERSION(4,0,0)
 	/* on Intel, VMXE is now on - update the shadow */
-	cr4_init_shadow();
+	if (boot_cpu_has(X86_FEATURE_VMX)) {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0)
+		cr4_set_bits_irqsoff(X86_CR4_VMXE);
+#else
+		cr4_set_bits(X86_CR4_VMXE);
+#endif
+	}
 #endif
 
 	atomic_inc(&call_done);
@@ -653,7 +666,13 @@ static void leave_hypervisor(void *info)
 
 #if defined(CONFIG_X86) && LINUX_VERSION_CODE >= KERNEL_VERSION(4,0,0)
 	/* on Intel, VMXE is now off - update the shadow */
-	cr4_init_shadow();
+	if (boot_cpu_has(X86_FEATURE_VMX)) {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0)
+		cr4_clear_bits_irqsoff(X86_CR4_VMXE);
+#else
+		cr4_clear_bits(X86_CR4_VMXE);
+#endif
+	}
 #endif
 
 	atomic_inc(&call_done);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bf1953f94603d8222e545d531221f93ed640f97e.1599473999.git.jan.kiszka%40siemens.com.
