Return-Path: <jailhouse-dev+bncBDGIV3UHVAGBBQ5542RQMGQEAYKXNCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C971FB5C
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Jun 2023 09:48:21 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id 2adb3069b0e04-4f4c62e0c9esf1323769e87.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Jun 2023 00:48:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1685692100; cv=pass;
        d=google.com; s=arc-20160816;
        b=wdgp7xbBJzEugmBj38jSGN3Itww+ELFHRpHQnohowyypphkA6Ym0/BIEtsL2lxUmwv
         LoC7fQr7PcdlkFOrntiutTi8CCMIU3VkV6oVgLSkIrx5j6EsPs1N61QT5EaNpsUYGmbz
         K/C+vtbH7gMXS/nX8AWOKoNyg4zhuHUVuJCxSTWZUUa+EEE8dkVFzAdJCy9/QmzMMG5U
         u4B83OSefdyBI1PzSYzYa27qzheIac5+umSZeUehMIGOsnV8GkxPToS9G08n3k7nhwtq
         dV0rk8Ps3pWLrE0scApArao5MqK0ow5Dlw+cdMJ431qU+duuh1+aKwZ1MTTvAl5jebM3
         w1Lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=JVhCmuyEiS0tJTOR/TmrcAgeK2g6E2/CxFT3FKlOfO0=;
        b=Er2Rp9xf4uCyouO1Ln7w/umKmtIXxij61EUwwqXdGsk6lNBoB6JUHFnNFWIZ0Q0ALs
         AOyRFhcYApbsEJpCe/MmuYMn+lk25dLpb3goPUk9o5QkNNq6ZUjl7uKWj9uUN7m2Owgo
         Y8/byXfN9V5FrrAAiiMHYC1KLoBDVoykgMig4Bh16Zm6MM9142j7kJq9N3yvzebz56hC
         RtHXKPuoNH2OH4BVR0KC8n0EOgflfzxZTJaADQt1saXKPLIij88SYVmzl5r3C9fAE/jl
         gVucTtQpkm7eLBRM5WRPBvyf6For2hQVygf7Hv8tEIhYPUFnhNcAAg83RRYOnYFU7EYh
         Evnw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=NPHTlTuH;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=kdwYeDb6;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1685692100; x=1688284100;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVhCmuyEiS0tJTOR/TmrcAgeK2g6E2/CxFT3FKlOfO0=;
        b=OGLou2hR7V2C5Vh9mA6n4PUz2mEkcpmAplGvp17rlMewOhjuuXhoH2qtIuGdCe/rQW
         17oDbxwtnIG6G2AxuGckheBnRg44+wEZVsKapVNJfKWJu/i7vpkM/T1/tsI61ZXe30Yp
         8hHXrx1DNtGgxRdphS+2wBfE/fNXskUxKLSFlEqZWmGVBDgaYVjVUbaXP21GF81nvj8b
         6pj8QdpZF85JwVnCL6G+35O1danHPeS8dY0KIOW+hyTg6JGjI6E+vLJJhpXrzTIZmPUg
         EGlbOystg3bUazk3S45dwvD9roriiux4Hktsi/19HO+VseIXH8UAGSGfElbU1JDIlTZk
         dgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685692100; x=1688284100;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVhCmuyEiS0tJTOR/TmrcAgeK2g6E2/CxFT3FKlOfO0=;
        b=K/vulTvz+rHgZabVRPw5gtBfC8cTFELp5HFSTc8HEy4gIELWuhsgHk+ufvE0jdfXfz
         ZjfoJDdy6OqAyq82z2j9TJwrv8VWJQ2hPiQfppr5oh59et7G6J1SLRoPVGfxphrbovCZ
         qMhlM6dhTmAbnRPd3EyoVJEULx/gqpzTOPjsjHNoz2vBk7NJmdX6JHpofHeXWARmDG3C
         QJdhFKzf7tkmVf0GnM52IUKqYEtRJABEQBKfUTw/CQSTmOUzToaKmdpfAZ+zK7xzmU7b
         4ka6z7WcGBczyAkCpRWPe+S4ok7Q7udj0dLTtTB7oxNgx4GIo2O5ptHHCoOIoxINtGV+
         Fe8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxp/pX/6ghTmlebgnj9B7faI0sMicKrnKh2n1s3qIL52Qsojq07
	I3yAciUopbwK3b9h550SFIw=
