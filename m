Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBX7H4OBAMGQEZPIKXSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1C5345033
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:45:35 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id l8sf45216ljc.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:45:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442335; cv=pass;
        d=google.com; s=arc-20160816;
        b=epNbLNACOKPJPUody6ufsXJO9oMngWZ5uWfylKtyolmtujv99X1qEANzW7jzaBXAGA
         XbE43IE1lK9rcsRBwjYEXAa7uPP/7CNilUeFMmBsnNPh/9VNCRYsuL7ODybtiuX6Gnc8
         kBWC7VHa9VD7BRnUopHrc0HGy0Y6kc2kDgAIrBV+4c57Nan+EORMO160aMblLHIMxDvT
         Qg4kRPsMB/36UJvgvZIPowwb3J7eyOANULbWFNZQvlwUv3HtEbYsOS6QNLVyIc7/AP0E
         rNviYRzQq0AWt0XZP6VlM12nrVVg05clLysFbfDH58lTWyBp4/Mqf65bnQ01hYIfUM8m
         +KYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=M1KQLZGhafOPf8XIUuxCit5eOqVsJVPqJMGouWscGws=;
        b=r7//d/8tHNGw+Xm4UsjtZPmJRp+f1tHbxKiiFlBPGmcIkzFwVK1P7cUajk/7oZkykL
         EPoXA4xokYzyya7VwzDd2JZHM0tfe6WsomN9umenSjUebPj76gdHJgyxVTyjMcw+RVhJ
         OwJwH7PELNMDzE+qaiUJbMC84/gzELRMOujPSiSVZM4bDkkZdlkd5rh3TIIZPSaqkzx6
         fY94lyNCNL3Q+pW9MMh8wda7NTBi0f182v4qRmADdAedFNFTyWZsmUS3iKVmAclgvjYK
         vu/VztiO8/eGgtH+D+KOcKvXHmEyZL+B9dxUiyGNHPyUWJbyhKJqobSDiW5QOFvQvVwK
         gpyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=mlBBmwIT;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M1KQLZGhafOPf8XIUuxCit5eOqVsJVPqJMGouWscGws=;
        b=IreQ2HMVY2B07saisa2EvMbsDAmanpqF4na+Ugd/LDMt/GRPkXy81r0CwFaii60GxI
         g5ZHKgjTAvkDRn7gQSYtIyQ2C1YAL8x9E/jGpwbBFApUmOCm9dvFrAkqHAOovjHrtF9P
         nsNIcI+L8FesCqi5MIRRMTPqgZWNsPCVTEv+bT0VSReOnt+kGWwtRzMXCO9xRWq3JXoz
         0+P6QXQkEBOsRHOu6FXkjOhsGa42wD2Q8Uv08Iuy3kO18XFKB3LKiwcA0dDRrcFM4/v+
         QvEZrMtVXj6WrUajk3sXMQovfIMPXsCoNnphhPycq94giTJyxhS8vZabR4xfEeBrS3ix
         DQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M1KQLZGhafOPf8XIUuxCit5eOqVsJVPqJMGouWscGws=;
        b=MrpjyQu7a9UHM4cSFuJtu8ttpj6xB5YD7Z8Tg5RGuKvsSwLugjh1DJgzI31pNHLCF7
         0CluFQsJMEa1Whz50Ya2rb9ftd6V1RsoyiNZq/u82ku0P6NaohjjQhvU4Jmd8SKtI3h8
         QvfjGW/v4IiKXOOAtKYv2SSXPtwjCz+Lkdv0wFQKhWZRb2ABU10c+gGLsCCNj+c006dk
         ZSMFMq7fjk8SgC50pMSu0Eqtqha8GyXYOLRJkeHXXO3zrvAyaV9Rtnp8xodAkkMM7y0Y
         AdNDGYQnIJ7SK2wyAsvCb28G7pvAnDZTbECTjxRIdcsrlLdjklslTrflTfBGc6slD3BE
         L0Ww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531MgcxBAC+1FmU4UkAGooH4xW1H25WHXEIAYMA5eHH12/80YfKn
	+b1eL7es9Jr/vnX4T/5mSTk=
