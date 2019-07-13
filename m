Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIF5VDUQKGQEXID5EFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70667B9C
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:41 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id r4sf6240887wrt.13
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041441; cv=pass;
        d=google.com; s=arc-20160816;
        b=IOMMRmrxEIo35PfxrEnx6j1txI4O481yh2HRL64ln43vV06Ti+8PbAmDZkFBAddWY6
         UD6iyh/w3DzaJHCFcyH20HiPWM0SDMn6SxUTXWWOJwQE8pZ9IU0DUXnVf6YOeHAKqwYh
         9u8siBQjWQYiyH/w3X81S+BXoh3148YIPnc33ivTFbJxoa+ViSmjKdqKptSrxTaVqL72
         0xPd0bPy7wmYx9/7TN5WtijUbGQZGM21gFF2tzmB+RrgEQqs7sqXtN/dW6GsKVHEeclW
         1DbpmCmOJJTRrm3ogd2hoV4PGdD2mW13AMZZ+zzQaiQIvSJ2mY7FuwDdakLVB60LhJ+P
         NHWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=P9+a0SneTXIb34oG6jteYwKLKUXbmhRRqA5Hu5owfb0=;
        b=DXd/wCAqBLRnABUaSu4S45Io4Uy5lPQJTC77sNLUhPlac9+VTdSHw6P0V2C4Mdsist
         3WrznWB8xmw3bL/5Qpcidi5dLHpznS7DgAxrk8lQUA8GiffA3VJ8FQ4wqxFsOewp9FL9
         zUpu9vnlE517OF519wzO4O6YhgXDKhdwQ6WiviTmXNZI2l6LArrGQA1qJ8F446eWInW2
         afrOvzZ/AsOaVLCSd9T9bjzyXtXvoyykbgzZG+KNQ3IKurP0KzAxWr6iFhlGjavm+Qpn
         r6zvkj+Mm64us2Gdaw9VDGlYEF0VR5o2dgzBMh+pUAlZKA+bmVB8JWh8K/Xlen2ZdeHZ
         mObA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=P9+a0SneTXIb34oG6jteYwKLKUXbmhRRqA5Hu5owfb0=;
        b=MJKUeBVmyB1hXPEetaEsmNXFLZOk7HBYCW/NillmhLc6UqH3o0AZWdPj5c/K8eVzgH
         91cirPKfDB1PIYeYmVlK/KASrFNio1OmdD5A23qt+jOIE2hbwZE50KJvRqcGv7ckr2Fs
         GaF+75sYSCKcyy3mykF6otcT/tSjxzKiq2gARB4ctHUG3ry0GhbxQPKGiEHejRBkeMV0
         mxHVSyL40BG7vz/OELSR2m6kiNL1f5keHS08DIXP4IxOzoJC1+IzLMgrUkJQxVMhATJy
         o0hnvZE1ot0SUJQ1nDz9711WSZUvCUXdElhaviOxItoJjAxOd361wIgMu+RI8ndaAQVY
         WhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=P9+a0SneTXIb34oG6jteYwKLKUXbmhRRqA5Hu5owfb0=;
        b=P3H1eUIehBoasYgEMpCc8Knim1Qi1dZFpLFdtYsgB0LZjpYpuEx/6zhjj59crP5S1j
         Vl2EUMoQy0PZA6zrwCzyrO1nZui4xRwOQAb+4nsgtmw17T9wIZuo0TE1T6toPI3xXySs
         KrsmxQRALAI7TMU79ZMkaAfHe/XyLK086H33E21AUsAXtpQmH00yoMue/AnGEZYFW+/A
         AY9hgzOv23+mbYHff1/1XtC6rf56UcWbiU5wirXny9t0YL1PHSCIKgXcZT2kvDCKMBVX
         kn75/FzSJ5vLZ+d5KFZcpFdDCBAmEam7+ixz56KMRSxMvHbvBmfrjHDITQJXoUc6VC0h
         KpMA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8eYpWnto19YzdGiZJYdKUmVOCC9ytq6+O97rcB66t5gpZr5/J
	fG/znjKqUSCUMOtQBP0M8qA=