X-Google-Smtp-Source: ACHHUZ4R46552xnZq00fiF0w3nwBm6BNqM5vVSK5szy5WNa73t7wp6beGUUusQkmrTADyuJsWXAHIw==
X-Received: by 2002:ac2:4465:0:b0:4ec:8615:303e with SMTP id y5-20020ac24465000000b004ec8615303emr1505366lfl.33.1685692099606;
        Fri, 02 Jun 2023 00:48:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3288:b0:4f2:71a1:53f1 with SMTP id
 p8-20020a056512328800b004f271a153f1ls23938lfe.0.-pod-prod-01-eu; Fri, 02 Jun
 2023 00:48:18 -0700 (PDT)
X-Received: by 2002:ac2:59cf:0:b0:4f3:7b3c:2e16 with SMTP id x15-20020ac259cf000000b004f37b3c2e16mr1206375lfn.39.1685692097907;
        Fri, 02 Jun 2023 00:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685692097; cv=none;
        d=google.com; s=arc-20160816;
        b=idRmTNv7ASrS6S0hImPVqMuCnz/06bqC3LUe4SmAYWtu+zqddA++Qzukeu3QKT03n7
         oLs1unqwoUv6tR6nAsJIoLwRyCnglT8uUuvLs9BzpC/YnVx7aCZV+Nm7WozlVw3tzM8+
         9xoqd4GLBr8aUSzYsDLxBjbF45BXhIpecSZZd+yV9pGR8DoSIkRl33BMFrQK6KDHYBIZ
         9+E3TP3REpwH9v/5zoObSaf1x5pIsezbztH04rNk3LFhAwUgsCQkoIHmP1x/yunm1bEc
         rdGM0VPtt+6vGJuyb5XELtsrNvbATOlMIQyelr5Av8vCgSJZJJrvCfJpU8Qsq2KFOAMe
         c7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:dkim-signature:dkim-signature:from;
        bh=EC/D/M0zwOtgFPG+gHM4SAFy30FcYwTWFcUaxDzRBz8=;
        b=au5LikyHoYbHIU0kyOA9L/2jyAvexiWUfrvl9I/IbytKLT/JNcrLkln+LqewKZZJkr
         VqPOJ/BuO/T8y7DUB57SZ500hgkSnLUl5WXqkkNnwmsWf5UW1eTu7boOkANI39qWavlX
         Zrjn/HfavAg2FZy1g1NprkDRDVciAgbmdZxOFOcmF6ywcRCZqT5beHCx+Sn4gy59njju
         D1tXG0cHRj/oltR4dWLdZGxSeTtFq1WxtA4a+ym5Q9l70oWLIWVdYi2nhjR/Xl9MTTB5
         siAciL0ZWrBENl8zJ5jZvjVF0AMiCOmOXf2aNMtt/rV2RdZsSBBtV+JDo+RGQ7Ak0n/7
         q3Bg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=NPHTlTuH;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=kdwYeDb6;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id h15-20020a0565123c8f00b004f4e6ea3713si40932lfv.8.2023.06.02.00.48.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 00:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Ulrich Wulff <ulrich.wulff@kumkeo.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [RFC PATCH 4/4] arm64: Set HCR_EL2.FB.
Date: Fri,  2 Jun 2023 09:48:08 +0200
Message-Id: <20230602074808.1383333-5-bigeasy@linutronix.de>
In-Reply-To: <20230602074808.1383333-1-bigeasy@linutronix.de>
References: <20230602074808.1383333-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Original-Sender: bigeasy@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=NPHTlTuH;       dkim=neutral
 (no key) header.i=@linutronix.de header.s=2020e header.b=kdwYeDb6;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates
 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
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

From: Ulrich Wulff <ulrich.wulff@kumkeo.de>

Set the FB bit in HCR_EL2 to force broadcasts invalidates within the
inner shareable by issuing only local invalidations.

The idea is to properly invalidate entries on a SMP system. Then the FB
bit gets cleared by the hypervisor and Linux switches to UP mode. The
memory between the two systems is not shared so invalidations on the
second CPU is not needed and Linux continues to invalidate only locally.

Signed-off-by: Ulrich Wulff <ulrich.wulff@kumkeo.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm64/include/asm/cacheflush.h |  2 +-
 arch/arm64/include/asm/tlbflush.h   | 54 ++++++++++++++---------------
 arch/arm64/kernel/head.S            |  2 ++
 3 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 9384fd8fc13cc..5a0b126d0164b 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -132,7 +132,7 @@ static __always_inline void __flush_icache_all(void)
 	if (cpus_have_const_cap(ARM64_HAS_CACHE_DIC))
 		return;
 
