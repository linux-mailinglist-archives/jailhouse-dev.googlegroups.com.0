Return-Path: <jailhouse-dev+bncBCY4NF5G6YJBBBU6TWCQMGQEXRA4WEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93c.google.com (mail-ua1-x93c.google.com [IPv6:2607:f8b0:4864:20::93c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F738BF1E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 08:11:20 +0200 (CEST)
Received: by mail-ua1-x93c.google.com with SMTP id z43-20020a9f372e0000b029020dcb32d820sf7163199uad.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 May 2021 23:11:20 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621577479; cv=pass;
        d=google.com; s=arc-20160816;
        b=jVoR7Is3h29HliX0xbM0IwL5f2YFkysp1RNtyoOk1kFv0/cc89i9Qh0Yf0rBd3usaa
         WEId6p6Bjk5zHAWqkFxUlNhP8j+Y9XyZu+kKlqHoALVWd4LIrZ3KUqGUl0zrAwIYbk/6
         3vbPNguSvi6SraEhDRfhgf+5Yd8MN7CeKp/mqbIMfUiGFRApmLPKfwUYbrcMWy3hZGc3
         uJAOUefsbio2kTD/3Dnl9uNHxQfpIKzDSnkDUrtm7FoWIWZCRuTuCH3TVvV2d1DEVgDz
         aqZi7yTdlVA/TFFm63h3oXmXoJbRH3R2EnfV3hAukO4M7iNoegtYjFy7EH96ZOIdP4yu
         CAdg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=S7f557bY300YPVn0ma7A/dO2qD4orRPl49GUfCIfMKo=;
        b=rAko3MDxAbUFq7LJVFZMFo4u9DURhxLHpA2d19PZTxdkMfbsh551/Jn1zC8rxlT4WT
         e8+jprimtTgY+HL3LAgpknZ2AYME+v9pRpx2TU6da+WHKwoKV8Lwe5B5j5vkiue+K1Vj
         xpzaYpnWluzl4nu6giahByPurdDi5Th1zcLvHFl8w06ZUyprXcSK9lI/em+yQXSIxZp0
         zo+VRjcN7gSxIZqDTFHNz5q3XCN7x/PJ7f9GXXD9ebsWc/D4+XOsH6ZN/+z8d+HlkZc9
         rnNaQQ4VscqZOf9zisahapoj+1gqNT4aC/tE0JIEh0UvJesQCUflnboKzvuizRF/hM2d
         aWqg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=kLZR8i4v;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.8.81 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S7f557bY300YPVn0ma7A/dO2qD4orRPl49GUfCIfMKo=;
        b=jxksPrSNbAaqyxcQZqESVqaXCj+mc5wFnwrrPM3eS+4hLa81BYUS8S24ODjf7AQbNM
         182AVjj9D80gninlAF/ZBhEwRG4U7g21EAj7lJH0hRYlnwNmQTltKUVFFYr3xEy+pH6N
         EKYzAKHTyhR3dwSNcltbo9Af5qIkXLL/eVnElX2tmUal+3N8yyTMUoDNV+WIDfU7BqFl
         ONKWXKXiFGYwL03G7NsJaahmJ6bxn2s80ub6rCbUzTsLYmDNPYqvm16as+pqDsVirogc
         QXKvnnhpbgil3XzJPMcjhn/N2mFggXgWa3KkzizB7tq11y2OkgpVm0Sgx9V1IfFvfz8R
         xwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S7f557bY300YPVn0ma7A/dO2qD4orRPl49GUfCIfMKo=;
        b=EHBaJFeEyPw9Gs9AXuc999gBU4FaZy7ZQruKTXmBBWi/GkgqOtSfyYPKn9Huh/H9+6
         M8lt184JCRjShmNPItviYBVpu+N+IFs5P4wncMcxLDJpbk9tPMjGe8YeNRmHCTyIQ03G
         eZw5CqJoZxhf6ihPTmgLQzXJgB1iwtc1ADn/70X2+Ee3dxbDzRMe0ukxlSkXJRIThR9+
         z+O8ZCYUz8LPN87iNcUrXYfmjsi4Mdn+OVGZ+M48/egUJMUbs2BCKanPq4FqHoPjX8RJ
         n1SPsF3dZGIHlZtG2i847D6N2x9CyMgkoglgTqaOnnx2UFSW2QtER8rGXQMen/6IVXyI
         kaew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531/sHp8uhO92wFaRd5F4tDu5xTsZtb45fy3ZE7edFkxYx7yIISb
	nrXiZf9WlItfh4/epK8y8f4=
X-Google-Smtp-Source: ABdhPJyUYDF8rOVr3q+WjRekH+1ZS9k5baMJRp9zS6RGUUcfYwGYwfaanBVKfvaf7HW0WjaTwAWceg==
X-Received: by 2002:a05:6122:a16:: with SMTP id 22mr8495937vkn.18.1621577479114;
        Thu, 20 May 2021 23:11:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:3c3:: with SMTP id 61ls636568uau.1.gmail; Thu, 20 May
 2021 23:11:18 -0700 (PDT)
X-Received: by 2002:a9f:2183:: with SMTP id 3mr8743677uac.0.1621577478587;
        Thu, 20 May 2021 23:11:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621577478; cv=pass;
        d=google.com; s=arc-20160816;
        b=fRIZFUSQbvF31iBbe+JECvbvrHikRZdNqxe8XfjHQl0wr0wANoIoVYmgrCm/l7mrUx
         awJVnENp7wB5aH/D0ACVf+zxTJ47XOb4lB6n9dkPSVCz3N161AAOX9Jbf5FFPfnH0Dl/
         Bm4xNFBAEzITYY5tGWrVzewWP2BSa0CbuB9R8//N2FihkxJyzdCHbS+HDsh4kGNjKdBf
         wObI0GraQug8LGw1V+m5GSGeN6dduk9QhgQ5S5S+xoiBQm/y+C5VmKhe3e5Ra+wFKTlZ
         CNfnsOxySu++VjuyYFO57K/dm8f5ESEvdsD0+gzgNTG2ryClc2J9/ZV0jRo9bSAGyfRr
         H9xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7NYDY+ASWe6Bky4mbSxyqn3KbzEQbsGE8/Gj4K6ZTgA=;
        b=OrafvXDXHsbptsaUNAEAHx40qG/2Z91X3Oi0KPzOyQ3rkP+zx4fLf6HKULE3nNP9EQ
         vkeXljalKEY06oMb8rViZB+KCnFzOYeVa7yriS4Szpws+SEEp5yYE2lWYRrIvyI9EvJw
         dyGUb67gfQpw3UE0ub+6nuIJHPB8sDdW73iSWiXlRgKlaq5nocNVnoyO+EHgIoxJcG9x
         U1d27WhC7fC63WX16riAjUfVjXHx5S/O3ZTa0EBgsjaiwFtQ0RsIayWEV3F1iAB5tE9f
         dBpg9gHFwOLACcXZkXCulZjMBN4TIiw0rklWAIVowXe0rJwDrA3ryLWOphvF2Op6hQ1c
         gCLw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=kLZR8i4v;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.8.81 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80081.outbound.protection.outlook.com. [40.107.8.81])
        by gmr-mx.google.com with ESMTPS id d26si621462vkp.3.2021.05.20.23.11.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 May 2021 23:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.8.81 as permitted sender) client-ip=40.107.8.81;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcGFFTYl65/Z1DR1tuGlQofiB/uHn/4ZK33l+DIWHJ6jHvfPfy6LWxunzEWUIkf0pWStKvc9e9gA3VLc/Owoqo54Q0pXwdCPcaAP2GQVWPlPr7tfLL4yWOqBK55FAzSwt+0rwZgzGpRq5sNIW+KXRyUKd0HrqYrNeslRtAwd2UzEMxKyHEajaRbQO3SilGhA2sn1LGbv1RmLbsE3sCLf9eHdqWvFm4mc8AwM7Et+X19YGqas3ri4ujZfUxUwFqw6//iGJU6JbBjnsz0D/QydrIySDNhyJBf/0zdusKOxJzIOx8BJf67ItNRzDTOdhMu01rGlL365UiR62OX85mhgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NYDY+ASWe6Bky4mbSxyqn3KbzEQbsGE8/Gj4K6ZTgA=;
 b=ge2w4gsUNSGCOgOoZ/kcbiJBTo2SexsohpzC896lH5Ye5IDCjBKK52/nKAXnAfBbp5l5ZTwARjdmmxL8mDxzO9wewTABtjOUksFvDR0GTRVk4M5TPnQDGRDNzfTufyADURk9wnVK8ILTEUgt6Vytz7Z2shWGoZYF7ItG60Tfuz4N1qr98SPVIJBskNcU5INlL/cNMMooT24pU+2RKidJy551lz8IDCjv/x9hixZ56H4kKq+Bc1rPEKl8jcQZRcV3I7qrv7X8r3M313QDuIQhb/E649YGATCehjjh9YzuJ7hIU/Kejztl5dzBHXZPGi7JPMPUycj9ei6qlsEFrw8v7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AS8PR04MB8182.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::5)
 by AM6PR04MB5144.eurprd04.prod.outlook.com (2603:10a6:20b:a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 21 May
 2021 06:11:16 +0000
Received: from AS8PR04MB8182.eurprd04.prod.outlook.com
 ([fe80::94cb:bd5d:6daa:1f0a]) by AS8PR04MB8182.eurprd04.prod.outlook.com
 ([fe80::94cb:bd5d:6daa:1f0a%9]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 06:11:16 +0000
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: jiafei.pan@nxp.com,
	jan.kiszka@siemens.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH] nxp: ls1046ardb: add configure file for running zephyr inmate
Date: Fri, 21 May 2021 14:21:44 +0800
Message-Id: <20210521062144.11659-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 AS8PR04MB8182.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.73) by SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.2 via Frontend Transport; Fri, 21 May 2021 06:11:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14308aaf-2900-424b-a208-08d91c1f3df2
X-MS-TrafficTypeDiagnostic: AM6PR04MB5144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB51440B1960EB3297AC3F05948A299@AM6PR04MB5144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3sUFK45gKxpcsVK1VSdfaD65757Q+SgHeelzWPkc3NkUUgnv2Cje4V1mbjusokUqu7NR25KM6LS7Vi+ap6gr3K4eFG+jnU0Zdq9UMSnsMFOIB9XKKm32HXtVdlaVdDkGb1hpKK6FDeMHgwpi2Gnm8uNHNW+sbk0V+YQBr4rWP0q8VHPS2lNbPSDz6LjNym9jHQKBBZN1r9zYT9SawNmOe+KU/Cyv0xkgA244EPVdpOJDz7c9F30JAy+WL34SusPLwYlKoQ+G7e+8V9ObN2qKFNpaIZoXSvv1MoktEfN3r/RT610ZOkV3k8u5yknzJH9NwjGF8K0vPsmaZIdhQTKGUTOkeKdJIKvKWggGNesjI2N7hmWxScvCUq38zVj0+rrAXS8nTZcTwfOwRifSgPUQMxEMZJDIUTr7RF6dVT/cn/tMyG9cFG4rUdfU1IM7bJolqSelvd2vJsM1ClYQdq0hgdDjyJ+/QGkiK8WTzCUMSITUWZOLCTM3o7DlwMmMcyzsMc0OaDus2Ty2t2vhMbdrOnrbtTJjwB1G1ghB33yG+nLXQYPwbe8TcJWYhIggQ1OjYA5X/zV2eRHyhQcRAU/O6h3uK2cQI7tHu1H4C3YYj6K+d0Ftfi7pGVOJQEuzmxF5FdLSZ/6lQxdc3dZ4WEluFvRhx2qJZ1A3cMyqdXkV6B/aGQ+oUhXNaxRSUncys5Ul
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8182.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(6916009)(52116002)(6666004)(26005)(186003)(1076003)(6506007)(5660300002)(83380400001)(2616005)(16526019)(6512007)(956004)(4326008)(2906002)(38100700002)(8676002)(66476007)(66556008)(66946007)(8936002)(316002)(6486002)(36756003)(38350700002)(86362001)(478600001)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EBoxffQlN8raIRN1Xq6AooG06Kui17hnhG8ugrPyzX2s8GIta7WZCIaiwozo?=
 =?us-ascii?Q?Hx1PgotZffDYq4JShfi14Yd/Bj7uJTFRwgW5g6Xa7nltE2JsP6Rw9/ZxdApe?=
 =?us-ascii?Q?iEQLXQJ/0GhjrCcfb/2pJrtZ+V5EGu/rWi5h3EuyiJw5Bhxi+iWHMDmkW9ad?=
 =?us-ascii?Q?u0Q66Ni3kn2KSmGLPqIkt1hg84fr6ZOLD02FqZ5S4JG6kYr5AgAwDTn3eEWa?=
 =?us-ascii?Q?N/yA61JLzNDqZ4jO2S6XMCrx7U++w45z0VUsltk1/yETJ77kcKpVO6r1MYgz?=
 =?us-ascii?Q?8lBoQZR0n24voqBgAumwCrCVQd3WGjDAXm3nUWU46wkoWKh5FvuSococ/+8e?=
 =?us-ascii?Q?tcUP7rU3gla6M6D8Q4YuU6yHxbqbwQAczd4nhuDLc2c3l9jDeeUikBjl1Fa1?=
 =?us-ascii?Q?EgYUKzWAbMk70ao9/qPEJrxwpjEaLT2tZUSo6qSGw2yEybQkkHByaayh1VMs?=
 =?us-ascii?Q?cteC2hCXJNEjuifpT7qv7Q2IXUXJS0tWjrMqcbAAGpni0DTJWAUL8fGXsv6S?=
 =?us-ascii?Q?w4FJjgCsnUEs49I8GW7e1S9e6LrQ+f0iXWExd6haTvt92pWyXN7sAvjcw3Z0?=
 =?us-ascii?Q?mW8mpY7MYO2k4/VcdSvmdMSVJOz59/gRwb/zjWk5cCFis9RGsH/Ky/QO9Mds?=
 =?us-ascii?Q?di7gnXb54dwuPa8/p34oWz95YMoSwzcSmFOH3x0Wt1+rDLLAm3eWDRs+BtHR?=
 =?us-ascii?Q?mPXXtTgbRFk8sSVv/oF05hr6KHVUq9BkBPZcbeF1SbjHHOqwA85G+E9/Mqol?=
 =?us-ascii?Q?Xzr/aMf42jNxbcQndimwcuNYB2rZnYcK9xHgR+QKhLizklv85k7VMGg/Whie?=
 =?us-ascii?Q?gqq//7Kqrd33T3nSbPZeBNY+adxQhVTpzxu/WRuFPMHnslC7fSu4/LiGdxoP?=
 =?us-ascii?Q?/5+S4smxyD3QNesMr6FUC4ECz98RapLRPZywL+wIWp1eWMB87xWW3bcyNLZ2?=
 =?us-ascii?Q?jmMTKWLETjdMxorahyZ/ARy864tH7J/YgVESNmzqHZSKLKNesXxppuV3/atT?=
 =?us-ascii?Q?7KWs/q8n1d1vckVA2ZuJrLB53ROrAm00GiN7mGoNyAIViaf7B9jCiFaPbZPz?=
 =?us-ascii?Q?64GamYdYE4ByoN0N4b95e2Ki4/l8kTnmQxikZbU+KOTS06pgGoO79ollo0KK?=
 =?us-ascii?Q?Cp66qJNLPDoxncWdWdZrHZ7NXBjO7EZ0kFdOAY80wDfXygMwW/vt9ZZWA2Hf?=
 =?us-ascii?Q?hd/B49eeZKMBSnxWxVKaBSq780oPRq5QbAl/dN1HSpRro1cN/T+lDrIORbcc?=
 =?us-ascii?Q?tRxvkLxk5h4c6eNPTPsKoTUkxm2xRqwiVI0xQLvapjUMv1R+pw+2C6YT3b47?=
 =?us-ascii?Q?d64miUSGWaCYySq3aGfyVhsC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14308aaf-2900-424b-a208-08d91c1f3df2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8182.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 06:11:16.0641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4i1NAihPb6hGthZ7Gl/oZBj3f49VGTeBhMQAUMJ12SOi3i9jUYU8/CBUC2y/IEUCsJ1peK8pt2jfc0O1OCzeTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5144
