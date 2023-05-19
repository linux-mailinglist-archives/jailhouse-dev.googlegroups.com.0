Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVN5T6RQMGQEDJ6ZW6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4EE70A0D2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:53 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id 38308e7fff4ca-2ab3e925512sf7338461fa.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528853; cv=pass;
        d=google.com; s=arc-20160816;
        b=INsxxt1uwH0qzcPvO43F0CawtbG6X/tRz9VSOTnvAWpGygQNf+e3ge1EPfdCByIKXk
         fo7orgZR8INE+0hievqO3lwTYQK/5oi5bHKg6PYttaxJ5Dlm6nkKoK4MlaW+EsJJtRAA
         MEBfP3GfJBrAph1deR6b3w6iGMcTbhoaleVYlWUkssdDgjAG56EpKykiHZrwgDA3T6H9
         ZOrOX4xXde0NMlCpdk2MhDqjzaPcVAV1KT+7h2gsxQGw0+Psv0WOaBuKkHy0WvUpeSOC
         ris0tW2RgBVEqKmEZ8Tpo14QM8gj5nYsHKK/OZwIAWeA3htJHIaBfBr0BK0LKHKTrUX8
         bNJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=FnkhzYfT5KMTiCNHlZ+WSzfviTevRX3bAH3j1OAlcTU=;
        b=JPqc6QTZZwQGbMH0h+3ahC4lBiYT1mNr8yrZn0haLa9hfL5dPNUts0ifMo1bDgIXdZ
         U8dShAvDdMyrk2yvhZM5nKYyFASkyUpis+yNzymFrWNAaf5MYuIeilwBnG3EGGZb7iNM
         BXcstezouM6u3caXqnhb4fw3I0Jvl9Myr31Lq+RJDPDtx9rImd6yjyybYOOGa4NuO5nv
         RRu1QXtoAQ++w00oLOzThlaKInvY20rE8DHO/EuMpnZihizbXYIuJcTgXXwUE3tSKeF1
         b1pmC9eEv2Exe5M2kPl5JVZ1pJ2uZPccrUZEzkZ5y0D6JC9lpszBKQFwEU4X9M0odr9G
         qNsw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528853; x=1687120853;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnkhzYfT5KMTiCNHlZ+WSzfviTevRX3bAH3j1OAlcTU=;
        b=DUQeMc/thhG6mDPhJMr+dfXvmxXOeGHPntJspejfvOIJ+P63JzaKZosyE8VbhWIqcm
         3AgE5EwP28NMtUfD1C3ueuXgARJCqc2My1kRmK5cYtRg1TrB7vPurKRUI0nKJjfGEMsQ
         9FRNbwsOFUwXs55XZQh7XG1vLBkWmfAT6UIST1KkgyoprH4iZLv3gG3Dw3eE/N9wClOY
         YzrrUlpGgKT03wv+zEeDL36njcoH72sf4zg2Z+SS333lVffPpoxHGWjyZMNVyyWdJP/W
         UzXpwHm0wt0PTIXqilZ3iCEU+V3W775TuTCZRylicEAEOAw+JovE03hMP8Eo9thydB9t
         /thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528853; x=1687120853;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FnkhzYfT5KMTiCNHlZ+WSzfviTevRX3bAH3j1OAlcTU=;
        b=G2xAI4/K9wtWI/ZJUXzOL+bWLuhn5SmOb/uteWBnXR5bHY7pCi3WxxOMOPry/FeFSw
         xgFApF0fERgmgM2fJvHBNsTmOr4CyfNRAEu1nkcBdr9l3pgkfX6AqbN8eDydXJC01roZ
         l+x4qLLoW+5A58BCD0I7auV2PxV/bJkzfM7kaSKB6W3wXTBo12H6NWSSv5eBbEMDrYcv
         4pihvI/o+X/s/fLKwf/cdyl4Ipx2WzgMP3/N6zQrT7PM/JKZVXvDMB0qyrIpdtXV1C/d
         0Y/SV5vZw3n+Rb4EWwSDFb5eYr40peE4Pvkl8kHxJhiFmpxp6+hQ11zpn09cyZW8rq+3
         CXTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxV972oCH266n4fo+7Xxzvax8mUr8YxViNe5NksNeh1eQTY+ly8
	i3dc8PCsH5BFIjtLuYzHHPY=
