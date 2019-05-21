Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB4UYSDTQKGQE464X7HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF2125243
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 16:34:27 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id x16sf3376542wru.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 07:34:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558449267; cv=pass;
        d=google.com; s=arc-20160816;
        b=shLTVz0emKbsIs16FwhmMGVbCWx7OUvuviyFZsCxCo2UAeg9x2Y/s29TaD1ADmzEpd
         cQCdSWJV9rTySO9wZN+jG8mZXVCQM7IE3Pi2EU5diSDkUZGyaLRj4SSOEOHECCOr1hBG
         ApMY2I7nQiiZXGNOrRj86suBg3mqYYPeHVKHL0jE3+jKELdIFpOLlHVBX8+wQ0YyiGqO
         7JueTZTu/Nq6DD1SB0UAduURfZ6jRxQm/0HiK7gy6PbRYwRBjmG7fJ65ydzivamzTDpu
         iIXQOwWGlXro3a3YL7lG4QVWXTyEzysTDJ2fIuOb/RGDLF+4ySiZbANS9qzLc6Wy3/sT
         ehQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=x/nvDpabtf4JRv9ctWNQtYwoXLW4K75Jb2Fg0OzfvbA=;
        b=WQXDxTlYON45vQ9KWjc16VFYBoqU1QS0dWSX0uxzSfn9OXmLiMV5c/h6QM49I5/H5r
         873yRQOpZi/OzHLwMkfjUaq3yl1vNvEiVmNUu5vE0d7V+5PugzTiLD81A52DjvOXqjCM
         6VvelkBp2BSYuyizZG/+PmJzGpGgf4Ddmuom9cTCrYzpfEavSwPclvJZQjE0B9qBn5mo
         KehFOHaW7l+PH7O6eXEuWWu//37pMiZrj3acsIlGqfER8Pm7whPTdb1PT7RS+q5dlLj1
         JKzHKab67qWVNRgowIgucstYeTJDbNXl9flCZdyUNdMXL3s9S/CV0qR2GWaImaDj9B0X
         mv2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x/nvDpabtf4JRv9ctWNQtYwoXLW4K75Jb2Fg0OzfvbA=;
        b=bFnfSq8xTO+EIpQa/L1OpKz/WEPBd5Vt3OPU2h60wLfUD8Gr0+uFrmcctNAXswLjAZ
         qwaQn0wmEB9hzQc6I/18lxLR0kSaMF1XI80xI54ywOs8zJCFVif/JxcVblzBlfhDLIja
         TFafmOkW+4KG81jItLXIr4XWZ1r5ofrpe4OysBJ99sNy/sAmyEET+pV+mFwHN3o3zaIX
         0tBIYFr2a/UyHnW5kZOuMXCLoz7+DUmtRBiUBon+913ePPojbUmHkflt79Yan5gwiGj4
         mliz18u9boe5+PmNODZDD1YxQ6MSiBbfhOOmxP6VrBJrcqNjPaPiRQeXGnYoyL5pBeUH
         W/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x/nvDpabtf4JRv9ctWNQtYwoXLW4K75Jb2Fg0OzfvbA=;
        b=dktSkn6EJPB2YOxPOQLM+CLGpTT4S3t7Kryq3ISjH/+X5DVnqIrq2yM82M5SSqWWgl
         cRTxrXCNZouAokdsQ1+ucjqp8THi7lBqUYuOXDOL9vCRfW3kvabG72yvMH59EnjZG8yi
         1M8lwG2UtMOr8gROwAjBNbvWU1Eg4a1b7vtAvkyFijUo6DxbOw5iqUycvk8iZkf7rrIy
         Y6+FuREIk3AXtEcBeMW9L5sF+cW3cNySuzawixWRj27TO0fMzOYDSiyAlmOTojxSNlBx
         pe3taeoaXKhV7oh0jKPGTJxYfZXvPAUPcZcIEJ+5ENxhpTigWjKeH6VcVGieKrXgKcyZ
         cGQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVrrBOKfHi5UmcC3TdSajeRyoTGBBrxu30+F9m+PjKvgxN3E6NW
	DT32iFMjYcX0Q5vC9dxpc2g=
X-Google-Smtp-Source: APXvYqzFkin01bpxrfGvap/nft6uiPf9haGOrt0UJu1SQtoLw5IiOK+/ZsT0rSr3C9o35voZuu1R/Q==
X-Received: by 2002:a1c:4145:: with SMTP id o66mr3456243wma.68.1558449266923;
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:97ca:: with SMTP id t10ls5096115wrb.10.gmail; Tue, 21
 May 2019 07:34:26 -0700 (PDT)
