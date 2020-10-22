Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBUEQY76AKGQE6PSY3MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3F229643D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:41 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id g15sf1019100ljj.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389520; cv=pass;
        d=google.com; s=arc-20160816;
        b=sF8EA7r9MqfMITBwTi/NaGT46M42EDL4989O70UdtKAu5ptkh9p6gnKoYDL5nIAnX8
         a6AKEsG6D3JAWLAMBgUaifPv0XhtjxVE26VCLr6gVOVOZc4HNuA3okYwCvrjM4qlMWz6
         gl58/Ex8Z6LRjleaGj/qfx4LK66z+SDFZOmMGpnC2gcsXlizeH1Z7fCo4gIrAf394MTr
         cuYISjliVrjaT7yfZAyRxL7LlXKNpUPole73w5UvBRcnn8Mz3td3cQ8WJu+RYya3MEtX
         6BUPL5qnuhGmhkSAS0zMKLLx8SSsNnda24xMbysaq4qrMTALW8YW+Mkii1I36RfF4b0Y
         sHsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=whd9CjrX764HF6ejQwaesZT+oB05X0JaaZEycLRDRmY=;
        b=LB2+v1frHd9n4M7kjU0fqy68+WmixOVGOWfvIL25d0SIsvsZMKqqzJ0B2h7Ediru7o
         txCSiwxthO6kSZ8ObDm1nO4uEk4yV92TVXoIbqSgCQsr/Hpr43qAOTMAZlCwzlkrQl3q
         h4EyqnPqxSg/mjbhOnHlZA1JMmqrqoNeLBSKeblG5J64kDsFKyGk03dlNxoKyzPP9Yse
         ttLVA7Cxv0o1j482fswK9dPoWMgboZJdgmrTvDw5U3yxR55ZgPA42ZSY33bG59JAcEuG
         AIRieoyUDrjCCT1vRX3HRna6N6Qdqj5qV+lDQh8ORg+PChQiBntMm657s7CHx76g8RSg
         g7YA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="VVf30dZ/";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=whd9CjrX764HF6ejQwaesZT+oB05X0JaaZEycLRDRmY=;
        b=XvEqVUF2v/zcrJx0dmBHMXh4naeOFhoHzmgvRntJcQj4uttaq23AK4OrA7EGEHEsZL
         Xh14ImbgCbjs6ykisMNpsWCgpVgM/U7JFhQWqnC8qiwuYEQPF1aVabfsrv/281ouT1bB
         danToB0ol9wqaGjNjIx2kVP8VhLwBRupDAMlcnQWOpmUTBWjZ1CwwKA+qh6cid3t4QJy
         rBEuDJtTWNWOm8dUvjgAPGZBffWaAIQPgAZX/7sVi7svXNjxakDS7kn3uW/RU6zKD+QR
         jx5isJXfaF7q4wIJdVwL4m4yVIbLxm5M0GxrtTqrAINGwqwlvVi5sks5T+4mPB/JyZhS
         8jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=whd9CjrX764HF6ejQwaesZT+oB05X0JaaZEycLRDRmY=;
        b=jFhHPINNLLovGnFEUEYntgDOkinTinqTkTW9MBBySVngU/mRT23aSh+cIyCxJH9yM+
         FLTjxXVAo38+GQep44eH4yHQEHvKdkoMnUrL4aOFq4CjNMKJy1oBx342U0AGUMHI4hMu
         ns1WjHxn3AmNSLoiNFHefVXIb6KFW0g+lV6fs0KsBgh517wnb1QG69e8VcuDidN4RReQ
         n7zo4KUbcbXvswV60IV+i/lS7+BbzlxzBj+5Da0tUPjogQWZwFB+BBpTPNeazKEO3HRQ
         OlLu2HhotfvMKl9mWtXoEAzjp3QAnu1lDhGMqHRzfo3bP+JT1hsDpT+fD6K8ekIrdeFA
         +4ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533V3LbTFLX2zNOWh4X0aEKCYWt+MKpplpPhVSmLckuNEuG1e4Up
	QG5pj8dqpBhcOFIRMFqY4Es=
X-Google-Smtp-Source: ABdhPJxwPvHpvSBfroD/r/KwN391i1lAAEd8k88BzS/nvdgZiQEjT8SBnumfrbNQelxG0hj+nHKljQ==
X-Received: by 2002:a2e:6a19:: with SMTP id f25mr1558014ljc.386.1603389520669;
        Thu, 22 Oct 2020 10:58:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c111:: with SMTP id r17ls1744861lff.0.gmail; Thu, 22 Oct
 2020 10:58:39 -0700 (PDT)
X-Received: by 2002:ac2:5f09:: with SMTP id 9mr1168078lfq.407.1603389519627;
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389519; cv=none;
        d=google.com; s=arc-20160816;
        b=dF+REu26ywdrzuYj8ImX0hjg1I0F6D6BXg66NLU3njHBKAA4yXCtiYlFx3YzWmFY91
         wjSucjBm7aKxmMaUVx7HTGJaYtI2bcV8cixdD8p9DOI5lJ3zuB3WT3lQG4c/UPbR2qhy
         DXc+73g5Ie3Ei4wFMpzJSBsmNK6oXETLawxsuLSY08S6ii8hlrr2MoZDDlCESL8k4qJK
         olGMRScRgfL+t+5FMZrhU4F0y+1Ne9sCYhsrlLG7OrLRtiyY7dcoxzhTkncf8xBS62yN
         tbafa3PN5sgn6CFQD137O/U5hu1ox1wsVute+O6y/HongUYu3oabDuPZ0GPzPOVqQ/Rc
         FHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=9vsiMXf3DxfbnFZBlMTojAHaruh/lPyGEb5sjutOIwk=;
        b=0ry31+BeIcJ+uTdjeGYMrD7HNTNdNLmZCE9ydfDZg2Ts26zzOBNrC3DOCLPpKfV3WJ
         yXw5xMiPBhLRCZJ5df8B9RqJqOECX3n4VPr3X+MzN1EPNQVoVvdQtYpm4aieui9+w3qS
         V4kwVjlIZeH2u854ASzlo0jF/epTeGoUAl18+mrcYy8IEZQTXxIy91kx+4VCDLdjZoDk
         ua2pRblfm9RfbAIY725O9sEGFS2oS+KhwAsQiClAJ0GCBYCbeLdraT+v/J/HeqqWkGRj
         HcXNCSdmmybITXsiR3m1aJH8lVwD/zw/xlsQq2es3AKTeeulJkLzVjrC5HYIlN2dq+YH
         tk7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="VVf30dZ/";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id t20si72610lfk.10.2020.10.22.10.58.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFTp6tSRzyZt
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
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
	with LMTP id 1984X2qt2uhI for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTp3vxwzyZs
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 16/33] arm-common: paging: fix old style declaration (-Wold-style-declaration)
Date: Thu, 22 Oct 2020 19:58:08 +0200
Message-Id: <20201022175826.199614-17-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="VVf30dZ/";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-17-andrea.bastoni%40tum.de.
