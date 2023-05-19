Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZ55T6RQMGQEBYKMLWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F870A0FA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:12 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id 5b1f17b1804b1-3f5e41e1ee3sf11779415e9.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528872; cv=pass;
        d=google.com; s=arc-20160816;
        b=cGQce/vOzD/Wn0c9HU79OWDDtE0Eo2RnsA9k029uEaGJ6IE8DyZNsU+1rjWQLCjD/P
         HCI6qmn9t6I0qzRqzY6Qc+HimY+toqF4p57BKUkrC+IPFMRZGT1NzZfCLvVoCEHLf+/l
         psbeK2DkM1pRRK3n09J31b1sM20mgDKm3jk4Z02Plmn9Z0B55dTh1roQV+5AOA8UlIWK
         SPl+RIfFDiWv7/RJ0AnOUUdQJ5hqFh98pLGlTNrgCPeXoTKQ+HgGyWYJP41TkSBsEepO
         ot6IX9lhYsa6QlrXKIv6ueb8guUqrVrjRhJGWRGpkuK0F8+WAV3BRn7t7yzJIB1v54SE
         kaFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Mx1GuG7Nq+tdOIWVH9PChaMiGMCWOyMrO9Ki2v0t6ag=;
        b=j4A1y5oOrHCLK9gj5H7ALrcwkJ54/5Gt60UOeOEcEXXv5qORn8ZBx02G4CgPbiQQwu
         n0tVaQ/o4BIPzBKnPJ+xw+KV2w2a/y6SQA+FoJSs8Fq/GS54MZltr+0D2MKCumKke+Ai
         3A5ZXE2b6civdlXnUTPyvNyxKVrzQmZcitFhDJ8KybBZe4CuqHPLsiNhv4aKpCeMpHVo
         cpT0lxBJQblPVuWZdkihuhiANbQla64wClTPDwMZNEZ9IQolX+qPQN6agBBFl8FF8Slj
         Ou3+dzUo7K5f9Blvq0w7jAR6KJc+o03+f+9OSbRr2o8EtNGeSYJ5n4JfRuWdsQHT3ZFz
         M2gA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528872; x=1687120872;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mx1GuG7Nq+tdOIWVH9PChaMiGMCWOyMrO9Ki2v0t6ag=;
        b=L1AmUXOv2/E11NFVvpgJ0A6R6EKNTW+udjalZ1Rleju3T5FLDksh3xeEsbngeov87O
         xo+zc/byyDEL3ttjI6P0uz8iNMebTzV9yC/5xOtfm8uXS8LxHvXJXYL36sVVOldL/L6q
         mFBczdiGSX2gBl0RQ+wqTLPmFd8qQoy95693ow+MwkwpeK/uJER+biFl6q04PaMona91
         jL2b79tzCpHyxoQC35HQZ8rCofR96XIj6qNyDj3Eae34WUsxJ1j9zQz732wafaJV4tB8
         gQwLV76Tn/RE/5QiWs0uml9L2yzlQ9wnDWRR85pBndVrwlVgz+whdEq0C2eWGPnk/gKc
         KTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528872; x=1687120872;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx1GuG7Nq+tdOIWVH9PChaMiGMCWOyMrO9Ki2v0t6ag=;
        b=DVM39u9il0Dirp2/lup+fwOjxrIm8vQgksYRdQRgOYMQzpBes5oddisc4kOn4l/GF1
         nbarmzsaxfB2xR8D2Dw9Rn+4zOjwkSAltz33fG/fvtzwbvZ81prLU1qOhJfsQ2IkRDvB
         JMONc9xxShuULqClZsFyU03rC5rDhdgbKkBlOtAHu/UP/aUnc9wV3hrN5wxNcqefZPId
         ooGqpHpHlJ7jrcT1tLLzN+JykFFsuHtkOZEZ/NOtM8GAgNKkhAJzQRAqKq+4hie2hGvw
         ycRpoGY1vJVCSIAfKGcvYhZilyrAIx6D23mdJAFHTEnSgO3g5v0h+v4CZm67Ep/hcj87
         TwIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwMOmwFZ6RQ6Ia4D8hltpgO09nOuYIiOsa9ec1EMbyJf4W0fvCG
	2qTBwAvuBURn/8mWTj1i6RU=
