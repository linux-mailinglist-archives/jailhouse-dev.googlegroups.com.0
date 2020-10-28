Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBH54476AKGQEGSZ5M3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2452E29D240
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:52 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id o14sf290469ljj.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919391; cv=pass;
        d=google.com; s=arc-20160816;
        b=JQ8EQ6HhPcuPadvDB7B+aqFbIa1HnYI2r8VremnE30nozCRVCeS2VtdLBaemsaTYq5
         c7Rlpa60cqoFR98WwmeztMxewg1qD8Wg4Rvh4wa5wDDkoPBJdXSVA/aJUG3ISjDvD6Nt
         LLYjN/zomkx0y/ctg1H0fabR1QR5l1zAJ/djTzhi2vm747lgbPBnFeKKvi3LyJs4pFw+
         W4eCboiOMqfFz+z3Lnn2O4XQg6dHI0AgKTgENPqQfXykr49nPPdY7lX6xFatz+emWuNu
         224pYXDpwb6UY9M3cySbiCGiRfzZMgOCSMF3PFhVsdxufKRI5coovWemTTQD0Xh97Wjg
         /MJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=GPhMBgvvg09h5GpraJMhKNkNwghUU3yUJacboHGFJX0=;
        b=snahXqhxj21TrPfNLl1qWoXiNtOOnvLwvIkM2CqFftKhRwen8CK04mN7jsg8yT1FQu
         /SUQUT3AzefturVAUlJWcZz89zRQPLiSFbGQt/buTclppsDGr33BGRRxaaQfKVuXe9PW
         ZgttwmFldyOKPK1W0bX78vclg2Lznz54AKcoidsvxd2oCQGPwu4q+SyNtouLWG0DWzNQ
         2McKd+DcdOdWrBAqqY2QVoUP/lJg/E4vuGvr/Oap5Zjnp2KgzcYGs/0RlvzxBg/YugUQ
         9NKC9IVusrc04qV+4rPCHqxa42kkSiG0CxDeNs5XHSvpAaESbZfsFaz7mU4kvkh+maLO
         9FjQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Uzi8yahy;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GPhMBgvvg09h5GpraJMhKNkNwghUU3yUJacboHGFJX0=;
        b=KDrOsQTrp42YhlAbIE7tvaZh6PbN0eUBouAX2DBA7sG1NDnuLpzjaoRij1bZjaNQai
         uO8OY+6b48k7swu2CT6+EzXjv7KFndlDGyZwzIi0/olLMDKGrB/8gCi4nlWn/BMGSQXz
         lMLmknVVqMzJVl9I4/BLOMV2Yn62xLgdGgTRGQgeYYBk9HvuUKH7DhWwA6u+MFsVnrx/
         Ro9XJtZU8t2auxspsVKHcuqY5zo+kRbJaxNtY1o5ZATHIBgsDzS/hJOTutbOfohswKM0
         WAUVTlykfGNuL5xxWU4NjKvcOJyJsGtlO0iJSz94TZcKbxh1GMPuZWG+jP/1dgqLoqmC
         Q5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GPhMBgvvg09h5GpraJMhKNkNwghUU3yUJacboHGFJX0=;
        b=PLGYtky/9Sdh+Vwmy/zWoELvV5CS6PvZf7PqcSr/mRyVUZxadCdxqdE79aNFkA3kvy
         o+Zwisoohd9E7ESRgv2kI5eQG2tJoSvhCcnD5Ud+vLP4nlycjEIbd09WcTwMjFPhdCwa
         /YXM55oCgU7qTjfNfauKlygROMKcBpTXmaRrfBxjoTR6YoCirMP18UJtLQvCXm6WPu6a
         sSp9F3bvAH5v1Mw5SGHVC88o2yTas9Gh3PYp8FZiGvWaxutPFkt+DS1aDcXAtXuBWvEN
         R945b+v3fvW4bDplndXK5wz/MQlEGy+hAS/AY0VcyLRS90HfJJBbzCwfvFZFRiP+zQnP
         QJgg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zU3AUHaueDGJHPFXDDJJiV2zxNyCOMnI2NRg9WGktNGDRakPe
	4xGeQHJwRe50sCOXRL/Yqy4=
