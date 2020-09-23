Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBXHFVX5QKGQE7SUWKBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7AF275CCD
	for <lists+jailhouse-dev@lfdr.de>; Wed, 23 Sep 2020 18:07:57 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id m125sf93604wmm.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 23 Sep 2020 09:07:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600877277; cv=pass;
        d=google.com; s=arc-20160816;
        b=iVXvbA90np0UG5ToZbv61QffYKbQcOvRYAIVxftptEBSi1yl7FQpFI9oxA7yPardlV
         0mfZCKkJps2ymybJef4pTmUI6kiHSfuRcBxxY0NoxLiT4JBLKlPGtipAxzVCr1q3qYPl
         oirGUWP03q413feY8k9Ci9ahsNpvI2hrQ+c33LnrXto2hLt1wx5c0CKiIuojCCsqdkPA
         bUaGkrsNwjz5o8PVMarwpUuOazckY2lKj8fxgRWMzQBjX5GEsMd/TKms1sAj402NpO8B
         agQNC5ZJ2RzfF5zZLisSsP9+IDGoj9gfwY9nLtSSZJ6sBt8dSASg8xAbJ0Y092uPW5qr
         zyVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=1UILn2r6mIO6iq5nusizM+j7IN4vQZ9T1G0iKeCYp6U=;
        b=0PaBgT6PnQ01Fm+f5aF8p81JqBwtFF4GKYN3c8D1437VKCpbjFM+FchbSDiY+IHCwz
         P/Pw5CpEYzhaxRLALTs/6T4YArtE5skgtjpbqCbXUtijLeF97i84EgnSqU0uq/i72vKz
         CQD3ylw1kvqeko+ZEupJNLP9xFY4J0Tix7xn9A9u40TzRB4fyB/XN8oB9KuWk25LWNcD
         b9jEyUreW4RMQpzZ3xhJAQ4u5tYSxm4DuEQ9ZK3tebCBWYs1lVVHx5/tDntLnxqLo4v8
         hxKiMqpBvAHDKxfxQGZJLkivo9KjtrLs0HJZCwLt2jPXGLvoZYo7B/Bq/87V+8Ta3fM0
         mGzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="PSPE2Pm/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1UILn2r6mIO6iq5nusizM+j7IN4vQZ9T1G0iKeCYp6U=;
        b=knPUbBRgSMa0T0bAj+9ykcoMbG5Q4G6A4b0AqgDbYA3vAePuUo9J/s9u32Z2UnZkkD
         2sFcnHljIGcMFJHxyjcgudVn4+DFKxcIYBMNnGRAWpTau7QisiQSiO57PI/fL5CSmSx1
         5uXQ8MXmggA8d7VWAovnORddyUBm7WFePAa9eWg25RLfQraaSt1dB9kXBTXjWh7Qjn8U
         Deck36aT9bX8kg2kv+l8dekQfpoZ7Npq0rVQdSQ2Zw280MV4eOQ0akVDoPMgw6AtkO9v
         EjIYEHsPWwreq3F/PDNIMhE7dlPAu6K9y8Dh7knwqy2RgULeZ6n2QACqSI0ob5u+Sb+v
         7DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1UILn2r6mIO6iq5nusizM+j7IN4vQZ9T1G0iKeCYp6U=;
        b=bAF9EcF0PVy7C/6ckdiC6AgQ4o4UYlT3T25DhZeH/Z1CARqQb65P6Ls4NtLoPuzSwf
         +xWizxAez3IaRUxx9pyD13v/ADZq64eMfeHzgf8IPRsVkmqS+O7LdmvBSOCN8qSIZEpg
         TtoHhbINoKc3MbqoVG4oPLDTfEOUg9sECOMagr14etB0CkA9SsWqfsbYWGf3clfyXRv9
         l9M/+TB+ikFwMoqlrwGIyHF3NLj0pQB0OQnzgVH+cce6CrqdlWnpv5TymzDPPahVM/6p
         umHa42K5Q6F4ZukRMQCRUhfLhEeiJhv8xR0nelrE0rMmMDmf9ZXLyzAiZ1kTujAmrhgH
         VxWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530cgNbrpoXtvz3ZuCBlZvb9YwU7RLnekxPpakiV+15ZvPluRHZF
	1KD2IFNpXbA7qpvw8JJ5JJ4=
X-Google-Smtp-Source: ABdhPJw2kbgOsqiOf9DdfNJ9st4kmEPm7d7GGZKKswahjS9+0FQ8+QJMvRcqS52KlH0fxqSrqPMhcw==
X-Received: by 2002:adf:f492:: with SMTP id l18mr424805wro.280.1600877276847;
        Wed, 23 Sep 2020 09:07:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls413136wrm.1.gmail; Wed, 23 Sep
 2020 09:07:55 -0700 (PDT)
