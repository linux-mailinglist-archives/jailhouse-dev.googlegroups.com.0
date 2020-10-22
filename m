Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVMQY76AKGQEZJ57GSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F481296443
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:46 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id r8sf1011773ljp.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389525; cv=pass;
        d=google.com; s=arc-20160816;
        b=lB+Ot2/S/gWC7hN/embUn4bYhyUfF8biDeF0rxpGfreLn+IYcXg1BnxPZSMFneiKqv
         XKSo1zDtktydojGEqKw1T3Ysa02mZlzPMQ+0KIMRpGsS8e2P03Z1F3y7s7nTP4F9wGCa
         n/4rZ339oOQHBfC488yL229KWMvTE2kX7vkYxgUG+U72+usWWMn0aV/pe8Bhfxcqkvmp
         H7rzqhsai4Spp6UkFRzyKdD28lkoaNZkxKILctRc5R4ldz9ybh7qUyHi/3aPP5cqm0iU
         7DLvJGXu2d+q5xkYJKn6nzaBUFulhTQ7fU75PsRCTqpk5JkxPlR0uLuA3iAw9XcY3mGI
         UDDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=N3LAGrYu3BAbbJrJWoHc369hv2M618fhDfvHos3c3l4=;
        b=LF/ideicmhkqHxwIYvgHXBlu0AR6AGYjGO6M48X+StXhLB2EUKXdtslF9Ol9vCVrto
         Fmou5OQNbQpsNCCK948fwmT0voSVnKmn3NkL7mIcWO9cm1Q93o2K6PZ/QFJBbj1+FYVC
         nfvJIQYXLP6jc4N/hp0iam8DKhp49nJGHyD/s/2zhxJiaHxZL5qV5otw2hx5oXCA9eXb
         9rR8qVv4zdf+TQDj4IF8HEU+myemVLtt/312UYBoiCY8VSm/vo1ZqCxcYQU42SQpnOys
         KpxtUSaUEBjGVc8hFDnnc2wYo2ZHdM6UKpBI9gcE82b597OpolLUjvOgZ3diOFyhXD2r
         ML3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=eJWZeqqx;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N3LAGrYu3BAbbJrJWoHc369hv2M618fhDfvHos3c3l4=;
        b=EvjFGfzFPAzg41wxFstvqRFGqRWNYwqxw7M3zJH3bEAVmgdAZVrue+/tFX0hOaEBqe
         eDnKh9XZdO9qpQ97jBNYyneNRKsIeO9qMQNrp6TENrraaDqOvk963EiTXR5kyr7FCIZt
         dViyo8bOVXDh2W+kR6gZ4G2dA2PhLQ6kM6uSZP08UMsHOX6Xav+ZRfJLIQilrzPmqCXB
         +CekChB/eVqTkKrUG6jPwbDMh7O7a0YJOqqSOZgdNzMq3UkCVxkl505d6W8lWqt6eWti
         /5iYXA8pigoFJozfbc6tDMJpUIE0OwBnha7ER2Qa7h1Gs1UrXan9h3CphKXgYumPWO9j
         IAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N3LAGrYu3BAbbJrJWoHc369hv2M618fhDfvHos3c3l4=;
        b=EKFnO22z412PJ52iwFFTLEJ9HY0tr8QARTZUovbjCnQfAa5LR5KF+RKtUFtVKSB6Jy
         oLuPY5JAJLFda7MGNz0skT4A2etQaGzSh3gluiSYNN//WoZyiwftYX58b3OzBmhwpMz5
         QivVHGYBiyhaIHeKd4/ddcNVwMEu6zdPRycryeKxI+KBuW5gHJ3HJuWhrZ1K1JM8MQrx
         FQDXjBUG0lnvCtxYqwMOqqr9DTcl1O6RQmqj3JDm9/QGJa5E9ODIxFBlS5LFVguoFouc
         jhDMrEYXU1b3dhu5WvafqRAn1zImXQjbKP6P8OTwJg3Iuyp+K2iod9TxlOCeHRTGSD52
         k0Yw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LE9rIhPaoGJadvbIFiFlyt3r1y9SpMgMBb67QaO3F2PoKFagw
	ab8J3PfboQwdJAZptoP4Zpg=
X-Google-Smtp-Source: ABdhPJz7SIwu+XJ1j7Ma0pviRluG2ik2oVUbs89kS4u8dZcqRLbE7PkmPVb/WPY4l2+5GXtruEth2w==
X-Received: by 2002:a05:6512:78a:: with SMTP id x10mr1405978lfr.340.1603389525593;
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls1746673lfr.2.gmail; Thu, 22 Oct
 2020 10:58:44 -0700 (PDT)
X-Received: by 2002:a19:1c7:: with SMTP id 190mr1165691lfb.516.1603389524424;
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389524; cv=none;
        d=google.com; s=arc-20160816;
        b=mm2CutQ4olpDI3u1KT0FK8an7JHXblirnb3cTb3k7fSKn6lvQmmp67iJ7fbCGW965c
         Q0M4HhIyA8tkuye248lRUSlYmQsDzVajDcHxKRlc5whWfoT67ipvZmdWWKzz6HwsPXcp
         Z1vPKtiJO2Y769akFcKZqq2bLYj0rz+6qUOUn4z+Y0+qm7Npwi2ffCscP08t/8K12Y6N
         B05RVWMnJjhZoLd0bNztIatRWYBcx/WDNwlmPahm1EjEiHFlLRur//SEX+yz5gyLMx9m
         nD/3qpdUfZ0iASsHUwmqecv/cSSuwr9uP3OOKgUR8LCJvoGuW1XRGeS+dBt9PwHvzD0y
         f8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=FAfnomtQiS49yTGytpd0/fRq+rNwoihE5/2b/7rU42U=;
        b=alzwa5n2zFCZnBvAEfXFK/fLtsQXC8A5pYsxQRVecIWuP3J21OX/HHi9H2HVLHjOBe
         YKgvNm4oDa3A5xW4rIQ44LNGQWxFcee/JFlfw32/qjb4OxodmHHff9fG49j1b24+SGnG
         IWLvFGVBsZ8pB5pE8m9v1+7Vy/VVCk0sZiEsSzaTm4sZ87n8tsx2dBYCG7S7lvpLwAga
         7Vu9VJOkJfVNnPP9ygaxiXc7fxn7vCeFWo/3BUAp6kT6V3Qp4r66CTj6oM58rOCYjeVn
         LsHTfeYWJttAbJFqQGPI+hIwGX39tzJ0PrjPtRIVfjep68NsQK0E38ex8urxT/R/x9pR
         ZKpw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=eJWZeqqx;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id o4si107889lfn.12.2020.10.22.10.58.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTv6lx2zyXf
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
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
	with LMTP id UeWkPv9F84lo for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTv3rvyzyXb
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 23/33] x86: fix simple Wsign-compare warnings
Date: Thu, 22 Oct 2020 19:58:15 +0200
Message-Id: <20201022175826.199614-24-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=eJWZeqqx;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-24-andrea.bastoni%40tum.de.
