Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBO5X5D5QKGQEECOF2TA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E316282CB6
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:12 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id j7sf3137382wro.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838012; cv=pass;
        d=google.com; s=arc-20160816;
        b=nqo66cDelHRS17TEYBP8A/6ErY3FSe4vYJEO661AET+3fjJ1mfWGAhmrwo/GBJgBnw
         z/rYKMXSVEXzX2K1KJxMQAgs98ssXnUeQgVdmNexVnSaSSY3RaH8RQL9Tv5UzX/rLfSb
         T35n0dTt+h/fWGMGiDMzHcmXDRnD63nTyT3gBOzyyMzobSNyJLAsxgHp0ZFQLfQ+Rg87
         dSZPKnyfIuIq4vj9YfIvefFtcPF6mww5ZlZYhEjrfZUnYTz63PQorwJHVhoVCaO4gs0C
         OMcdJh3yMaBLVWNAjMTGs3y/bxteqinrZokmuhIgrSPqEE326Bm0ucWkXm3N4A80B498
         YmTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=TDO6spjNNQYdn3qF3AyDZIea6MmcmrPvUAUqFakWedw=;
        b=CSK9VOz8isqUPhr3W4moc2pFGV1jR0FVlZBsF3MnoEPCQ3+b7knGE9XlIdBXo6uvCJ
         53uxlqC/dnMOdVA84KN/DRwGMdo0LCDjqqbp9wqMWQJukrZOG8J6HKufVhDAnknnQXMP
         Q+WdYGBqPBeK6HHWb/e9HWWDBLFrOHRr8GC7xcpyaZPN4wqbHnYrIxT9bcW7fLT5Q8oN
         H0c8e10tBU4Yqhkfoy0J8lhrXNU5RWX5Ql5+3dKuYNZes4E/Sk+xHcMESLyPa+bXHoVc
         rZUB5YMiLmyhLDPeUaEywMJpTnsqoGjxjPH6OjQAUjJiY6J+xi0rrcpgqsA97gd768B0
         c3jQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TDO6spjNNQYdn3qF3AyDZIea6MmcmrPvUAUqFakWedw=;
        b=LZdlJAyH8lfx8jIYv5FlkTa4LtMnLV7pUER45VxXXKo1ss+CuC97cCM3amh8+OiKny
         6zxcWZ3xxh9qr1pK7Ymsq4zR0MVQz71i2qubE2EzFX0b8nXJEaVgdfbXhS0StGmBWufO
         sbM4E4xIi3TfhoPAHbScj0zVbm2c9+4zoIzmYAMGG5SvuVuGWcvbzRO2FDjbY70Krjju
         NslimddUC14F+hqO52ZH9RhAT8j6jwR31D3lzxOKgDOhmZBEi5Dbkt7LNLNzW6XgbWU3
         r85rpKSrUX8TmzFwhYZLwqddv+Lj+dHchsbi9ZIDK7JxCGjVHv+mNMNWyUfS7mujUrdC
         Pd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TDO6spjNNQYdn3qF3AyDZIea6MmcmrPvUAUqFakWedw=;
        b=ME/4/DPb3rVUcdj+zFafOQUc+TBnWNpEUWCOZOaBYXg8PMswsZaKJUfAQ+301rttgn
         ZMl4tmF8CyIrySbi0knM/AQrqGfE8TsRUoq0rfupFYGEgaDAOtnGX9uzBj5jOxNafcR4
         j+i/wrA74BWaP4jCAynF01A8Ukxdd1QnIVFkrWvjbrcLQLNlawbRW3W8xvOMpRmz2iHz
         HSdy3rufVh+wbTl3dcP4sPRJil+v0BG6wPWmKQOrzjsNEaoPsNidGAZcAq2X9rhcXjmj
         iebamrNjiGXPWt+fEs9G6HssGC/3By1XMeGtHC+G/q3Th0JtH2H9ujawqUYYagMfe65R
         uO7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339jDE9p+nXSJI/LvaFE3w8CV5u8nct8pJ+AEKSmDItVla6sDIm
	+Xog2vw8FVTtTt+ipVovTIA=
