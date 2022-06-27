Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBLXB42KQMGQEWOHLNFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6BB55B9E9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:19 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id m20-20020a05600c4f5400b003a03aad6bdfsf3485814wmq.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336559; cv=pass;
        d=google.com; s=arc-20160816;
        b=UCiTqkHz2n2OhJHqze8tos74s5C8CGJf/zrydXNr77jt+DoY8OjHyKWt0ZaiFuiLne
         Q97vr6nsgjO3uqfna898qhj9DsaI5kXZf8kY+uNfjJNC5+XUg0EZgeriwmmer2tF4NZr
         Qdx1Wfq4VSlH/owAjg/PpQBsyxBTlSOqQ9CtUNtY9PWdpUHgGSFlZfJR8GUFWzWM5LSv
         Llbv28uKVBBGIaT2gU0xVh4vOboOGanAfMkVNMQxRjbO1td9QcQDZC2EcPVo3AWSp8s9
         byIXwZDZfw7b+6Hw/eBg4FG3wN5nb3SYbxbNqmcCHagZq+RyIlSmOv8f8z6/OrBgU9IQ
         xAdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=JTKua6KcL8OfJhSac55K+jqkHL3ECaxlrudM+SEzPqg=;
        b=BvQ4uM99wevr2iBSrj+qXmYE2bFoDqeNeqNNoShqnf6q63NaCsT/Fr+zZ/zS8geDYy
         sHcNmcCkoEHFzQWoAX3avmaIYTUEbGzt/ZNt4v6CBV/nU51CZUKEZRqLrbyPWkrV0ili
         jlRZn42ThY2CSK2V3k1cbDxP2ON6r4C0mkgSR4oCtzVmy3NXRBAjuqtuqfuKmEq51fho
         V2a5yJhlATzAKrEXaX5Z1SOQsIJA23WjrELj9IvmD4VBz4YfQ5ZXF3UlkaTbZtirYxt0
         HfvEpi89xm3/AWrYJykOHsSVTO4X8IZrfZAYXF85ZfwBV8ALaiyPfMObYxZdJlZdH3wg
         9rcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=KPsH+1hB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JTKua6KcL8OfJhSac55K+jqkHL3ECaxlrudM+SEzPqg=;
        b=cmbenANgZ6x1ExqL/WtW9QAGtf38HY1vtKZ3LshaYJGuygzatXif7uCo8vIejClfBC
         6ywycCx8jOIJK/qU5tRgveiRoeSQxdVAPDzM9Mn0MUSXkPoEyqLNxOuR7vRCZFTT98MQ
         2QuWqmatUOqBuv2XwLVG/PPI5FGm5QQkYo8lHfcWXPY58dxkP1GKkODbjtJSWZzop/4x
         makpiwTBydbGYfzaFH26gsgmytsqsDMyfwnWMEvHt4ltZF7R76xdJpjmGYejQsrdckXX
         dgRykRFOQ4mrdvCp1xTtFq34zZpx2PPovInDnpLXkKssbYvC1zPP4mX6QkVZ3Eh/G6g9
         dt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JTKua6KcL8OfJhSac55K+jqkHL3ECaxlrudM+SEzPqg=;
        b=38MJyTfUaAbEChDo4N0n1kc6ycdJwj1+ppBGQKb/8RS/lae+1TZ4LjMIJt0YnkMuaQ
         89pghyQ78uY7kTUfDh0CmV0CjBzptc07baecHYDupTkXiROUCwczYmPbBX0AzR8YDWog
         pmYaaffvDYhdzG7M22ejBEHkD95OYpRehFcv8QoWR6iDVpJB9n0dywmaJOcVWEk6BNRg
         eAynJgwrzNU9bd1hxOKfFE27j2Iqju0pVOfiLv6gJxNaguiGoTQeh3eVr6qf4pWnC7Jq
         vr6AA7CTN5VTdTawLAm90iy/LHlh2RDbVAPlBmSqGZbCNxyulqsxVOLKhPSP+ZKTeDNe
         6Qmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/IspOj7CLK1W+yj6bIaP9tuKOFe4sVspBI6b762d9rG/IROxup
	ShdfOJy0l5Tjede7sDcWSWw=
X-Google-Smtp-Source: AGRyM1tTILSJI44H9dQ+aaPo6ouLCKhpslrdwSTW6rdqssIzxTSJOs7mrA6F9sAp/9CVBCX6ENVciA==
X-Received: by 2002:a5d:47c9:0:b0:20f:e7d1:4616 with SMTP id o9-20020a5d47c9000000b0020fe7d14616mr12103070wrc.542.1656336559260;
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb04:0:b0:21b:b3cc:1640 with SMTP id s4-20020adfeb04000000b0021bb3cc1640ls13083236wrn.1.gmail;
 Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