-	asm("ic	ialluis");
+	asm("ic	iallu"); /*  promoted to ic ialluis by HCR_EL2.HCR_FB */
 	dsb(ish);
 }
 
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index cc3f5a33ff9c5..3f1b8f7970e7a 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -237,9 +237,9 @@ static inline void local_flush_tlb_all(void)
 
 static inline void flush_tlb_all(void)
 {
-	dsb(ishst);
-	__tlbi(vmalle1is);
-	dsb(ish);
+	dsb(nshst);
+	__tlbi(vmalle1);
+	dsb(nsh);
 	isb();
 }
 
@@ -247,10 +247,10 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 {
 	unsigned long asid = __TLBI_VADDR(0, ASID(mm));
 
-	dsb(ishst);
-	__tlbi(aside1is, asid);
-	__tlbi_user(aside1is, asid);
-	dsb(ish);
+	dsb(nshst);
+	__tlbi(aside1, asid);
+	__tlbi_user(aside1, asid);
+	dsb(nsh);
 }
 
 static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
@@ -258,16 +258,16 @@ static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
 {
 	unsigned long addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
 
-	dsb(ishst);
-	__tlbi(vale1is, addr);
-	__tlbi_user(vale1is, addr);
+	dsb(nshst);
+	__tlbi(vale1, addr);
+	__tlbi_user(vale1, addr);
 }
 
 static inline void flush_tlb_page(struct vm_area_struct *vma,
 				  unsigned long uaddr)
 {
 	flush_tlb_page_nosync(vma, uaddr);
-	dsb(ish);
+	dsb(nsh);
 }
 
 /*
@@ -304,7 +304,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 		return;
 	}
 
-	dsb(ishst);
+	dsb(nshst);
 
 	/*
 	 * When the CPU does not support TLB range operations, flush the TLB
@@ -329,11 +329,11 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 		    pages % 2 == 1) {
 			addr = __TLBI_VADDR(start, asid);
 			if (last_level) {
-				__tlbi_level(vale1is, addr, tlb_level);
-				__tlbi_user_level(vale1is, addr, tlb_level);
+				__tlbi_level(vale1, addr, tlb_level);
+				__tlbi_user_level(vale1, addr, tlb_level);
 			} else {
-				__tlbi_level(vae1is, addr, tlb_level);
-				__tlbi_user_level(vae1is, addr, tlb_level);
+				__tlbi_level(vae1, addr, tlb_level);
+				__tlbi_user_level(vae1, addr, tlb_level);
 			}
 			start += stride;
 			pages -= stride >> PAGE_SHIFT;
@@ -345,18 +345,18 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 			addr = __TLBI_VADDR_RANGE(start, asid, scale,
 						  num, tlb_level);
 			if (last_level) {
-				__tlbi(rvale1is, addr);
-				__tlbi_user(rvale1is, addr);
+				__tlbi(rvale1, addr);
+				__tlbi_user(rvale1, addr);
 			} else {
-				__tlbi(rvae1is, addr);
-				__tlbi_user(rvae1is, addr);
+				__tlbi(rvae1, addr);
+				__tlbi_user(rvae1, addr);
 			}
 			start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT;
 			pages -= __TLBI_RANGE_PAGES(num, scale);
 		}
 		scale++;
 	}
-	dsb(ish);
+	dsb(nsh);
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
@@ -382,10 +382,10 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 	start = __TLBI_VADDR(start, 0);
 	end = __TLBI_VADDR(end, 0);
 
-	dsb(ishst);
+	dsb(nshst);
 	for (addr = start; addr < end; addr += 1 << (PAGE_SHIFT - 12))
-		__tlbi(vaale1is, addr);
-	dsb(ish);
+		__tlbi(vaale1, addr);
+	dsb(nsh);
 	isb();
 }
 
@@ -397,9 +397,9 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 {
 	unsigned long addr = __TLBI_VADDR(kaddr, 0);
 
-	dsb(ishst);
-	__tlbi(vaae1is, addr);
-	dsb(ish);
+	dsb(nshst);
+	__tlbi(vaae1, addr);
+	dsb(nsh);
 	isb();
 }
 #endif
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index d8d9caf02834e..493c204eab39c 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -519,6 +519,8 @@ SYM_FUNC_START(el2_setup)
 	cbz	x2, set_hcr
 	mov_q	x0, HCR_HOST_VHE_FLAGS
 set_hcr:
+	/*  set HCR_EL2.FB to promote IC IALLU to IC IALLUIS */
+	orr	x0, x0, HCR_FB
 	msr	hcr_el2, x0
 	isb
 
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230602074808.1383333-5-bigeasy%40linutronix.de.
