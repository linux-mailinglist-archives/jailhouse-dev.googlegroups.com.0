Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBH4XYH6AKGQEGRF4YZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA3C294F35
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:27 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id f28sf1295131lfq.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292067; cv=pass;
        d=google.com; s=arc-20160816;
        b=cSbQWdBSKEVX9w3wcSodv6IDbLUbrc7i0oQGYT3pBxMEYkGnszup6K83gfne47W6Um
         omUvyFkYgLqZCY5HgOXL4ADlAuvNRObWN+2jv5992DX9TwVw5e8jAb63TIuYop2/Gmkt
         /gh2QMENC1Fqc9pRK8NgGdFyGan57LgVmFeF8nj5sRAqj1Xt+B2WanL3u8jBv2uLDMLw
         61i7StnHgREqi34WF/7H4WO+X78BJ3E62Vlfgeit/lypTSCxvhqoEHdlD3Y9csZnw4n3
         Gh5a6o7jhjSoxUuWRM0SVl03q5RCjNdrI7Z6nbzqOW8X2X2vg6vniRiERZmWCzFeyJcV
         9GqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=wb8eVgd9O8pd6ogkD2WFS4yYP7hV2VhEUdNsvbm2nSk=;
        b=qNeQfceuerqbvJRRc/JwQ+kigL/jR7tEn1sAP0s6YRt1n2w2Az7ybByb14KN26egH/
         yslHtxxHX1TPuRwuekilMPoGZAk+deOygyiqv2pa6EOnrrYQPFhFqQdLROqs0DevJ4oK
         2v9UXhh0D+Brmzn/NMBVPaxkx04NvRAzEics0M7xGoGP1ol1Fsp9rrNE8J/rsqcHTPV7
         iF4qAlvecdG5kNQZMc4xxPFMt5N+WtKgRKuWNSCwESupiXqBUdr935UVItZ+mbcb6w3m
         CsUhE4A8A1IFVRQ3r2pPI5UPI3FdV7vdoiPr1erSn54jfqtOlNcDNcf7MnBDEHzwyadY
         C4Yg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=WlxQNaKD;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wb8eVgd9O8pd6ogkD2WFS4yYP7hV2VhEUdNsvbm2nSk=;
        b=MmV9K5uOTK1JUtn/M38C1RQRHSJLvaEDQ5oF9mkFCaGn8kCpVu3oXDn8X8qH1MOW7D
         Y9ipwONW209BBW+/p9HY980WeeR3UU8Yd4aCSus6/6gVgQBOYeTGc6hDDoP788v6jmbB
         bT9ihT3DsQ5LPwSQsc54p3pMkel7KPq+1Zk8RGyit7h7v4aPidd5yu3EyAFMMxNAn+lz
         K2LlD6q9TqTp7LMJWk80raCy/Mlm2dO2+G7bntS59VPsMdwkK9YN7StaA+IjvdiPwRR3
         J+d5EFSbMLW9l8xb3KKBGSs2HNMegUumlTpSalkcpm1uZTSZ/86kZ25kVlBwS9Fg1atY
         hJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wb8eVgd9O8pd6ogkD2WFS4yYP7hV2VhEUdNsvbm2nSk=;
        b=akaBnV9cGV23TMZZ7tGXP5IPGrmxDIW57sG0X/N+flc+smdOTefpOkEcBkvJ9+oV1+
         WKYSDeGNSvRMwqsRgaaVjHXVXNapUUds5FKdNTucXPAIEAyZEkmfL/MdSjj+jyriltKM
         2dZiUFZeMgFmIm0iBZ3WZiyuZryFqHiZrNu+lj9Uie//pggBjPh/N0SSfuexN+7T0dVA
         DGfGkxO3g8NgypT1fdGE/c0DDgUYPU+9JqK5MCwo3hjFDVX3gP8LLoyTfRVbs0mKpq82
         mxUjwd4sOJ7hJ7Cm7VdPJZyJtxoqoCkp2rPMelQuRFKWNsFVaZA3JSHqb+Jp/yobjKp3
         VLug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531x6KBuTGcMwS1TkU3NFsbXX8Zt4ZP/K8vt0wdoC/BIOjG97Fu9
	06GYPby1PVvs2xlUQmh7LME=
