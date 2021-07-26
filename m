Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBAMS7KDQMGQEKJNPKNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83e.google.com (mail-qt1-x83e.google.com [IPv6:2607:f8b0:4864:20::83e])
	by mail.lfdr.de (Postfix) with ESMTPS id C94DD3D570B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 12:05:54 +0200 (CEST)
Received: by mail-qt1-x83e.google.com with SMTP id o7-20020ac87c470000b029025f8084df09sf4101211qtv.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 03:05:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627293954; cv=pass;
        d=google.com; s=arc-20160816;
        b=iaKy/zlceKkqNbigVkioUIqBm/zTIEnTMYHnHwzyN37b3pAbC/X62cV2wY5ZQk+8I8
         MBbGSTXgTlDc8WNJ3U5yzNvUsqHMbjMHsvh6LmXj6yI0z0G0LE8rK9++3RXg1RQDKJ0B
         +zDc3pyctsNj/yN1+cijFSrw+WWd1MNm7zR2sILgiCc11HMfu7h2OZUiou5aAoP0JYu4
         gGkGDzUZVzBj2osNHRFSdJIev9XdpJxEwcNx1Z+voHJUyqEHZUY8wVeev9WlZHAg4IZm
         zHJPAlD0P19HKQ3HH7pEPCWGxCFvUFKpOsbioToWNSP+r7vLhvTugao4BrGaAmCkJTsq
         N7vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=wJidd7EXSfEY0K+J+zkJ8k5Bh17X6KPqopOCw9Z7ehQ=;
        b=kBHSfdR6NIwWRANcONYHrrsQnGCrDLuEGCC3Ak/RT3eTq/fdnIA5cJ836pPosn6F0H
         DhDMnFhTyYPztYu4IGkVzlC47E+ICk5FidXu4DLHzVL3uXvEQmVcupfyE17OLvYvRl7M
         d2aaFviaIW1MR75pVmnD9KLjp2X+XnU5z1EIUlosUK5zL4W2p7E8Fq9cCy7QBeUy16yw
         2Jjvaody7qd3NIdF+1J6+eern3IXQ+xcqj8XAWXIOfKPe7mfxZE2SyAXA4nwshtmBfN2
         cuklCF30D47b+Jet/yEdPqALcepTXEkb4Rwtqr3rmG0FgrpVF7DrrfSe4zMk5Gi26CkG
         p/uw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="O/kDnrY8";
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wJidd7EXSfEY0K+J+zkJ8k5Bh17X6KPqopOCw9Z7ehQ=;
        b=P/LGpzntougxYC89ED/Sd94vEID9eYy+St3qtA2K8uxOcgBnzanqrHk2VPca9YzMzB
         6D1frFFjqTu4GVxuFmr/qxe6ZAMmdhqv8fQZ2jOFd3xKZBUiHSvKHdUXcRav/7a8G5oV
         PrtMoUoP1+zV3xAJOAmKTmcyypHF5cAGUmvoprjXgFWRuJkRIVa5V2LHDi1I1xG8/VBn
         hzbYrFBPxoYxH5X1uVrWqMOkjPBtyjkm2V5q+Wqf32Xy7qfLf4X6hRkkSNI5HC7TZ5U/
         SJNDrwNTDDcgLQ8mn/qGVROaCnOkR7jVzb/pRsDCQYZ16HlHh8iLBfjzCZ0VDkSashf7
         hODw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wJidd7EXSfEY0K+J+zkJ8k5Bh17X6KPqopOCw9Z7ehQ=;
        b=W5nnnlG50V5vUxixub1Mh61z3+YWbVYTK+B1aJkqF3vEmJFDzUyDUocElPxgEQlKTM
         /vX+4DYi5c7hQOyrPVEv/4mzxQTw/iN4ELguwt8FG36E/H6Kk2kB8jpemz6RqckoTp0z
         Nx1ecWhy41YFTlmo4CkAOg91B9iVH7/Z7lr2U+9Weq4EbdAaZHs4OS3rA3/FDCY25WnX
         SjBhXEZG/PqizHwG0NkCR/1e7X0uvlnSeYp6DDmKeNJCaQXoaePYsETe0CTS1joE3vTW
         ivjO0LJ2EUZoGLGIZl0c4TaMsSNnaBkGxPIUHjwUPU4n0N0P+aM6YJy1VBzOPeow19HJ
         PE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wJidd7EXSfEY0K+J+zkJ8k5Bh17X6KPqopOCw9Z7ehQ=;
        b=pFtFfffME643UbumT8F8SeFxDyp2ku1Tm1tgEyhTP4AXe3EiZqtwGuzlpw969NTQQc
         PCEiN3B+u9hDagZy4csmDgWJQN63ByEutAYriA2+LNbHUPioZN3ItweXio6IHzO2vZ/l
         7Tqi6eHWqtE/HXc49bB46UnOOss2qfOsHvYW3AZOtLytotHG7T5lL1yXlMkHaJxML4WD
         LZk+W6JNR/j5CvAeQKLUAFx+dkGDqY31A/k+l6TjsK87qI+zvMhzZR4JRb07KSpvM0px
         QCWbiqROvMxhrwY+jiD67VyvvzgUTJU2pGAQkkfUE94V7YKHtDf7R2//rpGquazdM6bt
         dB6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532zxTvZ280+mU5LXQydDDTc3OICSoklTIZPpd/l8Y2SWkVslT8Z
	4h4/pDs7AIMVAWjVtQYUCt0=
