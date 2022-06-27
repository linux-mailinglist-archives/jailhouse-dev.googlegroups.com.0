Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNHB42KQMGQEM6YNP6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E80155BA04
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:25 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 10-20020ac2484a000000b0047f9f9c81dasf4728342lfy.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336564; cv=pass;
        d=google.com; s=arc-20160816;
        b=OWRGhwBYyRSZCvxtKiNEb3Swy9GO+2UYdQNZIoA2p4GbHkGurYNfOzbQb7ve6LntFQ
         So6GD2Ay0KOB1KXPOKBnAmsCLTSEWuQdfqajhJi4N5UCaWpXk32ELMSN5lnDzfsl1eTN
         +IE/D3q9/OtvNgdf8FuB1a7YHDwpWBA4QxafvQc3CjXn2abOvkiC3epLaYLKrniKUjXw
         F4uQCPdLtJeNzMJRXTn0OjK1O5OfWvTNfCv4b/xJ6UKvzW8txLH1/BaPQtI3PSvjHDB4
         O+I4Q5vwKPPUQsh1WxvzHl6P1nKW/Y1kia3dO/vlPSAVSv/ASMwA9cesGnY/70IeQGLJ
         tYmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=xCAn59h5RxoQcy2VXJV8YEnMpmg6xa9UuSjPXto7P9E=;
        b=QL3GKPTWX369/pQ187+3Xq+HI5uRJ1FsggiB/hw+eA3mONEKE/dJjNVJn86UHmIExb
         q2I3qAId5EkT0G7OBhwfh4GHtK4HenjjM110I28K3CSFhva028qFFsh4Bfh7UCTQxAfV
         lB+IOktHteXcI9qS6Qwlg+V1hWwL2oyEnTUCmaT2ZydMi5hZt2ty0p5gwCUDc1oQLzZh
         +mxJEeI6oWB7OCQrkZrJlZpT222KDsZ9OWMoP29up+MrBBRb1HKLapSXTyipR/1ti4dB
         moG3DPbXytx3Ud9P8twWTqmo9iSWasRbSP7t1sfxaVME0L1qRdn6kN4VYJ7ZumV0ZkfU
         gwOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=RWbe6y2E;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xCAn59h5RxoQcy2VXJV8YEnMpmg6xa9UuSjPXto7P9E=;
        b=Wsveca/9Wt5p+T34aRkxDlbfdgisAZtZfdC+jZv8DW0wy45/gkGcYalKha81h/pr93
         SvTzmseKPdS7le244TBkkYFIP2FU8XdXThZcSSKdSdF06BmsHJy8cXoY4sjeRo4GTMOP
         6d4wEUG6srF7AmdSDB3x9wpxLq/OBGoFVjY/jaz7WZ5mEAEL15b+XTwQ3HBJEOn63a5l
         0CfezyEavn8Q/hQw+C9zy1Omn0/ruSWLIvf6uPkbKHKtR3Xbkx54R3UwP2nEbIyhqPCt
         vSODwwDm/gSgYseuQcUCYGhbbpD4LWOj2vXxSEkcbEKwXfDEHxXk+0QJCxnw3GETQ78P
         8wKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xCAn59h5RxoQcy2VXJV8YEnMpmg6xa9UuSjPXto7P9E=;
        b=GxHNG0c1Ui86+9UX7yMDb3cfUPEsMgw/XPmpFXCJdXavufANqadoja8HBI4c7pF8rW
         CSTSY5ZA2hgiAV7Hst+VQPq5hi9wBRFhfdkBcoVtQdIVLgBweAWVgSC8FqGRdPVKfRCE
         aZUyAW8uSrPztU9T7Nha8hltMt23P449oy5TKxG4yzLE3HpiMsSLwNzW1/W4eoQcygn1
         uJFsXckjA1+L9Trw2IQ7Gvx186sLcoAdVA88Rs+sG0GMsZTVRwVLB1giJfvOUzARuBQq
         uGMsRvT1noOjceAw/q4RhkyIZH2nqPGVrSK7IaeM9Q757ptcrGk75Ev1lGQyFzjXP4RA
         hr4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+14HuPg9VQGdbMHD2IaSc7WxkK4Ei7UwdJd+zM7A5xktsxtvPH
	tpgsi2vS1UWU/pqfCL/36f0=
