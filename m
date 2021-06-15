Return-Path: <jailhouse-dev+bncBC44VTVY2UERBAUNUODAMGQE3HH3YLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3323A83E5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 17:25:55 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id n8-20020a05600c3b88b02901b6e5bcd841sf2886721wms.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 08:25:55 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623770755; cv=pass;
        d=google.com; s=arc-20160816;
        b=yHcoLOQFjk5exW9KudZYzwV5dTBdN9GBCHz9VlRqb2k28C4/H8KZsoS3EUY7P4S0Ln
         dSpLY2lkZXIEimC/7PWPEoUxbThRyW/0Jcgk3dIX9NfcB11soTeZ7PYXSXZZqIlP/J6q
         4OqHLfxwWjCdL3FQdSyrCGWxYSujpWYaKMwPTbwEF+M0g3+H0OX1stJg61gYZKOaqlrM
         IUe+unw+HReWGnA/HPRoPJsCVTeQI+tpyG7PExsawuG4rL2Q70bKEEyoEYglAKOyoG4P
         20sEjNBVVOWFbTGON7STxNCXkgDNibSZPIbmiEjdTrRkawpxQY2Z06W5r9X6niTg01Wk
         PYjQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=W9zaOxmB3qmyaHgdP+tQkml0NJtyOlRdKBnTl2oHY5s=;
        b=nKHbKtd79T0UuyCzNe1CcIp9UDcIi4NQcwtG9QfjxPmTqkuXe989y8CPql//KkQAL/
         WDV1cKvw+SntqMjz8SJosT4OocCNmxPXpvgCTtrDDm1q32a/ObV/X1qM1n4Og1MdotUw
         OA+Jdfkli/sEP6vJhozXopVRq6BQ75Br1lJXqZr5HFR679FxzA7RKGOqDq9gIzDasWAd
         yOSr14PJZS1WmcLLvJxpt9nebUMYXbX2Rr+NP+5Xg3nEuZxcd6G4UqExwpoKMHCoC7Im
         iOxbLiY7xzKvH6BnfgYQK8r7Yu61otDx6id/11VgaHM2XbC1eqCFTmzJX+ZT3bZ5Vyyd
         8m5Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=RvgDy1jC;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.72 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W9zaOxmB3qmyaHgdP+tQkml0NJtyOlRdKBnTl2oHY5s=;
        b=DVunQXojai8gRVbvuX0dI3w3AsgBfMtTRjxXS9+IolMCQwlkhJQqKJJkJb9vYzfm+l
         6np1vPF3f64eFnU6WvxDZ+KnySBNVyn8COtBoALyLq2p3yaHjw4YeMrRoP1Trel8O09l
         4czx0cVo78DKprDM+qq80zSQUrude+AUog8G6vKM4UugEA+TV4fOZu3XA0VgXGniNo0M
         NjXZFj9+nslbmkBFUr9dbaQj0rRPgy8uysSTz+5T+yMszTU3K8vfJouaGloSfukBu+7K
         WbKjM5T95+a22AeNMAGxvTIl4McQNSNDW+klYazhtN6YbhnjHbCtMLcodnN9E2FPDGXD
         dWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=W9zaOxmB3qmyaHgdP+tQkml0NJtyOlRdKBnTl2oHY5s=;
        b=mpM08nQLwsOEYjluFEGcByPd3bgQ0a1mRf8jOHrnU3FomnenrMQblyAp6yzcgknnRt
         nOFK0hI2txGDp0aMMHE+eet7Y3eOKMh7A46rkOo7VeSFda8Po8JxqgHeG/UTJOplIsHG
         h3u1uFMeK9M1YgNQ0T/bapb6ThUvEi9VPgjLqh3pqkLiQ1tzQt9+v+zsFmjrIwFiJVyd
         450yi4XvQilpVEYTMqmLk8o7Stctquy4std9wURVosOi7ztUx9/NMVmQ+qvqiFYz+i8E
         IShnTyDy6gTFjNYBXgKny9BNt8c2Ob+0Ad7pxyK420Mw1Lhf1eZV4yz+O6q/cLzjF7s9
         nNNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+DriDeD8Ivq7AwfxOG9ELkjaSfPDSXUyTWCNXeb/gM1CcL/WF
	BquOZAA6VfHCjinhi8PNRNg=
