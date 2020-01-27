Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBHMIXTYQKGQEVMQSZWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E514A758
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 16:39:10 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id t3sf6193975wrm.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 07:39:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580139550; cv=pass;
        d=google.com; s=arc-20160816;
        b=LO9xICxcJqHDx8jpkkOeP7NZg5ZTm+oyMNVznxMdfvmnyRx9IeUQIzVih8KKb6e3dX
         nW8LOXYPzwziTWErGqbACeYmP8InyDpB8KsNNsT+tHwbbxac5UqfeHcDgc5OGuddQyiZ
         v1FmTxBHmb7Z8wYFpucfJH4OIYjS0z6QVbjTqMoyEiZDf/mgyojqiXbUTYkKQCEjDbKb
         0ncNJPFZPBYzboXSBAObB3VmczGpB/AHr3BB2lc6WBQo+in76ngWcKvtFQtCkXee1SUl
         78l0/hLgAIuxU6m5kVOd/XmqU03nurW/qyRgzCGjO8XfuIyafrOQtk7If9BRGroVLGvW
         4gkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=pUCQhGsPcRsglBuqrbmjoBqYqeHmo/VSOgUvGrtLK7s=;
        b=l0kusYhSUn8+6GBRMPKqDmY8C4M+meyLJ2kSU+Gn0z0/1fcjlewV+gZ60oWU2UcymU
         63PuCzp70wvc6NFNvHc4hP9Q06oaYsCvrCaryGsmnqU4rz2i4o8t4wrhogs9+eOb1lZO
         NZBRzmrHsULoLoo62BGC+u9Fy76A2oCDKv1MZe9Lwzyvy1XCH46svPXUu4dKrHxvnuAf
         T1GHP0JRAgj9/F+qHQ6t9JS8vrZ4Infhbb+pHMFHAJ280tR5Ax5M4h5uu+l2cF+Wm6vw
         KEnr3dIXbce+N5eCHR41R7oHq+s4GHkHIFjYnbmIEFYn7/bLGJ0ASZk7mEMc9Okb7qs2
         GTkw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=EhFpMzn5;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pUCQhGsPcRsglBuqrbmjoBqYqeHmo/VSOgUvGrtLK7s=;
        b=sjh4L1B+wunqkCOpKEFl0S3eZMaKPnSP574/N7PmXjkfCIFQyIUvHpw+XZ/VdzpgIV
         xL5NGlQkFcKnAb7bqCJlK4Jv/hqX3T0XHf9nFRvZjFxehYahA7hT0v+CkSgMfCUUIGBw
         zIbTKT1QLx63GlXrI3oFvBpskQ3PIDtaa/lDaE2bHdfqykXnY/YIkKRyzVbl/21ImCoc
         jQL86yEwqWIW4Ey2lSz2X7uWKMCyhoi3VBkDZQnvTSn5HnyWU7LEMP4nfqwBBK0Lu9k5
         aab6Zg7IiVrcBgwCRKVZrIe2p5FXqpuAOgfMaeaeeoqmakBOXAfP9mcqikiMkU0naI6k
         0p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pUCQhGsPcRsglBuqrbmjoBqYqeHmo/VSOgUvGrtLK7s=;
        b=QL89JqkycKWw4ZZV81w4XwSjaqBROrjQXXWTKQu8JPtDw7EA180kZjWxU0U32MurKY
         Sjdyiml4qdEJa58VubgJUFM7wwSkfIrf5jYAUGd1UZlZiRbbpbjf0nQZQ0iJ04Jv9tx4
         +24xyHltE0CMog0rGM6M3QVzjOYogAc6W6Atpue3Pb5Wj9XRiBw/0YJxJI1MVcVx8mXT
         +/kRnc8dGJTxwDnoZhblk1CeT0wBiuY4hXOIJBwn7pq6+wAPGAHSPJLSXalLAzgFQqqk
         Ey6Mm37I9LuB1Y5PVBKZid0WenXYOAxn6WloYqPZJBVDVyARZYsGii0fgdblEOjGlqPY
         u7EA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXO3zEUE6a3VRTvsho5O2JPyiLk6zvA3aIGiJBObfpYccZxzFwe
	+DJ9MWEH+pUOz1FTOvl5TGw=