X-Google-Smtp-Source: ABdhPJxx7VTdLnbyTaSPBQ04Karp2tSbaC32mmLkWyRJ/EKa9sBYPHXCZUiX6vnmXSSRUqqYWaYVdw==
X-Received: by 2002:a2e:3e1a:: with SMTP id l26mr478055lja.63.1603919391695;
        Wed, 28 Oct 2020 14:09:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls268903lfr.2.gmail; Wed, 28 Oct
 2020 14:09:50 -0700 (PDT)
X-Received: by 2002:a19:64e:: with SMTP id 75mr385517lfg.143.1603919390471;
        Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919390; cv=none;
        d=google.com; s=arc-20160816;
        b=QqE1F5AM6pvTBUFBcYWiITcF7IlxKrhG+wid/dC9CR9x12ZwVBkMQshSieKiRIcLyU
         XERdVyDwKWvbSEdE7iiAm+zatY5dYPKRcp7xAJdcmUYwbJNKZjSYK4ZrJ3PZdI1MEs1g
         ARw8NRo8LV5NaepNPdbi0TlmM1SoJ/qhW3Sho/8X2BAa8DYwEZib6zR/2DQ78vhcAUA7
         St1tLQOTDsjK+e5vTLQxRmZTDiLU2t572IBwn9kSggBdUdCoiH1UVK/eDQTUaUIhCJ8Z
         Sc61dqliap80qGD6g588qizE9QXBw1b35DuKJBRWNzNGnWieACspZefOtV448gz06q5E
         ESWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=9vsiMXf3DxfbnFZBlMTojAHaruh/lPyGEb5sjutOIwk=;
        b=NiCrWSMdsJND9V1JuOSjMNTR+0bXqR1E+Ou4QAtP/VHfxfPSgrK7rWDWo9NVUxfCgd
         +l6t27nqA/LklR8Ou/5nFAyUZQRutXYWHD6NuQKRFhmrUL6e0t4v1asO/vjogTNqfjxZ
         FLP3dPwvYCYczqANWNRnxre6njAOVz7ZngAcTeINwjwW4c5rOYAEHyDdt+6VF+JcqT4H
         Qrzu2gKc+svTD1uB9eruWgt/heglWUXAO/yqutbTE28xlAA/LM6I0CIIScSHT6UL/afY
         d2rIGsxz/x9PDRjZx7IdhC45IJQvwR57+ppvm8hY5IDMw/52Unj1+m1vttm5l8Ss793x
         IxhA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Uzi8yahy;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id x19si27570ljh.2.2020.10.28.14.09.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1Rd6zbrzyWx
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:49 +0100 (CET)
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
	with LMTP id 4ki8wTdGBJh5 for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:49 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rd466hzyWq
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:49 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 08/22] arm-common: paging: fix old style declaration (-Wold-style-declaration)
Date: Wed, 28 Oct 2020 22:09:19 +0100
Message-Id: <20201028210933.138379-9-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Uzi8yahy;       spf=pass
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
 hypervisor/arch/arm-common/paging.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/paging.c b/hypervisor/arch/arm-common/paging.c
index be1f7da8..e2bc374b 100644
--- a/hypervisor/arch/arm-common/paging.c
+++ b/hypervisor/arch/arm-common/paging.c
@@ -137,7 +137,7 @@ static unsigned long arm_get_l3_phys(pt_entry_t pte, unsigned long virt)
 		.clear_entry = arm_clear_entry,		\
 		.page_table_empty = arm_page_table_empty,
 
-const static struct paging arm_paging[] = {
+static const struct paging arm_paging[] = {
 #if MAX_PAGE_TABLE_LEVELS > 3
 	{
 		ARM_PAGING_COMMON
@@ -183,7 +183,7 @@ const static struct paging arm_paging[] = {
 	}
 };
 
-const static struct paging arm_s2_paging_alt[] = {
+static const struct paging arm_s2_paging_alt[] = {
 	{
 		ARM_PAGING_COMMON
 		.get_entry = arm_get_l1_alt_entry,
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-9-andrea.bastoni%40tum.de.
