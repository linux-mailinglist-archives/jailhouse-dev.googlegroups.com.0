Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7UP3L4AKGQEFFHDN7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA862278BA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 08:15:27 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id x24sf4883091ljm.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:15:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595312127; cv=pass;
        d=google.com; s=arc-20160816;
        b=IxUk4oQC58iHFCZ4TLWJkDubWR7CUr2dFXDKyou+/pcTwZmxisejl6hDThzvF35UJ6
         Om7KVrYToaWVv8d6PPjc1G05Kl4HMZqJTblM7VVAC9tcRLDhyh9GyxHWn5l/yRAEhLzf
         1lRWHAjm8f1WIB2NzFhfyLmOSv4KH5bk9T426m0BxCd5G1HRIiHjrTkXB8A5S5fC+aZe
         bIpAz4P2QDvbS+v9f1OiQitq2OWHaWYgiPHVdaI68jM4DZoVNrkB6TkG1wdXa3amnB5M
         i1k/xL7R/0Cs5fegINQEWZVZ9i69ldKRYsRpZYuCuaIms9GFvMIqQ4EXI1MR9Re+XOIO
         RV1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=rZ4n8FoT/HuwXPJFfsNY/Rn552FQoB7cZpnJS+Eqgf0=;
        b=sgoOAQZy7+WRuYe+oGQNf4L99M2xwoU8T5H1RK9LuVIB5l1r1xQgeeslaR8BToS4hQ
         0Bcl+q7xZscNh/qPJNrwpc5M9ifR/4YRvdr/fScifZL9QTGucMMC5NLoc2gp3uHdEGSH
         wtovVSNPWIsrUnmWRoU9CrTYfR8BNG+n0YEBwiQyAgj3CPb6YzwNkB4tIs22FXn9LSRM
         mZOonYNcmDHXjQKH5g/cg1pZNGcQ8D2hkhHB8iG1S2cu0rrraftS5qWHsH2FY4UKi7nm
         fBy2EfmzLdhHb/TWpqcM25t4kxWE8MEuwBwkG+1IbqRA/Y27778CX10v3Ug5UuhQeemI
         VTOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rZ4n8FoT/HuwXPJFfsNY/Rn552FQoB7cZpnJS+Eqgf0=;
        b=eTbTNLAL1axMRyrApi1+tI6TLYOgPhtSbXqSOxuYNepq1fpHp/wUvdn+a2VDqbQEvi
         KTL0QqtbabGH2XJ8080KAcOxlVU48OFzBb06mz5wubcpsvNEFihC07kk4euK7DhCJddB
         tPQFyI1LPbkkLQTbpky4AdYN3A/UOL+B0LLqeCPk9m55yo9sONAGk0CATKoFQI1QLy2d
         BR6zJjOF/94iKgcsJotBI22Wfiq7gDIRDvlzzXXkE8DvFTSk/j0oX4SH0XchM48z/gl9
         U4MgZxVM6iGw2E5F2a4rsss+ZSDRdGxktKwX8Doqu1WeR+W3gxZedwtitaYBY2T2QiHu
         MjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rZ4n8FoT/HuwXPJFfsNY/Rn552FQoB7cZpnJS+Eqgf0=;
        b=ZPqqe5VeCR3VqViWjPcdU2EGKkikvYdTqaSSy110HnBNgSiq15OaDFoS8ddQi02ZyK
         7Lt3XGlalkJQC1h8YRc5Ze0gz4EeBKgSJTwMXC0jqjqcptEigEITTzIgEeFi/QClknhn
         YYNFutQr5+IM5NBX8A1AcJpuCKiU0ZPigNsVWtxb2GKPSYkG1jAGbgNPuxinUs4TmQav
         mOu4LvQogvhe8Owavu9Z2LOtekR1k2EOc9Qukgqcl4gyUgmYDzJEfGeJ+o1L6EQYL32n
         xOJYA6eHNbyo8Oz2ebIB8cIEjtfjQXNjMrx6wV8MvFlKeQHFD0pkOyS9Dd83cqLD5S0x
         K44A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532J9xtuLX3F/PL86oPmz6y/alFFai/cgNbxFhDm35C44ksGvtjk
	GFR5Xvl1DtPmO6RNyWLDfoc=
X-Google-Smtp-Source: ABdhPJzrhPESU8x6psTAUBYVr2GVZNahK3wu2L+rmcuG3NyhcuPy89shPVfFiMV1DIYJUgLV9YlVZg==
X-Received: by 2002:a2e:9611:: with SMTP id v17mr12615262ljh.110.1595312127139;
        Mon, 20 Jul 2020 23:15:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4f43:: with SMTP id a3ls2712141lfk.3.gmail; Mon, 20 Jul
 2020 23:15:26 -0700 (PDT)
