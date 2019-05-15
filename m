Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZOH57TAKGQE4GTU64I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB421EB97
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 12:03:18 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id q2sf490449lff.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 03:03:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557914597; cv=pass;
        d=google.com; s=arc-20160816;
        b=qFngQxmgZYbOSjshO1TMF2qmJdOWqKdOiE3LUrT5ft9i9s/5TQtLOfcnZ5ncf9KQF0
         YSBV5jNuDyw2/PeZBIndY/Owi89oBcm2lIPBbGwqCd2bdbR8pQMwl258Km65FsNpM6xp
         WMrMZ8AjRsLsyrdMBCNeVQUWnIWmhYSr0wM5zoFjVQyDULWSRdk2Dy8scceoiSVGqD6e
         pt626HpQFf0iyRsKGpMuSt0JOXLYZeGgIGdWPqmxrXVMbqVjrOo5Ggp118QUzT4Nuu2v
         F/RNnCAGY8bijNMCHILSM4HantxFhgEhNOlgv8/bgp8WBTpozkL7bIBA0LjuGB09F2uB
         HYyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=NslGkqoknTx4FrdmNc6tp8N1mpBUySkPCD9MJv5wdZE=;
        b=snqotxs/5R/4ea4yLLriT88UDYnUCgIkCgKzK971fOjtq3dREJJzNJH7oBhUCHpN2K
         EqfCdd0BQTRPAymoArsp762urRbKlu6ThRbPNF1HWCRMGETc6nknWDoIQvC5A9ll78nB
         HEId+AqGQILRN/U9v7Jk0VLIrzFD0ddAgh4L6MyuAZ0crRgP2EB/hdTfagUo4RTOsXSp
         8SkKB2hOBXah8nHTtdBKkTz0+h04JiJD9ig1NKS14EUIks2SDT4x9pUEmDgbMq6LV6qm
         csaULiIT+dgGNGiQIanAHcllPWfjB5VT6ooCpL5ZNJB0iqUjYAI51RIBusjKyv2t87VB
         AYtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="QmyRIJ/C";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NslGkqoknTx4FrdmNc6tp8N1mpBUySkPCD9MJv5wdZE=;
        b=CmlKAbCy/kNxTLSYF6pXLqAePEPWVQtM83uPgv5SLGegIKKbM8KDIhN4TEeO3jL+JF
         pIps4th1X7Q5j4Zl2Fk2eZbu8U5VYR3qWSFVvL2EDrjbAOC4EJF6EcxtKn7X2G5AWeWh
         v+d6i+b+gDCRTQMDMVv1OpCuS7AbRjhG8JDaDKDW/S6wICsTjnZoPZwYmwSsmYtK+ygT
         3YxrM9U12S64bpka+LJXiz8PUcqD3nQWfjZs/DfBIomygRZ4w6BP34lUDlGW8fvsJ9D7
         AB0HrfkAHmtwOaAiBnCzTpHY5rqrSqfU1KIFfT5fmdIkhw+QfTti2eYcBglyhZN7WqLl
         deqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=NslGkqoknTx4FrdmNc6tp8N1mpBUySkPCD9MJv5wdZE=;
        b=gFeCC9EnKZI0RN8newuX5o17Bzw5aQvYC/eRcw7Cs6kiIeCqASj5cpuFlB0rFVOU/Y
         SHfX4VdwAbi3e0mb7z0CUn7qSxBwJgAMFadpNGiJ+gycVj0y1LA59kPAGYt5TeX3eA5k
         66TOYT5APRiKbrLdSBvAA54h3gax7tj+TbyqDXx+ffXAxCWts2w6C3JvgVGYX2LeekcO
         ZWqa0LZBeZchOwI4vyGFUS8XOXzucrzl1aRxZ4obNVo0wJ51iu0EkGMahk64P/VUfhJG
         kSqR8jMW6ctslmT2USvS0YSNl5217faFeZkBdiaezIzA4nsl1hZJvKfa34mgJESIkrT/
         HYEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXIlNFOrf04L8/4G6zqLnBStt5WpnduycqdgJhTNnLdRArrmHFa
	9eMuIIJkpsbLMDEMbY5a6lU=
X-Google-Smtp-Source: APXvYqzoepC/e65sYIgRQrOOekYZWhuNrTsDskhpGJUSiXKUF1IMAk03DJ2bYf7DJ1i1YdD1i518nA==
X-Received: by 2002:a2e:96d9:: with SMTP id d25mr19021863ljj.78.1557914597848;
        Wed, 15 May 2019 03:03:17 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8998:: with SMTP id c24ls182266lji.15.gmail; Wed, 15 May
 2019 03:03:17 -0700 (PDT)
