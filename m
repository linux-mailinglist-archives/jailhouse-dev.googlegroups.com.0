Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBQN4476AKGQEOE3PABI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDD929D24B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:10:26 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id t14sf354459wrs.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:10:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919426; cv=pass;
        d=google.com; s=arc-20160816;
        b=DGLYUE7N3uIAGvHJJqYot4LfWvsPg56PCyI931uri4muv4Zcs3uZS0ZkXovOE7pckI
         LChOTM4UlyTJNtqdkESMdIeyK6Bd82hGFKLFLN79D7x+4AcNkMWjJamC3Qw6Ovj9q8Jp
         /X/2Ny2p968Y79CzNfnB72qipqwXsSgWdJa4NlPq+Ww9SqQ1w/Tz3h0VA2VHtM0Qwhk0
         NNa4sqF94BFj9yRDnUbweTQTmunl4Ro6gy51IzfVn58efFM2TW6c1IpHLeIksdwXigNY
         lIU9AkBmIEKiisgAjBECwKgANCM0fdAn1I5Od2Vyno7H7hySzEIf7MXWfUZCC3mUHIGx
         wC0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=YRg19r4pdMD0hr3awVqvcsFaoaxvbRCdPRd8Rq7VxoQ=;
        b=qBawYoqgg2TV/aVFLFbdWMiabWxwqJ4mDxBx5jgEKORNa+5qJjvwMFoDmu4aHLEnEF
         wX9/yyBVUboSAToW14OXvtHK3dn2MmJZrqW8430ojoGok31tEBc6AVgazDLbcpjmFBYF
         kxuEvMarv0P4oUVB0+O3ntQAWip1oTDn2uFRZRmuW29ZcQKDS41/z9Q+0ZwSAByqyz2t
         H6ePmtPUER7bFIWx/XwKeX65Y1WcdkHKNyb3PxCrUrBa9Ac9Cz00IMKX5cxdj5i1L0v9
         CqpBn57TnWM0OJs7/G3Axvds8c2xv5W7wcrHJlcCnTuDujA8Mp8vVtFIDwq1qTcjf1oW
         cBdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=rpq3WVB4;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YRg19r4pdMD0hr3awVqvcsFaoaxvbRCdPRd8Rq7VxoQ=;
        b=QfG3KkOnVALtSxU1AR2iN0Nla4RMmoJ/ZAjP1zYg8c0d54YenqDRqD2/VuwGlFw+v4
         Z9Zmti2//zwNHirX0HndMUfNpkjbIV4+OHZYM7SuAQrI14EBRnCQ1cDnZjEU7esfFjT/
         N1Yt09km9/enf3yt4ukcJaH+sr5DH4BdVt5+yz/xofwdxNAiyGTXpy1zb07OPCE8kVwL
         9Td8KdqoTxH53qhk1KLAH8CSFSmF0frWu3Da7S5lFuyhw2KX8HrlVcqMC8KclSR1j39I
         NlJw4F6KNizewiGRqByDEkCndUltXBiYau84mDkAWYadYqhzIt/gkpWwaxnE1j8ZleII
         O6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YRg19r4pdMD0hr3awVqvcsFaoaxvbRCdPRd8Rq7VxoQ=;
        b=Gg70WHYRH1DcvD+Uom2pRmmqds7j2CUdHpX+1DluNNnypt/uSmWhoRscmPCBjH1Vhj
         bvhaTUfSPKYVz6Tg129LuS+8ygagJr2grxpENgkG2SC79GmVBrt2V8D2olqacKAECpPC
         Yi70165VFjyPOT/7vWOfr0gpRWxUxhT97cYNaLmwa2pl6qcwu8kOePtacz3RWrGHEnp/
         WJ8p7CPP01FJVNinauuX0JnPhxjA7ssuicxEUChziHyqd5a5C9hj570Qe+de5MrglvMe
         zezny9Z0dMmFYOcddH5A8gJjcBfjEHIrculA1dkV5habVfgvkd8mdAQJQcJlEE2LJ7N2
         uRLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530D/kH56fp0cU27NA4MmL+Wk9rG/XStQTIBFLyIbXxxkdafWR5P
	tt3BktddrcTi9jtZRS38g6M=
X-Google-Smtp-Source: ABdhPJyq0HS5li7yXo0MzqoTHZgtriTPXHc7QwkcsGamUNofdUd4ZAISIogZQ+Ku2TYIbu+Rp4X5rw==
X-Received: by 2002:a1c:e154:: with SMTP id y81mr759386wmg.111.1603919426059;
        Wed, 28 Oct 2020 14:10:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cd12:: with SMTP id f18ls203580wmj.3.canary-gmail; Wed,
 28 Oct 2020 14:10:25 -0700 (PDT)
