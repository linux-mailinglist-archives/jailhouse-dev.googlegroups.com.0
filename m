Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIN5VDUQKGQE3IRXD3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E3F67BA1
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:41 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id b21sf10521117edt.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041441; cv=pass;
        d=google.com; s=arc-20160816;
        b=pmWmoIdSEBXpVP9JWwF3jCrtWQHkVGUa85+v+QTJf2K/C08QryPW+Zf0XIkTAscLK/
         qDdprfDLia31O9J8S7SGI65+Tj419ADSQ1R3EJKuERGISmINMgnLwMJyB6aoreh5rzbR
         ekKP3gCRlyoExBDWCRA1Uuox5EE5hHbh2AGZMhNBc7cXvRW3wBXv4DBqf2xOUETvjzxD
         UkmhOt+EB7P5ymvA4jIqg188nOb+uUtlXf1aeo6ziD1DplOlXH4BcDJQsqLqMG+v1l20
         I2ZHOr4Z6uj4CSdPQMxKSq25ZQoH7wSA/l7llo15UGLwlPcWRmrt3KtE34et9Y7EfRzk
         EdiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=RftmraXsCqlgLrehKNrGVzhrXAAGrocNPkAU5EeloAU=;
        b=iCyW8SwAxjb/Epdag20SSgvj7LUBbiBwsS2ReEvGe833xkm9MnGRfIjFgmJ9sa+P6V
         GJUAkdzm06DMtOrrpF1cPGTggP1Xc66IsAF4UXKFkHOpAtbTi2UG+egyLqhun1orjD8C
         EqR3dXaEIS1Dwyx21MFVuPU8TPR9I0MBnBOCbsTAjMElkN8zHtr2DxYTt7jjELs2EP55
         Z7vSAAQsEBEk2Ghx+fk6cAmBEWy14gR6NkG1dX9ZJ/JYrBi9+oHKVrPAkFsVroGOtZjO
         g6qZPRiqKP1FuMh9XqiR46dx7J1C3bjnzekKM2Nzouay7vAhBhrOq/FGGYDV7Rgz97f5
         QBjQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RftmraXsCqlgLrehKNrGVzhrXAAGrocNPkAU5EeloAU=;
        b=QGv72oCK++UzKLmhqvz9n6Mz2MEFmwnl8A0+3WnxvcOIiTE8gqJzK4WVPuC9I1OVeJ
         bcoQDn5YuuaQwGp1VZ4tqqegoA+XjuaPsbnD98Rf1UUkTG+OBXwBkxQgpZImB9238cBq
         bbFdHJfAvEr1yjW++hsQgM3PMXAiUJ+UP6DqsRWGJugvH3Xs3Fwn6UVQhCjOKSY8RXjv
         tEqYnb0X5M5kVh+NCdoIlx7f8aoTakSZ1lizKL0Fj4AQXDfMibbbKru+WbKh9noSKsfa
         sVXCpUDJan2LUqkMYJfVqgxkdvRMlltVswQKoFWFvKikis1FZEAPX+dzbrmH1uMqvmX5
         SoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RftmraXsCqlgLrehKNrGVzhrXAAGrocNPkAU5EeloAU=;
        b=oLtOAcoyPFFqfQlR4+uO5G7LPGfAkwHz57TP+HhfF0PNGK/UaLlgdcZLN3hqVUhvj9
         w2WbEDDHTLTQR/HtWPHcMZtqxwkUbdjiYHuaRLov0+tMNsbJGsmyNxPPOZwQTSsKUOTI
         w1plOAaXxuZAr43v3+j3B2r3/dbucxBAuhjeWpKObB76pKGRLGO3qiagMtCaOPLJCZXQ
         3TeE9ImUvjVUbGLyNdyuFEXtGaO1K/mYLxOYAlLEz5lCltrl3VSbvEOkxfWKgllmlDiD
         agbkkIv+4ZsII2KVvGJ8wzYG1cZq0Ry2Lo6TBKeF74Zh2NuF5vAi9r7V260dVvLsYgKC
         8iPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXPakN8mXzoRK+FV6x2QMPLaQQ14KZg8Ma1hAByg9eoHz3+XKdo
	Mu4C91LiaNo1X4RPRg//sX8=
X-Google-Smtp-Source: APXvYqxSJpKXcQQXad7xGGCpN+BGaBAZf2/3I0xXBTkBLelo9FchY7IJMCGw9TsPAMoYGAafON24pw==
X-Received: by 2002:a50:fc18:: with SMTP id i24mr15258029edr.249.1563041441570;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8908:: with SMTP id e8ls3081038ede.4.gmail; Sat, 13 Jul
 2019 11:10:41 -0700 (PDT)