X-Google-Smtp-Source: ABdhPJx0I75phWlIarOZ0F5aNWEYzitdiRLEhCxUkNhbIRvTGq1dbSHdIM/Zm5X9hQHYIlyfBTcZoQ==
X-Received: by 2002:a19:7d43:: with SMTP id y64mr547080lfc.614.1616442335472;
        Mon, 22 Mar 2021 12:45:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8503:: with SMTP id j3ls2667121lji.6.gmail; Mon, 22 Mar
 2021 12:45:34 -0700 (PDT)
X-Received: by 2002:a2e:96d5:: with SMTP id d21mr683247ljj.148.1616442334581;
        Mon, 22 Mar 2021 12:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442334; cv=none;
        d=google.com; s=arc-20160816;
        b=RhLfKPlprityLc8LPX+KUKglwt7FGpdHqLdTnkILvDXq36L69CyDPLUlsY9B5a6WAN
         Zu0HuLesKEDJiN6Wbei1gUC+6NMwg9sjTQbcYXKy/Sa3A7+YHfqaX7Ns4AgPGFUT/TOX
         JF7sHGsaUTJCe5CzWkMG3QeQEFu3bxl5eHEfPLDvXSyBBlhW1WxB5zi5jfYjawHm1uX7
         GGZDQpeobiWm2zh0ZRWbVOAnhM2jluDdqVad3bPU9VBnsKvR1ghtSMx9gv1+yYYjBjDl
         Wg+toghe7b8sdUyM1sx8sCFey2mKvpHTCtWTi9O+fO8/dhfCzxZYZdPbzyfa0felSwWy
         QWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/veAU9di7UvVjlrEyjAqetkFobV2tTNeh79lXFM+NRk=;
        b=c73xudjRWJYJvEDYWvoes3fUbXuH2B2zRbDhwdcBv249Vln9r9i90SorixaqeJgHDH
         kFXSblyo/fQBGcbmtTN8zUbamlatD8FWu2UaXpQnhRgXMk9U3czpaX+E5Bkw4BozS3XC
         13K0lqBCXn79VE64nhzy4Gx0yh0AfbmsBJS6oKJyUboZ6vbVZICaNI6M7T/E07OymoHp
         UxoIY4jBA+gGyhMJeZh1MiCcyi/8r8K4MPj1ZuD6XdhrYyDczuJPilM4O6g82F5l7Wtd
         C1HBnYZfrlnpyNj0Vo2H3BTEiM5ID/aZtVf4lKRM1370LSgu29FKy4Zq9nFuBbwL4VTF
         sP0w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=mlBBmwIT;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id i30si682356lfj.6.2021.03.22.12.45.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:45:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44jV0ZZnzyXb;
	Mon, 22 Mar 2021 20:45:34 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id j119K7_7X0kI; Mon, 22 Mar 2021 20:45:33 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44jT3qZLzyXh;
	Mon, 22 Mar 2021 20:45:33 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.2 9/9] configs: arm64: hook-in coloring parameters for ZCU102
Date: Mon, 22 Mar 2021 20:45:07 +0100
Message-Id: <20210322194507.82643-10-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194507.82643-1-andrea.bastoni@tum.de>
References: <20210322194507.82643-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=mlBBmwIT;       spf=pass
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
 configs/arm64/zynqmp-zcu102.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 492dc566..0d721e63 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -45,6 +45,10 @@ struct {
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = -1,
+			.color = {
+				.way_size = 0x10000,
+				.root_map_offset = 0x0C000000000,
+			},
 			.iommu_units = {
 				{
 					.type = JAILHOUSE_IOMMU_ARM_MMU500,
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194507.82643-10-andrea.bastoni%40tum.de.
