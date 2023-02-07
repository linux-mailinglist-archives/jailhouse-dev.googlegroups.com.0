Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZEGRGPQMGQEIAW22EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 3710668D683
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:13 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id h5-20020adff185000000b002c3e68f9d6fsf948260wro.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772773; cv=pass;
        d=google.com; s=arc-20160816;
        b=PkuFNw4+5fdQRtQKH0AKlq0om334nT1TH9vGG/jzjK+WxrWMF43F5YzG6gG5cBVdgU
         AgEwhVPifGM4V9k/4OmH8LTd4IQ2bbYm+aIOZ6RLLs9PznFsZrpDJiK3jF5nnloPyawN
         i4e5KhfHPhRepKm8n3HcCr02BWOA/ToSopzpLoFwhyP1UvaXL4BDUMd/a3oo2OZoHukb
         baHu/ar6PG1+OtX6I4ZBbHPDpfoilFGFOdmYaTgcW8mukK8sUaRf3GBBY8PvKIMWQZGN
         oamSao/0jP7bd/1nAezPpZG0qRJi4NVFBn9C5+44YB+4kS5v8MRkmjwman0QyoLm2cxV
         PQ2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=uXyx3oj9fA+suyUreU+FQozawnElHR3nqNRW4CgjzKw=;
        b=M5J7uHTWor74TNLiX3kQLpS+UGxgwRfa6sfflpqy3scapoahLF0O4gH/Zvc8toWCHh
         sz4TE55kD6759IPL9TW8WOzsHx+fdtAeOia8J5rehs0E5Bl0ye0kQQf/DwkkiXnr4RpQ
         F1Dfxr4H3vXfdj/cd6XeBWDfQ+5GW+GMDoFwqX+EiHhmzAR9Wx1twCJd8fUSWjDkh3N6
         R7CBuWU9sg/7nR1zNjWr+k7Kx0J7sqWPvLGVsyW6nFQ0mP2PyK5kVtmD+TsXKiNN5iRw
         evgqOkkYiZGehXOumkXaIJTQzNL38xckDAW3HJCnt85q6w8DXJGAh6f1CKQgAIgW1kuC
         jbRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXyx3oj9fA+suyUreU+FQozawnElHR3nqNRW4CgjzKw=;
        b=jIg6Et8aaYqaoRG+fubcpGhwmhzx+iUoNG0g30jgNXWQ4cm2AHTfuAnqPJFtaDcL6S
         zTtQNJXjXByDaujn7ERaWJIp9mlVbJIpY9WTqU5+WpH2nb0EHDmAimI2yNX+uPaXKYGX
         RAT1BvtEdUzZKQ/QqlDiQOgOEDBYgXWVWBBKV//UytReJYC+VfzRLkz0bmL7yHmGoS7e
         eXUuYS0hN1ot4uj9XTqiqxuI8xjds9io6TM7FSm6HlupcbehBvt2EJqlZTHHU6Z0r62a
         FfaTj6YvOgYoEB0SqnQwofme/3HQb3c+h+i7dWf0NAraXzyd0eK+u2BJCFpwhR0GYlxp
         aZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXyx3oj9fA+suyUreU+FQozawnElHR3nqNRW4CgjzKw=;
        b=ZlOKOMI22EckS2vkAZM9+WAMLK2ACU8ZIreQ0kznVOCRBdfBkDAeHS4cCDlEFUnT8Z
         2dBtDxMKrucugo8r30+6sRUUiWpb68UZUkrc8xgbo1d6md4Dj9/0ElFtUZLH5sZegPJX
         qpRm7124lizq83wdiTeNKRSIAUoxMHNAM9nofKKJj3Gg8VejvPjvMrDuW5S6oSwR9ttJ
         izIvSffegmjCUO0lbblDo0JcXNkI8/dZGQOZK70iaxhlDvfkP8cxKD6IkS58CfgoJDFU
         c8lt4oRZU0f5mQp/KftMLN9ftx7aO14s2LrPdO+7qkkSd10mx47arIpyAILLzpz2bCcO
         qqCw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXWhUCcPlpTpsp159sGgpTdKk5RUr+mARkRW/FofD5k8AasQcqB
	Df35glJ80iCuF9YMRyOV8J8=
X-Google-Smtp-Source: AK7set+jkkyZZMvRKPC/dwxAAgWo/1URtwh4aB7v8qOdfwvFCJ/GPNM0iD73B0KhUe5YURhyw9F5Ag==
X-Received: by 2002:adf:f38e:0:b0:2c3:e2d4:5d72 with SMTP id m14-20020adff38e000000b002c3e2d45d72mr104362wro.260.1675772772843;
        Tue, 07 Feb 2023 04:26:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5c05:0:b0:2be:34f5:ab03 with SMTP id cc5-20020a5d5c05000000b002be34f5ab03ls21050204wrb.3.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:11 -0800 (PST)
