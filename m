Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBVFHZP5QKGQE454GFYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id E74B427BD1C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Sep 2020 08:27:32 +0200 (CEST)
Received: by mail-ej1-x63e.google.com with SMTP id d13sf659228ejz.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 23:27:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601360852; cv=pass;
        d=google.com; s=arc-20160816;
        b=ekaKuVgNlEvJF+bwykQx/8ohnqAep7FreYPhk0pi6FDnRwV8Ss1OW3o0v2LFIn2E48
         iY/1x048CHzCyhH7azhCHxS/IZ7fGMHiw0Ha3O0HBnM6jTdZh+EUJAFe/avG9653qh2V
         8O/8FtXPBFEM71+2SPY4GXl1xXE9Hog9fxN5X3Eniv8O9PYReak4i/kazo8Gl9x58ULN
         XcRnHP32I7U7RPiPfIeUIiOpHXnaUiSWWQeHv8sQBjzjqfzvt6d44/FWw2MCBPhEvIrE
         1XSZxyzTmD968C3s9jGJ41br6WmsJURYP3TXECjnkG2V7sdZaqJqqvr/JSp00z3iro7i
         6Q4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=DkUMn83Ziek00HJ1twGNgc8DdJ84ifrc1EMaFVu25ew=;
        b=qixKfupByjITRw5hK4zsPMcIuvMsILuAJPLlGgdyX8pYVm+4+2K+zW1itLICEyDiuT
         Y+owr4dJhx6BFlsQQbifmjlqsSLxfwuUN3/dl16sAmn3o4MOgE+MgxOiWgB4m2G7klnH
         r9piR2+AbDb/JK2pflEzFw6buIuzBnfUJytTiaAW8gqddb8JHpNBrPUO4j+JthkjmZnX
         9vcB1CAhkSNkM4HTkLESSzjEAQVzmAc5ZJ6/8N7hQmYs/p64g0GdS+1LyY1rLLAQZagz
         E5GIay6OTSe5zPWglC/LnGcSw6JT/CBUR15hTBraFDMfa0dKBv95adIPGhMGfZfJ44Ex
         D80Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="ap/DL0R8";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DkUMn83Ziek00HJ1twGNgc8DdJ84ifrc1EMaFVu25ew=;
        b=P5C1o3KHEMpuoGH9QPXu2OHi3CRcdkOP3zXT/2EaRKMAR7VYQirH9uDKUlWXscCfgV
         2Be8UJnYmsLTVtdfrbieLhVUtFdp0wH/HLuI8m+8iKNUFL2gluSAMckmNQztIryyYFre
         0qeqRhPmLNmaQZ5AFcqS3nyDfjnc407rnpat8MY19SVWdu+DSbVzY3t/1xQyb1jJYuuz
         2aGhNfcO3WUb2Nt78eqGYtF/42tL2NqhcoQJbOgV+w/fnWdEngFJx8CkBuD4f/kR6qE+
         5f9Dyb19YViwzHdeWsoD8fVGXwgeid5U3mC57g4qybeME0d38x5ZplNXuBiueBiJJN2B
         hZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DkUMn83Ziek00HJ1twGNgc8DdJ84ifrc1EMaFVu25ew=;
        b=gW+nky3NWgMVxwz0tjTe9GSTmFffBYWRCJ9hznNl2vJ4o0YDaJvxgsvMfgboPl19nd
         yurZdj3tVh+JsxZhD23WY4SJHpDWpv5+jqh+fmEV87uE36KOG7Tj+w9dS8NZgVtsTtkJ
         2ygIV7Bo9+N4tsaATrsb99Nc5GQO/yYJ0vuxRcrL5lefQKKPmcL3rETa04uF+ic/Zj68
         2B6gBEsn8GvKzW/PPaSDdnWL0wf/2x0jjUa2GlcqXHAz02pgBe72bRy75sgc4eAgbhei
         LSO6hZSV3MNZ424n3kdXQEEwOlhxUyE4lVz+pFDQXkF0/tqcl8snEVwbWQwycpFOmuQy
         ArzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qVPld4qMD+tHl0H1cp+nrq52v8mqSQEZL74IukUvbC7G5R3CR
	XXOhYwlGX3Y8cNxKrLeuskA=
