Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBKF4476AKGQECWLXUQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4D29D24A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:10:06 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id a4sf301192ljb.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:10:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919401; cv=pass;
        d=google.com; s=arc-20160816;
        b=JuLn55FlGB0KbgaMqTxECMywgLqcx+ofTKlvSlp28G4XpyJKqQ62Dl8DQZpG9h5XxB
         sCzILPo+gKGTFn/NGHAwcZ0Qjv5hra6dh9XeGg4bdUcqkFQPSWypvCYbb6nx/zPP85oZ
         aw0Jk6Gr7GjoD/Q2qbz2N5WWhUyI1WwhLmSFNR6Avt2XtLUGH5Rq2BKV/iV2ZDbZzDv/
         zJAf0CkgNnZuMQG5KHJYof1WN3xStvuYp3BCM5T+QNePvcZG806YBX7LG91HET7jf+S8
         80B0zrmH2yEGbelOF/Ou/LWow1VAw3CScHU/bRxGNcz1ws0jC5hk7sUGokL4JmbrwNMB
         MvAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=aVlo6f+iCCVaj9YfiDqgjrsC0l6JLc2gAvIhQ4Uwq44=;
        b=tdo+isT7uGFjLD6Axxx/ntyKExn8jWrJpIZUcwiFnCPfJFUjM8syPU0mrn7rpkxmVY
         Q04159tSBKgo5lDAn50mVSNWLiBpcObqKYgJjpNdVr7DBlVOMfLlsSGmilG3GXg3F3Dm
         fjeg1hV1OMIiEL66Qyeow8xdnUIOVWsdjYu911JxHA1KcYV/04Il24/2po+Qy0N+MpHY
         cQ46KMK4yXx36TxhI2NoiAV0D2xudXirrR+CbYrrw5WNrj7+cB3p98xGNw2/xKCYQNEn
         WWijgDjeZ+U/M55WjIHR1omInWz8YeandYpR1XLXtMNvI68yXo9FY0xNpjrxbuqkJ/fI
         w3Bw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=MU+ITjOc;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aVlo6f+iCCVaj9YfiDqgjrsC0l6JLc2gAvIhQ4Uwq44=;
        b=SAg1sd+w/Mvoj+Nj5Rd/iuSL91GZgFW1+opsKGSS8/tSBgaXpVL0gnS9N80iwswJZ6
         M0DDdPd6SnpZg+h+I8fM/KaZtpTFPnyUby4X5WIU0ZAyiOEZU22uhdru+SgKsvjbBuNA
         8zVi/YLKWJAl66ZGCVibAV2bvgfErbwB8rde3HNAQX9IcZd0El20qjXPYilhzLVvznJN
         79eXdenEy0LY+404te/puNqhFRPD8kaB0YcmjHvfvd8IEFfII2YYWcNuggI2i0GJSNw2
         7BpT2F1fwvB4ACcxbXyF7VABU/BhUSQ1eyKAyi3vDmjqt0bVR2e/ehwDoFeD/TatwFel
         UjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aVlo6f+iCCVaj9YfiDqgjrsC0l6JLc2gAvIhQ4Uwq44=;
        b=kuLvlqSPtVXoyvHA4YEOrplMaeYLrAsE+I/Zlsv3uzH/JitYHQpAsxr+LKtOMBO2Gu
         J/GfYQQ/ykJl2nwlSp5JRSh8PMDUYowthSD6vpKp1ocuyxKDwjqiDKEy/vZTL+7BIaHx
         A+BENXH2ckxV04MoS2weEVMZCkRqt2cR+5tqo9cajBwAqwkLJVoQUBQu9n5FaXoaxwrL
         ws1Q6d/qUR7BCqGz7zswUZ7kodnmEzhlVHr3h8ibpiOXE8PHXkTJaZdJLudGvCLUZtT2
         4WJtA9BywrpRM6XjVPM8gNOJgqUxnzdJTpQjYBFSO5yOYJkolqMXjdhSHTfpyGwjIOZ5
         5kmQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DIel/V+dRsNWcAd/33BDzPR+xzCgQyXqFre2LdMu3oIdZ9FQI
	eS0knfqmZh4q/Q81CExHfw4=
X-Google-Smtp-Source: ABdhPJzNMQkO27DG26llTQM20oYPaTJElLFDBbP2ArIiuzijYwF8nK09l+BJAIvxVYKAM0KMNDETUA==
X-Received: by 2002:ac2:4ade:: with SMTP id m30mr400071lfp.556.1603919401117;
        Wed, 28 Oct 2020 14:10:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:890b:: with SMTP id d11ls134292lji.6.gmail; Wed, 28 Oct
 2020 14:10:00 -0700 (PDT)
