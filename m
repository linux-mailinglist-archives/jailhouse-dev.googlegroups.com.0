Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVV76D6QKGQEJSBQDDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEF12C16B8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:19 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id y187sf195581wmy.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164439; cv=pass;
        d=google.com; s=arc-20160816;
        b=tvdMYRmN9436aAqLzhnAWr1uIx0LiyoY99a2wzDBiikUa3zruFDPqApktJsdEiXCAE
         0zIb7CeuMDcNKjucpeItbzClGMjCXU4UkZ2I8/ar3S72jjO2yB+oLzJ/r5yDXfBSZ+ix
         XsET/AaKxwFZGx+TYDIlhyy4TigbFbexmgqSDgwnnoVPxFveiOOuO0Q0V6cQDsEk0G5r
         FWwXw0eKcudyijeCKKy2n27ZYdNcTQU5WAngynaQKsWXsXuQ4nua3C9JdEkxrHRWqGPV
         6SYvRqcWwcbFrQzN7GhQ6sfiz3ubUKfJxDxg+ykSzjn62wRkpv6ThZc7EqlEem7ThN+B
         3pIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=0ZG/1rwrVsQ4gB23Cu/FIct4RAFt8SjmORKC9+whNJQ=;
        b=sGYOoQH3N8VF/3ho1Kt63kk9+dMwWl+2Pv+qF2QKUsNybmV9uhcoD5Pi2RWKFXYWhX
         02ZNAAy9YnU5CBARgQG6XIKfnffadycYMHH4mS2KPNqDYjUp84Wj9fG8deC7VxGfSmPV
         6aSjP3H4qkzN5tpnAL2HJo3X0OFjza2K+hjzxdLmVHGK+pDD1pN0itPl6Nui8OYAg79U
         J1jj/R5RZh3MHtL8B+VLogruQaMtAkx1HcB16qjslq/aokFHDc7z8FaUJLgl6obcg62K
         G+O/iYuUf/F/VAeUYIgaUvxmyc3pHO/qdzqlJ6VeibdsYPw7cypBKU34o3Q8ZuFAZ4Za
         2D+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=rb3idGe6;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0ZG/1rwrVsQ4gB23Cu/FIct4RAFt8SjmORKC9+whNJQ=;
        b=Uhm39CFNCf17L0oi2K1dJs38cdIJ3LSuGKwDBTvGVGJjV4cRm/+rBOFk9L+1B/ZI/g
         Hh8aObD+1eB/j+c0S7GvkDaFPvvfh2XcBmEdfUDRGTVMIRq4JpqHp88Q6hCPqrwbECVw
         G9ldjw+q63pS9FlpeNrky20xUi2mpyzYKSBw/ukAanW2yE4RvykmXJR8W7Cve7AWEdQC
         9v5KsoaW4WYJ25ezwnuRxyWI049coEXKJ2nPShjgjEEdRNJ3Cjsb844AwGHwvTPOtaTG
         fwo6Wqvvx9xmpdzOPdZdDoPGRy/myEbFfeysYVAZ+emR5E8zyYpPhM927uQNpifJIkBn
         hgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0ZG/1rwrVsQ4gB23Cu/FIct4RAFt8SjmORKC9+whNJQ=;
        b=ksIQv3AeuRVE+rBOOTj6/5lZDxJYo/MPa7YLULOp/9GTlpTsfoPZ6ctgRzpajYGRlr
         vAEyRP+iTI5p94RI4y1pMF5/gN5Hi9o2OAvc8ngPbSdy+or7Pjz2ubEvnGQ5Q/A/9AMt
         ZDInJpgh/wDjp9MBQoo2dz7HPdfCJrvKxtaiAgx7jxtUgy8vlwut5eIR9Bj1bmAIyfM7
         4GYP5ZYXKcJT7fEVsB1uGcY9UFiua3aciMBPu7zsTZCaYNv2rH6Wc644V5eaqIGmlHIN
         UI6Qpa73cpc8Nst5rLOiRGLpGePXCgR0yNM99busEuDU9D60be9k+xcKKyNbgumRpHFI
         wFZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533WoDQkh9eEEkq+Vu7w2Cwiw5OubkF41avyVPuBh9H7XI+RoO9i
	z/9VjKdH2BYEisrfO0OuxaY=
