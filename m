Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGUXYH6AKGQENUAHRCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD81294F21
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id ay19sf1558139edb.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292058; cv=pass;
        d=google.com; s=arc-20160816;
        b=hATTCZ2IkP2L8tegRhJnVxLSrZ8O0FoC8wEX0y71oaW0MILVIsxYRCAGHfv+AjbOIf
         K5GfTCwkhct9CG1drwHtSLQUUr3l7Akmq1yTsncqJGgZ0BY8epTJegpJwXFZsen+ZuRx
         Ap8KG0nUWfrXOYVahJiw/K/+2YDAVTywA9qD+B5QWUi5rFqkyeraHzdRCr5X79IDsxyf
         jociyJMJeiY+6vjLfhR2/1GLwxfEi3GDmpnq1ogFC/Mnpun2kujC6wX06vmDdukiIng9
         IXTquo3MAvakF0dO7w1yMQ6N639TF8zUzHDdplHmj4hu65gfdFVaqegabQTDS+Kyt8gI
         C+Fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=74rv9Z1Dc2L2GJCdRs+d54W07tzA4GDEq4h+1ETuNCc=;
        b=JaP6u06t3RHOy2Ie7G3RQHUUsUUaGv0IracKKvCb77xThAZdJ7Hzbw10oNmB2ZJr2e
         SNQcO/xwGhqTp8zqr3lA24GygJnl/Z07h3VIyxslMniExVV1/tsXDK6tQlK8hT6OJfHq
         JLQHlYVCrTXSFeVZYS5MgP7zQDwCM9TIhzp2wfT3LyA9KcphZlqcdYC1hVvmGyXbxCkF
         azO7VIUgIwOv6mV60O7YbIFznp0O9KkcK1h5za9s0CIWJ0zn8p6CR6lSuF7le30/CRUp
         WoKXDvQQJMNBcwhGEYclzx8gHUOv4MHd79YnD7/+OSf8AqN5EtDqwshFF0E9tcu6PMfX
         S+ww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="m2/Tj45f";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=74rv9Z1Dc2L2GJCdRs+d54W07tzA4GDEq4h+1ETuNCc=;
        b=c6g4nXWU9pV9YbFPDAmImOQQL42h/96ilhbDujs/QjQeoWSYtWyv+/BpBHc7muDg5w
         KvSeQFfurGIvnN25vvOf2qYr+LUXZKQCK+43Ya0E2LN4quMecuPyWBJLQ8urrWIFKyRn
         t8qZJ3AcLtPqVBnFdVWp2BhFkivJ89BYxkO3f2tI9sx7NOUT5Z+Hz466nijwZa2IJ77+
         HfdHlbECUM1jn5zoFFUkJ46ZF8rR1C/ZFYF7pbYSfDaTRTw07ctK++ZvTf7GCMpD4oEM
         sdB7kTXOTOH8DdnjZ2LRXjqrzhfK9sIHysVuMucx+YhNeyObC4jjpqSMFEtLgJwbs7Mr
         fSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=74rv9Z1Dc2L2GJCdRs+d54W07tzA4GDEq4h+1ETuNCc=;
        b=FPV0DSyLNZylLBmR1iWYKLagTRWWj6ZlSGdX3OR9/jQ4njKDxNPiEny8dpYcbWzo58
         IzZ0n87pTw8Xza9gCLFBC9grZIez3kBEwsTOV+7XrPAbLKPZ384eMAiT5bBjZmF3PUPY
         Z7nh7bExLS21kk9Qp4d0cyyuYsIPEi4OsHez6ehv6gDKOHwOwcKpd+KA86ZHJFu3cOfH
         PhH5/s2N2JvX/q7L7rmSE4Zh6jqBqQaVzX/XB0i+iOYbtSj8cWpPXq1W5e2nxMybdpzo
         aobvuWUv7D/m1HNCFkCjeTtZXGKbVYEZuHGMkPxZkQ2dvPbzj2SGMe5o5/FOQvcnNv7+
         h9hQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530XK1xnAQlSUh0oiC3c798D12D387sPHXsutep0IbWYVuvQ95/z
	PNammeLm424JGf4GNkDY5jM=
