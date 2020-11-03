Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBFPKQP6QKGQE3Z63DMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE992A3CAA
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Nov 2020 07:13:42 +0100 (CET)
Received: by mail-yb1-xb3d.google.com with SMTP id w4sf16673574ybq.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Nov 2020 22:13:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604384021; cv=pass;
        d=google.com; s=arc-20160816;
        b=vc3RlJ3pXXrPNmMzFkGIzm00LYpTS8m+5UAUY7L+966YrfBPEuPSuL5z8xnH7ZoS5F
         yQVxFzBDc0gbAkV4r00S723tHOPpC13bIHYW0Hkk00FygAxlEjm4VWIJOf+7jKF8xEbf
         iCXzy8xob1ND4zFx5YiPRK7+1Cgyzs2JHL5K5vneFMS/G9xRR/PkxZhIXgkyhGet1VPb
         iaxYqleeeZQrQuKKhtAXrAd/MXR89z2QaS7ynbNwZDsLqP0ln4jzMjHA+AVqDRmO/gpu
         3n8JsY+TfdGWiESDd3ThANGaZIQwb+8uMzE0/nBpX/xUK+QemVi76Ol4lp6y2lJAx3RJ
         oh+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=NEtettNXCQPBG584VbmYswQBDJ89kbdfGNN+u/qP+dA=;
        b=dyouZbSNPIjfTRmh0ItFzF716br15Vm8OEckNr9N+3tJ1TXOpBiYdhMtg270RkHbsJ
         MZvSj1f7wUh1FX91I3HYJLzj2uhYZ+tbPka+uSaxtyFoOVlluIUgZpLt8euqmJYmwgWA
         rQNz9BgNYD+hfr81ABpPKH+RwyYboxQAK0usPBCq6uW6CNAHgrVc0/d+OIPD93ZuiSxv
         BMTJVAqG5Oa6Bth0xncHlcfGZMZADe2hksQXtaL+wDZqNgsRlnzJg59BYIvFGe7GkNrz
         e7K7LDfXp/GCrgw4i9ur2FoOOXpJMFEJIoyZ5cUaPyGR6rO1xhdHnd8WqD+QX/mvEETj
         NVSg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZurIQd8D;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=NEtettNXCQPBG584VbmYswQBDJ89kbdfGNN+u/qP+dA=;
        b=UDwShzX+WjAMwL99dUYUqY6Tkz+xGUtOovYxgXSkjRcCn9E2J6ebHDHPl9q72LzmY0
         edB8kj7n8vRe6DJdJ8G9mNdZzamWQLFskKRI8jQYfsB3lFyv5bO+d6lSyS+c/ifOmPBQ
         Qnpg8ppdby7raVZAcgVebEz/IqM5V2Kke2i344iYfBknIbnOM351MrFXygjsPW6QOIgW
         zMUSk5VNPwCJB2ttV8OTiekHtoenK5jk89S9ZFw6oW3IHyHc4hqYvEf7utWZGfjVLWTH
         wMQ/6UTsw/DipRFTYvGcBKQWD9a6m4eSYNAr7xZyqfN69eD/IQGwNOo/UUXxCtwylyQj
         w+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NEtettNXCQPBG584VbmYswQBDJ89kbdfGNN+u/qP+dA=;
        b=r7zQfkuZ1J2Xy5nX2QNTJ5EAR5zR33rYlZNtsPVBc1SuTAe3JyJyXzj3mdEHAvFYHB
         +XvYR7tgoIR/IfCkCxoO8HbJ8XkgFod3ORWZFtmD4Fa60mQmJPJ7FQUCmKDc6S5T7gcb
         M+rpnOTsNbKjpzgLGeU7Kicv5uSNP2gKEuVpkJsiXsgR92ivSH6JzCX1I5CShpY69G33
         moCou9D225YC3pQfxJOVBNu5n8PdNfVm/MrBPkPlnWulPuY7Ap3Gn1ycaNsEJ20X3NyB
         iastm6sI4DX0TzmO8WtM2ZpHtHWobZtitkLbOIf16JAABKHW+avGDfBH+FA8Df2+FTUS
         LjeA==
X-Gm-Message-State: AOAM532stm/tlDxQSKSeFCZEolWFhl4uqhGw0qfu47Vf4fbo930xFMRw
	pO1Xd5LLu2fOJAAEsSr0Ys0=
X-Google-Smtp-Source: ABdhPJy2SOvm5s5649N0ZrtVBB5nq0FdJMPuA6oKGpP1u7F8ckxzollveCzb+pjPomnryaaV2eqXsQ==
X-Received: by 2002:a25:cfcf:: with SMTP id f198mr26636175ybg.60.1604384021368;
        Mon, 02 Nov 2020 22:13:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:cf07:: with SMTP id f7ls309409ybg.4.gmail; Mon, 02 Nov
 2020 22:13:40 -0800 (PST)
