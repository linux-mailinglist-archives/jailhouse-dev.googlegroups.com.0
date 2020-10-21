Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBH4XYH6AKGQEGRF4YZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2A5294F34
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:26 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id r8sf1773377ljp.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292066; cv=pass;
        d=google.com; s=arc-20160816;
        b=qG6CZ7yNYh/lYe+QpaekeU03Ao+BoOj99r3I2tNsT3VBImkYaSN50WQjeacgjtPTMF
         daSujW6Q7w6pWY0Zsc3uiiMCRlkvjqHaLdHYGj1l+wxXFhBmjPhWoefnSDIeYvPaRyvl
         PDvNO5+DO1eqh81rUG9ktTI8u+ygIp21WtiZ1673crqQUwwCisM5OPCp/JABC5qASjyn
         k38RVKI0fhx1yG3Qx5LVvYsMMT3ZuRbWifHgDikkWThZoFn5DLyj8h0dDAOarYE5V85J
         sWxzNMFuYtWKPwC5mos99879FbDVkEcksF+KDsYowfJ8V0fGAnKSozJpnpCsMZ844he9
         vGtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=/mqfmcsQEqPk9vXLagz4OVEQaYhn+HNTwh47TCIyuzE=;
        b=lAmBYCX/gUVXHYxTfEDpuugVh6By9vsrGZRurIvjyUn7VAX+cc4yDCC6ZV/AZTRVw0
         Laj4e4RGtrzRQozQSqwAnejbDGMLQ7PV2myYWAQumzWOnEpb1v+Cx9VJp/CP9MERrYg3
         etjhovBQvF5clUnuHy4bD53xgYOt8yeuyXlCZsD+YnEwLyF40PuI4ZzK2uKn4giiBuED
         hpgWgNP4eUE2SB7OZvF1Kb04uEAKsZTUhVhUvCkrvMCc6YmdBnV3OEBjJK//vjifYDZX
         cVkQNk1eoAVA2pKuQuEsP69nnZ2S3T5fA+MCK2Lg+mm2SGEszqNw2cWrtaYHObj83MFM
         eYBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Fu41Bxuz;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/mqfmcsQEqPk9vXLagz4OVEQaYhn+HNTwh47TCIyuzE=;
        b=oCg3TeXG/68S/QTb6aHXKqJl9Frl6q1CfnXhJd0vWqEdT99QOmoRb+FbI5wxMyzXNl
         33MyOKP/cQJijLDmANyyLGoT7tmf+UCtswxrxL1jY3nXCyDn+E+jgDAQNWp5LkOwsKWv
         cToPnc9HbEGciM7Y5LWoWLobWAImLKu29LSLtx15OapwI7GMsT6Y6LGD6B4oiTGZvHYD
         Q7t6nZt4bXaeuJwfGi7wYFZGmdmdlpfnp24rUfuQQS/ZY0kggUdnwTRGgPT9m/hSTy50
         ysx2vtL6SZV2yOH3UJpbMDV0xC9UgdQYvgbSmc5ktr5Slz+rdipdkjtJguX0O47Dsd5d
         Am4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/mqfmcsQEqPk9vXLagz4OVEQaYhn+HNTwh47TCIyuzE=;
        b=Gwe5QPNk/CoRsW2Vl7Id6HanHoyywddkDWPoQgShpXnSIKyhEOVuWEhoG6Es+oCVEe
         PG0h07FzV+7+7nFL848BvntCQssyIhbViR+/NSUEesNxuP+AhQEdoYAK3xMUclUI/tZ+
         Gc57vR3Jb2IXQeotFuVuJ77aSBq0LwFbhcEuaQL4Xomlm4dnttB4IoTeHtQZ2N48tX0x
         fh4uQpnv87nD1xKe/UKZRRNjAHwtX0zRnGfy3DLZ3s8P2BSugsf3n42Tlt8f1CjrW5Tq
         ku68k9fz911cA/p2LRA3xRHjvhJVEAZ8AQl0oNzlQxTGf00PMV8EcwEsqKX4lTSbKkcf
         ikWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531eFpzA8MjbRZW8Uwhg8CxBFKxpAf0AwK0BKNaJAXoRLw4FV22L
	Lu3S3CbL0LW8ENU1U/3sNaU=
X-Google-Smtp-Source: ABdhPJwcS/LfpR2L77nWLjtJmE1TEIamion/mIC1nV9lr8mTsptKFuDr5/xINkudxuHxwOBx0Xot3A==
X-Received: by 2002:a2e:814f:: with SMTP id t15mr1564099ljg.60.1603292063430;
        Wed, 21 Oct 2020 07:54:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:14d:: with SMTP id c13ls1085455ljd.8.gmail; Wed, 21
 Oct 2020 07:54:20 -0700 (PDT)