X-Google-Smtp-Source: APXvYqwuZhaqlGi3OEnNOWmI3CKa5y9v5wjssLPmVNWW+yJnCdjAiCR1YFPEdYZQO/I93KzKSp0A6w==
X-Received: by 2002:adf:c508:: with SMTP id q8mr18478847wrf.148.1563041441166;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a386:: with SMTP id l6ls3765466wrb.16.gmail; Sat, 13 Jul
 2019 11:10:40 -0700 (PDT)
X-Received: by 2002:adf:ce07:: with SMTP id p7mr18416402wrn.129.1563041440537;
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041440; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/yxCBNiPyl7Ky0NX1pakhnEWL01LXkIWLj+xzCwj2VH3+2GqrqAV9XH+HJogOeXGe
         xIi6tijE0Khvy3Hv3BUBEeQDgWRJeE3ztCLAKG1UcPqm/MymulOOxfD0VCeyhyAsfKg6
         tgVPPAU25sHl1iAlA13tizRQDswkJLpkZ6Q4YVrpat+bwnk4+NIewa4PGeX4fN9dMCVR
         f2DTo4f5dYfsu7kjU3w5KV3wjA4nngYTCrrAqm+BswOD5z4oQ0mQ564eW6ddyjFr423k
         D0zzfpk3I7oSQXYuQl1SpV0geBkN+1XyvkkKwV9vmZbgV0ILTy5Ty1eiCJ8qrcwTBLlE
         ff6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=UeWuAl0R8uDe9avBQtwLoehhzvHZeClJgegp7XgD1G8=;
        b=LfRLRMlQoE4mLh9FSNqbPlKldwTG1vulqB51NXnOFu1EqhsZLL48cCFeHG5wJnR3Jq
         fdTOKtbecrOpT3F60FHsS2WXfBmM7oBA6tNAYsasy8bKHnZqyeJroNdlmFyJ/kbyi+vw
         N+m18TZLYBZKtYfmPQkzBK1ikYzH5VkU0F+0wjZHWtgzTvY+I3zY6H9AGQE8nHXqoAkL
         PWW0RfffiZiTOKlfqPim27p/Bs64zRnQfdzR3BDhhApaKAbz11qZwRJTkrhCJw4n/FlZ
         KkxaCOp4JxvPbh2i19bH8RI73Oc57lomqh7MCb6A1CYDCXZYU71gmtO05gpgSSck4eGZ
         t+Ng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id u18si792738wri.5.2019.07.13.11.10.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsD1TpDzy6F;
	Sat, 13 Jul 2019 20:10:40 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 06/11] x86: consolidate deallocation of IO bitmaps
Date: Sat, 13 Jul 2019 20:10:32 +0200
Message-Id: <20190713181037.4358-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1600_1699 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Same as before - we can now do this in vcpu.c.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/svm.c  | 1 -
 hypervisor/arch/x86/vcpu.c | 3 +++
 hypervisor/arch/x86/vmx.c  | 1 -
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index e1000447..74abe652 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -381,7 +381,6 @@ void vcpu_vendor_cell_exit(struct cell *cell)
 {
 	paging_destroy(&cell->arch.svm.npt_iommu_structs, XAPIC_BASE,
 		       PAGE_SIZE, PAGING_NON_COHERENT);
-	page_free(&mem_pool, cell->arch.io_bitmap, IOPM_PAGES);
 }
 
 int vcpu_init(struct per_cpu *cpu_data)
diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index cf8ff04c..81ff8772 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -159,6 +159,9 @@ void vcpu_cell_exit(struct cell *cell)
 	     b++, pio_bitmap++, root_pio_bitmap++, pio_bitmap_size--)
 		*b &= *pio_bitmap | *root_pio_bitmap;
 
+	page_free(&mem_pool, cell->arch.io_bitmap,
+		  vcpu_vendor_get_io_bitmap_pages());
+
 	vcpu_vendor_cell_exit(cell);
 }
 
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index 2f46b7e9..c4b7dbb6 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -378,7 +378,6 @@ void vcpu_vendor_cell_exit(struct cell *cell)
 {
 	paging_destroy(&cell->arch.vmx.ept_structs, XAPIC_BASE, PAGE_SIZE,
 		       PAGING_NON_COHERENT);
-	page_free(&mem_pool, cell->arch.io_bitmap, PIO_BITMAP_PAGES);
 }
 
 void vcpu_tlb_flush(void)
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-7-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
