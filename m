Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMHB42KQMGQEW7KDKDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7955B9F2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id p36-20020a05651213a400b004779d806c13sf4700825lfa.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336560; cv=pass;
        d=google.com; s=arc-20160816;
        b=MTM7NrIknwSv0QKRNneS+juUjZCQpP+6AFgi/KSrsLZ6UcCZowKQwoj+5zjkh7B8SE
         BKqqD/ncEWMtmU/f4V8dMg2hUsBYofW6atMz2wotPqje4fNkZR4DFCaICXaPbQ8ytJXN
         Ab1orWRZgs1MU1EnB0MiHRkzk0xmc8571+rox1M4y6cnmm/rwTU8gabrEbcmQF59GF4B
         JSLXwkRpL0UG/x+MOy4TBBVjY218OLoVko6Th+hAbvgAWSNO1U0OzQixG1m2y1mpzssu
         VmzfZpiRUu/BVDrCi2QDYPecIXhrlMeQ61rdUkimEOPTP6HpDHJCKtLLKm82xg64susv
         I5EQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=8hVkti1bPcxy2CGMjAeV9r3OA2hBNwUcsqewV0dYzvk=;
        b=RsXmeDrEHhxMawIU6CLkd2IBGIYpt15OFHecXzYXN3L2YzLI6tV+k2XOd5Z2dKq75N
         mwvDDn3HHl56/77YjspcPOLQcdGhFPOHwWYDzZ+NEkF+ilrPdygw3Frns++9tI2gDiBZ
         iF/kNb7GN68n3zE07pr7pDG1VzL6ZF9pVYId4vBnhqd5veGSCj9uWxeWKZgRV1KPkKPY
         /v6H1vt3Vjw5r9+rn3eTfChVhBcI0EPxTDEcnNwdppV3hJMnAS2T7M+bdMRF5KbaVFoM
         rrp1dCQ1RFY+dd0F7o/pWFnmgA6bFE4lqvTv1yxK8PYmHvNJaEhXeV24QC3HQT3R+rQh
         AMXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=qC8CsvCl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8hVkti1bPcxy2CGMjAeV9r3OA2hBNwUcsqewV0dYzvk=;
        b=tARutPhZGxImGdvzOGZ2Viyj++SM4d6DIv1Rz6U3mOGvLIeMFT1RaaWECGoQbE1eIo
         l5t1Fz0GsyL0IgMnTfuQmJVPCh/6vLalxYm9FHxsU0YmmH7vmcmSsN+itizh4IHFflMU
         tx6H9q8YKDJDnwbyZs39jrxJSYtSMALYHmLBnY530Ki7Iz38Nob9O9A0v4KsHX9WDrii
         mhPCO7RhOefA4ZUjHq6udb3kBVc7KIidvT+cwtYhtBhfDlZwrzGp3Sycgk4jrQeoQEq4
         VJUlnCKi3ZpsJMvLYy4poxA9tZEMKtq5VYdnK7GJsUxEHTKo81EOWnWV2WUnJQSw92r6
         iYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8hVkti1bPcxy2CGMjAeV9r3OA2hBNwUcsqewV0dYzvk=;
        b=3yc26Yyn12IP8eyD+ssV8Hp+emx0BZq5b8ViAWoxh/7g0z9KH/EpwqNVcjQsimsXMs
         6kH72+X3VLed2FlNcSm3MczAcjl2THLDGSn/WSF5xhWFljUsHHXmOr0nPisQxwMDbYui
         zclIWDDU0Gw66sk8a4SDj7+BNkn+k4Xo9InSPbTHcTRJR5dOSwJl8GdoNhycdYWGZcam
         fio1iIM1znX34iyUHNglptZXFPN9B3vpKlckyxRu1T6x9eGprq4ZLjQogdElHDmqCxZp
         hw9o0Pzyd7yP6WKoyDBDtT60U5joB8Dbj+iyrs/wjBJwG0+efLQn0kVycH1Ais0bFn2K
         n1qg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+Jzo5yqKl0MQaRNXsL0nECj92mAD2LcDdxLwC837jejrHD8it6
	+3DzFFFz2b4lcoTnHg4jWBI=
