Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB26SUH5QKGQEGDR2R2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id C6811271E59
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 10:50:52 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id g7sf2292308lfh.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 01:50:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600678252; cv=pass;
        d=google.com; s=arc-20160816;
        b=XBHqwb8OsxrQuddZ4sYW3dYtonG/P/xmR5TI/VnA3A3XC68bXc8k0hM9ofVmx4uBrg
         RewJtduP9vHY+6DZwTx1yl5VNjyEYuai4uIXpUsjromelOdseMj8Rnt/Ywcd99jr3hWF
         xPlLWYKWJPsNqcLjGbLaU95cWznZR9rqZImr4r4it9/KG1DweM+HpymEeMIR7NnGLaQC
         3EPYq2vJCTZGsaJizt3s/PzJ9mt4hPTzkqhlhN7bj65tyZI8lFnxlGq5BF1khxRfX1dV
         qfiJmwHnHT0OgiPV6XkKFJqBA63H6DZMZ0DGS25V1HTGzgYyNcF/hnO2d+Uvp+Kr1vV1
         SQAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=Muck2yLx7Qa980rkXnbcLZLLMjfWUJe/PEE6eC2wsj0=;
        b=rHAZQMYE6MG6QQwhj97kkMYcsSbmPpA2hDZkBu9X0UDuwBLDPfZiaM9w61aImxNLrI
         /PgSWuZs7tyxokRXFP8CuHZgKUn1nDWeQLdvAEL3CdCk9LYgVZTYO9O4/ojdtIF49W1G
         A55MrEBS2+5Lmbcjm8TS9XiJmhh4cO6axe8e1tfl+E5FdrFh9U3dcdMVHufOJjSf3pBX
         KO1ksygWw4Lfm8bVCWZu2bmGH5a8Jb7wy/AN7IFB0/BV69VOgaLTiyIc2MyT3XiejJbU
         Wy9D3z0mQAzrIybTaACHJYjMXc72Zi4kqYub/eORjSzXCiYTn3TKiJJTg8FQZNODLqOH
         dhhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Muck2yLx7Qa980rkXnbcLZLLMjfWUJe/PEE6eC2wsj0=;
        b=lAbs1rnyoeaPEnig+HNyept0xH7pxVc4L8EKTjyWRANmHup1B2LK3/HExCHJi76TiN
         QU87JU/MkGiKPOdgObrpwkE6ZocctLIeFfg6auO5AhP0Do1J51Al1YIGWyuiZtylc+iy
         83Nzbmnz4iG/XtWJZV7Rr6oOmwGGoE6dluS902G9qk2vWQ/pb+P3fptfjZZd8wXMArr/
         C68WIRKDI5WWLA0C3RHxXtcGM3tkj0Y4vL9DqDh92dBvi0Y6wzyOfHDX2Ztro1XZGawT
         z7lH1o0v4zrjufC4DA1rBH6uY2g6wrgFcThwvVWc4mIixmQliDiu7UDWbsNuXuLRighB
         2HDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Muck2yLx7Qa980rkXnbcLZLLMjfWUJe/PEE6eC2wsj0=;
        b=X/WP9BgzkAcPWumD735ErGdVAOJByck78KwDsPlJ4gh/r9uZ5Ku+ZdxmoFKifDNewp
         QX9GpAUnZUIkD5RNzTzN/MOQhxX6a0IU4E27mZ3odoaBAbIyVP/789V+aEoz+yC6dVk7
         XMaRid6ED7BK+aCSoseV+9fv/oDrzFvn9Z3nrjqxC5b6AH0lZyce+8g9ArUwzZNoxWMd
         TqFa2lwPNAWmZnIJFAVsPZc2SEG6nvz/q4tYkLUhrF782LtrPjk2U+lWNfXBWdA0gITj
         u2FQoBWzq8Hm1c9/oX82ZdFjrsUKao+uRixgo6XFK11WFFjVHvuuIs9KF6HpDEC0+Z5I
         QzVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533dAeVuALLBR+IO4HEhQdV4YEYYjiPqiHCn4xKoTiRMzWhymD5A
	309Lx297IIgfnhlbPdYtCKI=