X-Google-Smtp-Source: ABdhPJznuImI/p5YngK//JynRepyb86vEDWJcFS612tZXp2yH9DziiOLOGo/pYc4aSXb2CoiEnu7EQ==
X-Received: by 2002:a05:6402:346:: with SMTP id r6mr1565404edw.301.1601360852681;
        Mon, 28 Sep 2020 23:27:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d40e:: with SMTP id z14ls1560425edq.2.gmail; Mon, 28 Sep
 2020 23:27:31 -0700 (PDT)
X-Received: by 2002:a50:8e58:: with SMTP id 24mr1621098edx.226.1601360851642;
        Mon, 28 Sep 2020 23:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601360851; cv=none;
        d=google.com; s=arc-20160816;
        b=fCoKPJOKB3E30LZ3dxOp2FhUBQ6+VV+xmEjQaTSl1Dl6XH3lPNus4pDgzli2d6yfN3
         D6owuGrV1ppVYCAKXPqF0B3Jfm6SJ7Gzz1Q2A0QiW2ypNX/2yA4KWPCLT+Of+f6b9w+7
         yapGg3y4998ZSBGH3SQNHnhixeCHVTpzkh7bGmA3DCUgd5cA4w+Jzuix0CKIZaVkhXhs
         hr8zSeVH1mb0Xyvr9MpncP9XCTdrZDQydGVmcQnAktZwyH8kEW/RjI117niiIup2zY+g
         JdRNarC8vAsWk+e2f05nyzbVe2SiTNob+U9dUD1UmAtHbLJ5ipYJWb1usg+yzGjep7hx
         p+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=fsXnD7DZzDb+K+mKg6GB26Benu+iJSeUa54tfyZumss=;
        b=D0pHg7TanrVlJwTaC5WjulGBGs4LF4Rxb/vNqdpD/DSO9fZP1ot578AAdBG733+Oqg
         un89hvslPj3n1+hlYGHkUB3SXRlyn9FCJEL/PSKV6Vw8lbjDBYbfnpt/Lhe9Z5LEcqQL
         Jh65tv0Pt1riQU2iUqEk8vIXy1KglbVKwPNk4WMsYrTlnCpMYxOGf/5BMJnHkdLi9aoR
         w0vNMRJMkZywzt1wMve5HFGHGNhTZ1S5dpN1t6Xfs2q854wzlqj4Ndw2xSR0j2NQwo2T
         Q5lTo9sIQ03AOMKjAz0+O7GZa5GJ5qGO8kJzpoi1SH2UMHMgzUKfwzoTOqnG9FmzcMPq
         282A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="ap/DL0R8";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id dk15si122513edb.2.2020.09.28.23.27.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 23:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LjJH1-1kzEx20dWp-00dZED for <jailhouse-dev@googlegroups.com>; Tue, 29 Sep
 2020 08:27:31 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/3] arm-common: Factor out common processor.h parts
