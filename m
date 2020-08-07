Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBWH6WL4QKGQEWQMKY6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id B136423E5F0
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:28 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id q15sf190788wmj.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:28 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768088; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ak1vLlSpzZ2A/hfJ9Z3It09Jw96HzrrZwbKZHoV+7JphdVb35uRNMTw7VYj1HnM3If
         IeWBEvT+IJEnWNxnzE/PJ/9J439OqL4BSMFBeuj5FYHyBPQ2FG5reCnWNPtuqt6uCmpS
         JxlbCYr636UcBZOT42uEWdofJs15112Hm4rq/7HH5+MspVEYARTgPd0miO3nQn/153Zm
         IjT/zDXRaRM+WoTXPmKousHv+HpLdmJ6fMGqqdrN1+FiHtbWNH06zhpqUjYYQVLr5T6s
         2q4qrzLqyglNRq9ceVDZSW9TLaXoOdu16DlOzzMoGowu0BW2MxkGpGq13uADsFVM8J/q
         i7nQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ZI5NG6JkVccgkeRnG/DXYNWoU9JmSCgVa7gG9XGTIyQ=;
        b=V0eF9eFp9iwiYNbP9BdL38wgjhKRgMvsjfjMmkVVJyyRXEHe9s5keoocBMLPTZNvZT
         uN2c1xAWBXQgS14OEngOAg9Y5/ssAPP4ZG+4aJvD0xTyqwqLoAhXf+xVdtfBSVnPxi4l
         3oxgrc7Vlt7oilHae5gbhJ4C3GNtM4lKcyHMp+64DU3E15BnEeOz87mdwaJjrtezu3kj
         HE21uLMfJK42NmJleR19vmfdX4OORwdjwd1UcqCxwVmGtXjA7l4o1/ZnOqgxELwlfJ8G
         Wn8I4vJSgA+osxzKWfLKK7p60hgYhlPqZBZskvoB5OPJWsb2jQ6BM4JkVVp5UfG1WK/W
         AyUA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rLFhQBXt;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.70 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZI5NG6JkVccgkeRnG/DXYNWoU9JmSCgVa7gG9XGTIyQ=;
        b=nE+HCdApy1eCtB6QmNTaOWjtORqcAkN8k4xQQB4h3/K3GglnW/8ltRbAYhBZQZU1Bp
         y1FreakI0H6KPZ1st7sU+owSsZiwnaDi4HUlufv7NOcZ9fsoIvh0H71AM+DLp1sy10zJ
         M/DBDMFergT1ED3JMO22jN4RK7aq4MWChzhukZ5tUUlrE6WxxnYsvDuyDQYtDC6RzJjf
         Jp4o/B9R2/gCOeV/WJQBDzSeGzeswB8pdh3Sc5xzSmJvstfz3twHCevW/RwD+dQw5KkK
         J6sWUlbcyTVhcfPqoooBOJUmiAtOMtbA0KJAMTgpis6JrjbzBTd3k5zYisXrac+b7Cya
         D0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZI5NG6JkVccgkeRnG/DXYNWoU9JmSCgVa7gG9XGTIyQ=;
        b=L/jQIc99xXsuBh+99TuJkthd2ye49B87BmEuJAy8VY4L63qdn+tytp0C0NQUSO8tom
         oROfZMiFwOZOD307FxzslpBOEdhCac53Zn2DjFvgOm/tUfUQ7m4JiEDr8pVJDn95GvGq
         aYwylDr0qqbE7wyIXUdKJEaYaHzuVZPM1/doL21PQ1kXOijO5XA9PmUZ8OZu/ySE0KGm
         AYzrLm7slq/WAe3ArA5WPL1ZtRXQ9/kneNo4i8yDbP4tSh8FsHRgTdcG1wvyFXYQ4X05
         bMrQ0o6FD5H3pvvVwejQsLn44+QZB3jqbR6pfkgH2FNrlgtbMY7m/0Rtbb8+G1h7T6Mm
         /prg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533WSHizDvWYQmG2+vj1qKFZxEfCf2zCRyCVZZTw7IUeOGCoYyEE
	Ugh5D7DCPkEIhklSUN1Mpgo=
X-Google-Smtp-Source: ABdhPJyp9dA3UETeTQJ3+0He/hgawVM/4FJLx7fJa3BDDdj3evaGmO+STZOoS1ylKaAP/og0pkRJTQ==
X-Received: by 2002:adf:df91:: with SMTP id z17mr10935436wrl.149.1596768088418;
        Thu, 06 Aug 2020 19:41:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fa8e:: with SMTP id h14ls2480102wrr.0.gmail; Thu, 06 Aug
 2020 19:41:27 -0700 (PDT)
