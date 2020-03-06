Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCMTRLZQKGQEHQVEUDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A9417C47F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Mar 2020 18:34:02 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id w12sf949079wmc.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Mar 2020 09:34:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583516042; cv=pass;
        d=google.com; s=arc-20160816;
        b=Uvar9OofK3jpxBXy0LkFbplYeGl1jcBR7adcsMcWvARlGqnsSOMMs3wYtYO5w8dZ6L
         NljjgOAG68bUw+PdqSuBTq1PzlWPltlGWYIjdjkPHk58eiTB8fwd9Pnh5H7dZaC3B8oB
         I2THOSfvwX66y/XXhm+L00KeQxt6sKynU+SZ1+TzOoiEhcKisbQlbRPw3vnaGEQ7aeah
         9YRR64+MnuabLbY+w/cJC2UuLmsip2m0DJ385zt7eRH+0+dtMU9P42S/LSFcgKoabFwG
         eQOJ1kQvRxcKwcJ6HAjIfyq6Gcceo4lV7RNVi6cy9up/rmxK6dpUFvKKMvmxQkTWZo3g
         JVOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=CQjNt5gCo0oPTJmvM13BB0kJQSBvQcJ58IBEneRxcGw=;
        b=knyzBaFLJx/UC1nByybRNMPSI3UJBHNmeCNk/PagtHbA2vCa2uT73OY5PJYXrAumBc
         CqfUO1sKUz5VTb5AbCEqWkNA/fVoCY8xjnxF7PdB1HN59QW/z2bcUTJu/ZN8xfUQ91Dj
         /zaK0y4jIOEsrO5zgyLpwhOwnoGFEcUcwbd81/NDe0jvG8FP/dR2sOWMKK/cZHp27/Pg
         //C6A3JxcQBggbXbtIDsQ98XRbsQKFMEsgJFwwKY9tVv9VsXo+c4qqcqYQHUE4su6yrn
         ePafypoY5JfIsqjRfamEYMFNrobbagLAdtRUmftzfpOWQd6PrXIdqYQvP7q6EzwTxUrn
         FJbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CQjNt5gCo0oPTJmvM13BB0kJQSBvQcJ58IBEneRxcGw=;
        b=UHw34r5ieH1UhMQ3fYKWDIsvbXF2XXE0U2V28nGixVN2Xb+UUbES9BMfUSvsdVlQN7
         6ragMljwo1HliY9tt/27o0L+nawMYY0yumQfri3dF38sPmh1yeEWwg6sQYyIXkC2z5yt
         mkpTB8+rSdsjfwGkRbNPXBy1jWDPF/PPGmLT4zDWoV/9jMuINchx1g8DXZej0wnjs4g+
         oniRpo2EqZnGp7QwuExf+t8uJAW7AcRVn1cjJCZUiBwfwARM6vCIuu/OatATcXjGdZWW
         Cfjr+Gnyiv5W2WcZ7AIlZf1CcR5G89r1jP359i6nmu9am1TpocxETsWOseMbC9T7F9We
         xGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CQjNt5gCo0oPTJmvM13BB0kJQSBvQcJ58IBEneRxcGw=;
        b=aw0sfvEtVgo/akfurL43yv9l0T38Jcxz9B9MYYXJZTya+stW7UtvGauh6HV5K+3pB2
         Uknz8E/mEbuxeA5L7bzx4dfOe8AydE11dIiZe9o8RXnF7LhVKjInF5vNcbL2IKo99b0F
         XNMRBF2GfBQXYd+Huym+tMGtibV0lhtos1kup/G+LCgwm4ow71NmK66tqbyUdQgnqNWu
         BBqB2881M9a9uBWP4yxowcl2UUNfLojGKpZ45ZpFtp7ByUzrjEAANm8nvHChxpvafl11
         RAPDEz3hurg5auMhM8hz7OQ1+T9LXuC0y2MS4RV/Ksl2+tB6Lr4XPaAq5UwprjZe4MDO
         /t8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1tGsvK9Zjvmv3vceMV3zzKZjWKFLrstFADuv2lmlbJxTVXGVqX
	lFkxU1l/dnbhdz/caOwBhxM=
X-Google-Smtp-Source: ADFU+vubnKIPzT6doVJ5YAO/T8lhqPbSmb5K6eSOnMBwoqtXTiGJ/4eQINdX838Q1EtZO95k+/M7kw==
X-Received: by 2002:a5d:6881:: with SMTP id h1mr4902549wru.236.1583516041978;
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:498c:: with SMTP id r12ls1190060wrq.6.gmail; Fri, 06 Mar
 2020 09:34:01 -0800 (PST)