X-Google-Smtp-Source: AGRyM1ucvyDxolkrzYkUKOVR/1d3n2Te21ek+dblYu34cY/r6wPM6lu+jNDux+kCR6G4IrnrGNAL8w==
X-Received: by 2002:a05:6512:2213:b0:481:7d:5aab with SMTP id h19-20020a056512221300b00481007d5aabmr8616128lfu.320.1656336560799;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e81:0:b0:25a:a178:9815 with SMTP id f1-20020a2e9e81000000b0025aa1789815ls1132136ljk.6.gmail;
 Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
X-Received: by 2002:a2e:960a:0:b0:25b:b52a:e879 with SMTP id v10-20020a2e960a000000b0025bb52ae879mr5019245ljh.491.1656336559157;
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336559; cv=none;
        d=google.com; s=arc-20160816;
        b=f7X+nMuXH3S2Pmg3QX38r7f7HwlIqeUjxUNrH5iA7ROsO4RYOrVGi0J9YT4+0K/Aqy
         yGE10GDs7XPrr8AOJ8cDToKjfKSjKTkvy1S6guktSQvFGg0HQwzQA+asRbH4arJ4XeGa
         gO6QKcyahjNhFdejfN+Rr4cBbutSkIeSAH2yAVKRz7fiBLDIEZ9Zi50i8gv3VV2Q5EjJ
         V3uelYQFrDFb2LcKY0aFNjIQm8V4lazvmaqCaIU5fn1XeICmWCxJGdHMsFYTyhtdU/3j
         Q/TYNTcCaXhpmgJ7zgNCZDuD2qLPoW2HI4Vr6zsO+Gv06KL5Kgz21qJK2ZhtXLcVBDBm
         I5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=p6rvbT2xET6n1XWp4+R5D07UeBSBMFr3Kp2dSOCYoYQ=;
        b=eeMfpgZt1djBHPwtxoIE6jg5sbzHzbyJLcOz9K9o0C5dNdt7qIdb5rojm69heyBILQ
         /3HNMh16iD9MfAgpvPT2VBvY8vSTxt9Ni8rng5BqMNzTrSochx/XElmUVArRWfTRtHf/
         T4XbmmUTri9F6ELmxzR8ZMsARWYEx4zwjJ0qlqo/UhP+/gy0P0g6TpXc1Uh4n/g5X3oB
         cG2TqU1NyFO6l7Tbp81o3/tsfJQXa2AwgulMXtkxRAAbPI/coOXdHCSUwDlvxO7CRrpX
         55y0b9Ov5cGrMxbjwPpzZL284bmHANTio5BXa4ChEmuWyhmKcEJY3utBKOfGQTHDnCbq
         Db+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=qC8CsvCl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id c38-20020a05651223a600b004811cb1ed75si89242lfv.13.2022.06.27.06.29.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV646PWzxxZ;
	Mon, 27 Jun 2022 15:29:18 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:18 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 11/42] core: riscv: implement the hypercall interface
Date: Mon, 27 Jun 2022 15:28:34 +0200
Message-ID: <20220627132905.4338-12-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=qC8CsvCl;
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

Nothing special here.

SBIs are parameterised bei an "Extension ID", which is typically 3-4 ASCII
characters, 'TIME', 'HSM', 'IPI', 'RFNC', =E2=80=A6

Let's pray that no one else will implement 'JHOU' as official EID.