X-Received: by 2002:a2e:9618:: with SMTP id v24mr1651342ljh.191.1603292060808;
        Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292060; cv=none;
        d=google.com; s=arc-20160816;
        b=vqv6ogjfSs83X8a+w+4QCh2Z99kNC6yu6RvJ/oKbF+CCKDzaZ9PT6S2Fqt9cewPuo4
         HfyOSmuTltc1JrHpsDmG/wwZnvHpGsg8s+IGPw1kqhe5D2XM25/JtmzhZvGkLd5GBY/j
         h89OgEf4/ySVXJKIGhl5sRXt6ge14gPv0ic08geqvUQ5FXGym6i4HmWRwZH9HVXP/M4K
         I/BTvuMuxsQB6gdfS3wZ9Rb+pGHeYqUwL+M8DssVPODKEMEBOAfgh5VEanLapB30QPZY
         6rassNr2DGEXpbqlGtQ1uB98oVycDhCZ38ubJuXJ5bddvYbft4pPjbKo6zaoxRxdp74s
         0GLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=gsUliSA8OGpMdmX5qNq/yEM4bBchKfdVBrNMLqSI1/E=;
        b=Tkj7bo7PmxUmdJwMeOI1UiRmD9kIUDV5YVdo4nKxKexOFrtqDnw7DiKRMqUAbLO6UF
         dNas4c/UWaZCRfBx3kFTbm2ORrdzTh/kqB/D+jTx2MOXSjP9MQxCWypMArnJphvUH6tN
         m3W+ncv6vWMXExWf3Ik8UJSv3eChlJt3YpqcaBt6lTrXvxE1loK+mIdkqL3U1cDnTaWg
         bhvAMUJjpj/4O0l/ZFzD6Whu9R/FQUetmN+t6v0Mv5WygIUvQsC5bjmxrCYCblpgoCg0
         OYD6ZwlLWH8vXAM/FCmoLFYPyFqIh+IlqA4S0JrYTLmnmSWjb7PLUvzYG9qGOJl7D3FQ
         /m9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Fu41Bxuz;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id e1si97960ljg.6.2020.10.21.07.54.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRb2GKvzyVy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
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
	with LMTP id nwoclgn5Fvad for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRZ668pzySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 20/26] arm: Wunused-parameter: keep compiler happy
Date: Wed, 21 Oct 2020 16:53:58 +0200
Message-Id: <20201021145404.100463-21-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Fu41Bxuz;       spf=pass
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
 hypervisor/arch/arm/control.c | 2 +-
 hypervisor/arch/arm/iommu.c   | 5 +++++
 hypervisor/arch/arm/mmio.c    | 1 +
 hypervisor/arch/arm/traps.c   | 2 ++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm/control.c b/hypervisor/arch/arm/control.c
index cd68dd9a..c1a0a308 100644
--- a/hypervisor/arch/arm/control.c
+++ b/hypervisor/arch/arm/control.c
@@ -20,7 +20,7 @@
 #include <asm/psci.h>
 #include <asm/sysregs.h>
 
-void arm_cpu_reset(unsigned long pc, bool aarch32)
+void arm_cpu_reset(unsigned long pc, bool aarch32 __attribute__((unused)))
 {
 	u32 sctlr;
 
diff --git a/hypervisor/arch/arm/iommu.c b/hypervisor/arch/arm/iommu.c
index 2c02c812..307daa97 100644
--- a/hypervisor/arch/arm/iommu.c
+++ b/hypervisor/arch/arm/iommu.c
@@ -20,15 +20,20 @@ unsigned int iommu_count_units(void)
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem)
 {
+	(void)cell;
+	(void)mem;
 	return 0;
 }
 
 int iommu_unmap_memory_region(struct cell *cell,
 			      const struct jailhouse_memory *mem)
 {
+	(void)cell;
+	(void)mem;
 	return 0;
 }
 
 void iommu_config_commit(struct cell *cell)
 {
+	(void)cell;
 }
diff --git a/hypervisor/arch/arm/mmio.c b/hypervisor/arch/arm/mmio.c
index 1c492b43..120312c7 100644
--- a/hypervisor/arch/arm/mmio.c
+++ b/hypervisor/arch/arm/mmio.c
@@ -29,6 +29,7 @@ static inline unsigned long sign_extend(unsigned long val, unsigned int size)
 /* Taken from the ARM ARM pseudocode for taking a data abort */
 static void arch_inject_dabt(struct trap_context *ctx, unsigned long addr)
 {
+	(void)ctx;
 	unsigned int lr_offset;
 	unsigned long vbar;
 	bool is_thumb;
diff --git a/hypervisor/arch/arm/traps.c b/hypervisor/arch/arm/traps.c
index 10b3fdbf..103dbbb8 100644
--- a/hypervisor/arch/arm/traps.c
+++ b/hypervisor/arch/arm/traps.c
@@ -96,6 +96,7 @@ static bool arch_failed_condition(struct trap_context *ctx)
  */
 static void arch_advance_itstate(struct trap_context *ctx)
 {
+	(void)ctx;
 	unsigned long itbits, cond;
 	u32 cpsr;
 
@@ -404,6 +405,7 @@ static enum trap_return arch_handle_cp15_64(struct trap_context *ctx)
 
 static enum trap_return handle_iabt(struct trap_context *ctx)
 {
+	(void)ctx;
 	unsigned long hpfar, hdfar;
 
 	arm_read_sysreg(HPFAR, hpfar);
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-21-andrea.bastoni%40tum.de.