X-Received: by 2002:a2e:9d12:: with SMTP id t18mr20027086lji.163.1557914597298;
        Wed, 15 May 2019 03:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557914597; cv=none;
        d=google.com; s=arc-20160816;
        b=O4k24W6tvtEAAjBloJHC7szTvM7AkIzCabGB7QFJPPYwqSw4iESSEyNbuaq6VahBOE
         RHCLYXnMZkokf/fGb+FMbePXCNdC9uvdJ8pIaZ76O+GXHizL8LCZ5fhGysU4/MHsZkqI
         QiyDmXzCVQ2phNgnwTWK7TCZqPmWixzpfJAZlWUBNQEWcSR2j5qWGfUejdBI9CFzvgmA
         smXZyEicr7XKaKEk7TDe5LmC/vFjKBbzlCzGRbu/qPhVoKOwiPWEXNl2z64qj+u1oOhU
         i2hcunQZtx/kQKc+rPkjweW0FjLuDrQlrxPYh4b4Pc+gL9AS0EaRjFtwE0E1JEyBG9GP
         ANnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=csW6HTxf7HinsX5leKcXgeWsrSegRqac/Y0iNvb1hdM=;
        b=XAJbPVlDzJnkfPhtMq2dP7Mfk1gFGA3HPEHyb1LFsnWoDFhd1rbI3D8/bZ9mRSzM3A
         IxUpmHrAnWjWChCInhtqIAzJAduevsyJNVmOUVkbROBTKOF7WuMP/MY42J0/Lu6LF9Ep
         vmPkc4Tv1ErlBMKnm8IvNfhMuvqoondt4kFlZYecABUG+ZgMJDaiPrbTItdbJYbAKx7V
         geNlUCHXN9FLUXJpc6SH1enmzuKCsB1vK//yw17C5x+4ugkeyOrIqoassiqdTLAcP+e8
         7zuACTSkMAtytpJBoYcoyQkJf7g4nYJvqONTgEQR7nYGlF/updilSZLi39zslNR8zVyO
         CzWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="QmyRIJ/C";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id o20si136744lji.2.2019.05.15.03.03.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 03:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.54.22]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0MGRMG-1hVESy1cyO-00DF76; Wed, 15 May 2019 12:03:16 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 3/5] inmates: x86: Refactor interrupt handler
Date: Wed, 15 May 2019 12:02:29 +0200
Message-Id: <bc75ae95de6346013d320dc85708aa737457de84.1557914551.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:7ULUcsYG4nKFRxvFg5b6GqYW5JCenG6ED9NFpTjkcZuSMtCvJqL
 l7KPsFlC520A6nfWPMXFT5Ta+Ph6fsJN2lpYDZgad5W9SPwv1iMGWPi84dSnXbnJcYjEND1
 L+WQv0sK+89hvdW4BkBn37eXHKP0i+REif0jKvMe0JGYa9F29ZSW0WDGp2Z7wC3cuD4CPp6
 jMiSkBq7plyAicjuqjk2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/egoZBiY40g=:DXop5sSs1B3vgA+W3WJ49s
 lDOAMe39bYWCLFAATZWIeS8E0rECbcy51Rjjd8Z68rF99CRXW+8b86VwWJORYgg5rgdK4UqQV
 WTXTtEMvp1vv7R1w1IqCpqcSmuIV3aMrurh7BwhcqaUlUGcIc4lSvJAz3OTthCVMLIr1W1Hiq
 mUJJK8lWEH7Rk7LMvmTnDwQNYQdtVnC9vKkvZXpjWCIu8py19T+8PKNLSA65bADUPzBK6TG4J
 IbiVzjiBdu4gU30zCtkBiSUPe/o+jGa/4kfOHvgP/JhZj/Mg9MDCC49DyGwX0IVCnvJlKi0Nn
 EpWlLP4yk4hfcRMmyalmu/HzSxTzfzO3GgHEMEfdaBAg8/E3Oyqrq3mOEgsBvtvYR+3pZQKoX
 saRKW4oGiZ35mjeZRHCXNaQLWX6jxSLYB749FETLYtaTerIQdQXaV/z+SG9GQA360BIgQ56JU
 AxqlHqnkXRFZvFkmDU/L9KiHBTk/Dw3KM1eqFFZBPCkbPwthNWbwrXcZtNtJr+noljFJ9I6BK
 v048bzxNi3xmm/n/iksUn+GfYk3agf61Z0/J8LbbG826UsMULNr2MJHokzYF4xXHoAu9t+AmU
 UE/UMoQ0oQIdPjV1FJmRxPeVEahBsKuQLr+ya9rq0p/QK5vlcs091l5ik522ZjZvO18/JGVZV
 i3phdIsSqFAyPVSq22G3aBQDu2eN7GXXgq7AMRyHpWcqB6zBEx8779kEBwhDjjbg2qhjxembU
 ijWvIURPwgAFS4rS0wdmi0neekkJWqICKMPgti61pLKUBQJ0eu8sj678NC3BB8TGuRvQaSEqq
 AXGdHJpqh0DlbY/ZzFR/zeCBHituEuCKQi/i5KZKoD33g+9JFA2KiiSJL8U/yKBVuCL9uCPda
 O0u33KgeU74QO5hnJoobE+Mba+zgSmoSfNTDd450bVKr3FQrV0peq7RFAuvsjA
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="QmyRIJ/C";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This removes one call level by directly dispatching the target handler
from the assembly entry and also doing the EOI from there - micro
optimization.

