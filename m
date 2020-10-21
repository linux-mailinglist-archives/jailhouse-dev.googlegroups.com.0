Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBF4XYH6AKGQESOAHE3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCA2294F1B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id t11sf2818216wrv.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292056; cv=pass;
        d=google.com; s=arc-20160816;
        b=rZzCH13ympCEcPo2HdnTISA/41GRh60vazCNaDGMDazREADTiFPESCDoTy4JAchj7M
         nv4+17uB3RebFtp1hU638QeCtCR/2zG1z8WXYdZ47IY54R1VHorPNAvI+P3Wv4zseXXr
         YOnLGIp2MR61aXba+GEoNeKVGi7jJnkDz9874cpUj0BbQ7KfabKmRGG7kb8FvwpaaHhz
         p/87a/mj7ybR4TX+DUSMv6XwGnvdIBQkgPwErt+w9vOMSLacae9DhHqE4CaRZ+gGFovO
         J2Wmsd/BbIexAD7YGkbqziqR9U0nIRwLDhg/p91Cr6Tc7NVrNzB0QdfjHzZqpEWkU288
         ns9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=xA3asd7+Hm2hSiBeyYAXUluM9l8W+7pBQJE+DD/3GRI=;
        b=1FdSONX4KmRBMnkkGmhY3VG9ciM/RVRSHvpESjEUui2s+TfkyTRHHKDF1FOu+RDRhn
         E2ZXGVrTS+Vqyu8oa+zGLi/Ar1kfnIUVc+tt+HY70sgRx8q0eNTJrESOQQYdhHSNVj0G
         08Oaofo/igGWzjpvMNL6wdrMk6qK3LV3mPp/zgmJMK34VaDV+w2zDH7ll0MDU+08h9v2
         cQwrlQdKF2KhgtlddThCKE4xWe3J3++tayd5DeZBPxVJqht7veaYTTA7SopZnpuyIGOU
         6I0OSNY5rm6PXYQPwn1Ca+MJGz1SF6CI1zxKyUu+P5TfIP+JGhItqaBWERr9nx03/RT8
         vKzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=GSW2SlvI;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xA3asd7+Hm2hSiBeyYAXUluM9l8W+7pBQJE+DD/3GRI=;
        b=ghlJWksYoaoqTXAXwaqGC7l3v8dmQDMXRi7U//4gjjuF1Nm/6cEfxIj+B5fqyHPNTt
         vPGLE6/EIhav32xDMF8vscgQxIAJFwF9menDciiaZ+Eo6MjXECgnq04rSGLUDYPfNQOW
         wFAj1p7d8AjI6/jzns4g/6S2LGUu1YbQenjBU1hAj5Rpt7qRQgv0YBHxvwopQJ5O1emo
         1sCZmo/SX1QF9dmgAx6bPTf6H8XuZvQcNP7qCnqiU9GXOoMytQkb8YSpmagB4B6vjKFB
         /GGveUq4l29V/TFn00eBG3UwyzfMWml0rREfPftsLzedZoY8ooRe1e5HzyQsPSE3sMLT
         YC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xA3asd7+Hm2hSiBeyYAXUluM9l8W+7pBQJE+DD/3GRI=;
        b=DdhbzauedU4Oq+c7g/Vs0/hXe7j27stA1RpOuWSr5Fkp+chQ7+c9kjmRNdXyBMkCvY
         bBKLVHB9haWurGWZa+7rqGQkcvOj4WofFk300UHq+FaZuWGR6GBgXQ6REpIjvGW5o6Bo
         k4c4i+g6pmhCvruLMpUixCEs+j7bNoaTHHnwXLoOwS+fZ0Sso5jbpYOpZnOp/4El87Q3
         E5MAhLweDutnrD13OXltRfto+ZpnfiCu19hjX78LUu1kebzGrXrYFoMuXlrId3az89Ip
         Z+ToeIipqs/SRoOyMoWoPu7VrIJGm5xkU4nE81pswrVIYPUzUADbHuUEajxBvk5BGKL8
         tFFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5301eqqe/R3bneYmmINsDapFsQIeB+r4nb3ZMFgaTwuTmss20qAt
	/F4qBt6f9gjRze4JwafaauU=