X-Google-Smtp-Source: ABdhPJxsahlo+YJ/LomncQaeeoHJPjuDyRnMpIQLSEUiKGRFzRylG04EFe5rlesVBcA4yS4Hdjac8A==
X-Received: by 2002:a05:6512:32b6:: with SMTP id q22mr4075427lfe.160.1600678252349;
        Mon, 21 Sep 2020 01:50:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:555:: with SMTP id q21ls1546804ljp.3.gmail; Mon, 21
 Sep 2020 01:50:51 -0700 (PDT)
X-Received: by 2002:a2e:9602:: with SMTP id v2mr14963000ljh.455.1600678251016;
        Mon, 21 Sep 2020 01:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600678251; cv=none;
        d=google.com; s=arc-20160816;
        b=RKmy5D3y26VpOsJWstXoSRzgwzrnvIPZDzCyv7oKVqdH78M0PaF8EzmPeugaYzx3+J
         39A4ERQyMt1Q+PqvEEbeYLX1NYZ2OyD7WwEV073ae+FupE5XJon0DoWo14SfJ0OplsAL
         u7J6XI5+GWvqL9ksV5xJq3krPt2PCnTwxtlIeHTCJriR52oFc4Wl1j56FdacR1E5gnnN
         mPfL7GcN/DFeA9qsDuDlInAuS47xogoTLM0tfKKRhi3OJQyo2h+kkeBaad/Qt36WTeZm
         Az9Img+JFMXMRK2jEZQwoe5y+jDbBt98F3wen4U3jk842Jv1K+Iksxc/xmcmmWaXcQj5
         BLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=JE9hgGzdocNzxDw2wsnqCOcMZFpGJYg9pRQ9TR2MEEQ=;
        b=TJ9wwHJfOT0N0dFX9zL7/1Un8G2aEd4GgBaZFntpiNREzL//8SY66hys4gSL+UiMiY
         SXfqgMadbMozH+e2Bg4c/zubQ6viC8g3zIH3+Hcz2rOOm2ugSseo3f6qSE/ohrHZzaag
         SBxlqWBkv7V22RzXZEZnPnCHagACGuA4t8186IP0tafyJCdvEriYYCHFyfBdUzHBvonr
         himLOJXZ+Wawsf9YP9fdcbgv40WqyGxXKkDEXPqJiRxAAEtiRytfMLbxs2t7ssaRP1LU
         JwGBYZEIW4Fgsi1l2+awC90yFgfIQL1wCGf7PIqLK09bCIcDQ3tE07A1X6wvqrkGxMGC
         Q4BQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id t80si233156lff.9.2020.09.21.01.50.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 01:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 08L8oowo001121
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Sep 2020 10:50:50 +0200
Received: from [167.87.4.147] ([167.87.4.147])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08L8onuL024858;
	Mon, 21 Sep 2020 10:50:49 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] arm/arm64: Factor out common hypercall stubs
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <743298f9-b9bb-4ebc-9211-ad809aa94502@siemens.com>
Date: Mon, 21 Sep 2020 10:50:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Just the argument types differ. Factoring that out allows to move all
stub definitions to the common header.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arch/arm-common/asm/jailhouse_hypercall.h | 58 +++++++++++++++++
 include/arch/arm/asm/jailhouse_hypercall.h    | 63 +------------------
 include/arch/arm64/asm/jailhouse_hypercall.h  | 63 +------------------
 3 files changed, 64 insertions(+), 120 deletions(-)

diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h b/include/arch/arm-common/asm/jailhouse_hypercall.h
index 6f2e0b30..3988fd79 100644
--- a/include/arch/arm-common/asm/jailhouse_hypercall.h
+++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
@@ -57,4 +57,62 @@ struct jailhouse_comm_region {
 	__u32 vpci_irq_base;
 } __attribute__((packed));
 