X-Received: by 2002:a50:ba57:: with SMTP id 23mr15744321eds.196.1563041441056;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041441; cv=none;
        d=google.com; s=arc-20160816;
        b=Tq8zMgIcWCwh1IFsmNl0DxFbZ1eAOIsPGzUupno1hoEflsyyYPC033dgyfuBMDjK1k
         spXSisHIZ7wI1Wbozcti+HPZ/HWPTNVQTJXHO5nuEryyTwtOPy6AMjH7wslVPpJoIRUe
         zQyU2G6hMqWrJG7WyqSkQv5sFCpEuK1KS4eriTnJPe4IjHhwvCP7PnUuw/0nACEz6E0G
         f03FGPOw/XiX5ezGBHDUAN6es/IDmeVmHI1dHVt58iOSXLVS2sR23rwQlk9mjOL30U4V
         KLi4TcXRyAw1BntlHMpezt5Z4T/LWs24Uq6OfQ33W7M97ImG4ItH+tPItgzqc2e1rR7s
         gdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Faa1rYBU9BglE1x2MCMeDPV5hl0shl+it3GMveSanpo=;
        b=quHfFYMmVdkZEApJ29UZp7IV0qRpbKoP1DC108Me63nYz2oJJF57igzeB2jdRwTTh5
         p792LvxcgQU6V68XHCIadYNfaKoFkXG97++A4h0/Q3iMRQZN92XrTsn6AxhgR5L05CoA
         hrzUski5dVx49GHbgJ+CRQf3kVLKmB3oi/uR42ob9aFQHHPt4dAOjJgX+ltSZqsbn6IL
         Y3XPb4EQUUXNJ1LcnXgosrXDHuYUg+e0x7/zIvCXSlfUVb7n/MUPD/7sYFQ0ZiAwxOWI
         K0LZKwSYQsD1jKi+lp4o+JaN9zisT7hJyhyDpBUnhdevDC6IwWFmRf/zL5PyRmjPrAAA
         cnwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id b39si882588edb.1.2019.07.13.11.10.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsD441Bzy2f;
	Sat, 13 Jul 2019 20:10:40 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 08/11] x86: simplify check if i8042 needs moderation
Date: Sat, 13 Jul 2019 20:10:34 +0200
Message-Id: <20190713181037.4358-9-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

By adding pio_i8042_allowed boolean flag to arch cell fields.

With this, we don't need to directly access the pio_bitmap in i8042.c. This
does not only simplify (and speed up) the decision, it will also be helpful in
future patches.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/i8042.c            | 6 +-----
 hypervisor/arch/x86/include/asm/cell.h | 2 ++
 hypervisor/arch/x86/vcpu.c             | 8 +++++++-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/x86/i8042.c b/hypervisor/arch/x86/i8042.c
index a7d7f19a..d98b6903 100644
--- a/hypervisor/arch/x86/i8042.c
+++ b/hypervisor/arch/x86/i8042.c
@@ -21,13 +21,9 @@
 int i8042_access_handler(u16 port, bool dir_in, unsigned int size)
 {
 	union registers *guest_regs = &this_cpu_data()->guest_regs;
-	const struct jailhouse_cell_desc *config = this_cell()->config;
-	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(config);
 	u8 val;
 
-	if (port == I8042_CMD_REG &&
-	    config->pio_bitmap_size >= (I8042_CMD_REG + 7) / 8 &&
-	    !(pio_bitmap[I8042_CMD_REG / 8] & (1 << (I8042_CMD_REG % 8)))) {
+	if (port == I8042_CMD_REG && this_cell()->arch.pio_i8042_allowed) {
 		if (size != 1)
 			goto invalid_access;
 		if (dir_in) {
diff --git a/hypervisor/arch/x86/include/asm/cell.h b/hypervisor/arch/x86/include/asm/cell.h
index 71bd9976..33697498 100644
--- a/hypervisor/arch/x86/include/asm/cell.h
+++ b/hypervisor/arch/x86/include/asm/cell.h
@@ -26,6 +26,8 @@ struct arch_cell {
 	/** Buffer for the EPT/NPT root-level page table. */
 	u8 __attribute__((aligned(PAGE_SIZE))) root_table_page[PAGE_SIZE];
 
+	bool pio_i8042_allowed;
+
 	/* Intel: PIO access bitmap.
 	 * AMD: I/O Permissions Map. */
 	u8 *io_bitmap;
diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 8588d399..9caba92f 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -114,9 +114,15 @@ int vcpu_cell_init(struct cell *cell)
 			cell_iobm.size : pio_bitmap_size;
 	memcpy(cell_iobm.data, pio_bitmap, size);
 
-	/* moderate access to i8042 command register */
+	/* always intercept access to i8042 command register */
 	cell_iobm.data[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
 
+	/* but moderate only if the config allows i8042 access */
+	cell->arch.pio_i8042_allowed =
+		pio_bitmap_size >= (I8042_CMD_REG + 7) / 8 ?
+		!(pio_bitmap[I8042_CMD_REG / 8] & (1 << (I8042_CMD_REG % 8))) :
+		false;
+
 	if (cell != &root_cell) {
 		/*
 		 * Shrink PIO access of root cell corresponding to new cell's
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-9-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
