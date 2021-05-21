Return-Path: <jailhouse-dev+bncBC44VTVY2UERBDGSTWCQMGQE2AJVN4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 825F438C131
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:02:20 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id x3-20020a50ba830000b029038caed0dd2esf10963763ede.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:02:20 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621584140; cv=pass;
        d=google.com; s=arc-20160816;
        b=C+33oG7OK/8Jq7srZ4b35ZUgr760uwGaGFK0kYZnjpxTXsy5Sn9F/Wv9EPGAm6a4eM
         tzjIy6uDTrckJjWgwyQwoJQGIwgquGZQC+8FHLq+YfS0vzXbg5F2h5PxichmBJYiUZvs
         dx42col8PtDzLQkXKynxZ+so9GAItqSxXNzfmWHTXeALH8PWtu7jYbKkzg27gk65Cr7d
         9oS1xksG6CS+5bwLY8uVfDp/6QWd6uZmgFgCgQ2Hz97TSvWLtZoV/86JUfzF7rqRb9z7
         PFBv3HOaa/kEraZJlqaAIRNviUXBJQZLdPptcxRuyAQMzF2pMDubbPgtSR2+9tz3jCF6
         f7Kg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=mFpd3VAuSzSL/Uh3yglMCFDXT6vmGLZNYhnmNukjAN0=;
        b=GT8h+zVWccVEmpmNhco+vItX0PeJSCVmK/Tt/Ej4VVVlRHDZ9KVYli3rtQBQ3W5GGd
         hMiHNpZT6yW6xQhcz5zz1dFe53xu6y6j1k4Pqjpq42wKv3fPcAnFfBEbWCdk2d2Qsk08
         YU05b0xGE+mqsTopnND7HHcCH/z0jYuVYX+FEYrf5jlS2KJNi4DhqT8vW8/pd3xhy9jE
         O1oos3+2KDHgeTpVMyXUseQmCRc0VWjj4C4xZdioevNvkxbUgVuywah0pXZdejMqSAWY
         3pCmMu7/tuZIzvecEuvoJB+GAl+YO2RKxlItAp8brbJFP4kYRYL6pGPbACWY3lrSRAAW
         l4UQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=MnNTv62B;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.78 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mFpd3VAuSzSL/Uh3yglMCFDXT6vmGLZNYhnmNukjAN0=;
        b=Eg8CjcigY3do6voFLm7xSFGtZK5UPaA3C3rNoyJq4GpLmJYwa6ymleP30Ky1ANgRxm
         IKaRkOZMetYC10dY3ihwJhWDR28mrJImB9zeQ7D3JcPpM/iJqXBuQTivvAReE52vqkEL
         mxWCuhFcvA2jMLT+FNo7Kowo0rYymnRrMJ5qkA0dTl0pVt66oGPYJV3WDkphRZJqk6nz
         qUHKf1uwy5iSvgtoWbGK9r9KoxBqpKCrYQGDC7GGG8eWBK9XGCAq8paz2NEwDCtw7lbL
         U38Un9kIYqZ0zcpKcOTnF+pYlC+uGFEbSzu2ht9QjzWxaB1kvjLiJwK71lZ7qtLxjo8X
         wzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mFpd3VAuSzSL/Uh3yglMCFDXT6vmGLZNYhnmNukjAN0=;
        b=HIsC+9ZS1jJ+P89HbGdJj1dWTLPCMiZI3XYbzYrTDh02hNJkFzhQJslSIFRi+7SyIW
         Q2thM02WhO1r4lnLsSYbGnGYtgzXE0SWv6Re7FVUdhGOVTQaflTA4zKJq4KFOfImSdVR
         VqTOa3/85UJPyaEegua8FIxYzWI6P8+D19nSddxLIKJvtvkpvSNvW9pZVziGva2ri3WL
         RmRquz+24k2Xj0WtyX1i9ZeYJSH8vvztovFiTUgS1ecq3pcR0frswGCL0AKA4bezsFwZ
         xjzmiqEekByYXafmEej+/mjpK0mepqeNQIKzb8CX1xl0QNAjRdG/hHDez001M2siJlo8
         si4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531T7CM+n7Vj9RChVj0A9DcmTjtS1hIYdPUY0evd4XEPWWyoPOnq
	PaaJOkEnF79EK96ez1aOlYs=