X-Google-Smtp-Source: ACHHUZ7AC9XjBqBHNvGKnHIaSKTCn0mVoMiqARK6KPTMwHvjy4GTXGMSXZIr3rumKtyHKbXZJgaRmQ==
X-Received: by 2002:a2e:be14:0:b0:2a7:6f65:77fe with SMTP id z20-20020a2ebe14000000b002a76f6577femr924459ljq.5.1684528853545;
        Fri, 19 May 2023 13:40:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:3852:0:b0:4f0:9517:7df6 with SMTP id d18-20020a193852000000b004f095177df6ls1354128lfj.0.-pod-prod-06-eu;
 Fri, 19 May 2023 13:40:51 -0700 (PDT)
X-Received: by 2002:ac2:4c08:0:b0:4f3:b1e6:4b46 with SMTP id t8-20020ac24c08000000b004f3b1e64b46mr653441lfq.12.1684528851609;
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528851; cv=none;
        d=google.com; s=arc-20160816;
        b=wDeisHw2Q0yMaSXRnA4GDg4kywJus/6hSb8Vao4Hxjx0nFyDzxcSZjm4Ry56Exob1p
         alT3/ZRR+ow3BX/bO+4aX51mRPbPck4Y7SembcOVJFyz+a89MWIBUIcNvAoyxL3TGJqx
         jyTPUdwnIrWFeHqSTpu4ZBSi7ZmgAtG48BuXFMIWf8+ZG7ZzFQVSAh9wmtNgfWJsA5v+
         4CtaP4L97/8z/DgixafQ/s+UxdkYdtiCathE+1CLMv7FDOmBScGbtaccL+R7qTpovJKj
         UHv66J5r/EV5rqABlgywOuMcb8HGg48bJXwMCEUBb5PbrQrg5eZ/WSJW/gwahsHqAsD/
         Ufvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=oLO618ChvfHILUTxAKnZ7mytxH908EJcme7sHBAbBUE=;
        b=V7db7a4Km8p/hIfzE3R/Q8p44Mh0uLsej/GJx5n9hu69UV3wPagDPi1GHDbvzbH2cg
         SpgoIWSir+semcqqIJ5O4QWtoGq/hcIzVN3nl6kjNN7thJNdbghBa7fpK9m1NfUsSvWH
         DFOgjTPDwU/Km0QYpoSANouAUxd7oLRKVawH/99CBVO9d8RyNhMNK85JJZEpqQdAVYIu
         gjJKb4Nd6HzVaBomwMDTSrUf9LaAnJDfAJBTmXsqkQ7kmknAJtMXShmu/HZZD/S5plBr
         ccSUEwlmpkfg6SGQfliqOU66HuL9KRxz8X2TMKGp0wzg78uR12RWm8rtl+mGIaxzb2k6
         fjWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id b33-20020a05651c0b2100b002ac75541fd4si687ljr.0.2023.05.19.13.40.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdZ6GDlzxpl;
	Fri, 19 May 2023 22:40:50 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 32/73] core: riscv: implement the hypercall interface
Date: Fri, 19 May 2023 22:39:52 +0200
Message-Id: <20230519204033.643200-33-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, CT_TEXT_PLAIN_UTF8_CAPS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_BOUND_CHARSET 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
index 107d25e5..456eb6c8 100644
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
 #define JAILHOUSE_CPU_STAT_VMEXITS_SBI_IPI	JAILHOUSE_GENERIC_CPU_STATS
 #define JAILHOUSE_CPU_STAT_VMEXITS_SBI_RFENCE	JAILHOUSE_GENERIC_CPU_STATS =
+ 1
@@ -46,31 +48,66 @@
 #define JAILHOUSE_CPU_STAT_VMEXITS_VIRQ		JAILHOUSE_GENERIC_CPU_STATS + 6
 #define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 7
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
+	COMM_REGION_GENERIC_HEADER;
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
2.40.1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20230519204033.643200-33-ralf.ramsauer%40oth-regensburg.de.
