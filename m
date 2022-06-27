Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMPB42KQMGQEZVSHWMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id A339955B9F9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:22 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id be13-20020a05651c170d00b0025a917675dcsf1018570ljb.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336562; cv=pass;
        d=google.com; s=arc-20160816;
        b=XH4GRrVh7d/2OH3Wdz4idCVgUuoUpTBletbCDDnZ3MzsEfJotJ+FQD2MD3WWEddTpv
         0e9ejgKYG4VU8xLfup9JHJzIOafa9wCZE1X23UszDO08qlg+3knABNU57qJ+V1BXejJf
         XmzyI6TFy+zf3iuEvdB0mv9T9AbCgMeMUo1602gup+JJ9aLcII5rE5IC6puZN55sjvG1
         uYoymTwh6fCcUTHlXhcFuqHDr0OoR8kX1afvWsSN441qjvpvDeLDvB9AZTLXfSuVzolm
         t6a7OTasiqmAlNR/mBz7OVzZn+h78fZtBmfVeiDTgI9RdVRLGHn2S1htBOOfcSpzJnIB
         /EkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=7LHFdlkW1GuRDpy5w8itF1T84QHqb6YzjNTVAW4gUjI=;
        b=0WE9KIThxIRzO5LEmuyV3kA+kQ6jiLCWunDLcKKKQSXMFY6Hy7NxQlW95uBoq8QgJT
         MqkGsPBtLNDMw4K22+5UGCsS6LqveIbFmEm1TY3zRq3pUE9lSBVFws7Ps0loIZCUf0io
         dAbp+oLFK2kk1kN7uvLacwMbT6M7wdBFhBUXXXOqYvA2XETRHCWP/6QfZ4IJmg1c0fWy
         p/USJbFbmuEHssL9jQRfa5JE3uASH+O6obwgV67DCPgaUnRxgO+wdlTRxVgTy1ejl/+4
         96i06EHsA0ivhqOyQm184vh+KA4X19Mkxz48JBM+FvzP0XzUHaN7ZtHZKEcbV33jpHMM
         8hCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=h6mA3ifC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7LHFdlkW1GuRDpy5w8itF1T84QHqb6YzjNTVAW4gUjI=;
        b=Vm6rTtIaVc9pDxpK04rG/SUIqR/BKXYTLU0zITWzC7bC1KCMfaaEr81dbxUF8CIJVW
         Zdauem9C64OdrxWEeksnsQ3RyrG6hD9WnNvv8a5/ypqVRjvQHp3Ja08Ff6xZeOIY0Ws9
         H9wC3VPsdDySmi8yQTKbAZrfS4jFb8RYfk9T+c+k15AiistPBua8WAW6+wfxDME8WAfH
         xhGnQHIOx9FnhVpa4Z1fljoEr1PxvUwbsOWXG3ayyvKEXMdCZH8Xk3gJWSHlrxNOdUoE
         FYMzwhqmYl27mm5cH+3/OPDtp4koN3AN5NdXMARxGke9Ymj9sh/AFNx4escg8ZhCjRSt
         iv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7LHFdlkW1GuRDpy5w8itF1T84QHqb6YzjNTVAW4gUjI=;
        b=pjijOyHYF7Qw2rKF2mntwEfwDTFeWdbZ+0HbZEclhbKtOWxacIa1Gac5MHy7RUbyit
         WGR6hwnacwG1rqES1VnJRrwXbfG/6BS9phbH1haXmf+EegTbWGHfPfa2ReEjm3Ul8A8S
         wu5wXxG6MOwEN1iel4UQr4NCGzX7xhg3cMh+N5E1SDWnDa+pNTWJ5qmKTTrutv9VkvHq
         CXmoH993DbwbSJ6Xua6jK8xpvcsRL+eYyzD8KrEKhFx0cWFJ8UGpucymVOctXMIxDpPK
         Ox2YHgapsu92MzzvCXKcYKYUNLhTzqfteTmveIYdXtl1ehCFvXJp6sWooGl4MJthvzIn
         FFtw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+wuvyLloKMLYNNtp2djSxdfMc+aObDl/OvtYfdzRgspE/GnRXz
	6LDQx7AzOA5UyQjfNGxCLhk=
X-Google-Smtp-Source: AGRyM1uXxq7P2369QiwhSxtU6LHbJOShW6J29K2WRNecgwbdveLbE6utBG9/rOwel8y7ejy0JI3+8Q==
X-Received: by 2002:a19:7b0a:0:b0:481:18b9:ae28 with SMTP id w10-20020a197b0a000000b0048118b9ae28mr4193996lfc.317.1656336562260;
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9948:0:b0:25b:c0c2:7dec with SMTP id r8-20020a2e9948000000b0025bc0c27decls419719ljj.11.gmail;
 Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
