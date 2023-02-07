Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBX4GRGPQMGQE5HHY4SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F43168D679
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:08 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id s2-20020a2e1502000000b002917ff038dasf3501488ljd.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772768; cv=pass;
        d=google.com; s=arc-20160816;
        b=m5iCp8f2uW+W0KhQ+/Is5aFVhAbfRCSxWyH4CGLA47akfEZ+dwYiPvsEqJ7wJ00mFn
         szxEN75Qr8kNoVu3Taf8dlhs8PzWa0tq+5rPLtI/aq4E24WlGYhdGyKBljYicN9/hN13
         q4bs0QOnHqzvgQFhCP5IBc1Zk8cQ4Z1vQMm1U1KsKCG5Pbq230Xb7+kCHU4rb8SvOkCt
         RsSzGGA7vmjvX4Hf5mezKWrj4c3aICHF31fqJ8iUklLq32Y/fuMVSjVvOAiQ/GZX3Fci
         nlfsFLjkaTeMqiDt2w26l12gv/G/gaE5VoOAowPlh0/NJuNRGmjR2XHUBeQTFky0tvR2
         pF+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=mn+FLv/nwpc4KUmh2x0ZaPjIiUkP3iicsjx4Mh38kVs=;
        b=mESpDTfZnUgn0IC7GOh7Dd51XQh1Apgktk5X6h/MOC6JaPaO3M4QHPdvMuDz+zaksH
         qbbUyK+QEoGo5My2D2HkRHAlmqxshFhHlJtq6rp7zXDauc4bTX/4rtIJG5yEX8yj/z/l
         0yuUEbBcjtA302ab/jlHwvg8F19C1NRAX/c2WOhT/bXxt/SVy9R6Dzp7KOS064F5DGfE
         18zD8/WhE+jrlITWv3P1hTGu5WQsY+Cwutcx2IqDHJKhI/8FRJom079VgGXT0nHPU6Mr
         ivILoaeb9bJp3u5waM0JAKdGK8bGSRhT+b3BY49R+ZklwsWJpMwbSP7jkciw693+jaAS
         4zkg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mn+FLv/nwpc4KUmh2x0ZaPjIiUkP3iicsjx4Mh38kVs=;
        b=MFATuml4AwHiPtdvWYMLihe/I7W5OTbRhuOGAprhsIYwConlSiMiwyjuOypmvDIbaA
         YCMEySFG6ZZi9Q2X5hOqmjdcCTC/Xbgw23Rrptrq9L71ejKMjjiRLEihuBL9ZjvtLmS9
         +3lAKZS7iOXMhc9Izmmq4Il4mht+QrTHATolU9A0cc/t/Ohjb4eVB7JVmDdMonFtTDET
         r7eFH8b5bRUL0tgwvlyAcsv30RZgitFp78Mup78dtKcC5DLc1gHQl9Ah7jV06xldA7RE
         51EtYtwT80cD2nFhEv3Ugl0NNDCjXwCGpSYk5KVeTTu5yOdayV28JxWu9n58KCSO4zbr
         COQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mn+FLv/nwpc4KUmh2x0ZaPjIiUkP3iicsjx4Mh38kVs=;
        b=xftzmcmQcsOQroPrlv9gN/Zdqm4xDZ1VbzDxGxqsUyWwnMtWhFuhVcFTrvC4KlHgzR
         97vYs3eQGYZZqq+51WBVguHGwGydFs/mXm15SYAur+9lNwpJ6TFpOhtkLp5WTKOu6tME
         STDzHrow6d3gMAYuk7698gsSiTXz4xdiuCrTm9DzS4V/MDx1rGTO+UK6jyVxNebpyFog
         X2eeZrB7O84W2ahamhzycN/ocLmLPP+sdGxtM9V//ZyEAtUBBiBfr7X5PHXo6ZUbKqzo
         luAJj5b1yb89qmgo+gnFPruYd6npnTB5PRRdcAGHH3vS9FunzvHsG9rZKWU0+qVMjEct
         3mhw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWt7ciiuR7wZ/17FTtSubbLbV7NjNDfYqL9S/FWaMa9scxpYRi0
	AlH5vb2acAM9+elEvhqR7a4=
X-Google-Smtp-Source: AK7set+EQ7VC0EFtXeXIUmMEvYhQg3qbMnIZclljai1GNO8uvYGS3EA/PL6BzMPBKryuLE6eXHIytQ==
X-Received: by 2002:ac2:5604:0:b0:4cc:8682:ec5f with SMTP id v4-20020ac25604000000b004cc8682ec5fmr446349lfd.28.1675772768131;
        Tue, 07 Feb 2023 04:26:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc0a:0:b0:290:6183:37b4 with SMTP id b10-20020a2ebc0a000000b00290618337b4ls2099518ljf.0.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:06 -0800 (PST)
