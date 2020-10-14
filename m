Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXHNTL6AKGQE3XPJOOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2128DB56
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:16 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id p3sf892585edu.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664156; cv=pass;
        d=google.com; s=arc-20160816;
        b=dLvHOjeRYH4EvvfhshRrDJ4Zxf+Wv9BQlr12TSAl1YrC6J/c32FAgw125JOUtScd75
         LVrchOWjEP962Tx09rhHbQ3IJUDCFIndXLWGrz9ElQQs26Swa1UKC5ztjMBhkJIhNYv0
         cAAbvNRU03vUjiJ2xkWK6mRaJqjBoGuDNshVLx93WGAn40hhIOxMVxHoK68fv7pzEzMN
         3fgC4JtumcAUjh/LBHFR/xMoPoyM8GC7hSxDBPdAUG9EUmfOLWGobGNDujaqjRlwFzUS
         psN/qJ/716lbfhDIanHfzG50GlDGmCfabV9QsoVAvOenP3/0oB4z61dRR051yOalMnkX
         n8HQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=WIXwoeeQNFbwfCVVKG9EbvpIA+t7kAkUPG180V9GMJQ=;
        b=UH+Uq60Ftt6x517ojLXhwyLIa0AntXABbBMYZMKi7GcKijr8pulPRZZ3qIvhb04giS
         B248CE4R9ctCuRJWSEgFMpVim1DLxA+ZTbaXxR1IYpN5FVOIU2DCBrcDHHI8jdrejGMI
         sVS+NR9Pw3Bad0byebC69JDSBbngSW2P/NLrJOXXLAxZkuZhPss60ZHLs+tNnbrH7aNw
         nAp5Z6n+Cp9SNXMVp/zFuiJs3LNM6pwmp6wugnEERadA0sAR8bZOmM6A+t2vYxyeUzZK
         AxsOy0GqxIv2sBQuXyVEkXgmu0qdOCOlHd1g4WlZobO3a84WBaQlIIqY/oSpVKRZBjAS
         0YRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WIXwoeeQNFbwfCVVKG9EbvpIA+t7kAkUPG180V9GMJQ=;
        b=BVvLu/arEKl+vdHfeYajidrkN8bcjvnQkYQftLB15Kd2DhGqaw4aVF7SEKowSsXYuo
         7eTGWoDXBRpvJG9vCM3OOmEIyW3G1TFZGBkVaArh0w12tcJa0V5HVyVCXotXxgZbjTR0
         hTLejV8LsS93VcN4YBd7YmlSj6jMYK1XaMjLiolLu6K55HgmX21XoUtcpk63TW+96VHK
         AHVs7fuD7Qb10a8BFoOvZxsSc1Z+DUn0IR5TigNSzEJjLX5KUiZ9di+4dzP26ep9aHtk
         yjcvCUvrYY5tj2bi2afkjlsF2Ouud4ahH6TBMcBWD70ka3yMicm+9IUTIjxIPWu1gSlD
         UUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WIXwoeeQNFbwfCVVKG9EbvpIA+t7kAkUPG180V9GMJQ=;
        b=ZAaIG3Aux4CqXbjYmg68wD8uiwBc+CL/KvB50DFp4MtiTBlo+FsgtY9QwpDPRw7Lp3
         693raQ5tHoUwodEPNC8TdzKEG59DcN5LaNXmTs0Y5Oa0/3imXRdpMzkD+hdFW8EjVEYs
         i2eY9sOPrtC0uJvfu7k2WKXtDg/b+/fHv33ZI0V8KkUZMFyMGdbXXQdUn0UB24iTvxTW
         LOcwxS6XtDmjr2az6MvXcEQRSO08JYg4U4tcJ94IiGhvOWDYqTeqRFcSKQFL40MLO5MB
         QJR3l61WiljMa/KKakvINutmSWGqGtnCQpgq57uQCeriQg55NeZjD2pXncQt41hSyxxS
         aGjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531AWw8K4dyHB+j2StW+tPFKFIt6pJHdQ6HW9jRbQipgGjRZQtoE
	U1enuxcCA33LKweJxWhOFaI=
X-Google-Smtp-Source: ABdhPJymT7JLiX8cz3v9qEru4Yon9eFRb0m6NB6PbUDZmXVfh36NGBS3wfTh9mOkW1oplfUa9tM5mQ==
X-Received: by 2002:a17:906:f849:: with SMTP id ks9mr4315116ejb.14.1602664156265;
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d3c:: with SMTP id dh28ls2629705edb.0.gmail; Wed,
 14 Oct 2020 01:29:15 -0700 (PDT)