X-Google-Smtp-Source: ABdhPJz3NVPJqU/C9Tl3R8awXSZ2FkE9Lo/InXHMhyPjf04sq/rQfoy1Yc2Hqeqr9jndOjMR3/O4CA==
X-Received: by 2002:a7b:cf04:: with SMTP id l4mr4053015wmg.137.1601838012288;
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls5162867wrq.0.gmail; Sun, 04 Oct
 2020 12:00:11 -0700 (PDT)
X-Received: by 2002:a5d:460e:: with SMTP id t14mr7639172wrq.399.1601838011203;
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838011; cv=none;
        d=google.com; s=arc-20160816;
        b=xejqLAno8T+x7HcuA+aUtBV8qvgLxk9VcKl5cGlxkHy1dGttiNic/XxCLCmDDJluO8
         0EnbezXVSZsVSwUscNtqHQRj5zFN8L08dwsQDJdJHkG5WLsngv+4nIdL6AchUVpkB2y9
         bSF+/m69HWJrE1woL5PCaAyeh67qhwF1lFZtM0BYFPNMf86U/6Ey3Fh0DvqgYjeW16fP
         F5/VwM7oI6PGwPzbyeUzpVvwmyGBYeC1CpV1vnGkCTQsN51Ma8AyiNJ0E0JUx9hQQIp1
         Q2ik4vNrEEtOw5xaU8YgIlXGEGz6Km8nxn2i2a1z2/FIlAFouhIOii6XBJchIepLAllQ
         QxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=CQHJ9ozchhP1j8etcrodJH+BkzFcUzD1L1bOfNH852A=;
        b=aH8Uyiyyo0VRGZ7b2uXPFw1cCvsPKTqdRkFNkXwpfnuRND0oQhOdJm013sYAHfX+bW
         uDRbmjrdN30J69nt483YFNSsEzxEw6owAL1YQdCvZapdp5l6d+KFweB2swRGPsYk9Eb1
         qcw1nzROegxdtLYgn/ii9euRWX/NAIS4HImVTN+0wHH0ptXeCfX7SPP8GyC62dLCZo3O
         BCy6GaP2KyziWV94CWKkAbRf9F3MsO5Qz7ijI4vcfaA2bWW9fktPNZaC7cLLlI0Oi9z7
         s9G9BykNEWN4cy0kpaQBZUV9q8K71+MX5vYyYp3pRLu4crSQON8PI/dLnCNKEHMzMcJ4
         v3yQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 14si45194wmf.4.2020.10.04.12.00.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0AdZ029749
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:10 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060Q017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:10 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 14/45] arm64: smmu: Remove IRPTNDX traces
Date: Sun,  4 Oct 2020 20:59:35 +0200
Message-Id: <0766d8d4d666156edbfc8450b9070f656b59e4e9.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Not used with SMMUv2, which is what we focus on.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index f17fca09..e39c2264 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -170,7 +170,6 @@
 #define CBAR_VMID_SHIFT			0
 #define CBAR_TYPE_SHIFT			16
 #define CBAR_TYPE_S2_TRANS		(0 << CBAR_TYPE_SHIFT)
-#define CBAR_IRPTNDX_SHIFT		24
 
 #define ARM_SMMU_GR1_CBA2R(n)		(0x800 + ((n) << 2))
 #define CBA2R_RW64_32BIT		(0 << 0)
@@ -246,7 +245,6 @@ enum arm_smmu_context_fmt {
 
 struct arm_smmu_cfg {
 	u8				cbndx;
-	u8				irptndx;
 	union {
 		u16			asid;
 		u16			vmid;
@@ -809,7 +807,6 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 		/* We use cell->config->id here, one cell use one context */
 		cfg->cbndx = cell->config->id;
-		cfg->irptndx = cfg->cbndx;
 		cfg->vmid = cfg->cbndx + 1;
 
 		ret = arm_smmu_init_context_bank(smmu, cfg, cell);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0766d8d4d666156edbfc8450b9070f656b59e4e9.1601838005.git.jan.kiszka%40siemens.com.