X-Received: by 2002:a25:8c8:: with SMTP id 191mr27644246ybi.121.1604384020651;
        Mon, 02 Nov 2020 22:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604384020; cv=none;
        d=google.com; s=arc-20160816;
        b=WJvFA/dCrctlEXvbJXpg3Qwyu1n2ML9xLUsRSOC9XgG10bBonR4DOVQdspIN3Pjp/B
         URKmILTQX+IiMB+mrHsf1OM5bry27kWkU2NsLKwiC90I8mdm6ZLQBvRlMDKqKLnjH1PY
         Sc9HEHbFdRKYV6ye9htwX0NVojXBM/YhfCcgVoNnPn0XEWkQ1WlalE2aBBvkHZ1+65yd
         7C/n9y4OPD0BN+OpxKA6JE6yVvvUJWLnOS4XUA7gmMtY6elasLqRXapyZVr+yIMUAKMc
         mjBirXSgEz3kmeuK+7oTOW8XXsgk8xg287di1tomG4M0tNnugetXbkdWKbWU4JSe4YM4
         9qVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hdlTTFkAS3SY5qrtRLR3fbAXz0y3Mo1CMaIZUJocNWE=;
        b=gv9o/ol/IUD19mpcApKC6mGR8noNmPohol8VjiD39WifEDGOf9f0xb0CM0kfOWIEYF
         YWBIiJzpDxFcOm69SXV27qQnMrcWcsPTIc//44tB+q2XMOdxB0iMPmgnkzGR2tWL1dGE
         6CLgmiTf/OO7cNBTevjZaoPuVeUpLlaaqRcznDAuNSpyQ54q4+lCHY3vUnNjX+jmL/8M
         inFH5UWgY7g4YBBOdrjRXauRCRUtJcazuGrs/DXITrsry8agrvYSdJOCKxP8lWl5mPyV
         QVnGOZ0p+NtN2puxWcafkzGP45KwgfzA0ia8xWGeQk/CJNJUdqqEPWKGSVGr1d1E8YtP
         HcbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZurIQd8D;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id l5si26094ybb.1.2020.11.02.22.13.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2020 22:13:40 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A36DebN082762;
	Tue, 3 Nov 2020 00:13:40 -0600
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A36DeEO073786
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Nov 2020 00:13:40 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 00:13:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 00:13:39 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A36DbXs093598;
	Tue, 3 Nov 2020 00:13:38 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH] arm64: Report exception link register ELR in the regdump
Date: Tue, 3 Nov 2020 11:43:34 +0530
Message-ID: <20201103061334.21256-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ZurIQd8D;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

For an arm64 CPU, when an exception is taken, the PC of the
CPU is copied in the ELR_ELx. This is useful for debugging which
code path caused the exception.

Modify fill_trap_context to populate ELR_EL2 and dump it as part
of the dump_regs

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 hypervisor/arch/arm64/include/asm/traps.h | 1 +
 hypervisor/arch/arm64/traps.c             | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/traps.h b/hypervisor/arch/arm64/include/asm/traps.h
index 59cb137c..a7c07624 100644
--- a/hypervisor/arch/arm64/include/asm/traps.h
+++ b/hypervisor/arch/arm64/include/asm/traps.h
@@ -17,6 +17,7 @@
 
 struct trap_context {
 	unsigned long *regs;
+	u64 elr;
 	u64 esr;
 	u64 spsr;
 	u64 sp;
diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps.c
index 26a58f4d..a9086c79 100644
--- a/hypervisor/arch/arm64/traps.c
+++ b/hypervisor/arch/arm64/traps.c
@@ -88,9 +88,9 @@ static void dump_regs(struct trap_context *ctx)
 
 	arm_read_sysreg(ELR_EL2, pc);
 	panic_printk(" pc: %016llx   lr: %016lx spsr: %08llx     EL%lld\n"
-		     " sp: %016llx  esr: %02llx %01llx %07llx\n",
+		     " sp: %016llx  elr: %016llx  esr: %02llx %01llx %07llx\n",
 		     pc, ctx->regs[30], ctx->spsr, SPSR_EL(ctx->spsr),
-		     ctx->sp, ESR_EC(ctx->esr), ESR_IL(ctx->esr),
+		     ctx->sp, ctx->elr, ESR_EC(ctx->esr), ESR_IL(ctx->esr),
 		     ESR_ISS(ctx->esr));
 	for (i = 0; i < NUM_USR_REGS - 1; i++)
 		panic_printk("%sx%d: %016lx%s", i < 10 ? " " : "", i,
@@ -147,6 +147,7 @@ static void fill_trap_context(struct trap_context *ctx, union registers *regs)
 		ctx->sp = 0; break;	/* should never happen */
 	}
 	arm_read_sysreg(ESR_EL2, ctx->esr);
+	arm_read_sysreg(ELR_EL2, ctx->elr);
 	ctx->regs = regs->usr;
 }
 
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201103061334.21256-1-nikhil.nd%40ti.com.