+static inline __jh_arg jailhouse_call(__jh_arg num)
+{
+	register __jh_arg num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
+
+	asm volatile(
+		JAILHOUSE_CALL_INS
+		: "+r" (num_result)
+		: : "memory", JAILHOUSE_CALL_ARG1, JAILHOUSE_CALL_ARG2,
+		    JAILHOUSE_CALL_CLOBBERED);
+	return num_result;
+}
+
+static inline __jh_arg jailhouse_call_arg1(__jh_arg num, __jh_arg arg1)
+{
+	register __jh_arg num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
+	register __jh_arg __arg1 asm(JAILHOUSE_CALL_ARG1) = arg1;
+
+	asm volatile(
+		JAILHOUSE_CALL_INS
+		: "+r" (num_result), "+r" (__arg1)
+		: : "memory", JAILHOUSE_CALL_ARG2, JAILHOUSE_CALL_CLOBBERED);
+	return num_result;
+}
+
+static inline __jh_arg jailhouse_call_arg2(__jh_arg num, __jh_arg arg1,
+					   __jh_arg arg2)
+{
+	register __jh_arg num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
+	register __jh_arg __arg1 asm(JAILHOUSE_CALL_ARG1) = arg1;
+	register __jh_arg __arg2 asm(JAILHOUSE_CALL_ARG2) = arg2;
+
+	asm volatile(
+		JAILHOUSE_CALL_INS
+		: "+r" (num_result), "+r" (__arg1), "+r" (__arg2)
+		: : "memory", JAILHOUSE_CALL_CLOBBERED);
+	return num_result;
+}
+
+static inline void
+jailhouse_send_msg_to_cell(struct jailhouse_comm_region *comm_region,
+			   __jh_arg msg)
+{
+	comm_region->reply_from_cell = JAILHOUSE_MSG_NONE;
+	/* ensure reply was cleared before sending new message */
+	asm volatile("dmb ishst" : : : "memory");
+	comm_region->msg_to_cell = msg;
+}
+
+static inline void
+jailhouse_send_reply_from_cell(struct jailhouse_comm_region *comm_region,
+			       __jh_arg reply)
+{
+	comm_region->msg_to_cell = JAILHOUSE_MSG_NONE;
+	/* ensure message was cleared before sending reply */
+	asm volatile("dmb ishst" : : : "memory");
+	comm_region->reply_from_cell = reply;
+}
+
 #endif /* !__ASSEMBLY__ */
diff --git a/include/arch/arm/asm/jailhouse_hypercall.h b/include/arch/arm/asm/jailhouse_hypercall.h
index 4a16ab19..7cd6bc63 100644
--- a/include/arch/arm/asm/jailhouse_hypercall.h
+++ b/include/arch/arm/asm/jailhouse_hypercall.h
@@ -36,8 +36,6 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#include "../arm-common/asm/jailhouse_hypercall.h"
-
 #define JAILHOUSE_CALL_INS		".arch_extension virt\n\t" \
 					"hvc #0x4a48"
 #define JAILHOUSE_CALL_NUM_RESULT	"r0"
@@ -50,62 +48,7 @@
 #define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 6
 
 #ifndef __ASSEMBLY__
+typedef __u32 __jh_arg;
+#endif
 
