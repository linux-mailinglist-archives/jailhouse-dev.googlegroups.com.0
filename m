Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPOF47UQKGQEMSNIUOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D07552C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 19:11:26 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id 17sf10943835ljc.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 10:11:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564074686; cv=pass;
        d=google.com; s=arc-20160816;
        b=CbGivH+Vo9Qts58y8ZUElJu757Tltrmmy6qkw36eP3ZMkaJWu1CITbIh4AdirQMmJc
         bO1/C7S0sV4tfjEeisMZ2jVVoxheJWwNZkyLlZjQnMeZJqUZWVUxY/3pI3t5lxg7rdc0
         u78I1owB+hAn6yNhHODDT2WSi0SkODTCHQj5m+a8F5yW2CRoLPzsNp7T9jE1mQKjPG4A
         EZFEjQ4jzMAxLw1Bx4zSVZTPd57b0IkmQ3fBw3VTwSSsQXCv6hQTCpqhlGuJZCQ5SwRe
         6elgnfRMats/4w2Qsb4urryxG/frFVYgFug2wGtd/uP1RbNBGJp3rjHMDWGSQiDMr4Bm
         Zf/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=1ThboDUqhwh+kbj6S8aRluiVO0eG3scOgo6fdZ2+qU0=;
        b=nvMFoXMhg8TAfIzRXHV6LB6QQQd2iRks/6RrwzyQu6nXYdLLjR6IdbS0ED4quhbcfF
         KXzTHiATynK/mqPOOovZnG86qiV6qzF81lryEKTdIB+XdFirAf8EBe5g+PgE32rsnQ1C
         qB1oDD7ZutmkdkW6nAhwcbYbaE8dX6lrh3R49TTp0sJs+9N6JsTixl6iepr8oL6uBrrc
         awjFrJUHkTxurzkYCpT15WPk9uYKVAwNvs08iTQPnKHX4/VtQWC+gwY/tFdVVhKuw4ow
         EDplD5g7NkWKJ2RkSiPmF3i8HfCR0qA5ZcoRmZuTOyAh0PlNIUI1xOHOB7lalA/+oZe5
         oSTA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1ThboDUqhwh+kbj6S8aRluiVO0eG3scOgo6fdZ2+qU0=;
        b=ID5cJ7fBvRDHrzgZ+ZbgsDKWrgKACQNqt2J4XRAEMPwxNUWTTB7d7Rpt81vjnYCWXp
         sT4lavqETCSc6X9viqjVfadlKD2/kNw54hugPvIytvgJEubzZ2AXcFEMjK3jTL4uwexR
         qFr5eME8uGEzOAGke6kDfzr+ZrcJaL/IagAwqdYX5nkR1LoKL6O9nbPd1BdhbZAGHctz
         EcO7Oml2fzkf++O66DGBUTDGDr/INbF+LDgmzTHaE3bOOEEAahh9AxHrG8H7QSdmCMmw
         8RW5PwP8I00JXV/7JSPoLdlEoYXXjwJlQIiJrUp+MBpQ7gLCnAf7k8tTfStws+55x0ed
         6h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1ThboDUqhwh+kbj6S8aRluiVO0eG3scOgo6fdZ2+qU0=;
        b=ZKwr7YOvsx97Xak4BSn6/7lBU/3ec66dvfqeKJwfel4nSlI21BRgXB4VF/pwAEHrxU
         W4vNDrbT/vxWGXcJbgFMuTdTYWBnsWVxZC2BYxusB14YtWxxleV6rE2CRaIteOBEKZPu
         G3XCyYoQiD1RRLjPgV9I8tdsSGOMhf5wF12jUvWSJhkRhzRFS4soOudxHYXiz83XyTH4
         FBTBEBdczyjzSeT0HOKxJUCr35Tn6tI2LdCU/qeZYTypJmGlR47BfdCr/cwuH+JF1ykE
         bMdh8d99ulBW5HSNHgdnFOyidiBHX7ExZUomuJtzZKdLxFSipo4S5KkNSWcUX0S1Uqca
         mGvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUMpzKxHoHZmyLw2t3xCBoWOnc2ayDGnQBloQLCYhloAiiIM7dg
	oG+G/EoYNpAsDiBs/1Au+C4=
