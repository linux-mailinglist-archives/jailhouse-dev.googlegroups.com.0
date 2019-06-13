Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZWYRLUAKGQE54OSEQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id E719A44CE3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 22:04:54 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id y24sf363628edb.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560456294; cv=pass;
        d=google.com; s=arc-20160816;
        b=naSlKolzwybNV0I2VMscpBr5MRoHQg9+E6jiNXrVNEQ93spqbI/iBqeqTA9kadL108
         F455FEqclne07NZ/fGIGwYCud9AxK9b6vqiFiLh/H9/G1g7ARU3Av0aWxnmDCnZinI6d
         JPzhdhzl116LCyTyOIRfB6hNa8YpNCKKcnx9Dumi2K7o4vTjzskinJ5/rCc8tqs9WiKy
         T9o5tNthCminZHGCpgRWHJyuqKwqFv0pPZf/iUjeN/JD5+wAuRONmHa8Z230Ql6ifSNr
         GW2+8XKWYFWuwNzEueU+N5HslULPXy6adnJn/rkfqi8acXml7ycxD/aWYMVfgcheLraj
         sYcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=vhUYT8E4mwtA7qnNNO5+PVKSG9VRFq24IkwltZl0x7k=;
        b=FBJO89S57R3XDmeP/YvandGJ5s4a3B6+bEyTFXCf0ybiEqd57ZtxESrxgekawH2BrS
         lIpc12WzgOpWHhb5hAqvB24w/J8l4W6/gJ0lf67qv0a+TOhD6i+haiLlen/VEDragOXJ
         RtUIDopLDKVYRaoJE5+RDBuqug8T2+NyjQTa142VQDMdw7DW+HgP+Y7McdMLt0F/5KQy
         tqFkXwTcVKgqKg/035haGydXWZ/HBvn61D63EgxM09DvdC/VCluW4tJrriopqVptFTs+
         /kR1cSyCLNr02P8+CxT4yFgku+g6aSurVB/1DgqscrQ6RvIf6bU4mBxMwZ1mgN/nmiId
         xfhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vhUYT8E4mwtA7qnNNO5+PVKSG9VRFq24IkwltZl0x7k=;
        b=IbK/K76pqykFKoiEV2gIUSPFd10LJnKa8Ji1sRx6E6Liib8BF6L5NGGi4hCYn/E6av
         f7pgWm3gfo2ymiVSgYESxw7SAUQuvgxLWSRcqlhz5LvvjwG5H7OE3pSdts8W2wco5Ich
         /R4bTiaL8TpAUsEftF/bwcWZPgka7xkudATn63u+z+/iQAGL3uI8/VDVyr75YtFyAgNN
         Mdr8Q/7ZdaOUB8K1tOT0N8tcMkM6Z8MR8W2NhO7qe6UU4fquam/1pJPzkAMjtwzGZj2m
         4uUdXbyV/S/UxJgYyLkjr6Q8TC5/YhFSSm3K0NqeZRDuAiCzvbs95k4gL+sX1IAmDDw7
         RPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vhUYT8E4mwtA7qnNNO5+PVKSG9VRFq24IkwltZl0x7k=;
        b=gCZzUSJaEQUoMQItjXYu3KXMCioOgsWS0f5aqZOBV31alVhPDHzmkGJMwJiTn5AB+h
         zcBqle9+NoCgOpieQoGIqRAFgtUvYi2Mryj4pg+EWoP1T2bgRNMeAn3vIYsdm+RkzQpO
         EKRIHWff0frEC01P3wrkEnq5ia4/NfwICtcTE+MYT++aORUxlPXGrCFY+J/f0v8eitmG
         1ePVsfqgGyqCpTlO+CjoDqCeOSjlg8Ji5W4MD5tV+9X2c+Nf44FQyiekHYacBOsSVKqj
         pHOQfe0VsgV+QdukBNyDJzrBFRGKtHDLScwr7WH2QyuVWIUb9crEk6zxFaGU4APjCm7M
         7MvQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVfUOt2roVwG7VkhpPPmzxObRdSAM9lU8uS/ho+D2eDG54qblIC
	+HVQNxpdQZdr18AxmEeyQ6g=
X-Google-Smtp-Source: APXvYqwS4CoFwGpZthiKCLDs4GJSIs+k+HJ8I6XrEZwRrVv5zmHS/s4Lo4rdPmlV0VfW69CgrtB2Sg==
X-Received: by 2002:aa7:da03:: with SMTP id r3mr46748487eds.130.1560456294731;
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:2f91:: with SMTP id w17ls1613019eji.16.gmail; Thu,
 13 Jun 2019 13:04:54 -0700 (PDT)