X-Received: by 2002:a5d:464e:: with SMTP id j14mr10073493wrs.361.1596768087848;
        Thu, 06 Aug 2020 19:41:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768087; cv=pass;
        d=google.com; s=arc-20160816;
        b=mtcPlzNbmvi48NkQ6ewiOSRfPJjRTbfOeLdENjhmbvGvbt2JKqf5nont11wbAOleQj
         7izMN1viVB42E9bZHq6PJr+b+KX5H3uHI8rF2FPVa9bwzOIOTz1hVipqPzxxB+z5+Ma7
         3Y37K0/u56b1eqCqHWZS0gH53iI1Rz8Ny6pMh0H3OhdTxoOEKNg2lYwRKSW/Pk0oFjuy
         a8PkZ1Mt3rZp8yqPUldabo2ltcq0ExhiWoBVSxySqkHB4Z59ZSdSI16VqsKIJSge/et3
         uAEUnRbDRbWgjQuhloEPOfKbd9d6tCDwrr08lGcGaCi0kP8iK68dJUL4eXeB1g0iCTLh
         fjdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YYKZ++ypHU72/gYYwJKUsUY1SwXu1PH8byX8NwN4x/c=;
        b=y7VXQqbGhBYxLVRsPn84+rYpHiIGFroHQaeA+fFcBrKNaRaORTADA0Euv4QvYkhHnC
         3GXZd/k6pS9JizTgj9HqwW5M6ylr06A91fcBU1eLtBakppUGELc3+8MbQDuPq6qaHUVs
         kbQsVx6kFKlxjozU3pPnwIvbxnknu7VloymMxd5F0v3d58+fi1W7R6bnE+425P68k8FB
         ZgnfFupqf9YkO6qn3CVok69qG2H+kjMGS6kXy3B+toQy0y7+u+pa0dGCXsY/VShP4fGF
         DErwE9121PGmXdUBaZcnVe9hrVr7fFBeJBHjmxgHz5BiUefoACEzJeSXGkTPpw5sYtmR
         Jojg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rLFhQBXt;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.70 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150070.outbound.protection.outlook.com. [40.107.15.70])
        by gmr-mx.google.com with ESMTPS id j16si363368wrs.5.2020.08.06.19.41.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.70 as permitted sender) client-ip=40.107.15.70;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGxznw8dVJlOB9mDXBpDUAulvkAW2Kvohjv9kjFwEsaOBkApqAy0vNQjUwikQrdHujz9tBg92ortj/PfOow0R51oYzGEtN73IzBF5yWX/Vkup4qYhoRbOmZAvQgi7ew84aUAUCzDrSHvXCyop4g1Qz4b6/R4Hx55xPp6/uvu9pFKBR1t/dnwtCPi/8wjqs9TEcfq9zquE4JTcui35ou39FDHSh6Liy3yH9/TfCvM7riIwThijcGgeEZJGu0W8mVVYB3hm5urMqXxvUVAwk78jjWDfIM4gDcEgxl/Q6VVBFVMrifpDsfEyYupW6QsNKO3To4Anorj5eEP11HVAzYVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYKZ++ypHU72/gYYwJKUsUY1SwXu1PH8byX8NwN4x/c=;
 b=TS0E0BojD41EDHjB30xvnJOICeWIbxONqaLV20xktUlf3E4o5lg8caGjA9ROnwqmmy+epwPWbOY7+/D2g+oU2u26ZNSj9FLpfY8C0Z2Ced5m6tsM7rzM2gM09JY6jJPYMOnDGU0mIiVAskYuEfOkF+f3XUKZlDpfXraIy4twYvpcPR/wFjiCXEnDOewQSuw7Afa7aQktxpfUrgjt8uv568qSAGnhgB7PnzqfWiq6odzhqN8xNpKczUPNT/haGJeYd6FuVbNiQIP6Nccm6YJormwuf46hcDjzojXM/e66a0guteIDi1+bRjIMcwzS2/i95qasHHN6DJLmgZMJ7ZvbyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:27 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:27 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 03/10] inmates: lib: move string function prototypes to string.h