X-Google-Smtp-Source: ABdhPJw6ueqrLZAECObO5u1IErfcDifCorq/z8fS2AfjNFVNjslgNskL6qQsKic99GXBOD3EolRcSg==
X-Received: by 2002:a17:907:d1a:: with SMTP id gn26mr6947132ejc.42.1621584140198;
        Fri, 21 May 2021 01:02:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c5c2:: with SMTP id h2ls3070307eds.1.gmail; Fri, 21 May
 2021 01:02:19 -0700 (PDT)
X-Received: by 2002:a05:6402:50d2:: with SMTP id h18mr10090603edb.10.1621584139330;
        Fri, 21 May 2021 01:02:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621584139; cv=pass;
        d=google.com; s=arc-20160816;
        b=DQPWTSP9dCv1UOyToPO1YT35gbHe5LizDIgCHI2bAQ+IHu7BskIHKBVjrqQE5WzMBd
         XqtHlVcawy7kAhdoffUPtexDsFDrHnIwPg5sAbIUE6ig6ZOLAl2pq11QoZSQJYCE4bs7
         YhuQdErP+Ppa1eSBwTz2APZTB0tFyfIlmN2RIyxJbeL3hOwOQRb9NacO4E/NDIWZPKoW
         ParuMvdsoLPkmpPsJyFxdjIr/83yd/KjxiCR9iYgJP9h2rUK4sWUmTCkfUb9C/0K3Awq
         0++kfpV6dvHGsIAFBfGtYpWctzzuX9xdHsyCYSOL2Bd9vUMexolydaGPBeK+jnqhfkf6
         +5hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vhbgkQCUaTBblNPIk6BBBaYZVlVb4ugglwgIqxAVsNo=;
        b=j/b0Xkc8t983UsYFb5lTAETf2KARb7qNyaRSABdWwRmkhZ5p7SKFI1DBO3UiMZ2QLA
         dB+HjY3fG4+zccuWBuJgOqH7ct0LpqviwgBIlciEMxFHIIBtsdDcHmgCIZw4PX6oCkEB
         Nja7A1iY565uC/IOJaGW3NYXUy3vvgxUW/7j4W0/V00eMG0j/4AqRhYAkOLMS4wsSoyD
         S3+ofTHTtoSB8guVwAmI7OplhEi/gX9X3YZ3FPVaO4Lp4FJeq80a43ji3KuiMUalIi/M
         0Hk0XO+fLQ14woqPiXLR5lrRYHNAHM2ChWg9epnS6HMb2BtggRLz4sunx6nuPIzMtRhH
         JoAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=MnNTv62B;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.78 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2078.outbound.protection.outlook.com. [40.107.21.78])
        by gmr-mx.google.com with ESMTPS id o17si77246edc.4.2021.05.21.01.02.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:02:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.78 as permitted sender) client-ip=40.107.21.78;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fx1nuU3pWwZFlk0THKTX026Qx9dSSEcIGFB893JA54oAVpnXcJEijJ0dyFmaG8r0rJ0w/ZEEk29ebXy1mHRUrzWg89W3bzaornWmSTF9fNnUm5ks1eoH7vekmyTBK7RA80qcnPqAvYCLANtoB5tT2zsuiLG4/0uU8tVZF88J9TjH4cd5e/nQ2xiyOZtbdGaOSMT2st186z1f4CGsnR6wOpNFgK1oljJNHcQy2m7ENoNFpzkGbs7StV4bRA2qpOApQz3xlpBIL/SdzcTj7WO2Zd9gq8sWOQN0Nr+zY1HHgDuNOWgM5+0cU5hqBukQNVxwQ5GlE5cE7i+qu+1uFfyYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhbgkQCUaTBblNPIk6BBBaYZVlVb4ugglwgIqxAVsNo=;
 b=iNDyFCwwxRRNwfAN3RUpG3NhKTQ1wYrOki6F3Fnnw7+wx5DDIkFuApy9tJsKVjbZiMpgGH2JGDA2fdNN2185zbuCwkWMAUiXvafyvwjbs0FE5wgA8uQcTfZn3ZEbI9gi2RYvegnvLun3CDJdwVd91IgamjXkN1kKeHywpagO12hZ6IaK7YlrMwp8xIJ7S0Gp/+7GZy5NtVjmrz7GdIbbdTiU+cPT+N+HEKgji4XTfDv3cln0Rpoa9P6qPYkJXBwic0Xv86k7vPzJHlOJY4js2Cw51umBRUxAvcpTv2e/o+m23xWPCx8Qo0Roq0PbqxhEcCFpnwuDL9v3oXMcY1PFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 08:02:18 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:02:18 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 1/4] Makefile: Update build dependency from python to python3