X-Google-Smtp-Source: AGRyM1tNX4wYP8cJElhkEqkapfUzqDHl91NwikM3ak62+S/NOUsUZPVeJmS6uqr3+SCS7ciP47E5dg==
X-Received: by 2002:a2e:9581:0:b0:24f:2dc9:6275 with SMTP id w1-20020a2e9581000000b0024f2dc96275mr7103655ljh.486.1656336564646;
        Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls213981lfb.1.gmail; Mon, 27 Jun 2022
 06:29:23 -0700 (PDT)
X-Received: by 2002:a05:6512:2241:b0:479:6426:15af with SMTP id i1-20020a056512224100b00479642615afmr8386341lfu.631.1656336563026;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336563; cv=none;
        d=google.com; s=arc-20160816;
        b=YLsScu/tHW5lvOUGq8fEa9CpJakkavSotZqCE8bZO60uucKgcRiv0/AOp1lJIaUA4w
         f7HSF4HGoUNO/NGYfzqQ+B/Ji30PL+EsUPuryOxQ3Afm9KrHmLIL2G6ipAbT36l59Xa/
         wMIZZpXm01VWpx+tAjF8cqWw9lL2Unc2HAerZhdo4GllGLGA+uUqwmrmT/hvXFyppnV0
         rifzmes6vcpCVxCovi/IATaFvNU/pKK4gMslHOfQ5LDict8mCSqCnsgjWcizIvwg7DHq
         ItKhlTMjsPfksuzAfIUS3wCsfFCCGTEBFJnvCxO5jMg7DLxTiINMoxJimSjmBL8Ej+za
         bGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=S+uhoKf3BAGV2RNXI6p7ZbuqZFArm9Wiiy7FLidrQis=;
        b=Z2dxr1QfFXh6CfzsmUOMlXJPNrHk4o4zY6hZ5+kVG1ABXM7ejQalm+SWqP3N2P0GeX
         GU5BfkX4epyCyrg9UxgEtF+r8slSnDpqvBcYhtokABIEcZAhJytbJQGyz4xj2bX1NIM1
         bH5zYLBxbzszeXPYDxBq+oUguRnW5GKEKcx2JJj3kg2mWnr9SrMWIwwXyt9qXOb/aOJv
         nPOH7ebqUYvv2zOAKa3IQF77v6OmuSo6h+TVcTT8psjrUKniZZZqjiFHnwRk8UZLOnGN
         USMytDAUm5wt7fZ784MoRzKedSMgLXTmLBAI5Skf1JhNptq9+ae5y0y3LBuY3eR0K0pg
         RvrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=RWbe6y2E;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id h24-20020a0565123c9800b0048116488c20si170596lfv.1.2022.06.27.06.29.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVB3S97zxxZ;
	Mon, 27 Jun 2022 15:29:22 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:22 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 32/42] riscv: inmates: propagate hartid
Date: Mon, 27 Jun 2022 15:28:55 +0200
Message-ID: <20220627132905.4338-33-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=RWbe6y2E;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

We will need the hartid for the linux-loader later.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/riscv/header.S         | 3 +++
 inmates/lib/riscv/include/inmate.h | 2 ++
 inmates/lib/riscv/setup.c          | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/inmates/lib/riscv/header.S b/inmates/lib/riscv/header.S
index 5ddffe79..e4b21ce5 100644
--- a/inmates/lib/riscv/header.S
+++ b/inmates/lib/riscv/header.S
@@ -58,6 +58,9 @@ __reset_entry:
 	la	a5, exception_handler
 	csrw	stvec, a5
 
+	la	a5, hart_id
+	sd	a0, 0(a5)
+
 	j	c_entry
 
 .text
diff --git a/inmates/lib/riscv/include/inmate.h b/inmates/lib/riscv/include/inmate.h
index 57338d25..468d2218 100644
--- a/inmates/lib/riscv/include/inmate.h
+++ b/inmates/lib/riscv/include/inmate.h
@@ -58,6 +58,8 @@ typedef unsigned int u32;
 typedef signed long long s64;
 typedef unsigned long long u64;
 
+extern unsigned long hart_id;
+
 #define SR_SIE	0x00000002UL
 
 #define IRQ_S_TIMER	5
diff --git a/inmates/lib/riscv/setup.c b/inmates/lib/riscv/setup.c
index 705c5630..a87e8c50 100644
--- a/inmates/lib/riscv/setup.c
+++ b/inmates/lib/riscv/setup.c
@@ -38,6 +38,8 @@
 
 #include <inmate.h>
 
+unsigned long hart_id;
+
 void arch_init_early(void)
 {
 }
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-33-ralf.ramsauer%40oth-regensburg.de.