X-Google-Smtp-Source: APXvYqwRg31uvqxmwG/7fNMGfoZNMosDS1BTD9GTWV3TIqABceXrBA3Q06QLM66641kI34p393NIeA==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr22227164wrn.283.1580139549894;
        Mon, 27 Jan 2020 07:39:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6650:: with SMTP id f16ls6881473wrw.4.gmail; Mon, 27 Jan
 2020 07:39:09 -0800 (PST)
X-Received: by 2002:a05:6000:f:: with SMTP id h15mr23062096wrx.90.1580139549266;
        Mon, 27 Jan 2020 07:39:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580139549; cv=none;
        d=google.com; s=arc-20160816;
        b=EUUGQ789aB+di7Cea8CH8tjogYBrMBXOUmoXqN8dRXE6pXCmLmpW+9GUtippw8HCpM
         R6ICYm+AtLIPw5VHYY0969v3q6yxGcKHPdZtxJ1TfuLXCOQj6Dg6cNG6Y3agubl7z+Tm
         BB2rFGBLWgO06rm15iZBDOPeMnKJjuqt0Uetxjw+B/twEC4z7IIu10rNfOQRrToeWALH
         oO/XB6CeTDoXzFdqTzgQYvv57qB4bATTBU2SvqQXIfrhPGPDCbVzOx0jCjE8CZWfWzTP
         ZQeg4uD/o22O7kevOJVR6+0jrs1/h6J01EdDBgnam1o2wgF0HPexct6suBiMgcUvHYNG
         EGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from:dkim-signature;
        bh=rbifCsywqg8jTQlIkl9hPA/DopM8V9/Bm6d1GLqX4w0=;
        b=VkaIWzIcsY49f4mIax5F86f5LFRkStfZSk6Ck02RjDmHQsJMiobkd4PmBok6IDhg42
         wfn4g2AQ+jFbawB3vTUHVGdhF3pcGuLvpTF664jPq52m2jjNPMjcnOcf+bV1ecKQryqA
         zZCMcWERt87sEQZkWdvxMq4PDT8MaCsweq5Ou2/ZuJmAxBEniC9v8zPHszMzXz8v0LqC
         //7nzAjWrlNZFYzCI6vL0AxzPNs2A0HRTQ8gF4hh0GT9mGTfgHfuNYjwC3n20cjbNe4t
         8AmdHUwcooBD+2qnD0NlvNyw907Czl4wFmsmVnJTFHnCchNeIe9L+Tk5UFRF1sheTSHR
         yI6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=EhFpMzn5;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id m12si734681wrq.1.2020.01.27.07.39.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 07:39:09 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MJTdf-1it5fj2qst-0035Vn; Mon, 27
 Jan 2020 16:39:08 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] arm/arm64: Factor out more common parts of
 jailhouse_hypercall.h
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <9671ca54-64ff-f0f7-93bc-818c9a1dfeb8@web.de>
Date: Mon, 27 Jan 2020 16:39:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:7OZw7qHp4PaQfxDpqUZ8Drvf7ybXC3fCjWes9yFeOPW886DD0ik
 KRH345+z0Uz8Qawq6Yr1bAU0+Mo5+Xgk/L88cPD6JRlkRE1NX0U+Nd4jDAIdRNzgqJsFhkZ
 meN8DRg+aY6NSHJh8GB+oPbLpupJkiADb2VQjcffFRRW3aFaMgGRzhaytunO3XE96N2y1I6
 sH8VwxhfnajayPIMI77HQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0ydY74Ee4CQ=:jK2k29tgb9iqLoefgtajrb
 nPRPeqt0ULHCuBmbIrRuBUsfnXh3CholazdQZv2i1QnezFjuMrBYUzxdtm1t9XcLvQKVrjm/w
 pg4sl9zUbcfXvdDFHbWStk6brnB1qNMR3jCCav9Z5onjvexuYMtaU4hlesNuiyz6kTKHKQ2Mh
 wCIbnwrL/tpPJ1mEG9SZnZWR8uuTSURvGwX07V+a3asZKykAEL9yhB1Tpu4IVmdrDbq5EdGVM
 P6JkadFA3yGuBpUJNmC/LMFQLXM5iJ5D2WK6ZUzs6/pEvVyvIGGjZ99FOwRyE1S6oboW2adR8
 zAoVoSW1xQrZiFidwlAvFjmA+3l8zfJHfL+dS65xbF9VGbnlMtrlacAsUjV/2B+TsDGBmD6Tw
 loVXOCZAC/MZ5gm9UVwZszBOkpT6vZs7Hdaib2/GiVBB3m7zx9TB5ViECll5AGFrr5HqV9Fqk
 2fFNNiKk/xZ90a5TU1JL+fenQjX1PPC3mtvOvs55ySkDcOErg3uo3qYgjooCUpcE9myPU2Fxe
 KHq+6LryuD+qge0TyAeJ1RbLRt+rfn+Q3TPkU4BCYfOsl9HOcWLvvt8zyKvjPcJNhb49DIJ8J
 BKaHs6MnDZDZQrh0pOm0QmHY6hha4I4AMUoELlvWYHg2FqRxzGXkgQlLrdKebQXutgDyhO7co
 repnPFL7tMyjtOOKTc/5z0h2AFiZGZXao/a70GMBfib2qGN+zJXhGclxjZb76uaqunhKE8F11
 reIFnuBI/6YxeImw1VoVk1wY7GJ2jAtdxGN5ZXvgwcaHGabqG7ZlZTPwup6t2gmq6O5pSZeei
 7bJmFBweZhR1zjPUAcYu7Kdk41/WI4ePv1EtvPXeOwS0fkQ4eCiGM4OxSIueP2/LeIWIvW3dv
 Edb308yDw85WIDTQ/rD1fdYOTVk6/ikM181SFNT+H2+SoJb2wITxbuJ45t9lLFFQa5S0FyL4T
 Lom8fj19yo9NcyGpM2zQcsZQ9v67Tj57qt2b4S69IsRQ0JOpm7gst9+xD8HVEC96oJzlX/Edh
 WOGLa+UsuHSI+uEZF5npoDAe/BrGPvKgCSeULUw6Z09hz6+d+o2V5Tsa731hT8Q2yC89Bcu96
 8gzBE587Ib6aaP+K1GqNQaMowOTy8rXG0cMdyTUpaVI4i7bJwOlv3PQbmArJCAdHhqlyVrNYU
 aQk3Vm/Nh1U4t2vM7K/vNhOczWfCjbHG5FRCYHlavQq+Bn8ND6tFsPzIf+lNs/qaosI0g7Wzh
 BE1A11WvhAAV3diVO
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=EhFpMzn5;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