X-Received: by 2002:a5d:400b:: with SMTP id n11mr195323wrp.123.1558449266523;
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558449266; cv=none;
        d=google.com; s=arc-20160816;
        b=FsH0/OWGorMxbXxqh+nPZUcReVdYqROCQcow8zZ1BYlBYtNLgkINbVBkLJBIEHrgez
         +xznuaMKFriQdKtn+J8ng0F7+EUVLPWJ4SHQXvwgEXJDiG34BGC52ElpMHFjkXQH0wvD
         KE+TTh5F0+Iv45m6Ohvt8/TwHGdem8CHcElDMZ+Oo8SgIPW+eTsMbOKQSwrhPXX/ipNi
         gYK1JKVp+aCBKcaQR7geENs0+Q38H9GcNQuPn9q8+7vhzgBAiSb83i+E/CSaQ7I2vGkG
         41fXUTX8jgHOT+stXpliw4t1LGwpTMtrSe7SIiYCstal6DhEVlci4zgN22ms/wD6Bg8C
         /8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=K/44TIX1IzGr2+cFQ3ERw51ZDwcIcQWgyiUUlvEGDw4=;
        b=EWUYhvjnIgbIR1eDDOlM3yoiRwzNGIUq6mMf+f9lkKUWiYAqjU9gsFqUkYLKSffPeo
         Rs4q9VGSt3j3ow69cJRbp9pVhUwcOOhhc0qP9RX98xknKQJOg5i+6rvI4PTJ2TzA/xdS
         WfO8Q/k4CeUikkXykqehJfbI2zlAKJRZ5t8twe641HqQs8mQrZzAmY50dpa0GW6jzcze
         YIuKh3XA4C3z6pyrVQBn8b6pMa1E116lhj3P99+los82BtuzKvdGQlb4St89+EKrzt32
         UyeguV58+29R1Vrg7ni2rq0JxFYyw7SARcRWEQl+DC+fBvYEy/HZ8GoX0ntaqACOdQTu
         4lTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id i17si286662wrn.5.2019.05.21.07.34.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 457dZB0KwZzyBH;
	Tue, 21 May 2019 16:34:26 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 3/6] inmates: x86: Add accessors for different system registers
Date: Tue, 21 May 2019 16:34:20 +0200
Message-Id: <20190521143423.17734-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.21.142716, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

Add R/W accessors for CR4, XCR0 and implement CPUID.

Partly copied over from the hypervisor and added cpuid_edax helper,
which combines edx:eax to a 64 bit uint.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/include/asm/regs.h | 72 ++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
index a004fdd2..85da043b 100644
--- a/inmates/lib/x86/include/asm/regs.h
+++ b/inmates/lib/x86/include/asm/regs.h
@@ -48,3 +48,75 @@
 
 #define MSR_MTRR_DEF_TYPE	0x000002ff
 #define MTRR_ENABLE		0x00000800
+
+#ifndef __ASSEMBLY__
+
+static unsigned long __force_order;
+
+static inline unsigned long read_cr4(void)
+{
+	unsigned long cr4;
+	asm volatile("mov %%cr4,%0" : "=r" (cr4), "=m" (__force_order));
+
+	return cr4;
+}
+
+static inline void write_cr4(unsigned long val)
+{
+	asm volatile("mov %0,%%cr4" : : "r" (val), "m" (__force_order));
+}
+
+static inline u64 read_xcr0(void)
+{
+	register u32 eax, edx;
+
+	asm volatile("xgetbv" : "=a" (eax), "=d" (edx) : "c" (0));
+
+	return ((u64)(edx) << 32) + ((u64)(eax));
+}
+
+static inline void write_xcr0(u64 xcr0)
+{
+	unsigned int eax = xcr0;
+	unsigned int edx = xcr0 >> 32;
+
+	asm volatile("xsetbv" : : "a" (eax), "d" (edx), "c" (0));
+}
+
+static inline void cpuid(unsigned int *eax, unsigned int *ebx,
+                         unsigned int *ecx, unsigned int *edx)
+{
+        /* ecx is often an input as well as an output. */
+        asm volatile("cpuid"
+            : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
+            : "0" (*eax), "2" (*ecx)
+            : "memory");
+}
+
+static inline u64 cpuid_edax(unsigned int op, unsigned int sub)
+{
+	unsigned int eax, ebx, ecx, edx;
+
+	eax = op;
+	ecx = sub;
+	cpuid(&eax, &ebx, &ecx, &edx);
+	return ((u64)edx << 32) + (u64)eax;
+}
+
+#define CPUID_REG(reg)							  \
+static inline unsigned int cpuid_##reg(unsigned int op, unsigned int sub) \
+{									  \
+	unsigned int eax, ebx, ecx, edx;				  \
+									  \
+	eax = op;							  \
+	ecx = sub;							  \
+	cpuid(&eax, &ebx, &ecx, &edx);					  \
+	return reg;							  \
+}
+
+CPUID_REG(eax)
+CPUID_REG(ebx)
+CPUID_REG(ecx)
+CPUID_REG(edx)
+
+#endif /* __ASSEMBLY__ */
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190521143423.17734-4-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
