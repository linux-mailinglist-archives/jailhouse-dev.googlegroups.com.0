Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYMGRGPQMGQEWKGWMJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 1179F68D67B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:10 +0100 (CET)
Received: by mail-ej1-x639.google.com with SMTP id qn8-20020a170907210800b0088eda544bd6sf11035518ejb.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772769; cv=pass;
        d=google.com; s=arc-20160816;
        b=kdxELlWxg/ZQajk1WkkM28NU29ZMjAY46Sl13B3bTA0OC3nfFvStmEnXynFWnFLGrr
         YGKcbhvfNDgIrPF6r4p5P8AG2VXQwfibpaP1JGY07iLvowdLWjzXcsS3ZoFIda5Qr36g
         5ONsxNnjh1yvv8wv1qN/FVlRdpWeTCdF2WNZnsHh7NKBHt1oEMY5t0GtG0jeR/c7jo4f
         rai+6n/7VJlSUnuXW48ipcjeTgN8kTOO4uEoqGx46fEGpgP9np9Nm2+VStLnC/E9d1Km
         Gl1O7lDbbg5LD5iVnIq9C3Ide3qRNU98wqOijH8prNPVyAz2cVDd9jTVe1nsEJRbzFJ6
         oxkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=LUolpTuhTWEVXePoXi4WmLtpY/IiStlFsoDVTlOxwaA=;
        b=hTYvsaH5+bk8RQk24n8Dx7dwdBgMxvcx2evjaASubIbBM+fgIBdwhejoQCZLbPS44t
         0D/34AO5MbdBPjFadeusOQGbrWiS/o3Uo4cRhdrEJ3xtwH3nCI0XeXjvggSJiWLVXaW6
         rfkjaqNti/y4l6ux7TkB6lgP4kteXvCONS4dn3aor5q/250qYPNN1g6OfO2vM619adwk
         p3eHMmdQYYpz3elO8V5EO5OWb7wqBPRtYcaUJOnFSCxYEW22Q2AWplVQfIz38P+O6sl8
         hU/CjA9yneJ4XpbETWnsLRnzJL4A8bxg0bbPVqSENdbbuTfcf7RAmCRSRgBG/fEhoWod
         G7WQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUolpTuhTWEVXePoXi4WmLtpY/IiStlFsoDVTlOxwaA=;
        b=LKwtgsCeW/bTv5U2LL8ELw27+0o7HawWoRlJYhwU9vo0ceC3CubhxBI8oeHAXLmsvT
         ejMpZIOXX4k+WbQa2kVERHxajTcRFLuoHJgMAKxyuPWjcz8eykkZ2Aidzzcl3EelqqQr
         sbUMK8vAy5P8taHH7v5jwBatp3m9Ei0Q7upgGAe5hpfV9p5cMjh3xiElTLLk6DHP5Knw
         svhXImmKL7+rj4w7FerD1FQohWn+cKK5qD6aJyv/hmzbYe8ADr0YqBDMnId6B/Ljvn6f
         2tBU1xWpPxBLRMnIAQuHD1MUDnr0aJby+Yr+jWFxwhR60cFmnlOqtfZqgaUDUkWdKBcj
         U7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LUolpTuhTWEVXePoXi4WmLtpY/IiStlFsoDVTlOxwaA=;
        b=OlXUJ8UaTBdyP9uDijvZ0heTcMOKaBrjzOwKqs8Q01Dc7tgCmEO8n8f6ioRUNZi3Ze
         0VnS8APqbJ8aGtb2ZjFnnXRkqhoRn6Nsu+h/uoVqFj2LwaS3spdTpoQxMs8t7ZZVb/c2
         WxPTxobrJXqC2O8rcxGfeBykdkZvaRtOoZoRz2w+0A45u26NDKwk/IJBSSEYTDB8Iw2X
         NXXJFDPPn/+g4wJXffFeTSl5UX6+6cy58tEkbYJtNG9E5k7BQIlzke1KQyITChO+MM7b
         8ICKyEzzaEJ8sEHNuaYIAngvK1Xh/5BQnBMqqFb47vyJBr58Q93TAXuJpLZGOT+EVRCE
         fqag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKX94Ns9ypbHtJl1O9y9MdqFamdrVNNTqh0SqYysbBZgYVpG4c8g
	3rkQQySl27KPNwKTkHV2DVs=
X-Google-Smtp-Source: AK7set8YPaLnosUwb0DeGIlw89WzQXx4oIVnne/FtkIKHkBbLoZgXEp2XGp8ZBy5pF+9GLp6OU7HiQ==
X-Received: by 2002:a17:906:3b8a:b0:889:d93b:e71c with SMTP id u10-20020a1709063b8a00b00889d93be71cmr854989ejf.54.1675772769713;
        Tue, 07 Feb 2023 04:26:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c58f:0:b0:4aa:a13a:e7f5 with SMTP id g15-20020aa7c58f000000b004aaa13ae7f5ls8175567edq.2.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:08 -0800 (PST)
X-Received: by 2002:a50:9ec9:0:b0:4aa:a76a:c428 with SMTP id a67-20020a509ec9000000b004aaa76ac428mr1621250edf.6.1675772767904;
        Tue, 07 Feb 2023 04:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772767; cv=none;
        d=google.com; s=arc-20160816;
        b=uhevERaj+QNmiOJPFELzE64494tkWZXeyVRwhIDCLlwPvIeK+7KCvp5JlkT5gwqhRt
         GyqfdSAaejMqLCPpYpDNRyT0aXGgOfMgjAUL32gXGaBtnxrjUZimdLWDwZ0dBGBSeoCc
         leGvmGbP1azgUFhsiRpviJL6czmPQyJsYQOdoaRW93tQzDuKZHPIFCfPInXyXPs72+mf
         Zu6hGz3mSx2Gr22bRi73//0SEJM9VzGcGfxJkw3UvN9WC2abRXxKTSLmaJ/C+K8qmyPN
         qKp5OF0FnrFUPB0gpKt1Fu/2N7D+0jToYJvGxZuQF/OqhuDkg9sqBmQU1kdgC5bNQZgl
         AtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=tR0UJEVsiZlgL2hHQA3xf3X4LTLHgHuLZ5K/r5X7Vv0=;
        b=zU6N0SjfGUSlErblXobqQ9sCynv24GEGjCVNAi+YhAiIP/i2UXtEwEzAx0k8hDYyzN
         2yMOheehcdRLdlAdr5bAPI2/widd3NuVUuiJV0mnlo2CBA7Bi9QbQoBu3z/Dd8MInNcb
         NNcXWeJp2yniBhzGesdIgtk07HTQkINyE0MYzsi/diJYBK14XGFxgBCMyjth3i6h6nAs
         Kt94+ZTJXfugOqCAYP3pKxaR8DYFEDUsLtdFByGDah99pOvGM3T5p0TezSPYtgW7hvoD
         dkfN/SqxINruEx2KehbdEARKFWJfV+wvqe3eO07DvfPmZAaAci0LVt/MJ7qcTuyOPyA/
         GF4Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id g40-20020a056402322800b004aaa51b36d3si445587eda.5.2023.02.07.04.26.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:07 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RM1H2Cz1075;
	Tue,  7 Feb 2023 13:26:07 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 12/47] core: riscv: implement the hypercall interface
Date: Tue,  7 Feb 2023 13:25:08 +0100
Message-Id: <20230207122543.1128638-13-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, CT_TEXT_PLAIN_UTF8_CAPS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0,
 __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
2.39.1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20230207122543.1128638-13-ralf.ramsauer%40oth-regensburg.de.