X-Received: by 2002:a2e:a41b:: with SMTP id p27mr512636ljn.30.1603919400087;
        Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919400; cv=none;
        d=google.com; s=arc-20160816;
        b=EZEk6bPp42PwEfhLqzipyG7QuNG0rwBn+LmHTWsTy8ovHPMq+kRyqNlmsQ2KoU08/w
         KVI4t4ycoULhQMVsJE/pdoK9yxgVQ5fY+BsHpKxYnWVNi59bviFhBTtjFFfwWTyBfo6N
         7N85vIVUdt0cd4WvHORbpuZCOMIKFa/RR2H70Tl0aXG+caML7FdsG5LMVPqjFqmcAaBO
         SupbJYlMYvn5hlnuwwA8eZ3MbRBGc1Rtfxhbx4gYznGvmuA2/UMKOe5W10kshY6QRGHp
         ZqGUUjqQhiAeisj2sMyNk7btIgdIgwARB92TcEt9RCs+7fmhxVgCE9PMMTOPUJanqrmX
         RLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=RvXbhRvjYaWEtcny6ZsR6ynnLX2hte9nBLQ8CVVFQqY=;
        b=liuSJctwpu91sPBEnNi4oDkNePgjEmPSvV6MBgnQrxbORFFuc2SKSj67pGe7rxVBku
         w4ZW+FCU121kZ/RTQfn3FB52458cSH5HdQliLNxrstbS5QXwjjzIkgQ/oJCictq9LcM9
         8WR72xnHm3ku/QdCpCQxhMH/SKaYt7PnH6qcTXswPaKeFtLQ+1WYlX5KaOkS1laUtden
         h0g++6UXHBNTbfVPorVcUrXYOeMOapCYos0DynVgV215X76CmlM7VtE30vh6pG4zL9jS
         n6tMhSKl24OoZYT0cXPZytXMuUVO8JlWexTFaOaHl964PNCTLS2vtTXAHKqv1SaEvsUf
         cDUA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=MU+ITjOc;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id k63si15508lfd.0.2020.10.28.14.10.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CM1Rq4FhXzySy
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:59 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 5cM992-_2sA7 for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:59 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rq1KNbzyT0
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:59 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 19/22] x86: vtd: fix Wsign-compare
Date: Wed, 28 Oct 2020 22:09:30 +0100
Message-Id: <20201028210933.138379-20-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=MU+ITjOc;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
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

This is still not 100% clean, since the fix generate wrong
int-conversions on "n" when used as a return value (i.e.,
Wconversion would complain).

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/vtd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index c072ba3a..9bef599c 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -595,7 +595,7 @@ static void vtd_update_irte(unsigned int index, union vtd_irte content)
 
 static int vtd_find_int_remap_region(u16 device_id)
 {
-	int n;
+	unsigned int n;
 
 	/* VTD_INTERRUPT_LIMIT() is < 2^16, see vtd_init */
 	for (n = 0; n < VTD_INTERRUPT_LIMIT(); n++)
@@ -608,7 +608,8 @@ static int vtd_find_int_remap_region(u16 device_id)
 
 static int vtd_reserve_int_remap_region(u16 device_id, unsigned int length)
 {
-	int n, start = -E2BIG;
+	unsigned int n;
+	int start = -E2BIG;
 
 	if (length == 0 || vtd_find_int_remap_region(device_id) >= 0)
 		return 0;
@@ -833,8 +834,8 @@ int iommu_map_interrupt(struct cell *cell, u16 device_id, unsigned int vector,
 	if (base_index < 0)
 		return base_index;
 
-	if (vector >= VTD_INTERRUPT_LIMIT() ||
-	    base_index >= VTD_INTERRUPT_LIMIT() - vector)
+	if ((vector >= VTD_INTERRUPT_LIMIT()) ||
+	    ((u32)base_index >= VTD_INTERRUPT_LIMIT() - vector))
 		return -ERANGE;
 
 	irte = int_remap_table[base_index + vector];
@@ -888,7 +889,7 @@ void iommu_config_commit(struct cell *cell_added_removed)
 {
 	void *inv_queue = unit_inv_queue;
 	void *reg_base = dmar_reg_base;
-	int n;
+	unsigned int n;
 
 	if (cell_added_removed)
 		vtd_init_fault_nmi();
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-20-andrea.bastoni%40tum.de.
