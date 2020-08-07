Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBWX6WL4QKGQEMYQFTIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id D741B23E5F1
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:30 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id t26sf194942wmn.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:30 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768090; cv=pass;
        d=google.com; s=arc-20160816;
        b=ioMT0u11YeEwGAAOMw4FbbVoVKOf5k25AN+ndjqtZ0dwEtGwvIb8gjq1K0iEZzIuEp
         tCAEJygfJaEG8y8xel+6abLYHVzc3pedomC+keE1Jc9QVJkNemOx+PO+GWp1i24Jpjv/
         LU54Ne/AkLRWw73wOXYydRShfGz1phGx6YvVuAHegrl2+qyvualjypDJFJ7dPMidofTd
         HmicwMsvB/Gn6oWxkHzn/iHKmvQO796VkEUTPmDCOyjIwMhLi2H2e6jKE7frin8s80kZ
         VY9Jf9x/tMXxYx0Y7ykcjCSrAJzN2VKtdkGUpNKYxnDu/PkaSZzevOs4qpUDgivg4rG9
         gNaw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Myx302FlnnAI99QDbNOEQrbebu37yeCdtbRIUWRlNR0=;
        b=NWpVA8SHY8CBBqnBP1/cHDNtLRlqL/kLeYPFx3COk56HlLh7s8qZeMUUDrqqlP4Ok9
         c+yglyCHEjoqEJ7wCAvQZ3lXNlZTQOzbPX+IBZDLjsP0a8BMMmodEPaslgrwVtcR3KAK
         +8lSJetBaKJwfPAXR6WLgALqtvB1Zo2y8aCgoGIsMRZf/mQRbWmjyyMkSDRrxzBw8OI0
         7pWyzz+ifGW21FaVW7WORDwOqJyRBYQOUg40jtO/JmCeyY/edxTH2yE8wWHlCeUIa89Q
         0cbAPm6TIkCdiYutdn8aFkSLUZrr0MtfI7DJYUZJQuuf9baUG6bb1dADUoTsHVTmKsw3
         tm2w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WDuOMgoO;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.72 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Myx302FlnnAI99QDbNOEQrbebu37yeCdtbRIUWRlNR0=;
        b=rRfzKJMr7yKX75ZFESxkWQRlkCNNIMbQfjQ0tiry5XXcfmTH86mqOtTX+LMPqFzEN4
         aW9bdC8DJgBFpZuAx5H1IDf4KYmif/3hv2ILSVyEGmIc96+xvtXCVglSZbQeRBlMjdLR
         DzrbgdADtz0Hx1KBACUkPb487FY+IKhlx8QMZBNDDJifae4n4+rZVsHMjUt3QtBaQ2xQ
         Zm+BquIPiERpbLKDhzQSypGGEXTUaff8Yy8YlU1ahL56qP/h3qJyo9/wuvYhz/JQjWrV
         B7w0BSXP+QgKYJEtgNhu7N7nd4dT4urh5DeBw8QGsVMGUwvpgiNFzCb2RDJzSJ3SGR9p
         IxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Myx302FlnnAI99QDbNOEQrbebu37yeCdtbRIUWRlNR0=;
        b=jS6/UT5IO/0MeBKH9wPhsfRpk0Sr+0IMvXwIHRXTfcrg/8uT5uxhWDz6rGDG6IjMAi
         S9aXItxgcalr9E3TMBjpXUU+W1L5oo2OAffbHOSXScY1xLS5H96a/uQjNLJzwBLm6m8Y
         H8zU/YcQbAwgKgyQMZrHpkP97ROp9yst2LKcpffztZZEKP1RAhDEE90IL/07D0Nlbqyp
         KxlX08siTeotV5L1/iG6lJmUzo0b7R7ivS33DGEakT7LONvsMhsTuF0aXb51GywJUjOM
         x0EwJjIsUXqmNh6VuOIWq2LprGXHyFUvaRN2Kkuv6Qy5KxKOS03CsHou5415JPtecpjg
         KACA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532sKFee68diZvsc/+knMJNT7jypy93Eda3UqIN3kiewS98F4f7t
	hIXLiUPJYVdDD0wwp5GO0C0=
