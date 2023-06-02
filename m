Return-Path: <jailhouse-dev+bncBDGIV3UHVAGBBQV542RQMGQEZSXPRRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id A20B871FB58
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Jun 2023 09:48:19 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id 4fb4d7f45d1cf-506beab6a73sf1367029a12.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Jun 2023 00:48:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1685692099; cv=pass;
        d=google.com; s=arc-20160816;
        b=QM6m9+R/om0xMHS4wYAR+XM0kSsMqyxXIGV/UAzTu9/39+NmsPkTyrg4Pro3aTgBDZ
         GMxU51xzm1/1v6VvALKxZtNeHrVy9yB3k8Y8VQECQ2omMnKSQgvXbmoOHG9LMMAh7r/5
         Dn/ngTVMCX1GoiwMZtFaoI1Cn7wCdmCj2vEIQDAzQqoRsAu0LBUf98Hp8rYaAmu9yUaK
         gFGWZKM8u3tSAM6vNXNQqWlZs8RHwVufb05t6Cr9O7v5/aHvywLBI9Y5KocLRavsWoM7
         5w9+GEWWT/Jf553CYNHO1KlhSfEt7nTF87ysDVsTDXoPqi6Iq2LNo+lHlfiS/Ev3wR2L
         7cug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=DZbA6aQaLVusUorr+oY+8+bCWnH4vWLZi2FkevIw2Qo=;
        b=tDEIz+SIYNCRev3PZH4d3cstTHfzntl1oqfEt+M93NV94F+gOoNNF7RB5yPdihfxyZ
         YrJrmoeuZcC8HqDFTF23GU5Gn/ZFRVpEmUp5UwYPqEqXI2Lxt5qi6T5dZbBoK0Uiyz4I
         fnqIQqqIG8pcE79KQ4kCzxD0eYxjbRVCNRXCDwOsFW4QyWhVBL6SfN2o37O07Jn2rqe8
         VrQzPgfGDJtzOo7ZSCyKR7kU4isUCH0eDE+SMO7KDwXgH30bkj3hSPgnl99y/mNAVB11
         NJEyXARfGzwLXU4JOgIv1QpGYEYBYDiIXnNnIRDo+6BUT2hRxI3PQrUZVKZmZEK/6h9m
         48tw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=jiBb7MMx;
       dkim=neutral (no key) header.i=@linutronix.de;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates 193.142.43.55 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1685692099; x=1688284099;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZbA6aQaLVusUorr+oY+8+bCWnH4vWLZi2FkevIw2Qo=;
        b=adwgyTPKMK8HpuYkc+LSqTXZEhI3cpg1Dg9M4i49VHrDD/1W9tPdltlH6qfsaxkXZo
         d7F853NDzIvTelVEx4YOnZdwIuoYSHx+ZA/7k9xEmZUjJnPaIaIYWN53XztLK6K3QBXz
         JBTOTwbRNb1Z9CvKnqgL8ZFOySa4YO5Ywek+sJ7fH7YJXwStKAVZYni7DLP+ueznUJee
         SxiiPQuGaIJYNMlvn9BUReIQ9HmeZdhPK3BdevMRflnJdFbFQ8rCfI0VE7OnKh5qhaiP
         yO82Mfw+lSQyh2S1ymNEBfoyKNZ1g/yhOkTYKY+X9kZh1qW1JB4Me1HvhppVCgDfSA6Y
         LB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685692099; x=1688284099;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZbA6aQaLVusUorr+oY+8+bCWnH4vWLZi2FkevIw2Qo=;
        b=B4BuV2slbr2eZfhKVdvqQYA9p3osmSY+yOR0EUBmtZ8UjdBwTMN5HTTOieAZPJ+l9G
         x+Zgva0C1v+zW9caE3Ri/jmo7MS+9uAwc1zV1zFZ6x+3w8epPOrGl9ftZ2GwEqYilJGh
         jG3QSXZZQreuCPPh72taMmOmXmfTbJDEvTY+3gtgRwalTZiFhz1cxV3g4CoohGcIi8Dq
         kgJAOjqXiaz6v1TqdEUinzM10QR/rdmWl/hFAlR6GsU0ktfpP8IrOzzTM6UI/URBy9OF
         nuI7cmhWjXnCNy00OOpSf4DU+8O4HoRjcHqBLEHD1vYBslSyMP3y/LGH8+V9lAOvasHS
         tETQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyOPkB9hkSS6JLixDHVJda+eb2wOm8lCRT2hIgWrlTgUwvKR0tj
	FQNdY14SD6sysE6K26uM6E0=
