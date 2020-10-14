Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYPNTL6AKGQE5UDP33Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F7328DB6E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:21 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id y8sf910827edj.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664161; cv=pass;
        d=google.com; s=arc-20160816;
        b=EprYxrTa9Kuz+4D+6JTruDpYARsWuRhXW0xiVU9hmAi1JCMD7l3DOs4DFdJmODXjD9
         98QyP5ZI0etJ6V1mj81evovVmTi7JlPMA8udj5djTsLaii80sof7RjC7aIjLyWm/B9g4
         nyCbiwvdFkTsG3g2AcTSCbNOfCGuzhczzcGmKqt9V7SthhR+HR3zT7QvIoml69ot3TXw
         LS4WlJlCYrcNfWjj+m9qFvLAtl2YSJWDkmdrX/c/F3Kt5mCaPEGGju1Cqb7hquqk4Ywf
         BMe33Z6Dro4HBpvbzXh7uxZmJhCATGAFm7Gsg/E6UVvz0665ZzQqnft25OZrbA0mrpLw
         3FIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=JFk61DNrm2ll2zTxVB486oPfabVYrbruc6lZsmRGEfo=;
        b=0xr2rPmaNu5I6AewmW/eoj1dKvAtJncNaknAH2GbPvBJ74VSuUd4FHOSyNsJoCVpS/
         188sLc8Th/t47mCE1CVYPlTytZrW9WiUfYW3Ob/f5dPklOQAVX7DqAlV3FeKqDxJsNUf
         XxmeukqlGez6dqYvYGguapVGi/47QdGUWH2ZJy/vpWrDCjOlKvKWcK4uugB/0YPFehPe
         yGvrX40FAXAYsQslihbWDosmaw2L28eHRai5lvyVbuM8YmVy1mDMQTATiWSJRgm65Dq7
         hr/LMjPBaKK9njaihBx3fB/vIJe0hpR3mx0NApzXFOiXpLpX9qLInmytOwTk3QlK5dYE
         flew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JFk61DNrm2ll2zTxVB486oPfabVYrbruc6lZsmRGEfo=;
        b=hLmVbwapx3sPnPdRel0/UiqQ2u4yAM21JAsiQu0fs6KHcJtR2OMqMcoBOLNBziNCAl
         +r3tEyzyaVy8/j4Ob60Ca9mi06FW1pd0Hyy7OwQysqu1eAiJ9o/r575SBZbqxDk5CkI/
         1NIWKZ+E6twMehrGHrvtH7Qky3UiBVnR7k5Os28LjYFarfOuwPJPLTT2jxESurLqG15z
         jU4NUDKYqXxlBUGHJ+GxMAiH74Mdw8iBJ7BeM35TEeflujvGPLfsWcNCfoElUrmo0ulO
         uIc34XIOIbBTFc0HkjjfFMDBZxGbuy6LY4atVjU+j9IjgR4jTK6FAG6vOvMh927Hr0hb
         6rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JFk61DNrm2ll2zTxVB486oPfabVYrbruc6lZsmRGEfo=;
        b=mM1nQI51p94KXBw0jd8XcvxyOE3IN2UaMMpTTQWmmm9a+OlpEfyg64NYZpubsxS4Xn
         Di7VnzHrG0TcHW+OmU0/zsVtQty1rlhJMKjt4DvKQ2HCbLXd3ExE3NdMeFoEpvVhsXiA
         ORGNHk/ZeGj+xx5c8aHy/6ZnvBzZsN0WhBrqrAxgIsouEwuJ0CMFS3AQfCuVpbuw4jIX
         lKSyWTzqTPF8zwj8KSEDiXoZe26kzICJynTKqXTTOvlehRWR7PePxFiyV8Hl3Sy9jUD3
         /8BKMLYVg+QfZImBrb0Qp36fRKY00mMgf314NOCSfljmHTI073JabLGuGtdLp/a6MHW6
         PUtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530v2VUZf1RvfNVZUfN+5X7VbMZXVNJuqoyteHoAbyRrTGu6LfKh
	Vobr4CJwzw6FP5iZJ32GI60=