X-Received: by 2002:a1c:6489:: with SMTP id y131mr761683wmb.107.1603919425240;
        Wed, 28 Oct 2020 14:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919425; cv=none;
        d=google.com; s=arc-20160816;
        b=BjfPQvhOymlPu1GX3Qd+zSUafD2JlVW1kYKesgb4SDApHb4I2K31m1eD+89wG/5XAW
         awvRiDXE7IRgd70vkT8CN34YO/QZ6XQLhHYRg/lfVm+xGdmdyfO1Aqpn3ORPRDoKv3ad
         wa4hui8o2OAcTz9HoKneph5iGF3y2n5v5IIjlzS4mEQb4CI+fJQuX7yFIgOseYFoumWh
         cG7fgUlZOgiL7w7w2XrzR+mZyg3ImbfuMGn4hIOjCKxoyl9/GMir1k5bCQ/oj+feojN7
         oBcSHMloIRkbz0XOG8Km/Ptcag0vDV5vHHzeYf9QnUUsEv2D694uQPfLSDVtKhvmG+n4
         QReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=SK6mb3YaSvwUcwcFGEb4zsiYPbqvH36TVqrqAVUs83Y=;
        b=Qt1+Im0ACgeOua9T1uv05EzDdOxysqz6A5O4HuJPIZgEKVeYo+1BeWkbPG/dcycPzl
         4GbEfvzgSDcRyrkkszXliwkZxBo2YseTXrlUP3msyF4neZ70nfoZ/aiAVaaa83xWyhjo
         65SF6ru+cgJ3khbIfgLVmdaZgGdOwH0SHXwNrZAWLW2WN4eNYfc75Bi0bfroA3OG6ef9
         WNw7s0u9hxd6pJyU7Cw52gBpwQyKGaMDlMmSNmkRK6y2FxyjlRHhcTop1qyDKcL9URcW
         cf+uEuJhFFkAUdLPqN+qK86TaOAUCMMOOsmjMh5/yDxECHmfmiQZFNE25pmpbXxOlMb2
         yHTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=rpq3WVB4;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id c20si22804wmd.2.2020.10.28.14.10.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:10:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1SK0RG3zyWR
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:10:25 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id EPSofzEsD3Rk for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:10:02 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rt1DgqzyWn
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:10:02 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 21/22] x86: introduce EXCEPTION_NO_ERROR to avoid int to uint comparison on error frame
Date: Wed, 28 Oct 2020 22:09:32 +0100
Message-Id: <20201028210933.138379-22-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=rpq3WVB4;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/control.c               | 2 +-
 hypervisor/arch/x86/entry.S                 | 3 ++-
 hypervisor/arch/x86/include/asm/processor.h | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index 2aea807a..2bc47a6a 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -238,7 +238,7 @@ x86_exception_handler(struct exception_frame *frame)
 {
 	panic_printk("FATAL: Jailhouse triggered exception #%lld\n",
 		     frame->vector);
-	if (frame->error != -1)
+	if (frame->error != EXCEPTION_NO_ERROR)
 		panic_printk("Error code: %llx\n", frame->error);
 	panic_printk("Physical CPU ID: %lu\n", phys_processor_id());
 	panic_printk("RIP: 0x%016llx RSP: 0x%016llx FLAGS: %llx\n", frame->rip,
diff --git a/hypervisor/arch/x86/entry.S b/hypervisor/arch/x86/entry.S
index 3ee11a99..295f0845 100644
--- a/hypervisor/arch/x86/entry.S
+++ b/hypervisor/arch/x86/entry.S
@@ -10,6 +10,7 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <asm/processor.h>
 #include <asm/asm-defines.h>
 
 /* Entry point for Linux loader module on JAILHOUSE_ENABLE */
@@ -73,7 +74,7 @@ arch_entry:
 
 .macro no_error_entry vector
 	.balign 16
-	pushq $-1
+	pushq $(EXCEPTION_NO_ERROR)
 	common_exception_entry \vector
 .endm
 
diff --git a/hypervisor/arch/x86/include/asm/processor.h b/hypervisor/arch/x86/include/asm/processor.h
index d22a60d7..3a7d9f93 100644
--- a/hypervisor/arch/x86/include/asm/processor.h
+++ b/hypervisor/arch/x86/include/asm/processor.h
@@ -164,6 +164,8 @@
 #define PF_VECTOR					14
 #define AC_VECTOR					17
 
+#define EXCEPTION_NO_ERROR				0xffffffffffffffff
+
 #define DESC_TSS_BUSY					(1UL << (9 + 32))
 #define DESC_PRESENT					(1UL << (15 + 32))
 #define DESC_CODE_DATA					(1UL << (12 + 32))
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-22-andrea.bastoni%40tum.de.