X-Received: by 2002:a05:6000:1f08:b0:21b:ae8f:4f0a with SMTP id bv8-20020a0560001f0800b0021bae8f4f0amr12805861wrb.456.1656336557861;
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336557; cv=none;
        d=google.com; s=arc-20160816;
        b=c/Vtj9Dlnqmp4plnMX9woR5N+injHbtZV5YL+JbHqovG7NjSykBRdvSrqaDZbE2/xS
         +S6UYIHl3ReON47j1WXUKUz9BK5yUnbmO03KlEO1eRtL+aU3X+b0BpbDAOvtNCWbbnQV
         6CADIQcMtP4SDU96aTQjlh12W3wqLu3N4uNMuwY9imJw39970YKPvGyMjk++CmV7lKI1
         AYytAeuGZhIuuXCEmNwAv4RO/2eO2wq9Hvz+NJLw6txTq1B4Iokc2fzKEpOT1sLrLMJJ
         //P3o4Z6K7ob5RRbNap8yvjXqzUiSU3/YGg01pt8fEQoYZqyiAhDXGL8ojvqcdxYssqx
         1Q3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MsVXjMROoilVDC8JF6gojKRgZcOjoOMHKY5hy/QqH/I=;
        b=vRzjXZWtfq3zfpSD3enWy4AailoNtHx3XFni15sZp050/jV4zYVoR6UeVNbYRGZQqh
         rgRhyrOxnAbKh6VmnHj3eOfbW9Wd/1wbJZ+RovnHzv3RcZ7RP5aPUFJmSJokHAla6vaZ
         vU1iBT+goPzIZJ4L4KsO1Nav7n9QqUcJUyPzA5+9C+p0yv62I04vsLT7BbVKCvgzAi8U
         mWQzWIkNJYxDNf1J35V4MJZbZoJCLWBEXEZeCo6qB+3PO72Cvr59qavT+kszGdlHQuyj
         eaIKHLPIhGYW/BDBBOgcPLBT1jfxf05vVn/ub6kL3F26qPhguT5bkJYPm3/U7t/GHw1z
         otAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=KPsH+1hB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id f17-20020a5d58f1000000b002102a7531cesi342600wrd.2.2022.06.27.06.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV53nhFzy0y;
	Mon, 27 Jun 2022 15:29:17 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:17 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 05/42] core: riscv: introduce asm/bitops.h
Date: Mon, 27 Jun 2022 15:28:28 +0200
Message-ID: <20220627132905.4338-6-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=KPsH+1hB;
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/bitops.h | 54 ++++++++++++++++++----
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/bitops.h b/hypervisor/arch/riscv/include/asm/bitops.h
index 4b7e31b1..f62f382a 100644
--- a/hypervisor/arch/riscv/include/asm/bitops.h
+++ b/hypervisor/arch/riscv/include/asm/bitops.h
@@ -2,9 +2,11 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -13,25 +15,61 @@
 #ifndef _JAILHOUSE_ASM_BITOPS_H
 #define _JAILHOUSE_ASM_BITOPS_H
 
+/*
+ * TBD: Introduce generic arch-independent bitops? This routine is shared with
+ * arm-common
+ */
 static inline __attribute__((always_inline)) int
 test_bit(unsigned int nr, const volatile unsigned long *addr)
 {
-	return 0;
+	return ((1UL << (nr % BITS_PER_LONG)) &
+		(addr[nr / BITS_PER_LONG])) != 0;
 }
 
-static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
+static inline long unsigned atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
-	return 0;
+	unsigned long res, mask;
+
+	mask = 1UL << (nr % BITS_PER_LONG);
+	asm volatile("amoor.w.aqrl %0, %2, %1"
+		     : "=r"(res), "+A"(addr[nr / BITS_PER_LONG])
+		     : "r" (mask)
+		     : "memory");
+
+	return (res & mask) != 0;
 }
 
-static inline unsigned long ffzl(unsigned long word)
+/*
+ * note: the RISC-V Bit Manipulation standard extension will undoubtedly
+ * have more performant implementations of these routines
+ * Returns the position of the least significant 1, MSB=31, LSB=0
+ * CAUTION: in contrast to POSIX ffs(), LSB = 0
+ */
+static inline unsigned long ffsl(unsigned long word)
 {
-	return 0;
+	register int result;
+
+	if (!word)
+		return BITS_PER_LONG;
+	result = BITS_PER_LONG - 1;
+
+	word = (word - 1) ^ word;
+	/* word now contains 0s followed by n 1s, if
+	n - 1 was the least significant set bit */
+
+	while (0 <= (long) word) {
+		word <<= 1;
+		--result;
+	}
+	return result;
 }
 
-static inline unsigned long ffsl(unsigned long word)
+/* Returns the position of the least significant 0, MSB=31, LSB=0
+ * CAUTION: in contrast to the POSIX ffs(), LSB = 0
+ */
+static inline unsigned long ffzl (register unsigned long word)
 {
-	return 0;
+	return ffsl(~word);
 }
 
 #endif /* !_JAILHOUSE_ASM_BITOPS_H */
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-6-ralf.ramsauer%40oth-regensburg.de.