X-Google-Smtp-Source: ABdhPJzIjPi3YaCZuLtybupL9+cuOTRJyqNSZsa4RysTcyTOBEvJlZOS9IdBU5wR8JHITKnGm/mTxw==
X-Received: by 2002:ad4:4eaf:: with SMTP id ed15mr16848387qvb.62.1627293953849;
        Mon, 26 Jul 2021 03:05:53 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:60c4:: with SMTP id i4ls8367289qtm.10.gmail; Mon, 26 Jul
 2021 03:05:53 -0700 (PDT)
X-Received: by 2002:ac8:544:: with SMTP id c4mr14360078qth.299.1627293953310;
        Mon, 26 Jul 2021 03:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627293953; cv=none;
        d=google.com; s=arc-20160816;
        b=oRV/HyXL9kObH+J5KLQtQGP1l3rRfPCeUKoijNVQ+TZyM4IipW+irhqazwCJguEKLT
         Y6/0uBX2ZNcn5mf2UVdAyJQFQjZAGyZBQ1kZV+QLXheF6beDMY71i442FvA2+SiBMXDi
         FIonG6BrhMZgly+kbfkM5fhHhOi0dvouaaBG20tplVTt2tJJAhXDY6n1I0LzuG0cKTVf
         25ttbHWoTIQauVYOhqTzOHQWwzBfGHsbbyF26rmLDS7ZKGTdJnE3f/j+4RdNdKC0rNKD
         ePk2TPxYjPQQJ57EdM+bSi1cvNeWrtkEqgOJ/3a5dlDGNUm1wVuTZ+7EKT/RV+2a6Xh5
         7GSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y3HyZU0ubHuWIRNbHGf4Fg4aIiXF6ruW3kWZMYkhiUo=;
        b=oaoHTnxptBNzyyLWrPQtGjkaBUpSSPy+9+qkZc5X5gzKxUevKKrMnSFI4MG8ECe5ib
         QZZXPIjKnQMR8wDSSuUNIKVYUFy91nOXSKBN83cx40XfmKziaU7TIhYIQVf/uURr1PHm
         KltpzhE2sRJvqhZZ7NXOcSP7RItiVK3yZyutxNWMu3ah/pyPWLcnAhHG64rGKLzsJoGU
         kTtYDZHGw/2IkcoETiOkypLPIrMJNVvwg6zmQq60Arl4zaPbB3bP4RAugnG20ryWFKwU
         5OVj2djtFPrl7gzjlgxGqw/YVFvt8Jdbf1pKrhiST7MwCdAPCtHjPjZCMLKuqTEGLEcw
         Clqg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="O/kDnrY8";
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com. [2607:f8b0:4864:20::1043])
        by gmr-mx.google.com with ESMTPS id o13si918889qkp.0.2021.07.26.03.05.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 03:05:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) client-ip=2607:f8b0:4864:20::1043;