X-Google-Smtp-Source: ABdhPJwweYhWrR6qcp6qnTbCu5dFCviEjeEpaJOa7a14T720xRChnG1DTikpb7vjfjhqTvCGXUh8Gg==
X-Received: by 2002:adf:f3c4:: with SMTP id g4mr5509672wrp.207.1603292055911;
        Wed, 21 Oct 2020 07:54:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1c2:: with SMTP id 185ls112452wmb.3.gmail; Wed, 21 Oct
 2020 07:54:15 -0700 (PDT)
X-Received: by 2002:a1c:791a:: with SMTP id l26mr4131317wme.163.1603292054883;
        Wed, 21 Oct 2020 07:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292054; cv=none;
        d=google.com; s=arc-20160816;
        b=xiQzIOvR1am5vkVwpg0X+Udj6CvNaAqgq1tpdyF3XbFUnIj3LETokecsneFD4XBRf0
         AgCj6wHpmn4StmWmn1OT7GbahrWSgy2u8h1thRX9jPgbNa5A83QOcQNMlVgUGRpi77g+
         qLYdrAgM5SnGpRq0Np+pqVByRk7sRA2tcC/dHcJR2d8wnS7gasN5vMnlASGplwkVE+3e
         ittoE5nkebktdvj+TTgVRk6AndrXgZRptymot9dVNrwgfQLr5OXJRYgrt5Kh5JVA5oRL
         OGUwVJBknmEmEtKIlJOr836v8lMmhqNAqWVQmOZ1qIQuJGJuD4SfuGANOY5z5cUKWdre
         XoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=L+m8NHSTh+Xf5H8Is63XmRONyhFHwEZColbETwXVs/E=;
        b=qPv1RLcwdqXbUEntvCiqYhrael6Hqe+tk9K4V/Ycz8u/KUdZ3GeUR8LmOLYC/oKaN0
         S7YnX3j4byAh9bRBIp6NkbB8/p0STpJ8xZX+k+bUDhwDNkc+uThUi+qYC/pVat3/y9JL
         5RPR8R4nzYu6qGWeiVdLm1E08UjBggAd7p6OYLzGYIMlAcgnBvo320gdV+hjBi731vnB
         /o9gY0nqa3yxu5KgxG2ni1yw9F4vkU1qCumZ6C0axNWBtbweVx0dZ4TX6ueoWe4tpJYH
         +I+/Z3ILolbGE66RolgOsQTJu+c+Z9lFv9G1NfYg7e7HjsVVtdTNm5JhJIfj2WnZ2BQ5
         KSSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=GSW2SlvI;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id 63si46734wrc.0.2020.10.21.07.54.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRV1pdbzyWs
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:14 +0200 (CEST)
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
	with LMTP id lQM2nT3-gxQC for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:14 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRT6B2TzyVy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:13 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 02/26] hypervisor: protect inclusion of string.h
Date: Wed, 21 Oct 2020 16:53:40 +0200
Message-Id: <20201021145404.100463-3-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=GSW2SlvI;       spf=pass
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
 hypervisor/include/jailhouse/string.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hypervisor/include/jailhouse/string.h b/hypervisor/include/jailhouse/string.h
index 5b87bf03..24f0b0b4 100644
--- a/hypervisor/include/jailhouse/string.h
+++ b/hypervisor/include/jailhouse/string.h
@@ -1,3 +1,6 @@
+#ifndef _JAILHOUSE_STRING_H
+#define _JAILHOUSE_STRING_H
+
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
@@ -22,3 +25,5 @@ int strcmp(const char *s1, const char *s2);
 
 #define __stringify_1(x...)	#x
 #define __stringify(x...)	__stringify_1(x)
+
+#endif
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-3-andrea.bastoni%40tum.de.