Date: Fri, 21 May 2021 10:02:08 +0200
Message-Id: <20210521080211.487380-2-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521080211.487380-1-florian.bezdeka@siemens.com>
References: <20210521080211.487380-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: VI1PR0102CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::43) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by VI1PR0102CA0066.eurprd01.prod.exchangelabs.com (2603:10a6:803::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 08:02:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb86971f-24bf-49c6-c926-08d91c2ec10e
X-MS-TrafficTypeDiagnostic: AM0PR10MB2418:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB24182F6C8265E41654D64862F6299@AM0PR10MB2418.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LI9DuP+UNoLPHZWUmKksOfhnKklb9v1n4UhBKccyvQNyUSOLQeX/zilFJG/dZh9WWJdJk7OE3/1k/1qmeyTJDdpujVWuG4Ylvh7ENoiwaC2Prbt/24Rxz6CXJ0RSqLxegeP9mFskL9i6iTPwRXwnpaC9x+K2bESFtxfWgb29aGuQIuloEJej20KZVvSP+h05qm7NKwe3JBJPH8Zbf4cWFIjBUKx4YE16XGSyhE8C18khseunxZzTQ0CruXOwlcKTTayCNBYB3CtlJwnPS0aVUSPRFAy42wE6SFMWEJuWjfROPyQizl/kwyb+DwY+ehZh1XhCYPUCJJL7EqGffoNb2IRmj7jU9fleSjjiun30fRA+VicLLNdi6pEm0+JqY4FZ6n7wclKhb5stoFNW6mK/DclD/AJ4Nn44dKKOxp/ZdMPyMg+D8/hfFZkJwl32iybQglxCdns8EKYvCJCTeREttMXAnvldbJr0c7cN+8wEldqLgCgjCaPv01fuyLzfTQz2D2lqd4J/arEsc81y8tSUrQhGUH+AEof8coXIx9okyyO0qjiu1u+YedbrJNSOaGzDZB5wrLtOH0+4QZV1ceiYee4Ds3N02EIuzGqtY9Gbo4A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(1076003)(44832011)(66476007)(66946007)(6916009)(5660300002)(8936002)(6496006)(107886003)(16526019)(6666004)(2616005)(316002)(478600001)(2906002)(66556008)(186003)(8676002)(4326008)(86362001)(38100700002)(36756003)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VGFyEWPsTMdni8QurE9azZCrJgxCl9S/BNphGnmoJ9QSoNly5X+FoMC/3JEI?=
 =?us-ascii?Q?1BNYnl0uXQrVNCe4ZybordXg9cD4y8VhuGwnQ0WYSLCNmhCtcwnoGccbg+fr?=
 =?us-ascii?Q?cmnE/TIrrm27Zyyz48dPArtHJqQePQPFkHBinfSGmn5GKR1iYnjAbFF+bNbn?=
 =?us-ascii?Q?NfmxSxLIUxOycZz1smjo2ZZqK7Anw3XgcO6CyGPGPUU35Cc9zRADuDPhtX3o?=
 =?us-ascii?Q?nQBSQPD967rTlMfIUBAI30zO+itjztmpEvQxhCEZkbh5HHywcw+wtZ06HnGe?=
 =?us-ascii?Q?O2QP58Tm18CkUHYMFwMwu9OR0Xma38PySBndA5gScupCsMyNlt8kV1n64im4?=
 =?us-ascii?Q?WPfGVbJJBOyzWO4M8zjy1HL8VBx4/BVYsp19eISJwdYenFd0iD8Z/mnnz4gF?=
 =?us-ascii?Q?vhZCkwH47WdxhW0BWcouqQEPxnceUc5j/CzlG85TLg0qExQhS1e87Lw1/7Os?=
 =?us-ascii?Q?fm3ekItGjCfEyhzT07U3QghM8D0rMsNJFUG6Vyomkyid+OocxoFShw6rXaum?=
 =?us-ascii?Q?g9mcawI7BbkpBKczGfPsM7lHkeMPAcJs3G6UTGHuBiBOmZqrIoG3GOq6BujF?=
 =?us-ascii?Q?L2Wri5FOPD8oUxYNKWUNiBJiXN54/PYjlGFBa8UZPlfTFpaBP1yUfiZYuaAC?=
 =?us-ascii?Q?1uM4hDExhB3w6WwRa/DxFwJwQm6VkdQGP2mAEEq49n6mYC9thTzPlhisZCQf?=
 =?us-ascii?Q?xJU4+IpJVb4kEW6Mh820RlOqjg3ugprL52SU9cIlP/Go8gk7hPKau+rjA7V1?=
 =?us-ascii?Q?ZSBWn1GrfV/5wDRajSvqi56UMskwwSjigt8F/vJPp9630qNbLvI/0QYqfFXv?=
 =?us-ascii?Q?A72Q71ZaqZQfc6m7i/kitbFbwv8Oy20gyLb0Yr2W7fPWFIYfNC+ztwv7z8/y?=
 =?us-ascii?Q?AnbMzlDosFNXq72HaDMpUME4LPc/8ZWu3ZhilUS2WVSt0sVThqbrfE3cJgb1?=
 =?us-ascii?Q?Jhv7EIu+5PgZxUiSPLq4J8XgJzlxo2gaLwvXY0I2BmtQHWCsO/Lhq8xhk5Ot?=
 =?us-ascii?Q?8jyyWRA1CL2+GplNcXoaAD0Khk6xzjVvPk95yIaei5fPwYDBEvFEIdWM1eIU?=
 =?us-ascii?Q?TN8cEpCDdfuKJF1ERpcpgoTE48dLBJ+IiQcc6/+mRePg99gpyxlsJUNo1y3/?=
 =?us-ascii?Q?P5uoUBsD/aPtmG7Df3iSYoYkdehFe+EUgO9DQHQdU/y46mlhlSBkICOctoK4?=
 =?us-ascii?Q?+SfNo75sT1dsvG4LOwrf5eLNHlK5BlCn9grKJbKnH9grlYKlCveg0tlFdDM1?=
 =?us-ascii?Q?N8Iib2PGCXhgIZht0wSiM2LYB74QvXMcf+KH8IG7U5HrcY0Abj8FYY3B/c1s?=
 =?us-ascii?Q?svINucUF/d/d2mYYlX9Qgh5BonufxcU+6lr4fLjEF4MdZ706Nw20BvNuUzUB?=
 =?us-ascii?Q?k39lyD+E3Xx6dy9EoQGx6OMiGKiw?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb86971f-24bf-49c6-c926-08d91c2ec10e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:02:18.4030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ks8bAsYiIAelPP+Zphw6EYpzB8UdC4A9M0hyHXE2ijmOnDeWRHeTDb2jKnSB9LSUMw8PkiUdwoSlW16Zj6aNqlbqRZOlfeY8vx8a/o5yYY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2418
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=MnNTv62B;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.21.78 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Some distributions are about to switch to Python 3 support only.
This means that /usr/bin/python, which is Python 2, is not available
anymore. Hence, switch scripts to use Python 3 explicitly.

Not that the PYTHON3 variable might be defined by the Makefile in
KDIR already, so depending on which make target is being called it
might be defined already.

Upstream kernel has the PYTHON3 variable for some time and is now
going to move away from pyhton2 as well.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 scripts/include.mk | 4 ++--
 tools/Makefile     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/include.mk b/scripts/include.mk
index 028f0ab0..d0139d8e 100644
--- a/scripts/include.mk
+++ b/scripts/include.mk
@@ -42,8 +42,8 @@ INSTALL_PROGRAM ?= $(INSTALL)
 INSTALL_DATA    ?= $(INSTALL) -m 644
 INSTALL_DIR     ?= $(INSTALL) -d -m 755
 
-PYTHON ?= python
-PIP := $(PYTHON) -m pip
+PYTHON3 ?= python3
+PIP := $(PYTHON3) -m pip
 
 ifeq ($(strip $(shell $(PIP) > /dev/null 2> /dev/null && echo "y")), y)
 PYTHON_PIP_USABLE := yes
diff --git a/tools/Makefile b/tools/Makefile
index 62585369..4faf9430 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -45,7 +45,7 @@ endif # $(ARCH),x86
 always-y := $(BINARIES)
 
 HAS_PYTHON_MAKO := \
-	$(shell $(PYTHON) -c "from mako.template import Template" 2>/dev/null \
+	$(shell $(PYTHON3) -c "from mako.template import Template" 2>/dev/null \
 	&& echo yes)
 
 ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210521080211.487380-2-florian.bezdeka%40siemens.com.