X-Google-Smtp-Source: APXvYqzPj382m7+qzKIR0C2TjnzxjWCrEgC1KmnZgn/ImRchmlbSJQw4qUpsqSAdCXG6XFFeY47gUw==
X-Received: by 2002:a19:234c:: with SMTP id j73mr40999843lfj.96.1564074686027;
        Thu, 25 Jul 2019 10:11:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:640f:: with SMTP id y15ls4179769lfb.14.gmail; Thu, 25
 Jul 2019 10:11:25 -0700 (PDT)
X-Received: by 2002:ac2:52b7:: with SMTP id r23mr11170491lfm.120.1564074685445;
        Thu, 25 Jul 2019 10:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564074685; cv=none;
        d=google.com; s=arc-20160816;
        b=N45kyBfRcCKPCPjxnkDv9j8S/6adixtZTqb7DNYoxbSzE4/52Wof9WBNJiXo5l5CTb
         vodim5ntKFMghDTyGGGAKLJMIkf7LjW9SjkVsGRSa9h/D4Vf0ArEQcM8XH1GVKYlxI3S
         B0X98wmc0sO3VWoN1fpXjxCNtImgom0NbqoA8ZoXu+QRxsUeG6thw6SyAu7AtoNY+M1k
         gnGJfbGjtTim+b4FrOj4JbnjM/Vb6Fs6wqtt0UtY8bLnQwb5Qt0a9VOvvxr2oQ0gvCIt
         RPnQ3Tl0m+akaMS4saw22JhKN6hnTGjTJwGx83AvgUW0DKwLLlpd4hYsdgSJUKmdi3o0
         W70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=a0I2tiyQ70MYI2tNpvdgsIO5102uhYWrzrY6UBON6h8=;
        b=wr9jZbKABpuikPyeNV569LF937QoLGs8S/syev+TMF8mAcqxA9wheGxlB/vhwTWCLW
         rUOu/AX56C47fpRHLoKyDrGlWu04Wq8ymr9tu00BpfPfPOKCqRnHrL70QtVcr6gdCaGD
         g/s94UYDKzUn2D4/HTSLMRdpKY0kIXZG1znk5lR62HXS8IA+hqr1wO/jtlmVucfKhkDl
         AYaizejSZeLN611hrmoa9HHMOk1GPjO+680qBuXMXxGLGEJeWCgsxY86hCf42uEFGnu+
         XuWgYrDQv2ZH/1ebTu9C5KO3dnjfyT5Go4n9dpbrtAUuclNrrH1rxYJa28ReyclPz5Ga
         gW5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q7si2883817lji.5.2019.07.25.10.11.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 10:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45vdzJ4s8gzy6F;
	Thu, 25 Jul 2019 19:11:24 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 1/4] x86: drop vcpu_vendor_get_cell_io_bitmap and struct vcpu_io_bitmap
Date: Thu, 25 Jul 2019 19:11:20 +0200
Message-Id: <20190725171123.9266-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190725171123.9266-1-ralf.ramsauer@oth-regensburg.de>
References: <20190725171123.9266-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.25.164815, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.25.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Intel and ARM are now basically the same. No more need for those level
of indirection. Consolidate it and save a lot of lines of code.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/include/asm/vcpu.h |  7 ------
 hypervisor/arch/x86/svm.c              |  7 ------
 hypervisor/arch/x86/vcpu.c             | 33 ++++++++++----------------
 hypervisor/arch/x86/vmx.c              |  7 ------
 4 files changed, 12 insertions(+), 42 deletions(-)

diff --git a/hypervisor/arch/x86/include/asm/vcpu.h b/hypervisor/arch/x86/include/asm/vcpu.h
index 24872f55..37c9630b 100644
--- a/hypervisor/arch/x86/include/asm/vcpu.h
+++ b/hypervisor/arch/x86/include/asm/vcpu.h
@@ -25,11 +25,6 @@
 	 X86_CR0_MP | X86_CR0_PE)
 #define X86_CR4_HOST_STATE	X86_CR4_PAE
 
