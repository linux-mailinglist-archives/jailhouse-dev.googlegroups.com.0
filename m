Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBMEO5TUQKGQEU2AUXHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DD876A72
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 15:59:13 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id v14sf25673939wrm.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564149553; cv=pass;
        d=google.com; s=arc-20160816;
        b=RfVQSbp5r3glgWopWMf5w2+8k3EBzUco1n6hcTdUTHlavYtkrBytC5xjT7J3Om2VL/
         fMPcJb63PP7MYbwKVEAmgIV5OFEBKMMJYZO4/YdFZrAOcm7OkiD5JaBrUEzOW4uI4hxM
         QiXLvXZjfAmVl++qAE3/aA7OeSLZmuUYjQpoA6fZ50fOqIRhGZgiwIz4l55sWXmhmTHy
         u8+X15n1k4qG+O3i0vDb5jmIeaC8EdQ2awDZvVQg5ftqVAQNa4lQOWZeZw1XvDVxQ6/e
         jqi6tf4zdQKzK01r0QuwFVmvJY1AVb+EcxTFlod1oXgSKWGPCNfu5v2jRE4DEtni2YrL
         Toww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=G6kRzcf5RlpcjZcUxnBOoWydWI30GPA4vubTKDCLjU0=;
        b=vw2ENkb9M3gZvY3IDFeGCgezKiXcbCueERfTi/+hbBB59n/Qprc1wF3O6PXeJx5lPc
         CGDEuqX8EgxHACOrNGMk36JKu9c5dCpKeIK9mBZlB/KVdWgKBCyTx7cO6ASiBh7WYQq1
         pViiE07KlSwPiuf3z3DuR3aj3sv5NlepEws9G/cI6Rpr741ua8kee3saF+zzgbO4TUsv
         N9EINUmR0l8VzIvJf/PDsup2O2YjnPimtgZK6cnkiRZFnlw8YQg9B/BdC7ss8UXt4xCF
         dt6lsPKYX6OZnk1/E5AsKUNkSPo0lQEC8TPibChlQEs7eXQYdn470nEkbjGbMJTHvnTZ
         RAiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G6kRzcf5RlpcjZcUxnBOoWydWI30GPA4vubTKDCLjU0=;
        b=V2mhqlUHbpJv2X8VSu7xOHd40SgTFjtScNyD3lURJQ4m/Q33XDrouiItU5aS3CeUum
         2ZIuT4Hf7U3xYryd9/NqOkv1Phesn7MD/Z+c/e37x5Zdy3NB4oDxLa8h26+6GsvqcACs
         VSRQZUQsQ4cGjjZgn2fkRR8zT9kjPxWCc7ZVpDFoQsQBkNA+riigDSEGLwsCxBItST99
         junG+sbD7zwcwkuIPWwnWFYLkzR3h5TUNoXAD//FFlCtkOdTJfUnqSixBNrDshzM+Swh
         1NlCuspcaEPOKEPGIAw6T+gxeV22iD0M6Y2qTmXJhz7qtHsTdevSzSeJmHpv6W2SCCAK
         uUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G6kRzcf5RlpcjZcUxnBOoWydWI30GPA4vubTKDCLjU0=;
        b=RWZbGO/egACCgPd+rB0lEi4bw0sKqf50iizVbOKIG/DQD0qkCtetLiH2eku3QZ6J4A
         ks1s+eDdlM3emKw8l3lsVyGaIpUhfs1djSeMg9fAZJPpMYJgfmaZsiRYWCN/bAGJ70vU
         uyGuVWzDhpv1Lpl5TxNfrQz6+AMiq0yYKehL8jMpEU/H/hwKrypBpOIijS3NHWkz1Eam
         i5elnFtrs6uBQPW+Pvdak56cRS94XaG+YB4q/BIhgv84t+DCilNpfiPfCstZK2uxMJGl
         P+qsUlmIk/3pQEYbCm7GUHwnlPoD0/XBAuSWJ7AyLOcH3IjAE2XRmkOu9PZ90WCrTgoD
         RGMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUl7WcPwoiFUDIROsit5QXUtmZ8Kt4niyBEoWvWv8XVeqMS6zTe
	UgCNmp8cCgU8+e+lzNSnacQ=
X-Google-Smtp-Source: APXvYqzSzUfwrw01jtb0PHWGM1wsQQbWEzb5h5Ql0hLyK/f41ynzcdQrlVgn+hjWi3CjlhfreFMk/Q==
X-Received: by 2002:a05:600c:2117:: with SMTP id u23mr1165309wml.117.1564149553007;
        Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c05a:: with SMTP id u26ls18885282wmc.4.canary-gmail;
 Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
X-Received: by 2002:a1c:d108:: with SMTP id i8mr89569523wmg.28.1564149552423;
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564149552; cv=none;
        d=google.com; s=arc-20160816;
        b=fRMkaGU2YKPF6tFyL2BVa9I5yKpD+A7CO6H3//bE0W7WDYFLvvcCl1IFfTrqfwhZiW
         bLqTxQEZNlQoJ4YrgRqyFe3RMCl2cXRNlMcXzMBD3oJnMokKfjb8aL39RxZsjGSFnrJq
         40GN/PzA0EC4wDxW9uD/K88ZFD+TBDDZTMK1j6KKxTinlp6LM2sv2soXUWCJxjfluIZc
         Fw27gTvNoLliOFke7z9oN46jprB6gD6YiHPnINiRKL2k/Fmj6RqmNFE6oppmfzaMorwJ
         Eb3yqwxotpYusDg0t7BRFfP6pwFXCil8w2fVfuei7hfpraKOFJGjliezJJ/Qx1jKfmpz
         rJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=a0I2tiyQ70MYI2tNpvdgsIO5102uhYWrzrY6UBON6h8=;
        b=ks76kvZjuUwJkniRCukznIkN9RgxqAqLXV5VxE5Jwv6DazYkqrHlX3LCwiG5nCIXvm
         O+y5WjG+wPn9+bAfhMBQ1+s3GtaSyyD3XupFw1TrWXemDC1vonlO9R+xOURshpFNOtxH
         9OIjp+BPWaBzj8wMkEe9D5YYKyEGaVFZBJc/TMAncWIHFIS2s5C2ZZXRm/c308ZHmbTD
         HFYt7prTz/Qq2MOoYO2z63TbamS+fmMSGTgWGSRytfm79VqeNS8uQxhqJJ8s3ab8gKUq
         FNbMRbkncn22HPTFT88/V0KN/NgSJRWU1UhjvmNTS/R6Pmpx1OGaLryNckBEfbRj6zyM
         7pQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id s13si3124056wra.1.2019.07.26.06.59.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45w9g36ddpzy88;
	Fri, 26 Jul 2019 15:59:11 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 2/5] x86: drop vcpu_vendor_get_cell_io_bitmap and struct vcpu_io_bitmap
Date: Fri, 26 Jul 2019 15:59:08 +0200
Message-Id: <20190726135911.16810-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
References: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.26.135117, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.26.5630001
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190726135911.16810-3-ralf.ramsauer%40oth-regensburg.de.