X-Received: by 2002:adf:eed2:0:b0:2bf:f609:10c3 with SMTP id a18-20020adfeed2000000b002bff60910c3mr2642528wrp.9.1675772771254;
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772771; cv=none;
        d=google.com; s=arc-20160816;
        b=wZ9f1XcPb5fzPhool6iIMNJYKAZXiCH972ZLfkZMrkh7aQFm83iEewTKpIsrR4T8Nj
         Rv0f5QVkHKYB44WZtCr+0LEyXcFBM7PV59zq0SSHD0WBf3pDFb187h40PbR7+OdpgFQP
         pdsv+x/jSKxhBRbMszSnukFO1MSwr5yFkeOfwMhbjuGPwjXYT8eLs0p9tvS8lWnNkKxd
         hHljGezzrNGx1/qT+hr7trSMaCk6Vkzo+jYAUEquXN2mLJ18pSuT+Un7m4NzZ4I0jfTw
         fCgEfp6/dtyslI1FXFpz1Aecu//HGsJGNI3ePANsfLwlO8tfE7AAL1smHm/XP2ER4VnX
         6mRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=tt61IvpmIi6H5ySPJBbn2pXpfTXq3ONZEklMQaMC2n4=;
        b=ScxdDOUjN/chLFipUnjxPxgkokL94TpxfZy7vFO/0z7NkbFDnBWpN+0d8HFCJuoFIg
         rwr5JleesPDhewWeX9c8XfUA784sKB4O3RU5bUkJp2qO1Fy38ScnZt9f9A44ZErkv9+u
         ArfmbaxuryI4heiq2KUGhjPqLEH/gHuiCqmw8NfM/mFS0FrVNfkEMl8RzEcpiMdm3X1j
         GXcM5G62aNIAbDlOy4vfG86frQxEiiMff7Lgk5mwcCw+Znxt/gg0DHycX9UXPzAgHSfd
         6W//6qqPmRYh4r/owfCMeGyW6zmFOqOSurIs1gQ9md3GAhLCmFDDa/PHjNqkv8YtOWTV
         Bi4g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id ay13-20020a5d6f0d000000b002c3f03d886dsi196898wrb.2.2023.02.07.04.26.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RQ5YbZzy6b;
	Tue,  7 Feb 2023 13:26:10 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 22/47] core: riscv: implement arch_send_event
Date: Tue,  7 Feb 2023 13:25:18 +0100
Message-Id: <20230207122543.1128638-23-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On RISC-V, there's no possibility to parameterise IPIs resp. enrich them
with some userdata. Great. We need to do it in software...

We differentiate between two IPI types in software: IPI_CAUSE_MGMT, and
IPI_CAUSE_GUEST.

When a guest sends an IPI to a HART within the cell, the HV will trap,
and we forward the IPI call to the SBI. Before, we set the cause to
IPI_CAUSE_GUEST.

Follow the same logic for management IPIs accordingly.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/control.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hypervisor/arch/riscv/control.c b/hypervisor/arch/riscv/control.c
index b848994b..7d4c31be 100644
--- a/hypervisor/arch/riscv/control.c
+++ b/hypervisor/arch/riscv/control.c
@@ -11,6 +11,8 @@
  */
 
 #include <jailhouse/control.h>
+#include <jailhouse/printk.h>
+#include <asm/sbi.h>
 
 int arch_cell_create(struct cell *cell)
 {
@@ -68,4 +70,35 @@ void arch_park_cpu(unsigned int cpu_id)
 
 void arch_send_event(struct public_per_cpu *target_data)
 {
+	struct sbiret result;
+
+	/*
+	 * For sending an event to a remote HART, we need two conditions to be
+	 * set:
+	 *   1. We have to grab the CPU's control lock. Having the control lock
+	 *      ensures that the CPU is currently not processing any other IPI.
+	 *      If the CPU is processing an IPI, then we have to busy wait for
+	 *      completion.
+	 *   2. target_data->ipi_cause must be NONE at the moment of grabbing
+	 *      the lock. This ensures that no other CPU enqueued an IPI
+	 *      before.
+	 */
+retry:
+	spin_lock(&target_data->control_lock);
+	if (target_data->ipi_cause != IPI_CAUSE_NONE) {
+		spin_unlock(&target_data->control_lock);
+		goto retry;
+	}
+
+	target_data->ipi_cause = IPI_CAUSE_MGMT;
+	memory_barrier();
+	spin_unlock(&target_data->control_lock);
+
+	result = sbi_send_ipi(1UL << (target_data->phys_id % BITS_PER_LONG),
+			      target_data->phys_id / BITS_PER_LONG);
+	if (result.error != SBI_SUCCESS) {
+		printk("IPI send to HART %lu failed: %ld\n",
+		       target_data->phys_id, result.error);
+		panic_stop();
+	}
 }
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-23-ralf.ramsauer%40oth-regensburg.de.
