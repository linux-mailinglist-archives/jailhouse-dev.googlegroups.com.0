Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIF5VDUQKGQEXID5EFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7472167B9D
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:41 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id e8sf6179964wrw.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041441; cv=pass;
        d=google.com; s=arc-20160816;
        b=mDDiLTeQTYL/5lNekC5E/UfDVb6nJNmYtNSkGLreySJgSqSl25p2hDnKj4kHLvmmGt
         53L+tl6p15hnw3NcOV59hUb3Ov55iX5Cr1qBObstFCJl2a3mFXSadKV7+DoAfSsAX3HK
         AGO+5l+9cQn5WGTlY4JwmnE2TeQZYqIlTJR4PoaPyBrz5VMEj8kdLTwRuz8bhp1F9ubu
         MhPDpJppOpU0OKLG+b1TXgxWQOt0jcde+6y/aIhfzEfVOxIUNsTGOf7H2uXnQ7ExRmfT
         0vCZTLPeMC4QBi1/rbAqQfBoCHrUFapj8eenkb+TzZZTffpm14qWyjW8lA9ApSCymOSw
         r2Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LTt44PoLfCbdQai8+Muu+0OIdIMLD6fcX+3ES0nzKQs=;
        b=Ob7VMY8jpyrIqS4pEAXS2Rjpbuzo4rwvDNrTYvK2f4vTMiwvcmnDdlyYMUUVyevnui
         EUbhDHErMzZwqCzAji8ylI0msXaU2tOMCCiSuVnMLQC9kUKLEWwS9FafT4mIqmW+HHKS
         VfndrQmC/MF+EvMBgtc1wikDtP0B/ydSFHgGjF2Gdvfr/vjubh9HQeskrExMB0oV8/l2
         rA1tzCW+z6cwJTN2Dre81sbgWuB7ANL97v7M8Vp/Lz3jhxRRUqb7q8cDfX8+4c+Geiph
         MRDsD3rb2J9igl8limTGN0yT8RGYc9WILtUfz+Vk9XSTMhZRxn5F4LVpjrM5phB+CCz6
         1Lig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LTt44PoLfCbdQai8+Muu+0OIdIMLD6fcX+3ES0nzKQs=;
        b=egi7QuWb4bsrU6aKGuHfDR8hNm0XcT00Je4JRe6mREjBec6Cr32THW07jMl9AVaAjI
         L/yrR4I+/S84hkmfE4Tf/L1YHQBHgaA2YVBm7OmWxzv+b4deL3/5ugSvJjTJtVIfH2Cj
         b4OuRyZfRlvoTaeBIf8vheAKCDfoXqY1xjrihT462BbTVCLSUp0o+wJjzDJlV0GX+ADQ
         pO0FlBEH30XypYlvQfR9fpJs6E2tHBQ6jlNV/GKA4ll1grCHrIVT3YJN6mN4srXv2UTt
         dF49UxozOPWmnmS4BmOkP3xoL6EeYalyV8W4ynJOfGAbfkAhijbVuA1lntH2pMT6V7H3
         i2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LTt44PoLfCbdQai8+Muu+0OIdIMLD6fcX+3ES0nzKQs=;
        b=b6S/gOuoewuA7T3IrzPygud/Oo431+V4Mf+eaaexaJOl4snVgQsNfdwXrxT/cpKHqT
         HZ3DqVnM5iXq14jN6fLhRiMek6t4BXbMOwHsAeFtTFZgMUXzcHX6qkg3Xy6JJTbbdyW+
         vGbeeCkVcqhs7BQCb1NFb7xfMZndej8yAcegi3Q2K41DyZf/fIHlvO9CO9XJdbk/ZM4x
         VVm9BvLqO0cLej8zlg7X0HApsvs48daqv6S7rSFyJzcHZs+jKPhLOk8IridMljwbSvm1
         WlT89VteymPQdHpvqnWjcqaALTN54aXvalRrUKMGySpH391FvRIIMQtVmG6fB2tbgnZ6
         Sg8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVxUNmoe9SPy6yQ4n88/5w30k1vBcUz5P154SVRre0vjCpTfPQC
	GA8Agm9Po4d/vzMSnJUTIkM=
X-Google-Smtp-Source: APXvYqwGnb8ZdvRMeXsWOOlDineIr68yzWrIPh5aSJQiGKE4Y/K+/mzfqZ0I99nwq7bRiIlsMHXYBg==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr14633568wmj.109.1563041441147;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5709:: with SMTP id a9ls4076679wrv.12.gmail; Sat, 13 Jul
 2019 11:10:40 -0700 (PDT)