X-Google-Smtp-Source: ACHHUZ50hfJOewCpOvZJZXYeEVRlJOwxEn8clISGFguB1EAvN+/IxjMdFjCDWy2IpotK4LcAG2ffkA==
X-Received: by 2002:aa7:ccd6:0:b0:514:961d:beab with SMTP id y22-20020aa7ccd6000000b00514961dbeabmr1439620edt.7.1685692098911;
        Fri, 02 Jun 2023 00:48:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:df96:0:b0:50b:c6d7:3968 with SMTP id b22-20020aa7df96000000b0050bc6d73968ls54381edy.0.-pod-prod-03-eu;
 Fri, 02 Jun 2023 00:48:17 -0700 (PDT)
X-Received: by 2002:a17:907:9342:b0:96f:ab92:aed2 with SMTP id bv2-20020a170907934200b0096fab92aed2mr9410468ejc.58.1685692097269;
        Fri, 02 Jun 2023 00:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685692097; cv=none;
        d=google.com; s=arc-20160816;
        b=c5Ap/4ytS4Em6EA6avyJgonEMKZ8YvUZ3+ExwXp/mVJXFhi38VR8XNAiPHWuEH+Lek
         JWH6A0xHf9yqVwQUGKu0P3Lu7Z/5WTatybu4ml63kVhEuCozoGT8IWo9zn6KQImb4txD
         JGm2VfT3GfDVpbmB9e+eoCpnUXHekOdAu+kTLC5Q968Lt5uANIFYNGKBYI9DwMniv2Hf
         AcRrcq+ZEV9Ba7XOpCmrHn8AZh+JqUuP9VTz1h6nILDa2ykh5fBcXXkK2oAgtserKqmi
         fs/GY2tSyDzJthQv+CCHKlXb7hAYDfSsCFf0nJpHskDf8GZsviERnbSaEiv99RDbwvoQ
         ALgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:dkim-signature:dkim-signature:from;
        bh=wRsiAHXICCnmHqmnxxLjH62q5CYMVC3eW0qIYn29140=;
        b=S+50bh0mKLZiwTHPZmQlAyniXgf2avO8KJMyufXTg8v3jNB0AtR4rC0HMNVcMOGfW9
         6ntarYebMsWxVgYzt0LMMFXL9CqHICaP98N1sVrZoJ8BTI8yq09nRcq+knJGSrDqvDkh
         1oBhxUi/vNTAJ6WMvsWR0458JbQ24cAm0NIeASAWjhA+B7B1CsskHq79Vw0WEbQNoqWG
         N3rp+bJiZFZVuMAryyCmQd/OZsAY9buVh2EWD70k7Rygxqnhunl94+Fhn9Nor5dQ048E
         CtUbo4XOcIq6LwYdS9BldmV/nlL5DsXPISV74lnD7SKKbpD2njRcCg4EpTT9AuCFHm0H
         NljQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=jiBb7MMx;
       dkim=neutral (no key) header.i=@linutronix.de;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates 193.142.43.55 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [193.142.43.55])
        by gmr-mx.google.com with ESMTPS id d1-20020a056402400100b005164055422asi29025eda.4.2023.06.02.00.48.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 00:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of bigeasy@linutronix.de designates 193.142.43.55 as permitted sender) client-ip=193.142.43.55;
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Ulrich Wulff <ulrich.wulff@kumkeo.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [RFC PATCH 2/4] arm64: Clear HCR_EL2.FB at cell start if possible.
Date: Fri,  2 Jun 2023 09:48:06 +0200
Message-Id: <20230602074808.1383333-3-bigeasy@linutronix.de>
In-Reply-To: <20230602074808.1383333-1-bigeasy@linutronix.de>
References: <20230602074808.1383333-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Original-Sender: bigeasy@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=jiBb7MMx;       dkim=neutral
 (no key) header.i=@linutronix.de;       spf=pass (google.com: domain of
 bigeasy@linutronix.de designates 193.142.43.55 as permitted sender)
 smtp.mailfrom=bigeasy@linutronix.de;       dmarc=pass (p=NONE sp=QUARANTINE
 dis=NONE) header.from=linutronix.de
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