X-Received: by 2002:a19:9c2:: with SMTP id 185mr2375847lfj.113.1595312126248;
        Mon, 20 Jul 2020 23:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595312126; cv=none;
        d=google.com; s=arc-20160816;
        b=mq2XeG4pc0hBYLOp/qR26q9xSh5xyL5zOmRZTiOQgAmgRielTtj25nn/SZd94pxoE8
         UAyG5RAkxlAlJcheFcLLdgLBRqs5kwzhqBI5uCXjj8A1bz/q5SUjws2s0QB+B1tc30yr
         v1hriviM6qoSUL2awo4U3RxCuLr+rAN3+YYqJMrX3b64jlbyUAIyIAOKm+Y83Shu0WU9
         P53K6EmArEHU3M93WL3BtQn1n4vZ2SoebZpCopLOXcQHtqFdy7Jp4suuEl4xM3sKfpNK
         tCx8B2/4fDbh/MZH+gJNc1MQCTQeCVIDAZoO9PcaCsLO9NhwWgNWt7lFgrs3vuzJ84KY
         j49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=msx0N/lHvutJMVrG5J3iNrnmw5DYzaDPJkV7gMPS4B8=;
        b=AoGQq9tHLtxq+saeFxEyC5qIUuTBgPr6n6NGYFx+ppPZ96TXjRkDev2pc2EvZac7Sq
         nAVQwrD9r4wsDk57Q62vv5JU+Na8r4LAK18RmwF2uGztvKGxiWP87+px7aNrQcxpCycF
         xCLa85r/9BY7Q8fboaCMYK2bRSgeLkBryAh4tRqHWzD6czt+ayCsvezPSnUozfhM5R8T
         9uvRS52XdF5CS0S9IKeV/l/7oN3Su53xfbtaK7yzVSZmxPSDAXLhzY8VVMYZUA+AFAqo
         mHsHY2Bl6vMkcmX9uWhNLuL7hwc6GlXnpoFBnRsZe10JWWCINJW7sG5rsx7NT9N28dmU
         2Ctw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z26si659312lfe.5.2020.07.20.23.15.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 23:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06L6FPW6014235
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 08:15:25 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06L6FNaL018114
	for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 08:15:25 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/3] arm-common: Refactor irqchip_send_sgi interface
Date: Tue, 21 Jul 2020 08:15:23 +0200
Message-Id: <9b4efcf4cb3ae36a555251ec01ba75d648c0f7a5.1595312122.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1595312122.git.jan.kiszka@siemens.com>
References: <cover.1595312122.git.jan.kiszka@siemens.com>
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

Pull the setup of struct sgi into irqchip_send_sgi, avoiding the
duplication of this logic at the callers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/control.c          |  9 +------
 .../arch/arm-common/include/asm/irqchip.h     |  2 +-
 hypervisor/arch/arm-common/irqchip.c          | 24 +++++++++----------
 3 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index 2a42c34f..70793432 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -38,14 +38,7 @@ void arm_cpu_park(void)
 
 void arch_send_event(struct public_per_cpu *target_data)
 {
-	unsigned int cpu_id = target_data->cpu_id;
-	struct sgi sgi;
-
-	sgi.targets = irqchip_get_cpu_target(cpu_id);
-	sgi.cluster_id = irqchip_get_cluster_target(cpu_id);
-	sgi.routing_mode = 0;
-	sgi.id = SGI_EVENT;
-	irqchip_send_sgi(&sgi);
+	irqchip_send_sgi(target_data->cpu_id, SGI_EVENT);
 }
 
 void arch_reset_cpu(unsigned int cpu_id)
diff --git a/hypervisor/arch/arm-common/include/asm/irqchip.h b/hypervisor/arch/arm-common/include/asm/irqchip.h
index b3fa6d3c..20e65b62 100644
--- a/hypervisor/arch/arm-common/include/asm/irqchip.h
+++ b/hypervisor/arch/arm-common/include/asm/irqchip.h
@@ -89,7 +89,7 @@ void irqchip_cell_reset(struct cell *cell);
 
 void irqchip_config_commit(struct cell *cell_added_removed);
 
-int irqchip_send_sgi(struct sgi *sgi);
+int irqchip_send_sgi(unsigned int cpu_id, u16 sgi_id);
 void irqchip_handle_irq(void);
 
 bool irqchip_has_pending_irqs(void);
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index d1a89359..4172934a 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -226,7 +226,6 @@ void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id)
 	bool local_injection = (this_cpu_public() == cpu_public);
 	const u16 sender = this_cpu_id();
 	unsigned int new_tail;
-	struct sgi sgi;
 
 	if (local_injection && irqchip.inject_irq(irq_id, sender) != -EBUSY)
 		return;
@@ -258,17 +257,10 @@ void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id)
 	 * on the target CPU. In the other case, send SGI_INJECT to the target
 	 * CPU.
 	 */
-	if (local_injection) {
+	if (local_injection)
 		irqchip.enable_maint_irq(true);
-	} else {
-		sgi.targets = irqchip_get_cpu_target(cpu_public->cpu_id);
-		sgi.cluster_id =
-			irqchip_get_cluster_target(cpu_public->cpu_id);
-		sgi.routing_mode = 0;
-		sgi.id = SGI_INJECT;
-
-		irqchip_send_sgi(&sgi);
-	}
+	else
+		irqchip_send_sgi(cpu_public->cpu_id, SGI_INJECT);
 }
 
 void irqchip_inject_pending(void)
@@ -311,9 +303,15 @@ void irqchip_trigger_external_irq(u16 irq_id)
 		     1 << (irq_id % 32));
 }
 
-int irqchip_send_sgi(struct sgi *sgi)
+int irqchip_send_sgi(unsigned int cpu_id, u16 sgi_id)
 {
-	return irqchip.send_sgi(sgi);
+	struct sgi sgi;
+
+	sgi.targets = irqchip_get_cpu_target(cpu_id);
+	sgi.cluster_id = irqchip_get_cluster_target(cpu_id);
+	sgi.routing_mode = 0;
+	sgi.id = sgi_id;
+	return irqchip.send_sgi(&sgi);
 }
 
 int irqchip_cpu_init(struct per_cpu *cpu_data)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9b4efcf4cb3ae36a555251ec01ba75d648c0f7a5.1595312122.git.jan.kiszka%40siemens.com.