X-Google-Smtp-Source: ABdhPJzKp6mtc0dnSwqkgyfPJEeq0szNvgSDlPVMeChWCH9kcRq11vYeNxatHQjr8hWa0O3MyECsig==
X-Received: by 2002:a17:907:33d2:: with SMTP id zk18mr4167036ejb.145.1602664161403;
        Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d3c:: with SMTP id dh28ls2629919edb.0.gmail; Wed,
 14 Oct 2020 01:29:20 -0700 (PDT)
X-Received: by 2002:a50:b261:: with SMTP id o88mr4157105edd.150.1602664160323;
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664160; cv=none;
        d=google.com; s=arc-20160816;
        b=Md79y4h/5INVyVq8nkQ52NFhP4ujqgMhxr25SltzaWxhOvy8vq96Hl3pHi6TnNKFta
         nAqbaQ5iE82n+v1AR0OROtm7vBzp1tlC6bhAQbO4B/FWzmyaNjfADsgfvGfH6p1asME6
         +ysXfg4oEvnR5BkEzgoRZWSIeFEeeddV/Bs5PMg+R7w92OhkE/KrxMs1QuWigjdOBJi/
         5/t+GtcZAV+qpVefvM1TEVeeiixR1HH3XDVoAXL+XlCUxCT3WKmCwGYjsZnVCv4opAB0
         oK8r9DHNkmEdp8GRdkd7sShoQQhmApwpY+oVEttDJcnwuJQ6opXYNGKhTlsZI+DLIHxj
         OJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=5QPeRXZ+QuEoDFjZujitJkGruluIb/YOogTcd+p4/JE=;
        b=qVzs+55NZ9ZhmcutKP8GXWoOlLM3K+FxN8AKAyUx5Y7G7nPrsqQ7XF7okalAHrXtvx
         sHn7AG4lXwi0H4+rQTa8uNLoM6VoJkoEVmc4xDUL7lKTQiJfLetGSdD4C3YZEyafhSO8
         FoMIuyuHqQskD2Nw9xKflfL9N/hU0Q4eybHi6qep+2k9PgOvVKijhUDnJ8Cqz0ov9SHH
         jW6QmVWJ7H5HaGnMVp4YUfT3mWAuBZetMEejET0tzdBwzrsi8+GlRJLcsta/36oQ/Or8
         t5nSqlmyf5rtZuSE5UoC3vd8TVblES2MrBmBexcXt5vW8vBJO8/BjTKQp8Oeej419/9J
         zt/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a16si104501ejk.1.2020.10.14.01.29.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TK03001695
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:20 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJP002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:19 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 39/46] arm64: smmu: Demand version 2
Date: Wed, 14 Oct 2020 10:29:03 +0200
Message-Id: <44345f22c74ec68b531cf1b7efec7e15aecd338f.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

We only support version 2, and this should be checked during probe
already. Makes arm_smmu_device_reset a bit simpler.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 3b45cc5e..ac6d7472 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -286,7 +286,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	void *gr0_base = ARM_SMMU_GR0(smmu);
 	unsigned int idx;
-	u32 reg, major;
+	u32 reg;
 	int ret;
 
 	/* Clear global FSR */
@@ -306,14 +306,11 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 
 	/*
 	 * Before clearing ARM_MMU500_ACTLR_CPRE, need to
-	 * clear CACHE_LOCK bit of ACR first. And, CACHE_LOCK
-	 * bit is only present in MMU-500r2 onwards.
+	 * clear CACHE_LOCK bit of ACR first.
 	 */
-	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_ID7);
-	major = ID7_MAJOR(reg);
 	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_sACR);
-	if (major >= 2)
-		reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
+	reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
+
 	/*
 	 * Allow unmatched Stream IDs to allocate bypass
 	 * TLB entries for reduced latency.
@@ -359,6 +356,10 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	unsigned long size;
 	u32 id;
 
+	/* We only support version 2 */
+	if (ID7_MAJOR(mmio_read32(gr0_base + ARM_SMMU_GR0_ID7)) != 2)
+		return trace_error(-EIO);
+
 	/* ID0 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/44345f22c74ec68b531cf1b7efec7e15aecd338f.1602664150.git.jan.kiszka%40siemens.com.
