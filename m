Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVMQY76AKGQEZJ57GSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1AC296446
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:46 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id f14sf1014030ljg.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389526; cv=pass;
        d=google.com; s=arc-20160816;
        b=rgNIanUGM/xEtJG+VU5Kwbs2IaV7Gj3qGvuIUgKevu1xUeeNlQPgaB6uOgsiVvKqjW
         okkUTUS/qHzep2/6YL+8QO7CnDRRA1MLaFGjwiPWHyhA3uIBs7ThjPqqoFUHiAjYk6tc
         hxIeLwyeQ9BNsYMSohs8jv9q7dHvEv2vyi+aI8sPSQh7Ty7jCyIS7nJYCD+bq1+R8et0
         RuhM9zMVPTDFn9BbYmnrcxWy8oGA8jur4LlgJ0GOxHrsd66j44BGcY8+ZKiAcOBW4/BW
         SUGRRoJhmyAhxI7SfJCu4rnu4TgiEYDgzF3MdYOBL4q6iOtADW2H3Dd/dQlC4t811bCb
         bTWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=DW0fRgtRaJ9UHzWOtrHcc3HtYovOo2zQhyasVEVEZEs=;
        b=lw9nknO5SaY7+pEBpVsbEkLExA1ot7Xty3abYtVY2IJ5lbwsAnsNCHHUaZ5Qr/cPWX
         0J6eBQdqV3XwHz5kFkMiInIajRtHQfqK/WjXPTzIAoKFEOtnVXo16GTORaDZ5acf+JeF
         qZ4xoTs3jbqizGUtpA0bskFd80IlEAYwhh5evJ+4Tc1bJZx12NMcfZ5b+IYNx452Ssut
         8KuJWO+UNDhKLJo29lpSD8r3ulenXS2rIIXHuyfDUX8mpwRaQWKZ1bGQEvBr/AYswq/B
         hB3AyrgH8Yak0sT6Zivi7kdaghrfdRsWDGLgDYImblLrqKRWgiwFr1VcRgW9p9I7WNBV
         ZTRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ZG9B4i39;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DW0fRgtRaJ9UHzWOtrHcc3HtYovOo2zQhyasVEVEZEs=;
        b=ggu4KdhG9jKmZMZLxG8UZ2rAdvMXpW3KLddVmbgptroG8iFnnhY3/1aoPVHln7stY2
         e/Qo6Adm5I4da/alSrNBVsfJs3agTse9FMvxT7VybN+w7X8GzKJMJ7V5engVvv0vkR6w
         ImrN8P/ErX0hJrcK2wwYQ631CGUWAB8AkDnO0y1VGa+FS4Biqinbg7WLa+G27htdAcMa
         TCONtp1oUhMFLSft35hjc/LMgI1XA4fPueSSfqYTYHl8uIUdhJqmAE1ADcZFANQgoYgd
         pVjcGmEpyn7Yg3Rb1T25iQCIUgfqJRX2T/9uFwN9JRfgMLLa7gn3d8IelRaIzdQ7wLEV
         py+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DW0fRgtRaJ9UHzWOtrHcc3HtYovOo2zQhyasVEVEZEs=;
        b=oNs72LFSDPmSy7u7An0STgeDlKJ5Px5puqS6QLnX+NXYz2F+xDFZ7dOtyNN8RbDbS3
         vfX7+5OG2xl4KIZJKO3Vy0aQ4J5eMhowGQzHa6+hpVQrwvXmmpGfsXHUmDVxdi2VW37Y
         mdF0Oybrhs5EHFIG0mPKImRzvdk5TsU3J7ryhyuIoqahnZNonumVxsucIMXd2FjWfTKW
         HVAjZsBQmXfVaGY6p1/1FBvMRnA658SUqpuwWdDg1KciVwit+3Meb5ZtXJi8YxK8XfRy
         f8nl2KVGIMO4aLe6xhq11W6z0GBOTajpvgRS2JodFdcgLUd5AzZm9cJ3pffOeK92YTlz
         boQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5338eZx2MNF/xluIsYVONu1VgRd5gig69Y8B3cxI0noMHBXjTsnm
	1AuHGsWXbRs9oxs52M1yjNY=