X-Received: by 2002:a2e:1510:0:b0:28b:9ada:9773 with SMTP id s16-20020a2e1510000000b0028b9ada9773mr722769ljd.12.1675772766364;
        Tue, 07 Feb 2023 04:26:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772766; cv=none;
        d=google.com; s=arc-20160816;
        b=tRYs0ZMuoE+FOiQcGx5EUXnXXbDYg2wgrKD7trQXrq14k25fyDqHEMZvDdOgXK3J7E
         DT9Gz2TYNojWr13Uc/6C+WP8fFl4fmnbeqgNo2yHDeavBDnSwtekVWbLVuU9bTItR08O
         +DPCdwa+sYw4q8Llfj0G9l6WiBlNQHPI1+aJMTD//mECnZakBo1z315Mz/V6Ix5WCOVC
         D1eMyWic+cb3+38V7Gw2GK2emFfoyWIx9kejbGPLqMzyx870pHisGHA1HJXLG0GzU0aH
         lfcT+jMpTneBdMF0WczVuPAMr6Lu4mZI1/alnbQZWmdla//4opsyNzYC146n1wGDUYu2
         9FLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=DiopV3TC6KAkITBB+5KVQUkmXqkwgH1Ch2kwyDs2QmI=;
        b=MpAAJObh9L2gk+k7mFaNNuh2VpiqFvZz2I5CWIxoswWvS9nM9lMHYqqhVv/BknkRB2
         yJkzQbEnjGITy3/gUPuDoNBlJFuSTggmPrpL/IPwnDxuU8yKS5iS652oHVMwd3lgAagR
         zFt02lnL05cyMn9TxSzt1sNWtnVmu5eZyw1wH4KnnKyuc/YRASvkKo6wQgXdTqOlyFra
         ZBGyT0IpK4bHlrDLTsebtixU/ClcRBvdC3ljVupr2IAWWaxxffdVqrdVO6A/wcNwsudF
         nIhZdcDmaP/ox33GsbiAvWiu53UBRj46ZGmKUDVmQPHycBr+/cH3eMNj7bXBq+q3SPB9
         WDhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id i8-20020a0565123e0800b004d5e038aba2si609536lfv.7.2023.02.07.04.26.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:06 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RK47LFzxvr;
	Tue,  7 Feb 2023 13:26:05 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 08/47] core: riscv: Define percpu fields
Date: Tue,  7 Feb 2023 13:25:04 +0100
Message-Id: <20230207122543.1128638-9-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SINGLE_URI_IN_BODY 0, SUSP_DH_NEG 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NOT_1 0, __CP_URI_IN_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_ALPHA_END 0,
 __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_HAS_HYPHEN_USC 0, __URI_IN_BODY 0, __URI_MAILTO 0, __URI_NOT_IMG 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Nothing special, but two important things: the ipi_cause and the hsm
field.

There's only one single IPI, and we can't differentiate between
different IPI causes. That makes things hard: if an IPI arrives at a
HART, we don't know if it is a management IPI or if the IPI is for our
guest. Hence, store the cause of the ipi for a CPU in the public per CPU
fields.

Simple protocol:
- The sender must hold the receiver's control lock
- The sender must wait until ipi_cause is IPI_CAUSE_NONE.
- The sender must set the cause before sending the IPI.
- The receiver must clear the cause before after finishing the IPI

HSM stands for "HART State Management". Refer to
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#hart-state-management-extension-eid-0x48534d-hsm

We will support HSM for CPU On/Offlining.

For Onlining CPU, we need some user-provided data, which is stored in
the hsm field. Besides that, the state of the hart is stored in
hart_state.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/percpu.h | 36 ++++++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/percpu.h b/hypervisor/arch/riscv/include/asm/percpu.h
index fce6c052..f57e6d57 100644
--- a/hypervisor/arch/riscv/include/asm/percpu.h
+++ b/hypervisor/arch/riscv/include/asm/percpu.h
@@ -2,22 +2,46 @@
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
  */
 
-// this shouldn't be here
 #include <asm/processor.h>
+#include <asm/spinlock.h>
 
-#define STACK_SIZE			PAGE_SIZE
+#define STACK_SIZE	(PAGE_SIZE << 2)
+
+enum sbi_hart_state {
+	STARTED		= 0,
+	STOPPED		= 1,
+	START_PENDING	= 2,
+	STOP_PENDING	= 3,
+	SUSPENDED	= 4,
+	SUSPEND_PENDING = 5,
+	RESUME_PENDING	= 6,
+};
 
 #define ARCH_PUBLIC_PERCPU_FIELDS					\
+	unsigned long phys_id;						\
+	enum {								\
+		IPI_CAUSE_NONE,						\
+		IPI_CAUSE_GUEST,					\
+		IPI_CAUSE_MGMT,						\
+	} ipi_cause;							\
 	spinlock_t control_lock;					\
-	;
+	struct {							\
+		enum sbi_hart_state state;				\
+		unsigned long start_addr;				\
+		unsigned long opaque;					\
+	} hsm;								\
+	bool wait_for_power_on;						\
+	bool reset;							\
+	bool park;
 
-#define ARCH_PERCPU_FIELDS						\
-	;
+#define ARCH_PERCPU_FIELDS
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-9-ralf.ramsauer%40oth-regensburg.de.