Received: by mail-pj1-x1043.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso18995536pjb.1
        for <jailhouse-dev@googlegroups.com>; Mon, 26 Jul 2021 03:05:53 -0700 (PDT)
X-Received: by 2002:a17:90a:348f:: with SMTP id p15mr16461826pjb.170.1627293952398;
        Mon, 26 Jul 2021 03:05:52 -0700 (PDT)
Received: from localhost.localdomain ([47.89.83.12])
        by smtp.gmail.com with ESMTPSA id g4sm49773761pgn.45.2021.07.26.03.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 03:05:52 -0700 (PDT)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Dongjiu Geng <gengdongjiu1@gmail.com>
Subject: [PATCH] ARM64: Set the right set TCR.(I)PS value
Date: Mon, 26 Jul 2021 10:05:46 +0000
Message-Id: <20210726100546.30332-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="O/kDnrY8";       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::1043
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

According to spec, the {I}PS should be never larger
than the CPU hardware implemented physical address
size(ID_AA64MMFR0_EL1.PARange). Otherwise, it
may lead to some unexpected issues.

we can refer to DDI0487G_a_armv8_arm's description below:
If {I}PS is programmed to a value larger than the
implemented PA size, then the PE behaves as if programmed
with the implemented PA size, but software must not rely
on this behavior. That is, the output address size is never
largerthan the implemented PA size.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
DDI0487G_a_armv8_arm: Physical address size implementation options
ID_AA64MMFR0_EL1.PARange Total  PA size PA address size
        0000                     4GB    32 bits, PA[31:0]
        0001                     64GB   36 bits, PA[35:0]
        0010                     1TB    40 bits, PA[39:0]
        0011                     4TB    42 bits, PA[41:0]
        0100                     16TB   44 bits, PA[43:0]
        0101                     256TB  48 bits, PA[47:0]
        0110                     4PB    52 bits, PA[51:0]
---
 hypervisor/arch/arm64/entry.S              | 14 +++++++++++++-
 hypervisor/arch/arm64/include/asm/paging.h |  5 +++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index 3f4ee871..99738f28 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -388,6 +388,16 @@ el1_trap:
 	isb
 .endm
 
+/*
+ * set TCR.(I)PS to the highest supported ID_AA64MMFR0_EL1.PARange value
+ */
+.macro tcr_compute_pa_size, tcr
+	mrs     x9, id_aa64mmfr0_el1
+	// Narrow PARange to fit the PS field in TCR_ELx
+	ubfx    x9, x9, #ID_AA64MMFR0_PARANGE_SHIFT, #3
+	bfi     \tcr, x9, #TCR_PS_SHIFT, #3
+.endm
+
 /*
  * These are the default vectors. They are used on early startup and if no
  * Spectre v2 mitigation is available.
@@ -460,8 +470,10 @@ enable_mmu_el2:
 	ldr	x1, =(T0SZ(48) | (TCR_RGN_WB_WA << TCR_IRGN0_SHIFT)	\
 			       | (TCR_RGN_WB_WA << TCR_ORGN0_SHIFT)	\
 			       | (TCR_INNER_SHAREABLE << TCR_SH0_SHIFT)	\
-			       | (PARANGE_48B << TCR_PS_SHIFT)		\
 			       | TCR_EL2_RES1)
+
+	tcr_compute_pa_size x1
+
 	msr	tcr_el2, x1
 
 	msr	ttbr0_el2, x0
diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
index 932dbb50..1b588aad 100644
--- a/hypervisor/arch/arm64/include/asm/paging.h
+++ b/hypervisor/arch/arm64/include/asm/paging.h
@@ -144,6 +144,11 @@
 				| S1_PTE_FLAG_NORMAL | PTE_INNER_SHAREABLE\
 				| S1_PTE_ACCESS_EL0)
 
+/**
+ * Memory Model Feature Register 0
+ */
+#define ID_AA64MMFR0_PARANGE_SHIFT	0
+
 /* Macros used by the core, only for the EL2 stage-1 mappings */
 #define PAGE_FLAG_FRAMEBUFFER	S1_PTE_FLAG_DEVICE
 #define PAGE_FLAG_DEVICE	S1_PTE_FLAG_DEVICE
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210726100546.30332-1-gengdongjiu1%40gmail.com.