X-Google-Smtp-Source: ACHHUZ5Ig2ZV1YuwTCst5i7qb6QPPvSAysHFNfaoAMJFrWdQRCh3chm9U1lg7Q71GK888QRQo4bIog==
X-Received: by 2002:a05:600c:228e:b0:3f5:967:bf1f with SMTP id 14-20020a05600c228e00b003f50967bf1fmr536762wmf.1.1684528872371;
        Fri, 19 May 2023 13:41:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1f10:b0:307:29a7:636d with SMTP id
 bv16-20020a0560001f1000b0030729a7636dls1286289wrb.0.-pod-prod-09-eu; Fri, 19
 May 2023 13:41:10 -0700 (PDT)
X-Received: by 2002:adf:f7c6:0:b0:309:4ad6:b3ec with SMTP id a6-20020adff7c6000000b003094ad6b3ecmr2730352wrq.0.1684528870589;
        Fri, 19 May 2023 13:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528870; cv=none;
        d=google.com; s=arc-20160816;
        b=BglPLBhq+REwngtAy9ED+MWRIhGwwLJpJLLgKz/EHQEzxOTq3rQMRY/8261X7TgZJv
         eYlAlJwqhBw+7y8CkA5/b/7a3Xlgd/fmPw49EzKRtsK8RaP6q8mNiCoY5uY6C/4OOWNo
         nqzKYycrDB95o8L62yj4x8DePtHudkCTy4gYBQRUDMm2MdA98ktT6+ZiNsvbXogCbDck
         65Y8iueN0pQfTsIoEnRmkDXHw91CubG3TL/jUOeIYDPzT6aQbQWqs7Rv6DjU015c1iuV
         D1ttAIsr+oyMbnTRQEGxdFS8WvgPetBWVFQLLoheaS2yoIFNF7qBMo9SXWTytiboIT/b
         sJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=F70ZWUncLiwsXsWoBsoy2cf0HdjOedEnyj4RF2qOz4o=;
        b=VBKWfTTPKo6UToD1hUUNi7XSvgC4/0Iep6l33sayTjPtDiSfYLYmT3+m6/G3RIQVuP
         fA9KSuAGjWkNHM16huc2AQ3yQAqkaAk6zErzutrnh1fsu5VIevpyF4mhL5j32ebbwBjQ
         O1SD29/o3PNdlv1oK5s733NGYT5jK2Em77KvpgJt1EXytuu7DAmcmSrpC7vjSAlLjflN
         KiS8SlvSO513P0kHa5TBq06F1daMTAO2CVF3TFiSRdl0taULfJ8b74yiNJW1xvSNqZOS
         edhBfNfh0SF6HPqU//g6bvothcPiJ3znjqn8o2EWTCnfSVICuiJmXp581bmdAnHDfTWy
         X9jA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id bq7-20020a5d5a07000000b0030933d3af7bsi397834wrb.8.2023.05.19.13.41.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdy0TQrzyP5;
	Fri, 19 May 2023 22:41:10 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 72/73] core: riscv: setup: Add Qemu Workaround
Date: Fri, 19 May 2023 22:40:32 +0200
Message-Id: <20230519204033.643200-73-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1300_1399 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

At least on Qemu, we might have the case that external interrupts stuck
pending in hip when enabling the hypervisor. This happens, if a IRQ is
set pending before it got migrated to the guest. This might be a
misbehaviour in Qemu.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
index 62911055..32d5b4da 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -189,6 +189,7 @@ void __attribute__ ((noreturn)) arch_cpu_activate_vmm(void)
 	 * well as MSIs) are migrated, and we can safely migrate all pending
 	 * IRQs from the old S-Mode file to the VS-File.
 	 */
+
 	 if (csr_read(CSR_HSTATUS) & HSTATUS_VGEIN) {
 		imsic_migrate_regs(imsic_migrate_to_vs);
 		imsic_migration_done = true;
@@ -200,6 +201,11 @@ void __attribute__ ((noreturn)) arch_cpu_activate_vmm(void)
 		ext_disable();
 	}
 
+	// HACK: Qemu: If VSEIP is set in hip (via hvip) is pending when
+	// enabling the hypervisor, clear it. Otherwise it will remain
+	// indefinetly set (at least in Qemu)
+	csr_clear(CSR_HVIP, VIE_EIE | VIE_TIE);
+
 	tmp = csr_swap(sscratch, regs->sp);
 	asm volatile("mv sp, %0\n"
 		     "j vmreturn\n" : : "r"(tmp));
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-73-ralf.ramsauer%40oth-regensburg.de.