X-Google-Smtp-Source: ABdhPJymIlYFiU3dnbEnnCiXxctmZgjpLXbvGdyj5QvjzbrK5lsUBQ8wZQKUeawWiCv/17GaRuXSkA==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr11087863wme.78.1596768090543;
        Thu, 06 Aug 2020 19:41:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a3ca:: with SMTP id m10ls2480265wrb.1.gmail; Thu, 06 Aug
 2020 19:41:30 -0700 (PDT)
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr10163353wrt.67.1596768089907;
        Thu, 06 Aug 2020 19:41:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768089; cv=pass;
        d=google.com; s=arc-20160816;
        b=TjC6qDIM+w2Fg8WjRGB/At/DiKmTou5INFzEWFHZYAcJ0P1RV7XNojIsAIIRLKfQ5A
         WrBOzkkW1h5+53PRwRAnih4VFtRmsTluMM2jN0LrM639r8SuhzjcMduEU05LT3107T8B
         ukpZ24mgreppcnxvErhSZf0jbC+lb+CrTH2hDMSysI1k0qnDbVEAlFCpkAsOoPbVbQXq
         pmh0PprgE+PtDnY4Wp3X47Aik8X0M0WBYMTB5BhHyqKyEskLfXxvy18gGrUNknGi2NxD
         OdqeMw6lLjWty66ni+t7NeTjNS6oACPwD2zgewlolXuDyHkVFsaJrnJ4D9GPDcV4K9Gz
         H/9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VroAhmfUFHHKJ6km6b+bFvllNGumwwRVRfq82qOxKnQ=;
        b=YJlYS3t5uBLpMZDfrUOtsWyJSIS4nVL2hbEzoZ96DrlecIRwQEcdThf0HNJ9l9btPS
         r47tE2D7C1F8NVe1xpaG3J01q/HWXvaVGriHAMUvLu+tO9k7EWLaR8YNT1ilGOJuC3Zg
         eyqtPmchaN+5oJmZXgp9H560wV5a4PfsnP5Z0yu4sugyi2GX6tviG8LD6RFDq8qMXwb7
         hNq293a7iHZvFiS19d/LArpk6oNe6ms81BTl1qO/hDAbijIqtvONBZASJfpjnmVBr1IB
         KaO7AdWNKz6PfPl7z0fsnoqtzhXwYIHDQaZR0zvMFr5fbm4Gb18BZVDjBp4MxBaWfK2c
         JfRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WDuOMgoO;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.72 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150072.outbound.protection.outlook.com. [40.107.15.72])
        by gmr-mx.google.com with ESMTPS id i17si320138wrw.4.2020.08.06.19.41.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.72 as permitted sender) client-ip=40.107.15.72;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ro0m/9xceNMdLBEvu+D8EmWorcy+6/Ibu6RGOC64xW38FExK9RWk9dygkxhp83wZc9GfhzagHX1+NMZT75RN7Vj5JbY+9ogbidi1jDo/Q+0rah8a762iWbt0in92Xjb0WSqc6uUXFEsqjxr28E/BT+4FlAF1mDKLjVX0pRKivm2Gii3JJtqv9j1sLCUt03yOVGjrJX+7ruO9ImS1e8+PW+c9bOdE+GbzrrP55t5nJGGfSiecKQsyUCAbHqMT7lNMxbMozoeKFyxIaSTeNM2BLpMWtClbhm1JBxz7HC4SJwsHvh+oOOeoaRios9zGvDliAB8w9MbcM+IBKdMcDD3xww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VroAhmfUFHHKJ6km6b+bFvllNGumwwRVRfq82qOxKnQ=;
 b=hsLZkkwrIpHYhoC/X2F8KMclz7N8qGZnpWhOxuQ/Aq8uKLBiIoirRixJcxb1hoxeZN6XGxP0RrBK88Fr+B2L12fIJCjvuD18ORMfo61nlhkUJQgovsFDP+c/anuMgdZpJ76qfpYbMAYZBiQ/yMTnYcfxzFo1kmDniWHCay9yuTsbzbdUcGPixc4ndz4RuNrtoXpZaZEQlO0MCcqDQTu5C59+Ap+fOQVWVex400FLqCn8tHsVYPTLWhag1fc2tbd/sMQUPcz/vcglJOhJyOVsFN6Xzu25rTn+DCXl5NvKOEpQW5o5ZsU/WgKJsZ0MYa5TFgChhTY1hozO8mTPNmUbtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:29 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:29 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 04/10] inmates: lib: move string.h to libbaremetal