JAILHOUSE_HVC_CODE is the same, most of the JAILHOUSE_CPU_STAT_VMEXITS_*
are, and when we move struct jailhouse_comm_region, we can save
COMM_REGION_COMMON_PLATFORM_INFO.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/arch/arm-common/asm/jailhouse_hypercall.h | 27 ++++++++++++++++++-----
 include/arch/arm/asm/jailhouse_hypercall.h        | 14 +-----------
 include/arch/arm64/asm/jailhouse_hypercall.h      | 14 +-----------
 3 files changed, 23 insertions(+), 32 deletions(-)

diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h b/include/arch/arm-common/asm/jailhouse_hypercall.h
index aeab2816..6f2e0b30 100644
--- a/include/arch/arm-common/asm/jailhouse_hypercall.h
+++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
@@ -36,10 +36,25 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */

-#define COMM_REGION_COMMON_PLATFORM_INFO	\
-	__u8 gic_version;			\
-	__u8 padding[7];			\
-	__u64 gicd_base;			\
-	__u64 gicc_base;			\
-	__u64 gicr_base;			\
+#define JAILHOUSE_HVC_CODE		0x4a48
+
+/* CPU statistics, common part */
+#define JAILHOUSE_CPU_STAT_VMEXITS_MAINTENANCE	JAILHOUSE_GENERIC_CPU_STATS
+#define JAILHOUSE_CPU_STAT_VMEXITS_VIRQ		JAILHOUSE_GENERIC_CPU_STATS + 1
+#define JAILHOUSE_CPU_STAT_VMEXITS_VSGI		JAILHOUSE_GENERIC_CPU_STATS + 2
+#define JAILHOUSE_CPU_STAT_VMEXITS_PSCI		JAILHOUSE_GENERIC_CPU_STATS + 3
+#define JAILHOUSE_CPU_STAT_VMEXITS_SMCCC	JAILHOUSE_GENERIC_CPU_STATS + 4
+
+#ifndef __ASSEMBLY__
+
+struct jailhouse_comm_region {
+	COMM_REGION_GENERIC_HEADER;
+	__u8 gic_version;
+	__u8 padding[7];
+	__u64 gicd_base;
+	__u64 gicc_base;
+	__u64 gicr_base;
 	__u32 vpci_irq_base;
+} __attribute__((packed));
+
+#endif /* !__ASSEMBLY__ */
diff --git a/include/arch/arm/asm/jailhouse_hypercall.h b/include/arch/arm/asm/jailhouse_hypercall.h
index 275d4891..aabd66ba 100644
--- a/include/arch/arm/asm/jailhouse_hypercall.h
+++ b/include/arch/arm/asm/jailhouse_hypercall.h
@@ -38,30 +38,18 @@

 #include "../arm-common/asm/jailhouse_hypercall.h"