X-Google-Smtp-Source: ABdhPJyExvahaMpddbPgJEJYIe1cnLo+HvqEvRwGDcmSjqIzAsLkNWYvAYmNzmZ59Q9r1I5jytpa4g==
X-Received: by 2002:a1c:9dc5:: with SMTP id g188mr5831549wme.141.1623770754910;
        Tue, 15 Jun 2021 08:25:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:45c9:: with SMTP id b9ls602231wrs.1.gmail; Tue, 15 Jun
 2021 08:25:54 -0700 (PDT)
X-Received: by 2002:adf:c392:: with SMTP id p18mr25892165wrf.373.1623770754089;
        Tue, 15 Jun 2021 08:25:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623770754; cv=pass;
        d=google.com; s=arc-20160816;
        b=ihW90gfbvXRjkObk/npHqYJaC1vLJzWz5tQXWMxRmYIBDZufZcCwW6OB1HuN4Efqsf
         e4RcbMsy+hjqCIM78Qnur2CdZuZVM6LXEIjnt77jhcxXqzrdiN0dDGHmShz/o9THz8Fu
         evgoS4U0k5lTj4XXWdwqUTl/Pu5xLWxgepRjckvto2Ae/bXoFgkAr8QFXMrLYlOWpjTh
         o9P81WD2brgFObdFBA/p2EXSO2GHEn91up5QKF9GdW4OIAu4SQtvLWjwTQ9WRk53egL7
         A2k2JVJrmQZKgPz0i/eAUcMdZCmDYzKrHROPe6IOz/o39hqh0k5BtzK5u+2vmWFjLXwv
         CtKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=WHujkitCiFzU/oPJ+DizjXNgZoFeKvXVMfycnXT3ZJI=;
        b=RfxCLOrtSnQaF8b/yQNlWbiztxQQSqSqoHDReRliJmv4lVEFT6Pd9uQ9bTnGShSu3W
         JyGuanyMe3/BpnMs4QIdkynbT4MIamcEXB3Jn+O/e4oIUaX5BryA3TzZDVZx0qCOh5uL
         jfgrhDjv1ri/Aoi6tVi9PQcEw4YCrhX4BvRyFqD8M6lIJ8mKUWwjoHWOb3pBN2BJpk7J
         dpLHghFPNkfl2NG0C1bVyyIJUSPpriyJ5HNev8gz1243RDEonrHFl2zCN94kJtprf76Z
         06tnBY8q++WYakN9BxYArv4BpAHWEQ8EMwe8PFtP+8/Af5LqXG9Trwaajfhsj2nb0kvD
         B4+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=RvgDy1jC;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.72 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80072.outbound.protection.outlook.com. [40.107.8.72])
        by gmr-mx.google.com with ESMTPS id 76si99555wrc.0.2021.06.15.08.25.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 08:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.72 as permitted sender) client-ip=40.107.8.72;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQSH3cPB99l2kfgD4h01tqBuNdA17OaOgWtcDE4KW+J1BGyQLjnWqn6ap4OMl4czpgRvWpe31P3ZaynsBLhXHvhg8k3D3qYmXKZiYyBPD4zouuwKToEwMb498/Gh/IjbMJk4kyD0tfE/HS41GwzDfbJSJsnsdZcYmrdOA1vAvD3DWnsQRzPbZeDm/1FrdJqV8gFiTIPzRgx6Fx8ptnxNOvnvbzivA3IrtVCyQtM+GV+SsnxaHkJswq9ebfgkhdkqY8Oz02C4qRtb+cRHHE48w/qv6HDOkM9v3zAej7r+iyNeeT5JFu5c53RkSPvowhyvxBTWYjOisyEj1wxJy4YYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHujkitCiFzU/oPJ+DizjXNgZoFeKvXVMfycnXT3ZJI=;
 b=NgROMBBsRNLWmVIsizdQSMfzkAgJwcYBXY+5WriYJKqy5jaxc7iTdaYM0rWadHylByWXVDmoWQFeiRI86Kyk9Sqd/lXQydIvzO6zRwnENWwnn92Ccrgx0gR7Z+R0tJbUeaNbPoRg1lCxWhsqkIEbcoyE23sSygXIP70pDA+mFmDBiho9+wpI8CQnucc23CQ93EPSYmQ0F9mmESleRBb9f+iMFVP9YLRMjyKZKbZQZpmgszVCIoHjq7QhM2ZCjoK81NGgTdll4nICwaX6L2SKmCtfNFf0I1jp3SWoHsWF6p+8eO24JJeYPcuZCEk+u7kFG7xV6zfARkGwmXb8SG3yLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 15:25:53 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 15:25:53 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v3 0/4] Support building and running on Debian 11