Date: Tue, 29 Sep 2020 08:27:06 +0200
Message-Id: <eb8343dfc7e3340a67d8ec735d02ded7ef5a6ead.1601360827.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601360827.git.jan.kiszka@web.de>
References: <cover.1601360827.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:FzLQdKgZKFtDy5owSDMLa2NoUmg4eSTki7YTOdIBaGXPJCn533H
 7TqidnomFESyw7TzkQ0fBY5K3XaOknoSb6n1APSIJC5IFQfqbeQ8rTaauwgLOduRCYTMS9t
 fdVE+M+Vs0ZGrhnD/56YNkrvcSEaN9FbWO/FmiCuCYrNUEjj9KVGup6wEqo3qDesI9SLTtz
 lw83lPBilFoifJ7LCd2Eg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p6fsw9TMqvU=:vK/8vuHZwGV7A+7iHnZ9a0
 pD+D6b2bD8iRlPOyhUM3GC89Gu5Q9lWR9SjXiBmTLFN7wNz3XUS5jb36+OJLt61P0hekmSJQF
 26Rggobt6wF3KMIgMyvADwVhkcCiK7t1CCfJSKmftyzsgivMI6T4dEKoK/GUOXLwCsBio1Cuv
 /62x7UGCouF12vnvRiSKO0toIM33qeU9XIBXgQqjmHYWxjxmAfQZLbT8mvsKEXpfIvn3iqiYN
 pBicx2Wzs92oCTM8nskvBMSjlHas41Qr4kcGJ5DHH4wnftozn2lku9zqZLx3Fk7EnVeCVsPhj
 vrg/tPzZ9agfvBWLEDGtMLJ4NXOkGGDzBAXanzZL4GjLWyW8uh8bwLVXfzwvcVFPLozcvEhA6
 +L8LWxwNTYrW5F232MJG6zUVB6bK5YhxMiaeBUDDJvJwGCoPD2g+K3nWh7jXdEiSOhpBwhBQB
 G5wjqXJmzBesVHVhZ7oABVK3Q4FC5sk1zzvQCTB8pFijXyB6rl0mVvrYTm42/tQ8FebOTXXQ8
 nvURt7zzz4tiO13VX0wpSwezCUsRr+YhVxTScHur3BkU2jJxWG7psHAKFNp92wdKBmtl3GQ/R
 oRyH3Jexehcat1SDKy/ixlH9bvCy993uoJ8CY/9EJLMIXe+kXB1UW0YEVpAcEJcCdHgFfLSdr
 cYND+P50TfafPF+81xooxXzn6q4s99EqQis1LAf0lhkFd6wUXmmQa0ZFfqaBfBQhiMDQfMCAf
 6Ij9ylVz0hz7N0tsFMx6kDNLZ4kp8N7gsCzDMBFE9t2K9acSzPRGAQGnACHt9Li1re5bJiB/7
 K7V9c/thAJI6PwIroCsC/Gwr0BoZ/meEiuiySVmB2zGAZBMPoMonk9qyNWTeS1SOJvonxds3y
 pXvYU6aeff3xcqXpq8xuBpEx/YCY4/92oV3pen5t9mH9IyBNFuoyJTH3tria/zNT/o06xfqtj
 HSO77yuhkISBDuQ7tR9Db9z0Icq0f4cjyGQ48nkI9EQORJ8u70W1dv4o8Rv4Zf6K4YA6vkbNG
 5ApiJgpwvQ0QW6gsxfaqtWYxiY6SWMOK0v0BJ4DD/zANTDpCj9+D5Xc9Y+jp4qN6ZvzTZA4xh
 AM8YMg8rhgqCwx9YeuKZdE7FWQZnuzpq0NnzS5Vxkd16eTm++XpWv3BxCDjuWVhsdCFgMDu18
 ipXVlNJD1c/mY+Ekg8cF/Iy9CNntwmom6DjrYYkYwwS+RhEVMaT+S51Nuivno5dk5NUgfX1JM
 965NAhI2E5uk6ifRXOFV0aCr+RdeQRQZAgwsDwg==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="ap/DL0R8";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

No need to duplicate them in the arm/arm64 specific headers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arch/arm-common/include/asm/processor.h   | 34 +++++++++++++++++++
 hypervisor/arch/arm/include/asm/processor.h   | 31 ++++-------------
 hypervisor/arch/arm64/include/asm/processor.h | 31 ++++-------------
 3 files changed, 48 insertions(+), 48 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/processor.h