X-Original-Sender: jiafei.pan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=kLZR8i4v;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of jiafei.pan@nxp.com
 designates 40.107.8.81 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
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

1. Use virt_addr to be same with phys_addr for memory
2. Loading inmate binary from start of virt_addr
3. Use 1M bytes memory in order to load Zephyr
4. Using CPU Core2 and Core3 to demo Zephyr SMP

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
 configs/arm64/ls1046a-rdb-zephyr-demo.c | 141 ++++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 configs/arm64/ls1046a-rdb-zephyr-demo.c

diff --git a/configs/arm64/ls1046a-rdb-zephyr-demo.c b/configs/arm64/ls1046a-rdb-zephyr-demo.c
new file mode 100644
index 00000000..55c0e78f
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb-zephyr-demo.c
@@ -0,0 +1,141 @@
+/*
+ * ls1046a RDB - inmate demo
+ *
+ * Copyright NXP 2020
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 60 - 32,	/* vPCI INTx */
+
+		.cpu_reset_address = 0xc0000000,
+
+		.console = {
+			.address = 0x21c0600,	/* Uart1 in DUART1 */
+			.divider = 0xbd, /* baudrate: 115200 */
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				JAILHOUSE_CON_REGDIST_1,
+		},
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 2GB DRAM1 Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (60 - 32), /* vPCI */
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210521062144.11659-1-Jiafei.Pan%40nxp.com.