Date: Fri,  7 Aug 2020 11:06:25 +0800
Message-Id: <20200807030632.28259-4-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:25 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 85db7fb8-7456-4e68-b408-08d83a7b61c0
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB40876BA397FCD8D8E7A763BA88490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzKIFeB+LmcDzjrYiVZUgaAFS35kCtT5W+vn26a3MyjfN+qLpfIXftqFCS325ED0miQ8mgXYUbqJEBNqXgI99vIIVL2sRYtcRo2tMsAqXinTgf3OtJQc3HifO3/wx4+Tcyk31uKgUL0daRe+WEEsVSZZOZz09i/tgsf6n9hSmLRsS0B8DQy5beFuYCDxeWZkBy8Vt4tbMt+ajxPw2GSfHY0daV2xu/zATeZgt/Y0XkrkTrx3KCein0CiNWNTFEayXuEYB9sJgJ+x9r/aLmaPvyFDqRlDt2duZ/ddU6c3UWNlHBaqGALXQbB4c4QeH7cFwRktHQDd4Yk3WT/9YbF7Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(6916009)(1076003)(6506007)(83380400001)(9686003)(6512007)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +E6L+SilJaWixfYnhM9coItqwhEMPcu3aRcayP3YyT/HbsWFYNHVeIH2SFz8qBQcR706hLP7M/JqVkdlKAVfZDFTQJ854CpQDi9utTgQD9EGLFiZtyUvLYShs/T1JcDuBFj+jPm/lY6xrcwLfmO6SG8diJa4HZ62Y10GRHEtcDaeSWrTNFQ61OXKnTb7WNSh4XgSaNwu21n9VDyCBwJLjZGkP8KMHJZwWTORAL+Lf6T8UM2IwapmjImpLuck9GP1QHGMHyXuepCRFJ9mPHIKyEEVBkjd2AQ8CZMY3AFdrxCXYFnHD08bQPGsfGq4VBan0a5aFsb0mfMWEybkRsm+GOX9TtXYslwUT0/AjXqlR99B8rEIhEfsnpnMS+HocnX9qwxrloj37GG1GwwolSeJaRukLzrJ6FSCeISJJ2dV/3f8vNVyeoFf4UvYZf5n1XIAqViI0gOaWog3GpX3IVb5NJlN4m+4533PqMyqsd2R5JasXnKW3v7zYvbzGp9fohV5omB4GkBH7G2Br24CNVLQwrO5mu1SsxfOzhzxJ6XJQSJeYwr1pUyVjYfKrmBxj1lqXpbaAFn3VNKKyu4IXBlAcUnz3Wrlj4lJVV193utcSmsc+mUXtRlvje0Pyy/XHCvGZtk+bPioxIwmODK1RybZ6Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85db7fb8-7456-4e68-b408-08d83a7b61c0
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:27.0481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIOgSrvhYtDm02piDviagzKeA9IFVyVusszrsMs4AFDSEgvMUCFQ0frvdY791Jrqww6ecn5gYjbCRoTTGZpWhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=rLFhQBXt;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.70 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Move string function prototypes to string.h

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 inmates/lib/include/inmate_common.h | 9 +--------
 inmates/lib/include/string.h        | 8 ++++++++
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index 5af1213a..752e20b5 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -87,6 +87,7 @@ typedef u64 __u64;
 typedef enum { true = 1, false = 0 } bool;
 
 #include <jailhouse/hypercall.h>
+#include <string.h>
 
 #define comm_region	((struct jailhouse_comm_region *)COMM_REGION_BASE)
 
@@ -104,14 +105,6 @@ extern unsigned long heap_pos;
 
 void *alloc(unsigned long size, unsigned long align);
 
-void *memset(void *s, int c, unsigned long n);
-void *memcpy(void *d, const void *s, unsigned long n);
-int memcmp(const void *s1, const void *s2, unsigned long n);
-unsigned long strlen(const char *s);
-int strncmp(const char *s1, const char *s2, unsigned long n);
-int strcmp(const char *s1, const char *s2);
-int strncasecmp(const char *s1, const char *s2, unsigned long n);
-
 const char *cmdline_parse_str(const char *param, char *value_buffer,
 			      unsigned long buffer_size,
 			      const char *default_value);
diff --git a/inmates/lib/include/string.h b/inmates/lib/include/string.h
index 29f5e2db..34108645 100644
--- a/inmates/lib/include/string.h
+++ b/inmates/lib/include/string.h
@@ -38,3 +38,11 @@
 
 #define __stringify_1(x...)     #x
 #define __stringify(x...)       __stringify_1(x)
+
+void *memset(void *s, int c, unsigned long n);
+void *memcpy(void *d, const void *s, unsigned long n);
+int memcmp(const void *s1, const void *s2, unsigned long n);
+unsigned long strlen(const char *s);
+int strncmp(const char *s1, const char *s2, unsigned long n);
+int strcmp(const char *s1, const char *s2);
+int strncasecmp(const char *s1, const char *s2, unsigned long n);
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-4-peng.fan%40nxp.com.