diff --git a/hypervisor/arch/arm-common/include/asm/processor.h b/hypervisor/arch/arm-common/include/asm/processor.h
new file mode 100644
index 00000000..710bf197
--- /dev/null
+++ b/hypervisor/arch/arm-common/include/asm/processor.h
@@ -0,0 +1,34 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013-2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#define dmb(domain)	asm volatile("dmb " #domain ::: "memory")
+#define dsb(domain)	asm volatile("dsb " #domain ::: "memory")
+#define isb()		asm volatile("isb")
+
+#ifndef __ASSEMBLY__
+
+static inline void cpu_relax(void)
+{
+	asm volatile("" : : : "memory");
+}
+
+static inline void memory_barrier(void)
+{
+	dmb(ish);
+}
+
+static inline void memory_load_barrier(void)
+{
+	dmb(ish);
+}
+
+#endif /* !__ASSEMBLY__ */
diff --git a/hypervisor/arch/arm/include/asm/processor.h b/hypervisor/arch/arm/include/asm/processor.h
index 79b66f39..cd7c5589 100644
--- a/hypervisor/arch/arm/include/asm/processor.h
+++ b/hypervisor/arch/arm/include/asm/processor.h
@@ -14,9 +14,11 @@
 #define _JAILHOUSE_ASM_PROCESSOR_H

 #include <jailhouse/types.h>
-#include <jailhouse/utils.h>
 #include <asm/sysregs.h>

+/* also include from arm-common */
+#include_next <asm/processor.h>
+
 #define EXIT_REASON_UNDEF	0x1
 #define EXIT_REASON_HVC		0x2
 #define EXIT_REASON_PABT	0x3
@@ -27,6 +29,10 @@

 #define NUM_USR_REGS		14

+#define ARM_PARKING_CODE		\
+	0xe320f003, /* 1: wfi  */	\
+	0xeafffffd, /*    b 1b */
+
 #ifndef __ASSEMBLY__

 union registers {
@@ -37,29 +43,6 @@ union registers {
 	};
 };

-#define ARM_PARKING_CODE		\
-	0xe320f003, /* 1: wfi  */	\
-	0xeafffffd, /*    b 1b */
-
-#define dmb(domain)	asm volatile("dmb " #domain ::: "memory")
-#define dsb(domain)	asm volatile("dsb " #domain ::: "memory")
-#define isb()		asm volatile("isb")
-
-static inline void cpu_relax(void)
-{
-	asm volatile("" : : : "memory");
-}
-
-static inline void memory_barrier(void)
-{
-	dmb(ish);
-}
-
-static inline void memory_load_barrier(void)
-{
-	dmb(ish);
-}
-
 static inline bool is_el2(void)
 {
 	u32 psr;
diff --git a/hypervisor/arch/arm64/include/asm/processor.h b/hypervisor/arch/arm64/include/asm/processor.h
index b52782b7..312214b3 100644
--- a/hypervisor/arch/arm64/include/asm/processor.h
+++ b/hypervisor/arch/arm64/include/asm/processor.h
@@ -14,10 +14,16 @@
 #define _JAILHOUSE_ASM_PROCESSOR_H

 #include <jailhouse/types.h>
-#include <jailhouse/utils.h>
+
+/* also include from arm-common */
+#include_next <asm/processor.h>

 #define NUM_USR_REGS		31

+#define ARM_PARKING_CODE		\
+	0xd503207f, /* 1: wfi  */	\
+	0x17ffffff, /*    b 1b */
+
 #ifndef __ASSEMBLY__

 union registers {
@@ -32,29 +38,6 @@ union registers {
 	};
 };

-#define ARM_PARKING_CODE		\
-	0xd503207f, /* 1: wfi  */	\
-	0x17ffffff, /*    b 1b */
-
-#define dmb(domain)	asm volatile("dmb " #domain "\n" : : : "memory")
-#define dsb(domain)	asm volatile("dsb " #domain "\n" : : : "memory")
-#define isb()		asm volatile("isb\n")
-
-static inline void cpu_relax(void)
-{
-	asm volatile("" : : : "memory");
-}
-
-static inline void memory_barrier(void)
-{
-	dmb(ish);
-}
-
-static inline void memory_load_barrier(void)
-{
-	dmb(ish);
-}
-
 #endif /* !__ASSEMBLY__ */

 #endif /* !_JAILHOUSE_ASM_PROCESSOR_H */
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eb8343dfc7e3340a67d8ec735d02ded7ef5a6ead.1601360827.git.jan.kiszka%40web.de.