Date: Tue, 15 Jun 2021 17:25:46 +0200
Message-Id: <20210615152550.356561-1-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5]
X-ClientProxiedBy: VI1PR07CA0130.eurprd07.prod.outlook.com
 (2603:10a6:802:16::17) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5) by VI1PR07CA0130.eurprd07.prod.outlook.com (2603:10a6:802:16::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Tue, 15 Jun 2021 15:25:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b256629-b324-42ca-f045-08d93011dcfd
X-MS-TrafficTypeDiagnostic: AM0PR10MB3699:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB36994AEA8DB34F8612AD08FDF6309@AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jGlS09iXiNsyey46xnB0NqefcSVb3P0iLkhcM1d3mtjSVLQtlT1XCWK4g8uBuzIJKjDefe+fi3IkW2f2MD7KapVLGUgLI7K8WA1nZWGzR2b0wLrSXgM3uPJbWcdHPE+hIz9HS14SzDgLWPxWYLZMwsHPIDj1nRvRyfYYF45Qy7EZ2CkPWylf2zMDh/96Aw/T7Xa1lT4vs5T65MnCN40atTsTlDV7P1XCBQdUpHhX7XL5TNYCObDAuDLoznDTOzgagpqDNaHHjYEgdpuEINFCrBSzIMC3nj4UXTLEeQVlqfz6ThCwsxKjFdIVGu6pga2gGhs9QZr3bMew/kYFJoL0KggV4r9kOF6NlzNQ3YLs73776aiLh3DwOFPaKqBkZpb0Gsy/IMNxL79GC5UA4NfA5dzD11vNHwYxG5YWbxGCswWWdKOLsPVdA8xqzGhcSmfPFt4+E+I+3WhcIgo6aGzoV8iUjizOn10i023u5IwHTp6BV7fCcJtoUaYC1l/WUhyG+jJJj1fY1Q4ht07z50jCWMtqO9pWv7vzIP5OP95iN/kU27CxWPO7R+8bFW0gzP3iVjvmu97hgSlvVAS2oVggm7iQZbBC8fxzJVY7VY+18II=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(6486002)(6496006)(83380400001)(54906003)(107886003)(6666004)(186003)(5660300002)(8676002)(316002)(44832011)(16526019)(36756003)(66946007)(66556008)(66476007)(2616005)(4326008)(38100700002)(2906002)(478600001)(8936002)(6916009)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7hDmg1GKjdFNsNb1g8wcM46J5SbD9fq/IL06tfqbVIBBy3bslyeTBHG0lHC+?=
 =?us-ascii?Q?5My22/gJzsiMBxeetKKi4V9/AYrOvoyFjOzAdWjs0RQ10xs7mruPjr/hBre7?=
 =?us-ascii?Q?7X+K9muE+xf9NUGisQsIx+9bXPoBnZaLx3OdxjmRsWSxamKanlV2xtQl5dNr?=
 =?us-ascii?Q?JYGHNcpKfmKNm0Oj0+VSm8D872FL5Lyfp5HOB/Qrkr5u6Uc8zFVA+Xs5OcVW?=
 =?us-ascii?Q?6XcjDcrLQyOh8n/Bz/xZkX/O3+k6bxVujUcPCIerpg6YXzqvAjtLuomgaJXL?=
 =?us-ascii?Q?rKt41xVGeMB1VMjV+OCpwmPc8WHywFkTQ1ajMdR/ZV35BLI9/jiTju3IHyF1?=
 =?us-ascii?Q?SOnPAz3YbqPQnJ9WpMMMaKDte1o3l5ir6UZU9MDdZ8OTIrFTx9ICcuYPwUlz?=
 =?us-ascii?Q?TeCNXlU4D4Af5P50SqpqIaEW3bLOPI4QL69GcVuKOtm7voGWg89K/ubMpq9K?=
 =?us-ascii?Q?O9ifhpSDncQ0e9i+TNaM3Bzm7uvhLMVBzP+pAklaCNkaKQuO3KD16XdbW1Za?=
 =?us-ascii?Q?0dLW2IGzY84rm7HcCnIbrIoq/w1PpfnuVXQ/cNAlKZp8MO/TZArAMWQf9mUh?=
 =?us-ascii?Q?REmrK2F8+YEUh/K9du3HtmpFEQZiC2Wkl0LmZjMrW8gM+ZtnXljd26db0Oz2?=
 =?us-ascii?Q?pSKh5kbdCaRXvHxZDzssH+cQwqpJvtRIqGzNQIvZ93qJtvl0Gmky9ZHlIJTD?=
 =?us-ascii?Q?mk41z5+mVbHm4uHEZU29/EB8KTwDUsAzLZBDJ6blxjfmDzbDVBCHPGI8HDyQ?=
 =?us-ascii?Q?0CqSrTxyfdlvmF5GEAUmNctjLddi1HWYtiJS9q4O0X+C96f7wG300iGySwdT?=
 =?us-ascii?Q?zKVDo0nXo3pHks7rQDUo7zkXbhNBaCO2S7jHRStext+qUSlHgJH7H+E93B5Y?=
 =?us-ascii?Q?MEJRtos8r62Ieo+1Q3kOuvlS5iKGebrMAy/oldipzBWb1H8I0jK8fZrMeexs?=
 =?us-ascii?Q?f4mLkTPf0Xxql4k78CraNB3d65A27XX/G8eP94tQZCB8DbhRKilY5N9RDvxt?=
 =?us-ascii?Q?UdtxZEixb00wBoTiB0fM3SOkCAtW4DH2dUP0k4Mc0vsv3qqDDcULa8UfMKV6?=
 =?us-ascii?Q?ohfvO5k8JGGTQp6tLSDQ7tn3NFeXF3pigyfDIno8Ly3dmfZKM6ickNdIh504?=
 =?us-ascii?Q?kTDK7M1xV4v/Xj1o/EEujTVfE58vJa6gHffhk8cat9qhxdgpBaj/8CYaWJ0r?=
 =?us-ascii?Q?4BWuOAvbsNMIZtuCsLSByOMHd/zx0ZoWap9khvFnkxM0b24uYGuueftF0Mlo?=
 =?us-ascii?Q?8AwEUKbE9vaqbMJwIM4h6tgwylW+CzBEYCz+447awvTAzIUAmjojS0VEdeuI?=
 =?us-ascii?Q?jYWIIcSWdOl11DCn6cWHP5KcagZ8bEjesBT5c9/erqM+iIC4UzJyaZ2AKxth?=
 =?us-ascii?Q?P0nEeLyIOpfkAY4Sh6BfXAH+gCOi?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b256629-b324-42ca-f045-08d93011dcfd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:25:53.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEAgQIrYnG6Usf1awp9ON1McdiL5DkccfBXkpLC0jxZK6Vg7JcyOQQClPbIfa2Qs0asbkBwUBRtAksk4o0tIKmR9Z2MK7owyqyzzTMf8peQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3699
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=RvgDy1jC;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.8.72 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

Hi!

This are the necessary changes for building and running Jailhouse on a
Debian 11 system. As Debian 11 will no longer support Python 2, most of
the changes are related to the Python2 -> Python3 migration.

Testing was done on x86 only so far.

Best regards,
Florian

Changes in v3:
 - patch 3: Fix typo in commit msg
 - patch 3: Retest, correct ExtendedEnum(metaclass=...)

Changes in v2:
 - Address review comments from Jan and Ralf
   - Cleanup ExtendedEnum
   - Remove "from __future__ import print_function"
   - Migrate shebang of scripts/arm64-parsedump.py to python3 as well
   - Update CONTRIBUTING.md to mention python3 only

Florian Bezdeka (4):
  Makefile: Update build dependency from python to python3
  tools: Update shebang from python to python3
  tools/scripts: Remove python2 specific code
  doc: Migrate docs from python 2 to python 3

 CONTRIBUTING.md                               |  2 +-
 Documentation/setup-on-banana-pi-arm-board.md |  2 +-
 pyjailhouse/config_parser.py                  |  1 -
 pyjailhouse/extendedenum.py                   | 12 ------------
 scripts/arm64-parsedump.py                    |  3 +--
 scripts/include.mk                            |  4 ++--
 tools/Makefile                                |  2 +-
 tools/jailhouse-cell-linux                    |  3 +--
 tools/jailhouse-cell-stats                    |  3 +--
 tools/jailhouse-config-check                  |  3 +--
 tools/jailhouse-config-create                 |  3 +--
 tools/jailhouse-hardware-check                |  7 +------
 12 files changed, 11 insertions(+), 34 deletions(-)

-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210615152550.356561-1-florian.bezdeka%40siemens.com.