-static inline __u32 jailhouse_call(__u32 num)
-{
-	register __u32 num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
-
-	asm volatile(
-		JAILHOUSE_CALL_INS
-		: "+r" (num_result)
-		: : "memory", JAILHOUSE_CALL_ARG1, JAILHOUSE_CALL_ARG2,
-		    JAILHOUSE_CALL_CLOBBERED);
-	return num_result;
-}
-
-static inline __u32 jailhouse_call_arg1(__u32 num, __u32 arg1)
-{
-	register __u32 num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
-	register __u32 __arg1 asm(JAILHOUSE_CALL_ARG1) = arg1;
-
-	asm volatile(
-		JAILHOUSE_CALL_INS
-		: "+r" (num_result), "+r" (__arg1)
-		: : "memory", JAILHOUSE_CALL_ARG2, JAILHOUSE_CALL_CLOBBERED);
-	return num_result;
-}
-
-static inline __u32 jailhouse_call_arg2(__u32 num, __u32 arg1, __u32 arg2)
-{
-	register __u32 num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
-	register __u32 __arg1 asm(JAILHOUSE_CALL_ARG1) = arg1;
-	register __u32 __arg2 asm(JAILHOUSE_CALL_ARG2) = arg2;
-
-	asm volatile(
-		JAILHOUSE_CALL_INS
-		: "+r" (num_result), "+r" (__arg1), "+r" (__arg2)
-		: : "memory", JAILHOUSE_CALL_CLOBBERED);
-	return num_result;
-}
-
-static inline void
-jailhouse_send_msg_to_cell(struct jailhouse_comm_region *comm_region,
-			   __u32 msg)
-{
-	comm_region->reply_from_cell = JAILHOUSE_MSG_NONE;
-	/* ensure reply was cleared before sending new message */
-	asm volatile("dmb ishst" : : : "memory");
-	comm_region->msg_to_cell = msg;
-}
-
-static inline void
-jailhouse_send_reply_from_cell(struct jailhouse_comm_region *comm_region,
-			       __u32 reply)
-{
-	comm_region->msg_to_cell = JAILHOUSE_MSG_NONE;
-	/* ensure message was cleared before sending reply */
-	asm volatile("dmb ishst" : : : "memory");
-	comm_region->reply_from_cell = reply;
-}
-
-#endif /* !__ASSEMBLY__ */
+#include "../arm-common/asm/jailhouse_hypercall.h"
diff --git a/include/arch/arm64/asm/jailhouse_hypercall.h b/include/arch/arm64/asm/jailhouse_hypercall.h
index 7f30a0cd..9c94930f 100644
--- a/include/arch/arm64/asm/jailhouse_hypercall.h
+++ b/include/arch/arm64/asm/jailhouse_hypercall.h
@@ -36,8 +36,6 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#include "../arm-common/asm/jailhouse_hypercall.h"
-
 #define JAILHOUSE_CALL_INS		"hvc #0x4a48"
 #define JAILHOUSE_CALL_NUM_RESULT	"x0"
 #define JAILHOUSE_CALL_ARG1		"x1"
@@ -48,62 +46,7 @@
 #define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 5
 
 #ifndef __ASSEMBLY__
+typedef __u64 __jh_arg;
+#endif
 
-static inline __u64 jailhouse_call(__u64 num)
-{
-	register __u64 num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
-
-	asm volatile(
-		JAILHOUSE_CALL_INS
-		: "+r" (num_result)
-		: : "memory", JAILHOUSE_CALL_ARG1, JAILHOUSE_CALL_ARG2,
-		    JAILHOUSE_CALL_CLOBBERED);
-	return num_result;
-}
-
-static inline __u64 jailhouse_call_arg1(__u64 num, __u64 arg1)
-{
-	register __u64 num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
-	register __u64 __arg1 asm(JAILHOUSE_CALL_ARG1) = arg1;
-
-	asm volatile(
-		JAILHOUSE_CALL_INS
-		: "+r" (num_result), "+r" (__arg1)
-		: : "memory", JAILHOUSE_CALL_ARG2, JAILHOUSE_CALL_CLOBBERED);
-	return num_result;
-}
-
-static inline __u64 jailhouse_call_arg2(__u64 num, __u64 arg1, __u64 arg2)
-{
-	register __u64 num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
-	register __u64 __arg1 asm(JAILHOUSE_CALL_ARG1) = arg1;
-	register __u64 __arg2 asm(JAILHOUSE_CALL_ARG2) = arg2;
-
-	asm volatile(
-		JAILHOUSE_CALL_INS
-		: "+r" (num_result), "+r" (__arg1), "+r" (__arg2)
-		: : "memory", JAILHOUSE_CALL_CLOBBERED);
-	return num_result;
-}
-
-static inline void
-jailhouse_send_msg_to_cell(struct jailhouse_comm_region *comm_region,
-			   __u64 msg)
-{
-	comm_region->reply_from_cell = JAILHOUSE_MSG_NONE;
-	/* ensure reply was cleared before sending new message */
-	asm volatile("dmb ishst" : : : "memory");
-	comm_region->msg_to_cell = msg;
-}
-
-static inline void
-jailhouse_send_reply_from_cell(struct jailhouse_comm_region *comm_region,
-			       __u64 reply)
-{
-	comm_region->msg_to_cell = JAILHOUSE_MSG_NONE;
-	/* ensure message was cleared before sending reply */
-	asm volatile("dmb ishst" : : : "memory");
-	comm_region->reply_from_cell = reply;
-}
-
-#endif /* !__ASSEMBLY__ */
+#include "../arm-common/asm/jailhouse_hypercall.h"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/743298f9-b9bb-4ebc-9211-ad809aa94502%40siemens.com.