X-Received: by 2002:a17:906:2415:: with SMTP id z21mr59346528eja.211.1560456294285;
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560456294; cv=none;
        d=google.com; s=arc-20160816;
        b=cS5XmL40e9bwaIwloskuNGz0/wuE9s/ucbLTByKZ2AXesKQTR071AtGKuFS0UmwYXU
         03KXokTs95Nh9nYYEi6KooVWtermZejjT1w0dfkGCYq12kg07TX7KCWmrx+RwAn0JqOu
         SdUIVZo9wiBfAgqWXnrEEwcU+zcc6lX7wd14iSyY8OvyWE64FZJQYUXZWQGX6UMedqo1
         ZA4sF1XNSqHlmaWIAITrOaTBKLtm7IFX/evYbE6uHNjyvDqBI6WxJNlkJHY57GFgkNn8
         zzy5nzmUQ3PXMnsj866fnrhxootrrvVUJW/gwE36hDw+6iCrCzduRdXVRfmgMsSlTBXQ
         +jGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=jTWqxmkGZsGvu8l6ZuhzB47+Ou/l5ZcDh1M4KmDwLMU=;
        b=0X0evuOfi6ESHaN43LCbuX2Fx3PIJ2RyAzAiYFBkksTptfPpC1WA9JmplnQUvbuKnE
         Jinnj14WwEgWNCyJt7W3nYkNE3gkQGZnoviMPxReUztRlxnqPLyduuSiDPWZzTO2wrQw
         cTFqdleQbNQZDaIauljcl7K1+2bGISgw7Hl/FTNA/DRETa/h5kOISyi3ORSHp2n+nK0q
         Zg3qx97ftklm5IjM+hmDyHeQIl5WHZic9sUdkEcwLW73sTG72HT7PNEew9BFssaUgnJq
         m/DqO2udSyo+nvb2Qe+TnlJ9D0+oTf9j0nuicZTha7iIccyyG7QWid1XfMIFrcNewSQD
         WSHw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id h23si43312edb.2.2019.06.13.13.04.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Pvps5yYhzy5M;
	Thu, 13 Jun 2019 22:04:53 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 5/8] inmates: x86: Add acessors for different system registers
Date: Thu, 13 Jun 2019 22:04:39 +0200
Message-Id: <20190613200442.18984-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
References: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.13.195416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.11.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Add R/W accessors for CR3, CR4, XCR0 and implement CPUID.

And use these acessors where it's already possible.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/include/asm/regs.h | 77 ++++++++++++++++++++++++++++++
 inmates/lib/x86/mem.c              |  3 +-
 2 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
index a004fdd2..25fb697d 100644
--- a/inmates/lib/x86/include/asm/regs.h
+++ b/inmates/lib/x86/include/asm/regs.h
@@ -48,3 +48,80 @@
 
 #define MSR_MTRR_DEF_TYPE	0x000002ff
 #define MTRR_ENABLE		0x00000800
+
+#ifndef __ASSEMBLY__
+
+#include <string.h>
+
+#define READ_CR(n)						\
+	static inline unsigned long read_cr##n(void)		\
+	{							\
+		unsigned long cr;				\
+		asm volatile("mov %%cr" __stringify(n) ", %0"	\
+			: "=r" (cr));	\
+								\
+		return cr;					\
+	}
+
+READ_CR(3)
+READ_CR(4)
+
+static inline void write_cr4(unsigned long val)
+{
+	asm volatile("mov %0, %%cr4" : : "r" (val));
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
diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
index c6903897..e391f2b0 100644
--- a/inmates/lib/x86/mem.c
+++ b/inmates/lib/x86/mem.c
@@ -37,6 +37,7 @@
  */
 
 #include <inmate.h>
+#include <asm/regs.h>
 
 #define PG_PRESENT	0x01
 #define PG_RW		0x02
@@ -48,7 +49,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 	unsigned long pt_addr, *pt_entry, *pt;
 	unsigned long vaddr = (unsigned long)start;
 
-	asm volatile("mov %%cr3,%0" : "=r" (pt_addr));
+	pt_addr = read_cr3();
 
 	size += (vaddr & ~HUGE_PAGE_MASK) + HUGE_PAGE_SIZE - 1;
 	size &= HUGE_PAGE_MASK;
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190613200442.18984-6-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
