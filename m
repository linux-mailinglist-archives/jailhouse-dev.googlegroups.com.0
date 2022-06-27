Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMPB42KQMGQEZVSHWMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ECC55B9F8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:22 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id t14-20020a056402524e00b0043595a18b91sf7133317edd.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336562; cv=pass;
        d=google.com; s=arc-20160816;
        b=Or6lb9PkpV07H3QEU+i+5bon0oZxoWATK0QNT2I5lGB/AnP/PAAnlyZGL75/cml/uf
         9nu22qeqahmDk6nI21zHFoj+L+Bw+pYBfyZixddndmQ7X2kAFHlYsWn1QNGy7wLAc2S+
         jxCBxeZ4YAYIX+vshML6BXK1yjy/v8+/JFbKEDOFK+vKff3vdmUMYEksw+v6rtysMTRR
         T8y6PmtLiZI+v29M6lRszQLivHndi8S7PDdnhUPUqRiBsU+Xx7F0OvWnKaa0ExoaU9zf
         teXlhsth/FYGIwpik6L9m3WJAhFt0jVeFhJFz+Kr14d7b7NlVSkpidANuE2TclTPLpYT
         scGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=1oBa60fxqtm5SjMchTvxdC5WvKVH0njUGivk9YU5F10=;
        b=uX9+lGITSlmweZPEfZHNAhJ70dq7M8/VtW30MGRySfpgx45m8FzqhNHFqKk/5XwjUy
         HbYrBKaqZet4ELHeuxcDoaqQJBIsGszP1XEwPRzKXwXbAmHZCXie3lTbEcZjvP4jXZ6k
         9tZNn5CpjgWo3OuUS4k49Ci/e4mwrITdWYltalJm6GRYmVtpdpkX4VgfE0nMGmgOfjkn
         x2mKHKUNB9Bv31uEfCeoQZfQS/N/jO3kiemunySitIbFfpjudPlOn+1g/2wLsVU/8Ojd
         bMvF2zRR7SQS3nuy2wZED4KmrlnKtPO0KJXV9rd3v8YUKpswJ6n4rJTmRUqvr4NFcjZJ
         ozaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Bwm7f910;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1oBa60fxqtm5SjMchTvxdC5WvKVH0njUGivk9YU5F10=;
        b=EBbO0f3R1T4CfA8JisbbDOFFC+rp04b89L4vx3c9p6j7B+Hs1AYZqreNo9o3ef8N3Z
         BkJ4Rq3Pue5zV0lkMlagsFPv5EKDtRCqRNa6OiBC+NS76v4zTW+nTLZ79ERHqSaBzxMs
         gVZOVXpXfe3r/fl/F/kg0PEjbcf7khUGlf3Q9TTroj9tqm5qjP4tkVufsBHm6AWsvND3
         nsSVO4yWeodFasEb6GxFLXMIrMnHuVE/ZSmeT2Rb0AsKybXCqfWrqu4Dt/+FBSWxBrNp
         dPvN34ZEPSnFA1agN70z18ScpO3GqijKL8pv3ZMJBaNJqfkOT9pzLJ/wdcnS0+OXjJvD
         JN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1oBa60fxqtm5SjMchTvxdC5WvKVH0njUGivk9YU5F10=;
        b=mTaO/lP1qYhyDbB4ge9Czby/DdSiNr9oA+fnZn99OChMB1+aGO8Mrb3Y/WiDGb/Z30
         qCRuvyeNnAlUlVmVOKW+POhPkNYjmZarovYG4TQYfGO2kCSyig3QhByd5BFSE3NL+6bf
         koJzqkqW0zEdObcCSzCueYSfJmI1asH16rE0KyNYjLpcARRtwjrB4CnSaYo+jyk0Tk5C
         NbdB17dHlqkZP7/M6Gv/c+aDoKG0s6b2t4duRK7MJUpey9OBlMOMVS3uR+9J7kYLhtbx
         tOqF+p+kPCr1zVBu9jPd627yflwU2eSXkdJ/veIDvIJuT1UcOj2quWKf8FxTqM55wck7
         7kbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8rMBblb8Ehu3eZAHAfxzvYxeGb6txrzpbqR63eAywAhPJ6w62C
	nYFy/+TLQmibVUpDMJGKAuY=