X-Google-Smtp-Source: ABdhPJy+2rmSYp3N1ilqGsrUPzGfaSrCz678pr8+l8HxqHufvzPg8k4mAHfup85u2zYPE2ACuHJSaQ==
X-Received: by 2002:a50:ef0a:: with SMTP id m10mr3510110eds.116.1603292058604;
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d3c:: with SMTP id dh28ls5429759edb.0.gmail; Wed,
 21 Oct 2020 07:54:17 -0700 (PDT)
X-Received: by 2002:a50:dacf:: with SMTP id s15mr3557799edj.71.1603292057571;
        Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292057; cv=none;
        d=google.com; s=arc-20160816;
        b=RkHQfSXmywfCJIDU1EqVqk07wFxVvH7isJpDHikQP/IspBMsUghQuNFAU1/Di2v+TM
         gHTUoUatRv+PtNYAO70RjAFxmAd9dTGMDfolatdAjbRn0zkrwR26FVSJuXEmBjUV/+Jd
         k2JERpuvAhn11CPDpONjkR9/dnDsXL7iyYqov8g2BWG7sAsoXvzI5kS9AwO+rDLNzOoA
         gYOM0NjDk9Ud87LbXAO4pM1lTbPFQgXM1ypHrAJpIUW9yTZADAdtCD+3+xettjNKxFJM
         9Gh42PZsZAaoPGQP8t7sXCKCRx2UCzMpVdwcCXmzmQTaxN52abcncKY0hOfVe3aIKzWL
         Hogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=FAfnomtQiS49yTGytpd0/fRq+rNwoihE5/2b/7rU42U=;
        b=mdbzUOJhkuKZ2HXlAuwhim7wHT5WONEi2oEwE682wVoKa5i+9W8tfIXIn85IATaIEw
         A56uZsVR8p9ziynFkxEkbzS+Q0zROErCx/eejtvO1pNC2YO41qXn4cMASmyEYgZVIQX1
         WJiumnB+2/Qzoi10I/Ctki3bcX4Q4i3DLn/GTwFWLKDCrwL1GRnFaIMkKB8nZNDk0yCO
         iRjC2W7do145KX63d0eCjRiRfSyzdtYkn2W7KRXfzvBxOmMDQHEZhK3RgjQSPZYi4PaX
         1lHAg+ZTSRtFDZV9p3eEjq7TRBDVy6+WfC4920H/2xIw/Sw9PNO4aQ7mcOWsaWpxxU9g
         pLRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="m2/Tj45f";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id lf25si110302ejb.0.2020.10.21.07.54.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRY2MqZzyRN
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
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
	with LMTP id 3lPkNgDjt-HX for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRX6WL5zySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 13/26] x86: fix simple Wsign-compare warnings
Date: Wed, 21 Oct 2020 16:53:51 +0200
Message-Id: <20201021145404.100463-14-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="m2/Tj45f";       spf=pass
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
 hypervisor/arch/x86/paging.c | 2 +-
 hypervisor/arch/x86/svm.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/paging.c b/hypervisor/arch/x86/paging.c
index 9f846dc9..cb7ff929 100644
--- a/hypervisor/arch/x86/paging.c
+++ b/hypervisor/arch/x86/paging.c
@@ -41,7 +41,7 @@ static void x86_64_clear_entry(pt_entry_t pte)
 static bool x86_64_page_table_empty(page_table_t page_table)
 {
 	pt_entry_t pte;
-	int n;
+	unsigned int n;
 
 	for (n = 0, pte = page_table; n < PAGE_SIZE / sizeof(u64); n++, pte++)
 		if (x86_64_entry_valid(pte, PAGE_FLAG_PRESENT))
diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 3c3e6854..9b1664a5 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -698,7 +698,7 @@ static bool svm_parse_mov_to_cr(struct vmcb *vmcb, unsigned long pc,
 	struct parse_context ctx = {};
 	/* No prefixes are supported yet */
 	u8 opcodes[] = {0x0f, 0x22}, modrm;
-	int n;
+	unsigned int n;
 
 	vcpu_get_guest_paging_structs(&pg_structs);
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-14-andrea.bastoni%40tum.de.