X-Received: by 2002:adf:f181:: with SMTP id h1mr5084208wro.361.1583516041117;
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583516041; cv=none;
        d=google.com; s=arc-20160816;
        b=DCTwT/Ph3QOFG0tlckql5JyZxjI5Un8TjHPeaC86LmXL/8SpAt3UUMnKCrFcfvqR5t
         lpwQ827GcGMD0FJSCMCKQrtljWQuSHzw4Otd07nxkbi4FHIZEDMbXWiOfL2LJyRZT55a
         CF8KJ6E1sFFUW/jM25gHjHVWAP8lY3D2pHUoo6R5PXFUVCSiwdMg6Zl5gVU5+BG69Zic
         kn2KzgoBIlSIfNmJJhcR6STg9svWjMegUfouxca+hYgWpcYIjUolIuh2Qm8zdqYEMvC9
         Eaaz9Oyyl53ThxaBJSexUidKHmlNSjVmlVWsvm/LiiY4mwnOzgNPriyZMhYRzQgn3xFf
         funA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=UN1oUQeI46bW32nFUZ+SN/Js6AR29w7apZieKrO0ZAc=;
        b=gAEPgRsOHYufDdX17pVuviYhLy8Uf113MFqn7wqv7X3PEfHo8COQK1dvD++UqWj0Z+
         Fg3F9lVqL3VtXb/t+Xrgl/PtYu1mnOrYHQNfQgz3fR9sscYieOXA/4mmbJPcTw1h4Q55
         1WYRoQBTQ58hzrKknFfySbM8SU1O9n9tN7mYlQ3CuO1xNgNZHEi4+7VDwHgrqYkosaHV
         FUlaR/D83bqNN27H8GwH2Zxbh58cLeqKALHMhPHkMOsy/tb/k+Iv0Fov9PpE86ZcsPyO
         J0WEN6JiVl0Tjyme89PWvgcPUnaBnyhOj/zd/kzmIr0gTJToBHS/r1sK+xLuTb19/JOI
         Uk0w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id i16si149892wrs.5.2020.03.06.09.34.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 026HY0tI013255
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 026HY0a9016750
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/6] arm-common: Get rid of arm_cpu_kick
Date: Fri,  6 Mar 2020 18:33:56 +0100
Message-Id: <f91c57158100fa0b4586a3271dc2c27570d56be7.1583516039.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
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

Implement arch_send_event directly and switch psci to this. Makes things
more straightforward - and provides the chance to properly document
arch_send_event.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/control.c             |  3 ++-
 hypervisor/arch/arm-common/include/asm/control.h |  6 ------
 hypervisor/arch/arm-common/psci.c                |  2 +-
 hypervisor/arch/x86/include/asm/control.h        |  2 --
 hypervisor/include/jailhouse/control.h           | 10 ++++++++++
 5 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index 10885f9d..2a42c34f 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -36,8 +36,9 @@ void arm_cpu_park(void)
 	arm_paging_vcpu_init(&parking_pt);
 }
 
-void arm_cpu_kick(unsigned int cpu_id)
+void arch_send_event(struct public_per_cpu *target_data)
 {
+	unsigned int cpu_id = target_data->cpu_id;
 	struct sgi sgi;
 
 	sgi.targets = irqchip_get_cpu_target(cpu_id);
diff --git a/hypervisor/arch/arm-common/include/asm/control.h b/hypervisor/arch/arm-common/include/asm/control.h
index a1771302..2f54e2b5 100644
--- a/hypervisor/arch/arm-common/include/asm/control.h
+++ b/hypervisor/arch/arm-common/include/asm/control.h
@@ -31,12 +31,6 @@ unsigned int arm_cpu_by_mpidr(struct cell *cell, unsigned long mpidr);
 
 void arm_cpu_reset(unsigned long pc);
 void arm_cpu_park(void);
-void arm_cpu_kick(unsigned int cpu_id);
-
-static inline void arch_send_event(struct public_per_cpu *target_data)
-{
-	arm_cpu_kick(target_data->cpu_id);
-}
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-common/psci.c
index 13d89e15..65155710 100644
--- a/hypervisor/arch/arm-common/psci.c
+++ b/hypervisor/arch/arm-common/psci.c
@@ -49,7 +49,7 @@ static long psci_emulate_cpu_on(struct trap_context *ctx)
 	spin_unlock(&target_data->control_lock);
 
 	if (kick_cpu)
-		arm_cpu_kick(cpu);
+		arch_send_event(target_data);
 
 	return result;
 }
diff --git a/hypervisor/arch/x86/include/asm/control.h b/hypervisor/arch/x86/include/asm/control.h
index 5ca015d0..2566e115 100644
--- a/hypervisor/arch/x86/include/asm/control.h
+++ b/hypervisor/arch/x86/include/asm/control.h
@@ -23,5 +23,3 @@ void x86_check_events(void);
 
 void __attribute__((noreturn))
 x86_exception_handler(struct exception_frame *frame);
-
-void arch_send_event(struct public_per_cpu *target_data);
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index e50beed7..5476d590 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -173,6 +173,16 @@ void arch_reset_cpu(unsigned int cpu_id);
  */
 void arch_park_cpu(unsigned int cpu_id);
 
+/**
+ * Send internal event to remote CPU.
+ * @param cpu_id	ID of the target CPU.
+ *
+ * When the state of the target CPU was updated and action is required on the
+ * remote side, this function can be called. Processing of the state change is
+ * architecture specific.
+ */
+void arch_send_event(struct public_per_cpu *target_data);
+
 /**
  * Performs the architecture-specific steps for mapping a memory region into a
  * cell's address space.
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f91c57158100fa0b4586a3271dc2c27570d56be7.1583516039.git.jan.kiszka%40siemens.com.