From: Ulrich Wulff <ulrich.wulff@kumkeo.de>

Clear HCR_EL2.FB if there are only single CPU cells.
Set HCR_EL2.FB once the hypervisor is disabled.

Signed-off-by: Ulrich wulff <ulrich.wulff@kumkeo.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 hypervisor/control.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index bb54b01fdead9..a7bcd060ab0ed 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -413,17 +413,11 @@ static int cell_create(struct per_cpu *cpu_data, unsigned long config_address)
 	struct unit *unit;
 	void *cfg_mapping;
 	int err;
-	u64 hcr_el2;
 
 	/* We do not support creation over non-root cells. */
 	if (cpu_data->public.cell != &root_cell)
 		return -EPERM;
 
-	/* reset the FB bit in HCR_EL2 */
-	arm_read_sysreg(HCR_EL2, hcr_el2);
-	hcr_el2 &= ~HCR_FB_BIT;
-	arm_write_sysreg(HCR_EL2, hcr_el2);
-
 	cell_suspend(&root_cell);
 
 	if (!cell_reconfig_ok(NULL)) {
@@ -629,7 +623,8 @@ static int cell_start(struct per_cpu *cpu_data, unsigned long id)
 	const struct jailhouse_memory *mem;
 	unsigned int cpu, n;
 	struct cell *cell;
-	int err;
+	int err, nrrootcpus;
+	u64 hcr_el2;
 
 	err = cell_management_prologue(CELL_START, cpu_data, id, &cell);
 	if (err)
@@ -673,6 +668,25 @@ static int cell_start(struct per_cpu *cpu_data, unsigned long id)
 	pci_cell_reset(cell);
 	arch_cell_reset(cell);
 
+	/* count the number of root cell cpus */
+	nrrootcpus = 0;
+	for_each_cpu(cpu, root_cell.cpu_set) {
+		nrrootcpus ++;
+	}
+	if (nrrootcpus == 1) {
+		printk("Reset FB Bit in hcr_el2\n");
+
+		/* reset the FB bit in HCR_EL2 */
+		arm_read_sysreg(HCR_EL2, hcr_el2);
+		hcr_el2 &= ~HCR_FB_BIT;
+		arm_write_sysreg(HCR_EL2, hcr_el2);
+
+	} else {
+		printk("Number of cpus for root cell is %d.\n");
+		pritnk("FB bit in hcr_el2 can not be resetted in this case.\n");
+		printk("Create more cells to reduce the number of cpus for the root cell to 1.\n", nrrootcpus);
+	}
+
 	for_each_cpu(cpu, cell->cpu_set) {
 		public_per_cpu(cpu)->failed = false;
 		arch_reset_cpu(cpu);
@@ -812,6 +826,7 @@ static int hypervisor_disable(struct per_cpu *cpu_data)
 	unsigned int this_cpu = cpu_data->public.cpu_id;
 	unsigned int cpu;
 	int state, ret;
+	u64 hcr_el2;
 
 	/* We do not support shutdown over non-root cells. */
 	if (cpu_data->public.cell != &root_cell)
@@ -843,6 +858,12 @@ static int hypervisor_disable(struct per_cpu *cpu_data)
 	 */
 	spin_lock(&shutdown_lock);
 
+	/* set the FB bit in HCR_EL2 */
+	arm_read_sysreg(HCR_EL2, hcr_el2);
+	hcr_el2 |= HCR_FB_BIT;
+	arm_write_sysreg(HCR_EL2, hcr_el2);
+	printk("Set the FB bit in HCR_EL2\n");
+
 	if (cpu_data->public.shutdown_state == SHUTDOWN_NONE) {
 		state = num_cells == 1 ? SHUTDOWN_STARTED : -EBUSY;
 		for_each_cpu(cpu, root_cell.cpu_set)
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230602074808.1383333-3-bigeasy%40linutronix.de.