Date: Fri,  7 Aug 2020 11:06:26 +0800
Message-Id: <20200807030632.28259-5-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:27 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 62598c7b-7001-428e-9f46-08d83a7b62ed
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4087B81AD0FFC07A1CDFDC4188490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRVjA7X0xliSnUsLf3qRnzf0eAuyIqV4B4P3/awEhIT3qiWXyWsAuRikWXLXnwkdXFqVOgRx6k4114hhCHgeCL8MhkPmq9UtQrZTVxmRCldK1wpf3d8LDCahM56snOlaKPXVr+bGMS3C17Zu13BUpYq37pKI+WtiCf38APpDoSFPAMeufz9/145b5vP5lAp+MbrccYcHA5gPJUtSkebhLF5Hmy2Bf2RRjdPpXytmfvJv5w9BaCbk+TyBk5fKmB1tbMICQa+2H7EIiMH+LQbSqX2Gd83mGHIedCcoDo68NM9oISv6j6O5NXzcGbymlGNq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(6916009)(1076003)(6506007)(83380400001)(9686003)(6512007)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(4744005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hxyOXaB0upocTq9wKnxLw2pqIA1ieqrnLjf6vmIg4NPmo3EUKqeUuE8kV6bk7mdK+Z/VZlWycoHeZVZdVPGtavG0f5vL0viuH98yi7+ur4e/dE1HRyEiOUnXu6vSqlkPmNDKTCrTxVmbOWtIAtucBA/Tuha6EFSR1NUjOOegv9Okl3LzpZfZYsyCfvZk92TbR58bcUFJdhW42DrIp72Z4xYPFOlmm71ztzWja3CTAUB/goEmWGz5jGqV7r9tcvOkpdxcHX+0sKPfNMM59cyK7E+ArcyeqLLsrkbZ5NU83jcOckSFMnzU/XoqFAXLoUrtLx8hk5ICwuOAF22gJ2b2E7G9nJyo1jNwE5+4SckSZrTuzRDfctVmjbv8UhAHVrBmpiZGhWLA+S0QdtpNDl9ekqxunOzbghUgBfcyGRKpTQ8JL9YO49Oc7jbsLgckep25oyFIKRyp4tKgxSBfvinz8+D9lFgF8vv4FtiKzPWNv4R37dCR8d7jyxcPOMwpW2wvO4yxwJCht5RwNffgUk/imi7rmtGoz7XsEV18rIX7DcdL2cLw4YinorQOm7fljcwYrWoD5DJGEQdhfo2YR3XIfzVmIDJDMYxHqC/S5+a3gl9UV1ZE5MUzL8Bb2SQqTExpn8jgXf/Jw4YtOTQWV8ljbA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62598c7b-7001-428e-9f46-08d83a7b62ed
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:29.0882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oI/4Kn7xL9u+tptX5wH6KY3Ta0w2wY9iz+mG2//7dJKjRqUB0kjyvu8C2NDpH/iuFIL/kyRdptcV4V2VtU7R+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=WDuOMgoO;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.72 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

From: Peng Fan <peng.fan@nxp.com>

Make string.h could be shared.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 inmates/Makefile                               | 3 ++-
 {inmates/lib => libbaremetal}/include/string.h | 0
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename {inmates/lib => libbaremetal}/include/string.h (100%)

diff --git a/inmates/Makefile b/inmates/Makefile
index 9ccd30fa..095055c8 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -18,7 +18,8 @@ export INMATES_LIB
 INCLUDES := -I$(INMATES_LIB) \
 	    -I$(src)/../include/arch/$(SRCARCH) \
 	    -I$(src)/lib/include \
-	    -I$(src)/../include
+	    -I$(src)/../include	\
+	    -I$(src)/../libbaremetal/include
 
 ifeq ($(subst arm64,arm,$(SRCARCH)),arm)
 INCLUDES += -I$(src)/../hypervisor/arch/arm-common/include
diff --git a/inmates/lib/include/string.h b/libbaremetal/include/string.h
similarity index 100%
rename from inmates/lib/include/string.h
rename to libbaremetal/include/string.h
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-5-peng.fan%40nxp.com.