X-Google-Smtp-Source: AGRyM1vWw44x2Wx0RkaRN4qePjanniMh+HqcQWCfMzEMoVXZiyHNFVkOHa6KrjAA6Jq2EZvY7Ofvzg==
X-Received: by 2002:a05:6402:4244:b0:437:726c:e1a with SMTP id g4-20020a056402424400b00437726c0e1amr14083251edb.107.1656336562395;
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:50cf:b0:435:9b77:f6e3 with SMTP id
 h15-20020a05640250cf00b004359b77f6e3ls1431384edb.0.gmail; Mon, 27 Jun 2022
 06:29:20 -0700 (PDT)
X-Received: by 2002:a05:6402:1d53:b0:437:9737:24f3 with SMTP id dz19-20020a0564021d5300b00437973724f3mr4660956edb.397.1656336560861;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336560; cv=none;
        d=google.com; s=arc-20160816;
        b=lQj0KEIL0PZwCAlhxuq/JS0vZGWJsO7tqkLa7WuRkaTbVOLhe7u2gy0wtP2ueWTU4L
         KNVsWFhaGsHfsjcWdW3xQpjRzG8GLrNqa/bx3TAlABtBNO5zgi+pads8klbvfrsNlskB
         f/EhFrCdULxx/UYDTSor34tYEHq8VXGII3/otWlD+7GYPELlTZMJ3mDJ/DLZaiQ1SRyI
         +UY8+I/Dqw1DHZhajsDvC3usjVbcKcPoclrh2rbYekim10+Itj/N4ZRl5NniSCkxcnNR
         d22LkhpqIjJY5ZdsrFMVMLxa+gjP71T1HYk1kqhR+Dj4fM+a6aJZRXznaupi16ou08d8
         YbxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KOBvhSkihx8Fjz3wEUmUb72+MgP8CWkelWb6PYEYt70=;
        b=X3pKEUmfg165PXntV2phIXdGF29nNYkfNe++8HnNgHTfPP+vi8iAvh/e7q+2zHVCgJ
         yxH4FJybSoLBcwMPMTyspozxtYjb8u3G4eAMA6EMPppS/EYTkZT/GC4sQZiCUJonV3ag
         S1iaX+7zQYSzTxa7jiy3iWEV3gSco4Wu4Cv82Kh1n6sRoDTJ0iywMdeKif/e/faFT5af
         HEakKTlNwk9az6709F6+ToaAGBBQLIGX/23vPenQJ5HUPHQDQ+c9IgdjTckohQQi8HHg
         UO0XE5SJeCd2S/5FQhrfnWvwehOa3d+OFTHDtm80x0ejpuuz20cGo0MTVYAFakTE94lh
         P68g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Bwm7f910;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id ci3-20020a170906c34300b0072546cfeee8si452408ejb.2.2022.06.27.06.29.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV83lP7zy1c;
	Mon, 27 Jun 2022 15:29:20 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:20 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 21/42] core: riscv: implement arch_send_event
Date: Mon, 27 Jun 2022 15:28:44 +0200
Message-ID: <20220627132905.4338-22-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Bwm7f910;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

On RISC-V, there's no possibility to parameterise IPIs resp. enrich them
with some userdata. Great. We need to do it in software...

We differentiate between two IPI types in software: IPI_CAUSE_MGMT, and
IPI_CAUSE_GUEST.

When a guest sends an IPI to a HART within the cell, the HV will trap,
and we forward the IPI call to the SBI. Before, we set the cause to
IPI_CAUSE_GUEST.

Follow the same logic for management IPIs accordingly.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/control.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hypervisor/arch/riscv/control.c b/hypervisor/arch/riscv/control.c
index b848994b..263708a7 100644
--- a/hypervisor/arch/riscv/control.c
+++ b/hypervisor/arch/riscv/control.c
@@ -11,6 +11,8 @@
  */
 
 #include <jailhouse/control.h>
+#include <jailhouse/printk.h>
+#include <asm/sbi.h>
 
 int arch_cell_create(struct cell *cell)
 {
@@ -68,4 +70,16 @@ void arch_park_cpu(unsigned int cpu_id)
 
 void arch_send_event(struct public_per_cpu *target_data)
 {
+	struct sbiret result;
+
+	target_data->ipi_cause = IPI_CAUSE_MGMT;
+	memory_barrier();
+
+	result = sbi_send_ipi(1UL << (target_data->phys_id % BITS_PER_LONG),
+			      target_data->phys_id / BITS_PER_LONG);
+	if (result.error != SBI_SUCCESS) {
+		printk("IPI send to HART %lu failed: %ld\n",
+		       target_data->phys_id, result.error);
+		panic_stop();
+	}
 }
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-22-ralf.ramsauer%40oth-regensburg.de.