Also limit the supported interrupt range to 32..63 so that exception
handling can be established for the first 32 vectors. This effectively
removes the possibility to set an NMI handler, but those are not
supported by Jailhouse so far anyway.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/x86/int.c | 50 ++++++++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/inmates/lib/x86/int.c b/inmates/lib/x86/int.c
index 4f760589..e85e3e12 100644
--- a/inmates/lib/x86/int.c
+++ b/inmates/lib/x86/int.c
@@ -38,33 +38,25 @@

 #include <inmate.h>

-#define NUM_IDT_DESC		64
-
-#define X2APIC_EOI		0x80b
 #define X2APIC_SPIV		0x80f

 #define APIC_EOI_ACK		0

-static int_handler_t int_handler[NUM_IDT_DESC];
-
 extern u8 irq_entry[];

+static int_handler_t __attribute__((used)) int_handler[MAX_INTERRUPT_VECTORS];
+
 void int_init(void)
 {
 	write_msr(X2APIC_SPIV, 0x1ff);
 }

-static void __attribute__((used)) handle_interrupt(unsigned int vector)
-{
-	int_handler[vector]();
-	write_msr(X2APIC_EOI, APIC_EOI_ACK);
-}
-
 void int_set_handler(unsigned int vector, int_handler_t handler)
 {
-	unsigned long entry = (unsigned long)irq_entry + vector * 16;
+	unsigned int int_number = vector - 32;
+	u64 entry = (unsigned long)irq_entry + int_number * 16;

-	int_handler[vector] = handler;
+	int_handler[int_number] = handler;

 	idt[vector * 2] = (entry & 0xffff) | (INMATE_CS64 << 16) |
 		((0x8e00 | (entry & 0xffff0000)) << 32);
@@ -73,43 +65,53 @@ void int_set_handler(unsigned int vector, int_handler_t handler)

 #ifdef __x86_64__
 asm(
-".macro irq_prologue vector\n\t"
-	"push %rdi\n\t"
-	"mov $vector,%rdi\n\t"
+".macro eoi\n\t"
+	/* write 0 as ack to x2APIC EOI register (0x80b) */
+	"xor %eax,%eax\n\t"
+	"xor %edx,%edx\n\t"
+	"mov $0x80b,%ecx\n\t"
+	"wrmsr\n"
+".endm\n"
+
+".macro irq_prologue irq\n\t"
+	"push %rax\n\t"
+	"mov $irq * 8,%rax\n\t"
 	"jmp irq_common\n"
+	".balign 16\n"
 ".endm\n\t"

 	".global irq_entry\n\t"
 	".balign 16\n"
 "irq_entry:\n"
-"vector=0\n"
-".rept 64\n"
-	"irq_prologue vector\n\t"
-	"vector=vector+1\n\t"
-	".balign 16\n\t"
+"irq=0\n"
+".rept 32\n"
+	"irq_prologue irq\n\t"
+	"irq=irq+1\n\t"
 ".endr\n"

 "irq_common:\n\t"
-	"push %rax\n\t"
 	"push %rcx\n\t"
 	"push %rdx\n\t"
 	"push %rsi\n\t"
+	"push %rdi\n\t"
 	"push %r8\n\t"
 	"push %r9\n\t"
 	"push %r10\n\t"
 	"push %r11\n\t"

-	"call handle_interrupt\n\t"
+	"call *int_handler(%rax)\n\t"
+
+	"eoi\n\t"

 	"pop %r11\n\t"
 	"pop %r10\n\t"
 	"pop %r9\n\t"
 	"pop %r8\n\t"
+	"pop %rdi\n\t"
 	"pop %rsi\n\t"
 	"pop %rdx\n\t"
 	"pop %rcx\n\t"
 	"pop %rax\n\t"
-	"pop %rdi\n\t"

 	"iretq"
 );
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc75ae95de6346013d320dc85708aa737457de84.1557914551.git.jan.kiszka%40web.de.
For more options, visit https://groups.google.com/d/optout.