-struct vcpu_io_bitmap {
-	u8 *data;
-	u32 size;
-};
-
 struct vcpu_io_intercept {
 	u16 port;
 	unsigned int size;
@@ -88,8 +83,6 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
 
 void vcpu_skip_emulated_instruction(unsigned int inst_len);
 
-void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
-		                    struct vcpu_io_bitmap *out);
 unsigned int vcpu_vendor_get_io_bitmap_pages(void);
 
 #define VCPU_CS_DPL_MASK	BIT_MASK(6, 5)
diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index ae215ade..74abe652 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -1007,13 +1007,6 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
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
index eb171605..2e3a1880 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -81,9 +81,8 @@ int vcpu_cell_init(struct cell *cell)
 	const unsigned int io_bitmap_pages = vcpu_vendor_get_io_bitmap_pages();
 	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
 	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
-	struct vcpu_io_bitmap cell_iobm, root_cell_iobm;
 	unsigned int n, pm_timer_addr;
-	u32 size;
+	u32 size, iobm_size;
 	int err;
 	u8 *b;
 
@@ -97,18 +96,16 @@ int vcpu_cell_init(struct cell *cell)
 		return err;
 	}
 
-	vcpu_vendor_get_cell_io_bitmap(cell, &cell_iobm);
-
 	/* initialize io bitmap to trap all accesses */
-	memset(cell_iobm.data, -1, cell_iobm.size);
+	iobm_size = io_bitmap_pages * PAGE_SIZE;
+	memset(cell->arch.io_bitmap, -1, iobm_size);
 
 	/* copy io bitmap from cell config */
-	size = pio_bitmap_size > cell_iobm.size ?
-			cell_iobm.size : pio_bitmap_size;
-	memcpy(cell_iobm.data, pio_bitmap, size);
+	size = pio_bitmap_size > iobm_size ?  iobm_size : pio_bitmap_size;
+	memcpy(cell->arch.io_bitmap, pio_bitmap, size);
 
 	/* always intercept access to i8042 command register */
-	cell_iobm.data[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
+	cell->arch.io_bitmap[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
 
 	/* but moderate only if the config allows i8042 access */
 	cell->arch.pio_i8042_allowed =
@@ -121,20 +118,17 @@ int vcpu_cell_init(struct cell *cell)
 		 * Shrink PIO access of root cell corresponding to new cell's
 		 * access rights.
 		 */
-		vcpu_vendor_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
-		for (b = root_cell_iobm.data; pio_bitmap_size > 0;
+		for (b = root_cell.arch.io_bitmap; pio_bitmap_size > 0;
 		     b++, pio_bitmap++, pio_bitmap_size--)
 			*b |= ~*pio_bitmap;
 	}
 
 	/* permit access to the PM timer if there is any */
 	pm_timer_addr = system_config->platform_info.x86.pm_timer_address;
-	if (pm_timer_addr) {
-		for (n = 0; n < 4; n++, pm_timer_addr++) {
-			b = cell_iobm.data;
-			b[pm_timer_addr / 8] &= ~(1 << (pm_timer_addr % 8));
-		}
-	}
+	if (pm_timer_addr)
+		for (n = 0; n < 4; n++, pm_timer_addr++)
+			cell->arch.io_bitmap[pm_timer_addr / 8] &=
+				~(1 << (pm_timer_addr % 8));
 
 	return 0;
 }
@@ -145,15 +139,12 @@ void vcpu_cell_exit(struct cell *cell)
 		jailhouse_cell_pio_bitmap(root_cell.config);
 	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
 	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
-	struct vcpu_io_bitmap root_cell_iobm;
 	u8 *b;
 
-	vcpu_vendor_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
-
 	if (root_cell.config->pio_bitmap_size < pio_bitmap_size)
 		pio_bitmap_size = root_cell.config->pio_bitmap_size;
 
-	for (b = root_cell_iobm.data; pio_bitmap_size > 0;
+	for (b = root_cell.arch.io_bitmap; pio_bitmap_size > 0;
 	     b++, pio_bitmap++, root_pio_bitmap++, pio_bitmap_size--)
 		*b &= *pio_bitmap | *root_pio_bitmap;
 
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index 182e4de0..c4b7dbb6 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -1219,13 +1219,6 @@ void vmx_entry_failure(void)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190725171123.9266-2-ralf.ramsauer%40oth-regensburg.de.