X-Google-Smtp-Source: ABdhPJyFAawzh+eEnMP1zQzDorr1bc2piPrPwP+x0DieC6SRclPammX+UPRybuQ82h9hLyx1G1cVBA==
X-Received: by 2002:a19:ee19:: with SMTP id g25mr1500392lfb.463.1603292064056;
        Wed, 21 Oct 2020 07:54:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls132745lff.1.gmail; Wed, 21 Oct
 2020 07:54:21 -0700 (PDT)
X-Received: by 2002:ac2:5294:: with SMTP id q20mr1487213lfm.538.1603292061641;
        Wed, 21 Oct 2020 07:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292061; cv=none;
        d=google.com; s=arc-20160816;
        b=1KO8tF3xb3g+FtWRh8T9JNl1wlTUQWIshBsx1PW+vORXNSaO7Z1as0J6QmVEZRKZ3S
         TugyCKDwTyVFOXhYoyGsqxN+NtBZ6HkDw8GIZHCOBH2LflTcgTKKJhkLztEdx1jnwkf4
         oM2g6PmrNLrvMwJPvHIfrHbpNTimftfGKsLhxpJzeRrGajBNQPgkSz8N+RmuwbWBlMYl
         pRMg39hKhAaqgV8+OZvHoHM53vBRTy++PHmjtFdYQPDlPJPi22y0DZkGUp1Jfeiw7RgS
         AtRjnuBk0C5PEEeVWZrsFmgaHxsgNJrA/HQKAM11OzUHqSqyx9MenQYThAWyz6WcTA8i
         SiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=63QBtYpei1FY5kN1T6P0RRDJplT7dUIxq7kcz72Jqy4=;
        b=TZno3D5WgJQQT86c1gg4CqASbXdEhhipCxd9f9gSJYaICuq7g6LwYo3rqibgTRZjOe
         RlH6+DEkEJZ2OKWvzEDuzBt8cvDDPmHdbXQhDNG2GRZR8523kf1vW9QXgvuo9baBQZ0W
         RzNxYGupkaHJJUtYtcjcaHSiIQ8jTS9bJrTNocXqbHWU8BB7K0YmwUVwPOKNrB4iFWXW
         eUyLH7lwEOhaMynhyYvIHtRTlpodhRMV6PVkHyhTY3bY8JbiRvpA0BLlGr2/JrOUUifz
         1x9GI7jpKAmVlxcikOK6An4q4mh3QaiVZnThVINXeTRmpou3hgRsPtH30bsrSUbzYXUT
         8IRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=WlxQNaKD;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id p1si65690ljc.0.2020.10.21.07.54.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRc16w6zyXK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
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
	with LMTP id nhC97LHgR2LD for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRb51VpzyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 23/26] x86: control, vcpu: force cast to prevent Wsign-compare
Date: Wed, 21 Oct 2020 16:54:01 +0200
Message-Id: <20201021145404.100463-24-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=WlxQNaKD;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

The cast is just to prevent fallouts due to the Werror. The error and
rax are really unsigned values, but int to unsigned promotion is mixed
too many times to be easily fixed.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/control.c | 2 +-
 hypervisor/arch/x86/vcpu.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index 2aea807a..98659f4a 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -238,7 +238,7 @@ x86_exception_handler(struct exception_frame *frame)
 {
 	panic_printk("FATAL: Jailhouse triggered exception #%lld\n",
 		     frame->vector);
-	if (frame->error != -1)
+	if ((int)frame->error != -1)
 		panic_printk("Error code: %llx\n", frame->error);
 	panic_printk("Physical CPU ID: %lu\n", phys_processor_id());
 	panic_printk("RIP: 0x%016llx RSP: 0x%016llx FLAGS: %llx\n", frame->rip,
diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 7a6543bf..5dd23d49 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -194,7 +194,7 @@ void vcpu_handle_hypercall(void)
 
 	guest_regs->rax = hypercall(code, guest_regs->rdi & arg_mask,
 				    guest_regs->rsi & arg_mask);
-	if (guest_regs->rax == -ENOSYS)
+	if ((int)guest_regs->rax == -ENOSYS)
 		printk("CPU %d: Unknown hypercall %ld, RIP: 0x%016llx\n",
 		       cpu_id, code,
 		       vcpu_vendor_get_rip() - X86_INST_LEN_HYPERCALL);
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-24-andrea.bastoni%40tum.de.