X-Received: by 2002:a5d:6b84:: with SMTP id n4mr414459wrx.55.1600877275899;
        Wed, 23 Sep 2020 09:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600877275; cv=none;
        d=google.com; s=arc-20160816;
        b=P9kC6HBp4eDVhCqbg1zVI7wKHePFNUmRulSvFdeWafmvUERFj9g45Q5tC/wy6VcSwD
         OVxIcfc2jwATfqXo5BPwqhlGyM6k0bOPC7d0upBAJ0wQAUM1qpp07GQAqwpw0h7sU/rK
         dd63xScaaOLFwOabLtDfp+Suu22Xmn+M7YUjGC2FawY7zg7V0EVNeaquvZNVVpj/bryp
         m+LuBsrzJJQdtSFrxPxvuahs/VsX6WTVzU8A4xliL8+3jTRoUDMVZM9cgBpf6cvgexRE
         Uykn2ZV/GJMvQQdMEaxAz6ZcsEKavzm97OVHbjbfx0tpCTaTKHZ+WMxuqvUJyn2HWgib
         vmUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8b3OpjkUPQZlsnbAuO+5GE/IReu3q3yteltJ/0Uu/7E=;
        b=EteLsi1ZxYr5wXcfRC+OQXw34sNiMH2OhA9Bj9Mz0+1e/rSO4BqBiJapbLWic+AgeR
         zItkzHEA9bAMqBiQH1oZv6phYzH4SlZyoZXDwU7RaAS3cAWxx26V5xeSRF8TykgZT6Qm
         LqjdCM+YlTaJADU2TifYGRWWCcnaxmfMyAQ/UvdUIUog88+ud3lOY4QCOSyoAy74gdV/
         68ghQjqYTCdzi99Br5wIWMjShMzWk3rz2p5mS29VlixlAnSIgt8CSSLNnLBD6/rHyMsM
         HZ+5Oe0iJKbNFeagC974XdSUaq+G4CWeW/3VE7fkYsElxASAc5eA0J5b0ZJ9zU3DBgJ6
         gvyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="PSPE2Pm/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id s79si2703wme.2.2020.09.23.09.07.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2020 09:07:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4BxNPR4CwRzyhc
	for <jailhouse-dev@googlegroups.com>; Wed, 23 Sep 2020 18:07:55 +0200 (CEST)
Received: from omega.home (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 23 Sep
 2020 18:07:55 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 2/2] inmates: x86: replace hardcoded constants
Date: Wed, 23 Sep 2020 18:07:45 +0200
Message-ID: <20200923160745.580421-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923160745.580421-1-ralf.ramsauer@oth-regensburg.de>
References: <20200923160745.580421-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="PSPE2Pm/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Use this chance to s/loader_pdpt/pd/ in header-32.S. It's a page
directory on x86-32 and not a page directory pointer table.

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/header-32.S | 7 ++++---
 inmates/lib/x86/header-64.S | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
index afcd8bd1..911f430f 100644
--- a/inmates/lib/x86/header-32.S
+++ b/inmates/lib/x86/header-32.S
@@ -47,7 +47,7 @@ start32:
 	or $X86_CR4_PSE,%eax
 	mov %eax,%cr4
 
-	mov $loader_pdpt,%eax
+	mov $pd,%eax
 	mov %eax,%cr3
 
 	mov $(X86_CR0_PG | X86_CR0_WP | X86_CR0_PE),%eax
@@ -141,6 +141,7 @@ gdt_ptr:
 
 	.align(4096)
 	.global loader_pdpt
-loader_pdpt:
-	.long	0x00000083
+pd:
+	/* ID map 4M@0x0 */
+	.long	0x0 + (PAGE_FLAG_PS | PAGE_DEFAULT_FLAGS)
 	.align(4096)
diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
index 4d5a7164..a71c018f 100644
--- a/inmates/lib/x86/header-64.S
+++ b/inmates/lib/x86/header-64.S
@@ -143,13 +143,14 @@ gdt_ptr:
 
 	.align(4096)
 pml4:
-	.quad	pdpt + 0x003
+	.quad	pdpt + PAGE_DEFAULT_FLAGS
 
 	.align(4096)
 pdpt:
-	.quad	pd + 0x003
+	.quad	pd + PAGE_DEFAULT_FLAGS
 
 	.align(4096)
 pd:
-	.quad	0x0000000000000083
+	/* ID map 2M@0x0 */
+	.quad	0x0 + (PAGE_FLAG_PS | PAGE_DEFAULT_FLAGS)
 	.align(4096)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200923160745.580421-2-ralf.ramsauer%40oth-regensburg.de.