X-Received: by 2002:a50:8acf:: with SMTP id k15mr3940929edk.351.1602664155177;
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664155; cv=none;
        d=google.com; s=arc-20160816;
        b=cnKdLQpHReWYVwd5biN8r0vueJoSdqld414oQqPftwsE4l7I4jc4FpUAhhMlkU7DLp
         uREzyByP2OLFtWUWYIe99xYj5nP0kJ2ax+OqZu87jWi5wz/HaPoMeoFfmqBuL2bejZKa
         mym7S36zr47dSwJxkOIVqUiecgPwEcDAqdwQywG8SmxJg7gr5yoOV6d/vpPNRdS8EV6Z
         uBqKGRYSXtkdXPO4h+2dssbZyUeeNdM3GfOHP4T5atDWoGXK492oT7OqZ0SZ8bQ2H1hq
         TuzbF3x4jVT7Owd9HAJ85aMjcBHcfhzvOV8z9dTfbZ5PGrZCQkRKhVdnzeAAP45MFGiB
         0Arg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=86mMHkgdDijSbJQDMHZoI/MJkyYDK0z5P/lfkmuzyDU=;
        b=R/T8sks4BHKxjuRQGC9Yq+TP8G4yk/0mR0PlgccicOcbhRSH+lQYo2fSV1t1ohzxFW
         7rUITf7Z8l/2ndp24Q25bz1GImMYJ5YDUaAC4UoiJPTh7kB9gGmVMtb807X25GwFmt4U
         aToGgIjwFTYORoo6Zd2RrL9LFCFD6KWI19A/rGBGewplhTMV8gVOKsAKwpFqdXdubP4G
         lsSFhHYkb2kdvMqaeG8ynLy8hqtTerw2U/PGu4zZNBAZbytsUzNcvR6bUNuCobXHsG0q
         ApuPkrDKtCucFu3Zbyc/de4NiJgsKrOxEuhCMvuZCXFBiVJaNgG6sF4KTvKVbGjgGBNw
         oxSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u2si70839edp.5.2020.10.14.01.29.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TEKY032691
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJ2002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:14 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 16/46] arm64: smmu: Remove bogus Extended StreamID support fragments
Date: Wed, 14 Oct 2020 10:28:40 +0200
Message-Id: <9f5484e22ac6d31f56516a6bff56664a78880ae7.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

We do not use the extended S2CR / SMR registers, but we enabled extended
StreamID matching when it was found. That would have broken platforms
carrying this feature. Remove all traces for now. Can be added properly
when there is a need and full support for more.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index e39c2264..9c10d75c 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -42,7 +42,6 @@
 #define ARM_SMMU_FEAT_FMT_AARCH64_64K	(1 << 9)
 #define ARM_SMMU_FEAT_FMT_AARCH32_L	(1 << 10)
 #define ARM_SMMU_FEAT_FMT_AARCH32_S	(1 << 11)
-#define ARM_SMMU_FEAT_EXIDS		(1 << 12)
 #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
 
 #define ARM_64_LPAE_S2_TCR_RES1		(1 << 31)
@@ -88,7 +87,6 @@
 #define sCR0_CLIENTPD			(1 << 0)
 #define sCR0_GFRE			(1 << 1)
 #define sCR0_GFIE			(1 << 2)
-#define sCR0_EXIDENABLE			(1 << 3)
 #define sCR0_GCFGFRE			(1 << 4)
 #define sCR0_GCFGFIE			(1 << 5)
 #define sCR0_USFCFG			(1 << 10)
@@ -296,10 +294,9 @@ static unsigned long pgsize_bitmap = -1;
 static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
 {
 	struct arm_smmu_smr *smr = smmu->smrs + idx;
-	u32 reg = smr->id << SMR_ID_SHIFT | smr->mask << SMR_MASK_SHIFT;
+	u32 reg = (smr->id << SMR_ID_SHIFT) | (smr->mask << SMR_MASK_SHIFT) |
+		(smr->valid ? SMR_VALID : 0);
 
-	if (!(smmu->features & ARM_SMMU_FEAT_EXIDS) && smr->valid)
-		reg |= SMR_VALID;
 	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx), reg);
 }
 
@@ -309,9 +306,6 @@ static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
 	u32 reg = S2CR_TYPE(s2cr->type) | S2CR_CBNDX(s2cr->cbndx) |
 		  S2CR_PRIVCFG(s2cr->privcfg);
 
-	if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
-	    smmu->smrs[idx].valid)
-		reg |= S2CR_EXIDVALID;
 	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(idx), reg);
 }
 
@@ -537,9 +531,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	if (smmu->features & ARM_SMMU_FEAT_VMID16)
 		reg |= sCR0_VMID16EN;
 
-	if (smmu->features & ARM_SMMU_FEAT_EXIDS)
-		reg |= sCR0_EXIDENABLE;
-
 	/* Push the button */
 	ret = arm_smmu_tlb_sync_global(smmu);
 	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg);
@@ -595,13 +586,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	if (cttw_fw != cttw_reg)
 		printk(" (IDR0.CTTW is overridden by FW configuration)\n");
 
-	/* Max number of entries we have for stream matching/indexing */
-	if (id & ID0_EXIDS) {
-		smmu->features |= ARM_SMMU_FEAT_EXIDS;
-		size = 1 << 16;
-	} else {
-		size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
-	}
+	size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
 	smmu->streamid_mask = size - 1;
 
 	if (id & ID0_SMS) {
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9f5484e22ac6d31f56516a6bff56664a78880ae7.1602664150.git.jan.kiszka%40siemens.com.