Then there are FIDs within the EID - Function IDs. For Jailhouse
Hypercalls, use FID =3D 'JHOU' and EID shall represent the hypercall
number.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 include/arch/riscv/asm/jailhouse_hypercall.h | 61 ++++++++++++++++----
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/include/arch/riscv/asm/jailhouse_hypercall.h b/include/arch/ri=
scv/asm/jailhouse_hypercall.h
index 1a76ba2b..1c0d80c6 100644
--- a/include/arch/riscv/asm/jailhouse_hypercall.h
+++ b/include/arch/riscv/asm/jailhouse_hypercall.h
@@ -1,10 +1,10 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -36,6 +36,8 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
=20
+#include "sbi_ecall.h"
+
 /* CPU statistics, RISC-V-specific part */
 #define JAILHOUSE_CPU_STAT_VMEXITS_SBI		JAILHOUSE_GENERIC_CPU_STATS
 #define JAILHOUSE_CPU_STAT_VMEXITS_TIMER	JAILHOUSE_GENERIC_CPU_STATS + 1
@@ -43,31 +45,66 @@
 #define JAILHOUSE_CPU_STAT_VMEXITS_VIRQ		JAILHOUSE_GENERIC_CPU_STATS + 3
 #define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 4
=20
+#define ASCII32(C, POS)	(C << ((POS) * 8))
+#define JAILHOUSE_EID		\
+	ASCII32('J', 3) |	\
+	ASCII32('H', 2) |	\
+	ASCII32('O', 1) |	\
+	ASCII32('U', 0)
+
 #ifndef __ASSEMBLY__
=20
-static inline __u32 jailhouse_call(__u32 num)
+struct jailhouse_comm_region {
+        COMM_REGION_GENERIC_HEADER;
+} __attribute__((packed));
+
+static inline unsigned long jailhouse_call(unsigned long num)
 {
-	return -ENOSYS;
+	struct sbiret ret;
+
+	ret =3D sbi_ecall(JAILHOUSE_EID, num, 0, 0, 0, 0, 0, 0);
+
+	return ret.error;
 }
=20
-static inline __u32 jailhouse_call_arg1(__u32 num, __u32 arg1)
+static inline unsigned long
+jailhouse_call_arg1(unsigned long num, unsigned long arg1)
 {
-	return -ENOSYS;
+	struct sbiret ret;
+
+	ret =3D sbi_ecall(JAILHOUSE_EID, num, arg1, 0, 0, 0, 0, 0);
+
+	return ret.error;
 }
=20
-static inline __u32 jailhouse_call_arg2(__u32 num, __u32 arg1, __u32 arg2)
+static inline unsigned long
+jailhouse_call_arg2(unsigned long num, unsigned long arg1, unsigned long a=
rg2)
 {
-	return -ENOSYS;
-}
+	struct sbiret ret;
=20
-struct jailhouse_comm_region {
-        COMM_REGION_GENERIC_HEADER;
-} __attribute__((packed));
+	ret =3D sbi_ecall(JAILHOUSE_EID, num, arg1, arg2, 0, 0, 0, 0);
+
+	return ret.error;
+}
=20
 static inline void
 jailhouse_send_msg_to_cell(struct jailhouse_comm_region *comm_region,
 			   __u32 msg)
 {
+	comm_region->reply_from_cell =3D JAILHOUSE_MSG_NONE;
+	/* ensure reply was cleared before sending new message */
+	asm volatile("fence rw, rw" : : : "memory");
+	comm_region->msg_to_cell =3D msg;
+}
+
+static inline void
+jailhouse_send_reply_from_cell(struct jailhouse_comm_region *comm_region,
+			       __u32 reply)
+{
+	comm_region->msg_to_cell =3D JAILHOUSE_MSG_NONE;
+	/* ensure message was cleared before sending reply */
+	asm volatile("fence rw, rw" : : : "memory");
+	comm_region->reply_from_cell =3D reply;
 }
=20
 #endif /* !__ASSEMBLY__ */
--=20
2.36.1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20220627132905.4338-12-ralf.ramsauer%40oth-regensburg.de.