X-Google-Smtp-Source: ABdhPJyF9jiJBmqsDo2N20BhJED7XO3ybnChIJGCH6U/TOyIu6qQ8ZCyYMdTVNb9QGKk18KgIvCsrA==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr763247wmj.72.1606164438960;
        Mon, 23 Nov 2020 12:47:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:aa87:: with SMTP id h7ls9061205wrc.2.gmail; Mon, 23 Nov
 2020 12:47:18 -0800 (PST)
X-Received: by 2002:adf:f245:: with SMTP id b5mr1541584wrp.354.1606164437996;
        Mon, 23 Nov 2020 12:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164437; cv=none;
        d=google.com; s=arc-20160816;
        b=YgyT3I1wgAH5nOD4KilUV4D4GbjU424DkOeIQbApBzb6a+OBxv5KAuBV7pFwUU+lF9
         PHI1V6ApeBGf/jpTLaFWwkNCV8ptZ0Xn+bmEDVhc1CQS5FGXXEdfjEvqZ4/q/B6kwVFM
         AcrA7deMgURQMGtbt+bQ590LcC3cvPCyTgpXDCI4l66nPCMPLIYxTqiMt958KuDp6c++
         pm2MyGtxocv6+FFE8PCMVKvHW5dnk0m7kvqJA/BWsRcOiC8zBfzegyLAYckFTPqGg10q
         VDETPCobFewzakIAcX/RTfnKlC5gO/TAKuBsPphF1tbTRLd8IdvjbPKBzsTN0fWafBBR
         0v9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NuxdxNeR2hoj+TUiK3gV69FUzYv/Bb7duSQRi8KExh4=;
        b=p3QoT7/bbbG9Ucd4uA92Hnd0EYuiITf2a1an4HWTKp3ih0fpH2VLUM4wIzNSOFEh2d
         FCRBIdAvq8OeA70+d7fhLN040SMo7zQN4DGV6SlKkFAZXglYVsj9qifOjKulW4Tp38js
         AmjpcS/Wy7kQh4+sXYDk6L4wUA2P0WTMNM6sjSRaoBIqxBq3ISj9v/2AMKT4Ghi/jh8q
         68isnAm9qClUTH1dR0kd1sas9doMWgxoxJwQXWb0NDJjFhXKJI8XMvAVa0HVkELWROAv
         2wo6Maq/9/FJ0wf2p3qVYveUP3h0CPXxfa+nm8Thdjt58207DiWp85sgb3SHefytJbK3
         PeZQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=rb3idGe6;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id w65si11885wmg.1.2020.11.23.12.47.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:17 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4Cfzjd5YFYzyTj;
	Mon, 23 Nov 2020 21:47:17 +0100 (CET)
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
	with LMTP id p8j9Mur_H-Mf; Mon, 23 Nov 2020 21:47:17 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Cfzjd1ZvjzyTl;
	Mon, 23 Nov 2020 21:47:17 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 08/14] configs: arm64: hook-in coloring parameters for ZCU102
Date: Mon, 23 Nov 2020 21:46:07 +0100
Message-Id: <20201123204613.252563-9-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=rb3idGe6;       spf=pass
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
 configs/arm64/zynqmp-zcu102.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index bdcb04b3..5261b15a 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -45,6 +45,12 @@ struct {
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = -1,
+			.color = {
+				/* in debug mode, the way_size is autodetected
+				 * if it is not specified */
+				/* .way_size = 0x10000, */
+				.root_map_offset = 0x0C000000000,
+			},
 			.iommu_units = {
 				{
 					.type = JAILHOUSE_IOMMU_ARM_MMU500,
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-9-andrea.bastoni%40tum.de.