X-Google-Smtp-Source: ABdhPJyIGcZRJF+Csf1OrdXoPGKaqn/A3o9eYu62boqx29QimgwJF8P/RIp7szQ8vnbBJyrZkuPoRg==
X-Received: by 2002:a2e:8e67:: with SMTP id t7mr1428613ljk.206.1603389525814;
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7313:: with SMTP id o19ls492050ljc.11.gmail; Thu, 22 Oct
 2020 10:58:44 -0700 (PDT)
X-Received: by 2002:a2e:8514:: with SMTP id j20mr1473487lji.131.1603389524655;
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389524; cv=none;
        d=google.com; s=arc-20160816;
        b=sTTffqgu3+IldMs0kQwuNwMv3i/M1mlF/UYRw6BYSe4Lw4JA17Lcl32KEHoFvuEOv4
         atIrxNXAL1JgWlo13keQmmzIYSFiW4yFud3illeNNtT/zaawtzzk+FLSu8IsbHVratv7
         iVdaSfCsLbjXV345xAT1KciY6SmubUVXYrqP/jlMTltDv5QG3brLrPbt0U3kfL3TiofG
         SsudSDxRU1A4yJFW3JHMasH0KsxbdbDrgE080RcVMxISRhHu6XlhR1vH2rtkkGkzXwdY
         9uX+0i01Bjjkkk5+VkYjTdYXnRfxrzFTXyeGqIBJC3C3rn7f3s9Vk73w0/XGAOEBjnAl
         wbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=hCjGy51FKTLX8zJZekyB9McVszk10EWd9jpptNeijBs=;
        b=QsHdODv5LmAsNVGEyYE/TKzHFOfFM8wkMR6q1vNXfJ0ekg1Egh5p264ITqeBf4+Gsw
         9gKTQXh1iUMMfSOVGEwenfqRroOwi7/mDczdZfMMgdFgCNZyCP4sGJgQnxgk0qenu/Bj
         kqA56XGYiTynq7aBdb1vwJBFggDo0inCcnKnbN+POIbK9mpIHfsn5/3Gx2wPe/7/xD7r
         wEKk4izEmxocWSDFAwtccT4ZBhOzV382qoNG4ms2Bzt9c3sIr3dBpd2ymu/yRGhI0RN7
         BvPjK5kboL/pkwiC7QgEpsiJw/kqrwVWXzv6CQvdmog3Szy2fnygREME3Ynv0q8v7gHn
         kMOg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ZG9B4i39;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id 8si96965lfm.7.2020.10.22.10.58.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTw1HB4zyXc
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
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
	with LMTP id qPyfdFqKGknJ for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTv5RhdzyVH
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 24/33] x86: apic: Wsign-compare change to uint and update comparison check accordingly
Date: Thu, 22 Oct 2020 19:58:16 +0200
Message-Id: <20201022175826.199614-25-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=ZG9B4i39;       spf=pass
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
 hypervisor/arch/x86/apic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index d36c2033..b49a6745 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -315,7 +315,7 @@ void apic_clear(void)
 {
 	unsigned int maxlvt = (apic_ops.read(APIC_REG_LVR) >> 16) & 0xff;
 	unsigned int xlc = (apic_ext_features() >> 16) & 0xff;
-	int n;
+	unsigned int n;
 
 	/* Enable the APIC - the cell may have turned it off */
 	apic_ops.write(APIC_REG_SVR, APIC_SVR_ENABLE_APIC | 0xff);
@@ -336,7 +336,7 @@ void apic_clear(void)
 
 	/* Clear ISR. This is done in reverse direction as EOI
 	 * clears highest-priority interrupt ISR bit. */
-	for (n = APIC_NUM_INT_REGS-1; n >= 0; n--)
+	for (n = APIC_NUM_INT_REGS-1; n != 0; n--)
 		while (apic_ops.read(APIC_REG_ISR0 + n) != 0)
 			apic_ops.write(APIC_REG_EOI, APIC_EOI_ACK);
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-25-andrea.bastoni%40tum.de.