X-Received: by 2002:a5d:5012:: with SMTP id e18mr18907402wrt.166.1563041440418;
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041440; cv=none;
        d=google.com; s=arc-20160816;
        b=bptErxPtyTsPqX6id1ZxLl/1ZJVpWFmjzALHmVGAq3BsbcZA1sWOBl0iEx6w6hRiGQ
         9AlKthgKHoTZ6X2pqdma2hwNWg/Xx1TuhVPv5f6YLGn86JxgI2xyHXmNnrQuH2ogDQ/K
         FGexU6uvlftGnlm0GkA0PLEYKPPHjg+ehBHuid2oWEd0F9BZ9pxzIgqTHU+RawkhaiLW
         jTgNZIA1SiJGi4mDUKsFjWRNM3Mi7RN3pOqP0NO5xa3M5lMNUmWP10Jco1OhV3DmuIo9
         I77E89ZmKKw4+d8OQsP/sI0HbpbjN3Lb+3KhfursHzdMZGMIKENq6D6BB9pgZPVKeBg/
         gFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vAtNknp+a2kdcFvVDI5jv3/Sach0MAyDRKdiXx2k62M=;
        b=vm8AxzH3VgeHzIb4RkMjF+jNUrrp6Ap6Ip1z567IpIbO4SBfdHXlpmiUVBwJQb2JHU
         o3jhA/IJR+tcugt05Mn/YTA9Cw/iZeV3LEJEqLkGHRY1cF2RVXZKId9BpvmOAXoVREtw
         /gbDTqDqvPO1rRKSBw7vODTSOf/fQXNt7luU3CoSc2ueQMfYbc1kW1WOKVRiuOA+59Br
         HXqth2EgrjP7OEaiNMOa6x4IBCyzOxWLu5VC/6z/ASTfdYK6zTSarAdqXs8y/3EW1+pm
         uLeaOdkSTx/2rXiN9OGc6jfZ7yviyobwq+PUQ57EgPHSmcI0n4siQA2ZNJjefDwnbLyv
         hspQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id u18si792737wri.5.2019.07.13.11.10.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsD00nxzy6p;
	Sat, 13 Jul 2019 20:10:40 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 05/11] x86: drop vcpu_vendor_get_cell_io_bitmap
Date: Sat, 13 Jul 2019 20:10:31 +0200
Message-Id: <20190713181037.4358-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

They're now basically the same. Consolidate it.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/include/asm/vcpu.h |  2 --
 hypervisor/arch/x86/svm.c              |  7 -------
 hypervisor/arch/x86/vcpu.c             | 13 ++++++++++---
 hypervisor/arch/x86/vmx.c              |  7 -------
 4 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/hypervisor/arch/x86/include/asm/vcpu.h b/hypervisor/arch/x86/include/asm/vcpu.h
index 24872f55..cae5b554 100644
--- a/hypervisor/arch/x86/include/asm/vcpu.h
+++ b/hypervisor/arch/x86/include/asm/vcpu.h
@@ -88,8 +88,6 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
 
 void vcpu_skip_emulated_instruction(unsigned int inst_len);
 
-void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
-		                    struct vcpu_io_bitmap *out);
 unsigned int vcpu_vendor_get_io_bitmap_pages(void);
 
 #define VCPU_CS_DPL_MASK	BIT_MASK(6, 5)
diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index f2ea313e..e1000447 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -1008,13 +1008,6 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
 	}
 }
 
-void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
-		                    struct vcpu_io_bitmap *iobm)
-{
-	iobm->data = cell->arch.io_bitmap;
-	iobm->size = IOPM_PAGES * PAGE_SIZE;
-}
-
 unsigned int vcpu_vendor_get_io_bitmap_pages(void)
 {
 	return IOPM_PAGES;
diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 4c074669..cf8ff04c 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -76,6 +76,13 @@ out_err:
 	return NULL;
 }
 
+static inline void vcpu_get_cell_io_bitmap(struct cell *cell,
+					   struct vcpu_io_bitmap *iobm)
+{
+	iobm->data = cell->arch.io_bitmap;
+	iobm->size = vcpu_vendor_get_io_bitmap_pages() * PAGE_SIZE;
+}
+
 int vcpu_cell_init(struct cell *cell)
 {
 	const unsigned int io_bitmap_pages = vcpu_vendor_get_io_bitmap_pages();
@@ -97,7 +104,7 @@ int vcpu_cell_init(struct cell *cell)
 		return err;
 	}
 
-	vcpu_vendor_get_cell_io_bitmap(cell, &cell_iobm);
+	vcpu_get_cell_io_bitmap(cell, &cell_iobm);
 
 	/* initialize io bitmap to trap all accesses */
 	memset(cell_iobm.data, -1, cell_iobm.size);
@@ -115,7 +122,7 @@ int vcpu_cell_init(struct cell *cell)
 		 * Shrink PIO access of root cell corresponding to new cell's
 		 * access rights.
 		 */
-		vcpu_vendor_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
+		vcpu_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
 		pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
 		for (b = root_cell_iobm.data; pio_bitmap_size > 0;
 		     b++, pio_bitmap++, pio_bitmap_size--)
@@ -143,7 +150,7 @@ void vcpu_cell_exit(struct cell *cell)
 	struct vcpu_io_bitmap root_cell_iobm;
 	u8 *b;
 
-	vcpu_vendor_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
+	vcpu_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
 
 	if (root_cell.config->pio_bitmap_size < pio_bitmap_size)
 		pio_bitmap_size = root_cell.config->pio_bitmap_size;
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index 8552cabd..2f46b7e9 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -1220,13 +1220,6 @@ void vmx_entry_failure(void)
 	panic_stop();
 }
 
-void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
-		                    struct vcpu_io_bitmap *iobm)
-{
-	iobm->data = cell->arch.io_bitmap;
-	iobm->size = PIO_BITMAP_PAGES * PAGE_SIZE;
-}
-
 unsigned int vcpu_vendor_get_io_bitmap_pages(void)
 {
 	return PIO_BITMAP_PAGES;
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-6-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