X-Received: by 2002:a2e:a16e:0:b0:25a:9202:9a80 with SMTP id u14-20020a2ea16e000000b0025a92029a80mr6470123ljl.105.1656336560501;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336560; cv=none;
        d=google.com; s=arc-20160816;
        b=zjefgIaKQmoIviVtaSIm5LSMBY1J3Uc8rrqFPSwTDIwKlanbIeY43gyK63btA8gOis
         sKhUVVBUDZcRJHK7JMKeNyd5nfXXMnueg0mPZfuU4kbSczogyI2ZpfsQ1Yvcx5os27G7
         4rzkVn5tl1N2+/uUaaygHu4T86avK1fNyFsLcQ75P6PYhBiVb0g8lQRf39QVYBlNPY+4
         222JNYce9o/bwTN3Un5Do98RMyporB8AAnTcW2gLinwwNtPdVvwORSa9Fv/Jm8QmhF93
         7/Ite28mmoNRomqcBLJKc5aKW1OjSUhJenBRaQGOX2jIl428H3NY6Li2fpp4aom1sTZh
         0TuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7D6+oq102MMlXpJe55qKFMkcvlbzrtz6lVgExKn9r8c=;
        b=E0IOTT7PLJRRrCe2v9sUsBjx+oLEL/xDmVb8iKgYIWb/78XmXe2e6fYbnUoMBE7pjK
         cP0XAhn0lmOnyxRQYYwgKE4XfMq/zq6FUpvFLUhMbHe4+FDhkZcrf0mHQ+eUamlUW2Y9
         XMOYhY/eqCgx3d+e6UUgdp6zwmkrG25owxTpApAeLO4XLFJJWN6pJYYYQejuqtusE8QU
         e1QBNCTswK5Vke0PvKXJ5F9QMSYGvZKJATXuf56W24I77w3HF0x8gP/6mx2iCJsaQXmP
         KHYiEX+JxSs2rOuHllg+EAVSYDRs5h3tsDJiqGi3jrx5n1MmCH0jSmq0sC3tRUEvP9G9
         ixpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=h6mA3ifC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id u12-20020a05651206cc00b0047faa025f65si339013lff.12.2022.06.27.06.29.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV76sSMzxpy;
	Mon, 27 Jun 2022 15:29:19 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:19 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 18/42] core: riscv: introduce traps.c
Date: Mon, 27 Jun 2022 15:28:41 +0200
Message-ID: <20220627132905.4338-19-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=h6mA3ifC;
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

This commit add the stubs for two exception handlers: arch_handle_trap
and arch_handle_fault.

Rationale:

On RISC-V, there's a scratch register (CSR), which is typically user by
the supervisor to store its stack pointer. On traps, the guest/user's SP
is atomically exchanged with the scratch register, to set up the
supervisor's stack.

Now, in case of faults when we're inside Jailhouse, we would have to do
the same trick, but, in case of double faults we're doomed anyway.

So instead of preparing a new scratch register when entering the
Hypervisor, I chose to simply redirect the trap vector and reuse the
stack, while the hypervisor is active.

So if we're trapping the hypervisor, we will later end up in
arch_handle_trap. If we get a fault while we're inside the hypervisor,
we will end up in arch_handle_fault.

These routines will be called from assembly.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/Kbuild  |  2 +-
 hypervisor/arch/riscv/traps.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 hypervisor/arch/riscv/traps.c

diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
index dd114a6c..4213194f 100644
--- a/hypervisor/arch/riscv/Kbuild
+++ b/hypervisor/arch/riscv/Kbuild
@@ -14,4 +14,4 @@
 
 always-y := lib.a
 
-lib-y := entry.o setup.o dbg-write.o control.o ivshmem.o paging.o pci.o lib.o
+lib-y := entry.o setup.o dbg-write.o control.o ivshmem.o paging.o pci.o traps.o lib.o
diff --git a/hypervisor/arch/riscv/traps.c b/hypervisor/arch/riscv/traps.c
new file mode 100644
index 00000000..f61dfc1a
--- /dev/null
+++ b/hypervisor/arch/riscv/traps.c
@@ -0,0 +1,28 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <asm/processor.h>
+
+void arch_handle_trap(union registers *regs);
+void arch_handle_fault(union registers *regs);
+
+void arch_handle_trap(union registers *regs)
+{
+	for (;;)
+		cpu_relax();
+}
+
+void arch_handle_fault(union registers *regs)
+{
+	for (;;)
+		cpu_relax();
+}
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-19-ralf.ramsauer%40oth-regensburg.de.