-#define JAILHOUSE_HVC_CODE		0x4a48
-
 #define JAILHOUSE_CALL_INS		".arch_extension virt\n\t" \
 					"hvc #0x4a48"
 #define JAILHOUSE_CALL_NUM_RESULT	"r0"
 #define JAILHOUSE_CALL_ARG1		"r1"
 #define JAILHOUSE_CALL_ARG2		"r2"

-/* CPU statistics */
-#define JAILHOUSE_CPU_STAT_VMEXITS_MAINTENANCE	JAILHOUSE_GENERIC_CPU_STATS
-#define JAILHOUSE_CPU_STAT_VMEXITS_VIRQ		JAILHOUSE_GENERIC_CPU_STATS + 1
-#define JAILHOUSE_CPU_STAT_VMEXITS_VSGI		JAILHOUSE_GENERIC_CPU_STATS + 2
-#define JAILHOUSE_CPU_STAT_VMEXITS_PSCI		JAILHOUSE_GENERIC_CPU_STATS + 3
-#define JAILHOUSE_CPU_STAT_VMEXITS_SMCCC	JAILHOUSE_GENERIC_CPU_STATS + 4
+/* CPU statistics, arm-specific part */
 #define JAILHOUSE_CPU_STAT_VMEXITS_CP15		JAILHOUSE_GENERIC_CPU_STATS + 5
 #define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 6

 #ifndef __ASSEMBLY__

-struct jailhouse_comm_region {
-	COMM_REGION_GENERIC_HEADER;
-	COMM_REGION_COMMON_PLATFORM_INFO;
-} __attribute__((packed));
-
 static inline __u32 jailhouse_call(__u32 num)
 {
 	register __u32 num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
diff --git a/include/arch/arm64/asm/jailhouse_hypercall.h b/include/arch/arm64/asm/jailhouse_hypercall.h
index 9daa21fe..108d052f 100644
--- a/include/arch/arm64/asm/jailhouse_hypercall.h
+++ b/include/arch/arm64/asm/jailhouse_hypercall.h
@@ -38,28 +38,16 @@

 #include "../arm-common/asm/jailhouse_hypercall.h"

-#define JAILHOUSE_HVC_CODE		0x4a48
-
 #define JAILHOUSE_CALL_INS		"hvc #0x4a48"
 #define JAILHOUSE_CALL_NUM_RESULT	"x0"
 #define JAILHOUSE_CALL_ARG1		"x1"
 #define JAILHOUSE_CALL_ARG2		"x2"

-/* CPU statistics */
-#define JAILHOUSE_CPU_STAT_VMEXITS_MAINTENANCE	JAILHOUSE_GENERIC_CPU_STATS
-#define JAILHOUSE_CPU_STAT_VMEXITS_VIRQ		JAILHOUSE_GENERIC_CPU_STATS + 1
-#define JAILHOUSE_CPU_STAT_VMEXITS_VSGI		JAILHOUSE_GENERIC_CPU_STATS + 2
-#define JAILHOUSE_CPU_STAT_VMEXITS_PSCI		JAILHOUSE_GENERIC_CPU_STATS + 3
-#define JAILHOUSE_CPU_STAT_VMEXITS_SMCCC	JAILHOUSE_GENERIC_CPU_STATS + 4
+/* CPU statistics, arm64-specific part */
 #define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 5

 #ifndef __ASSEMBLY__

-struct jailhouse_comm_region {
-	COMM_REGION_GENERIC_HEADER;
-	COMM_REGION_COMMON_PLATFORM_INFO;
-} __attribute__((packed));
-
 static inline __u64 jailhouse_call(__u64 num)
 {
 	register __u64 num_result asm(JAILHOUSE_CALL_NUM_RESULT) = num;
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9671ca54-64ff-f0f7-93bc-818c9a1dfeb8%40web.de.
