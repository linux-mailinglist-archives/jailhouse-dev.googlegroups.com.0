Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBV55T6RQMGQEMJFQESQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6123770A0DB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:56 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 38308e7fff4ca-2aed331e597sf7430571fa.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528856; cv=pass;
        d=google.com; s=arc-20160816;
        b=GxYGfxxtykio67lUNgOW5VQMeRGX8BJl0wvLLqdoVWnVvoRZPOt+fayWmtVl5oZfUg
         3itZmqUAKLZ7axy5kjwsm8ExVWAJVxm5TAjSAJ8uxp/OblQwS55jccCs6l6ZFT1hn4rh
         My/iunv3f0hdhka0fTvpZGqSVsoVjwQUv0ti7Hju0ZK/qfTbFCSLyhyIPEDeEtoJv992
         0beN3Kqgjh3iJTcMAeBtcLl+wJ6AW69Meak0OeJSnN6gDXef6OodjE9mxId5ePENsS9Z
         U3Jag6uc1WFeLt192W6yEH3e19o1WR0JZzkDzhTkTdvkw/A+ub9kiMzHWBzhsJWz9NdG
         VmXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=1lOw26XixLs+6SGldWAFzxbD5eZ3KvrONPoecK8pfbw=;
        b=oKHq7bXKfvyAOOOmOcOEywqwgoNy0LSaETNqFe9KAYWUsiNiALR8ryl1Tyc5RB3dlh
         6LyJmEnahosrzp3LvxsSVIeEpr61bK1QUSZGr2yH9nxsWOYFVex59j050SrNKv9iAl8e
         j8WVg6jquhwet+Lr9xhZ63s+nV6j47IIB5JRGrj/Uc5yw2w+CUd0TfjDV9alZROfP+0l
         R1Hjr2Ju5WnkQi8KaB3T/tGkLomkDDP0P1oOVsdVOXHqEjjqbhclXH0sOD96imvWyaCv
         OgGpAjJuUkqp+RlAhwS/bybDNJNgo8lMb/JHsqX8pQ0iO3URl/ntV+qmSFK4q04uZtVe
         1bfg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528856; x=1687120856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lOw26XixLs+6SGldWAFzxbD5eZ3KvrONPoecK8pfbw=;
        b=Blxk04CxLaL9D9M+2lmo8Uf682AZH/mNYJtMGEuCYxAT9qZlDgNW/jeUmMBiVPVbx/
         augZ/tGRKYSeHcWTz6ky+KDWwpUFDJRoytIPjkqejNQP8kxLYwC1bQD0RNtpxgYJdUC8
         ZcHDxRatDYUGeklyDe/odDriW1xtL5aSG5tjI+Lp39QQHUGOZvm1sE2lNQ248Wr7L95P
         7lk3yjf1wEfRwRSvP/+1Q3Wch0NmTgDlh53D+d5+L2lVRlp6VaKyn47PgzucSQLpF4jJ
         VnAfSr17WotGoGcco3lyHP1AvwqG/a9ACNcE7t9G17z5/wsLrav0jjBZ26esyt9TDHn9
         Er6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528856; x=1687120856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lOw26XixLs+6SGldWAFzxbD5eZ3KvrONPoecK8pfbw=;
        b=Vt2Tc+eRxbzhkQaLK4aes1Xqma7GjHr90sPToNl2GKloZEtJkN4VHhM8w5Y0D/EiHk
         eyJ2cVPNwH6aPu4J5jWQaUJIemAGb6ZaM2sJa5EkHysdVs8qSMFDmuG1gmNeRYXqG+AS
         pMG/+ezOpKhQwJkEMXpbhPoPU+LDPntJdgKCbmqvBm2ddleNmXxv0n/+t2cXnhRGVTff
         A1R/rj8IHui4X/Y/eoJ9Z8QIbojQYFBTzTx6QvUOSYf/vgroaXd1U4lFQTiiOywkxha/
         vfmbOys6Ez0wIuiY7PKmRvoSlx+TBClN6KIEtkIrb4Z71+nnVtSkJ/4Q9msZTZr9z+n6
         8YsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyULUvGwu2XHWsNgQcufqN21fo1YD0TxGSNvfQToGiQKs8qyMez
	pS9prRDcmga1mhDinvk917g=
X-Google-Smtp-Source: ACHHUZ5C4of6ADdcAClFeDDoUtPGnyTc7ivFBsbtylIf6EGJ8yqj/3TPd4dLK9mweW0GEs9kpUWUqg==
X-Received: by 2002:a2e:be14:0:b0:2a7:6f65:77fe with SMTP id z20-20020a2ebe14000000b002a76f6577femr924489ljq.5.1684528855953;
        Fri, 19 May 2023 13:40:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2124:b0:2af:25fc:42a2 with SMTP id
 a36-20020a05651c212400b002af25fc42a2ls365067ljq.1.-pod-prod-02-eu; Fri, 19
 May 2023 13:40:54 -0700 (PDT)
X-Received: by 2002:a2e:3809:0:b0:2a8:c01a:71b6 with SMTP id f9-20020a2e3809000000b002a8c01a71b6mr1074135lja.3.1684528854039;
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528854; cv=none;
        d=google.com; s=arc-20160816;
        b=ojKQ/t0Q1TT31En4bexXr57P+0U10GRyVCNBClEGoNTWoQMq0UappAL1U+j6G1hrd3
         rmDYvXxIl/ba4jDkkSjEHD44DvORbCRJtRb65XMl39+EHI9p982ZfxSXG+Mj/gbTqzy8
         GXpMf5voFCo/xLbc6m7N8q8csgOuHVzgy5AojAEfpyn6hIEof2raGycf4c/i29J8qSSB
         bapar1Cp+89thxQ2ap5yjeUOlKPYu9CnKpdkdvoJg5LbczlJTVC9xZT9UhtKJD9KvAZq
         lh5cNqmlIPqf/wSCb2YxGHUXQ90iCZsc0k1q/HWLSeAawQ6sjIGyDLiTXKUZbAwurAkK
         vFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=An+3DkXzVNslUCmq0+3/tDTc4TqxXkvmQmE2rLEJAm4=;
        b=nAP78igROyD3c2QnI/8GMsFrJXDwcIUTkR3VHUxvPHMmfRcSRYIp1ESqKS4PXfa02L
         5YAuD8Oj6J1F6bkbyKWsZn8w1iBRJwcOl5/divSwxBjQEf4xmaINwnLH8excNYoFQvme
         0XkR1Z5bAhdW16LAk2P8VXOB5JFmDnNnqrBapAPjVu//QW+kFj6rl2Oy/J5LSB/i4P1h
         KqqmK7TnGQhKyBx+FbE8RBtNm4204kLJAuRlMmaZDEGaypE7GvRXdrYvFpN/DRb5dhmh
         xy44TYXK86KXIBQ4tgROW7TqTV9ZV+nRI6AVlN5dw0sMkoAp9oNfdDZXoLS9if9CPum5
         abhQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id y17-20020a05651c155100b002ac885a8f29si320768ljp.3.2023.05.19.13.40.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdd27SYzxtC;
	Fri, 19 May 2023 22:40:53 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 41/73] core: riscv: implement arch_send_event
Date: Fri, 19 May 2023 22:40:01 +0200
Message-Id: <20230519204033.643200-42-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-42-ralf.ramsauer%40oth-regensburg.de.
