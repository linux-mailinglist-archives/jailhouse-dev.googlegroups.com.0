Return-Path: <jailhouse-dev+bncBDBIZ3EL3UDRBEFOUKEQMGQERRJWOEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 5597B3F9543
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Aug 2021 09:41:06 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id x20-20020a9d6294000000b00519008d828esf2411174otk.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Aug 2021 00:41:06 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1630050065; cv=pass;
        d=google.com; s=arc-20160816;
        b=AkiS1aGZ6jSrgWkxd5wdYL8iSS/LvbNZz0MNb4MDXR53fA+Tt2ahe1nIcnhgEHE+RT
         gc2RKkzvjklQx2AtIfd6JbwOe0Za4e57vTh5qsxn7rKHpt6HssH31M44zR3UJEXiELYH
         TdUcHTlRJJcQhSATv9aZfOe66+ZwbYdx2Zj9tcoV/7jv59TMLEDDyowa9RspyxY+mqza
         hRwWmNCxx7iSjw8hGoMB32JLEuVEFYxqkXIczBeXspZ0kH3hFxRKnQdIXkEH35P36NyV
         U9fySOO7iNVyQvtTeO7fdTGx2JM2pqhEATzSF/nwmj64AL7ocldwEwnblMKWhCHsE96D
         Rq0w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=segS7UsgYZx/ELeI1vUJ23Wf+Djt1+SoiiY46QQVAsU=;
        b=yVyYqjxQWqfo9J+ZM3w7HouvheXG89Rf9SnOMqL4d1MIoawRDMFwc/i7MbX6WQm9e6
         1hKI9quzdY7A7QMWX7LwAJ9fZAzisNP6rkZUusUSKQNVKWYsZU6x5EHxv78EalacyZlI
         jRmgNskL4JxuOwhRCZIbb7WqvyeNJWIOhjm73AWz/RHVtBrFSxmKPQCxO6Gvbj0l+hJ6
         UUkLGApjvo7Woseo0Pu/R8ry/w4VcDxlCR1Fc7AulZSbdQqhUEplnUA8hJgI10s2WrxC
         fe58DvGigqv2vjWoBQFgUyTu2t3GbJkEJx3jLGpckJKUR+SyZmS5F89gd5MmJHo+1Qrl
         5nqw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=bchs76O0;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.20.63 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=segS7UsgYZx/ELeI1vUJ23Wf+Djt1+SoiiY46QQVAsU=;
        b=tmjsnpmVk6Cv6y7EHaY4YnitLneUpzPrV2Q7MYQcC5Vdr3lw+k/kPHgYQgTJA47CNE
         tUEe4bArecdyrF5P+yNuFOdYVr40BQOBLgYroYuqBDC3YaUNtz5hhWctbBNoNWK+EgQf
         RBvZs3i3O7q09fyAsTy0T09hmtyKx29rKRKT1Ma0Xj3EgahVmG5cAqoVMOSK1xyDt1+7
         sqhcZyb01hrEiQ7tL06ImlLNk5+RDMLtIvSOCVQ9csNOipMw1o0nHqjkZDsfihEZqXcS
         QrihWrK3N0Uc5rTuHkXB76NKr7RzUFKtdPytLlKr93pcjIaeBpIC1WGTqBCcXfKOUjCr
         IQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=segS7UsgYZx/ELeI1vUJ23Wf+Djt1+SoiiY46QQVAsU=;
        b=pJD2DHsOVm2OTaNEICgg3h9OzBQeJoFabGjt3w7SYdteJeYqxDogtzy8XeE5ZFiysi
         Pidv2GGwIdXGCrDEN2reKHuhhq5KZ7fgDsTM2qXA/9hQ3KHzFIhp8EqFw/wRZ1pijkP0
         wFt13f4ulFOvz2qMTZSRd134MfZ4KOGEBeToxZHV1DrCOoNoMRTXznDdOzIgSUSGW6gE
         Mj9zgr83SM+wVqB52u/D/BuwDMDPjaacVAr5G9PkTvU+SaxXF+JPoNmArKDwbXkgVNPU
         8mBxFxCYNZdzUi8kW+95AIgKL0E8QsizCyFGkyC2q9/46GmGi+H3GflFn2oPjls1Rx/O
         R2nw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Ckw0gu4PPGT7MEUOY1hnr7e9X1nYiDSf9DRQIyNm7ado6mLUF
	M1SVS/lDUYLXmJuizPOzW5E=
X-Google-Smtp-Source: ABdhPJwwt8+lLCvoOy6kO/87pHyqSSpeh+v22VpFOUERqfh3xWgSVlen8c4y1VjBy++f0IaHGIn0kw==
X-Received: by 2002:a05:6808:8f9:: with SMTP id d25mr5627792oic.114.1630050065180;
        Fri, 27 Aug 2021 00:41:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:20d:: with SMTP id l13ls1779405oie.5.gmail; Fri, 27
 Aug 2021 00:41:04 -0700 (PDT)
X-Received: by 2002:aca:d02:: with SMTP id 2mr5643312oin.126.1630050064703;
        Fri, 27 Aug 2021 00:41:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630050064; cv=pass;
        d=google.com; s=arc-20160816;
        b=kSkziqhAs5q/hgzDizIVXyzVlA/pZOwUw/EgjWD9VpgYo+j9JD8gvjPUEMvMnNFO9c
         VctpCp8c1xmRDxLpiE3vEAIGbMJlwp3aGL9vz62ZcAFcN8anizdV2+GrFP6JevSLgOt5
         KUjqgYwfgwCU0nmm5GT5LGcycqaLkI06+yfCikfv7fvqZdzG+cb7XF7ycivZ1sHaYLVM
         3fvR5Wr+0s6ybcfLyi7Kt7KmxvHXMMVHP9gm4c3eEH8mLe353kAAa4ag8tv8qg0M0oqF
         UlSub5xqYWlEaDYtnOeNej1wl421seC5C1o0f+2EBa1dLzDkY75SQtaFGGIkm0YysBOp
         bKug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=EH/3bZEXc+KvYL7/A6U1vSblry2zE90veW5zVQvj6J0=;
        b=Unnre6RG8LaOZ3bjdb99NwIWeGPAeOnLpeQrQwISMkCIwsAStBOsMq6rawjEpWa5t9
         HeK7ggF58YnuGUzWJB6UXM9ZPZpIbXoCyd+HKgBktT0FAS9TRscGBOsdTkyqgN0lTIZU
         /OkILyzuQ/qRLnAJQiqv0tN5EPowOjWQT8ZhyAx0YTzTqG1q1jkokv2WobBRUXU1X58q
         tqMfBTPa6GG+QG1gEd9PjlMYaqKV9hIyFMz28r1PwoA8oYtVZJgSc7sjxdEPngy3aBjl
         Glj8J6yi8OMCR/yLY3zsZMc+sDy69M6YfpTjFpV/2vgypStRp8bag2eLxUvmu7O/NTYf
         b7vg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=bchs76O0;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.20.63 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com ([40.107.20.63])
        by gmr-mx.google.com with ESMTPS id bg35si147609oib.3.2021.08.27.00.41.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Aug 2021 00:41:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.20.63 as permitted sender) client-ip=40.107.20.63;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odOZ/Wo4EOrwrMTB/JunklVC1bg3AEAXD7GjTgfiKYgpf4xgWD75HzarSI4Bfa7mAQmHZkQeDunAio+ppYneI15xmGVyM70tnfPiP+17vm7k2xFQ9Iwi5hxEmwWOm2TwL/PAEGe42du51ptwhYvxrlgfbJ8L7h82mEOrJyOoCfJPaGFvZ88ENSPflgHw/yjlQW8L4DYt38puF86dzBspeu0RvkkjkJfR8+SYCLRpPjRLVQItsgPCnA/cnxxyEZyQFOFBfEqDjJseMGtwEisxqIZN1gJ4Inloct4R3CL/Uu0Iu/hEqBqDX+eI5+MRkkYlD0ED/GyHeWqiXEg0D5Me9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EH/3bZEXc+KvYL7/A6U1vSblry2zE90veW5zVQvj6J0=;
 b=CwEoGh+hno+pQa7NDoLX13m0a0Sdz0cvMLq95cHLBfL62ItIpJkXO/0Wmr+REHWg0IPXMUl3mgk95n3PSUMyScDeFfrQGxiIJpgjckTi4a3cndlacYwA8J9gK6ck6Z284P40mssYAru5xK6XH3TeodXGy0xWPFV2yH6A+JTrYTMANVJ+ZJNoWvbY6vXpnE/07Y9uIXabsekIpz7C5G5DPF1rOSBh6CBdN/6PyWewtiZ1UIpN8bs5aiIVc7h8SSSO71jTHl6+vRquB+q91XFrvAeUyQ2NPA0DcH3MqqIoIeyGEZYOdsq7R42QuiyfWKJKp6U1tB4buxcO/YrYbwhhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR0401MB2555.eurprd04.prod.outlook.com (2603:10a6:3:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Fri, 27 Aug
 2021 07:41:01 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b%6]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 07:41:00 +0000
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCH] arm: irqchip: Fix the mask according to access address and size
Date: Fri, 27 Aug 2021 15:51:16 +0800
Message-Id: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR0601CA0018.apcprd06.prod.outlook.com (2603:1096:3::28)
 To HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.73) by SG2PR0601CA0018.apcprd06.prod.outlook.com (2603:1096:3::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 07:40:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e9d0db4-74a8-46e9-531b-08d9692e03a9
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0401MB25552FCFD24A93AFBC39000884C89@HE1PR0401MB2555.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cea9lFPAWey3GXXFwZmd/GheY83xBmcl0/vBTMJZ5E8Kwy6H/xsUYML4sNc9nNUyyJUbPQQkPQrMplTA3lTKwl/DL0V0OMlnLz2hS9KSgRb+p7YUfuPGFcQPNXhYkaLViUW5ydlq+AwcJ4Z5Qqibnz0tMvHGsoBNyY788uIBHxkUvpX/cCuNzOMOCRv+/feSJa9GGg/JOiSQWuv+MrGpLBuDAmvZCeA+qjut5VwLdhEJI52U+Z9OSJE2jrbRpeicGaOfrJdnmzmTthAQcO72BSUs8uDD6YKoY1nHZyc+jjf2eomq+aw4xMx/PgSjtr67iWayFjUoxbWJyB6EU80vMIKDFjhpTKgXv7f7TSZqNKAX2seTjdfvA9a5lzS46KplPzHDBtP7Uj0SZndAYjrQty9ajmv/cOslHFXSpnzOew9Ushr6/zXFK1EYxq2QR37Wd6quYmUSRTif+HFrhVDXeE2vF9rUiSArWbQoRm4MveE7gnPzJq1TKC3kP8ToPQ3g5Y8suwm4Fw9Q23v+vE0kHY03E4HcH9vnGt7d9ha9bwFok5Awp4ztuhnCBJ/alrlxcIW6FjRtsc26Mh1kqFiKtFBMF+1z6pRpxVkZRUsUhy4mVabFDAjZltyya1F5RlQyY9YnBb2sLWA83yY9SfEpPG+b/bP+I8k62xsiRea/6mGR3aiApSmHZeUbyqK36nkDw6vmaCzqJwOF4vC4bufUxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3371.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(6512007)(478600001)(5660300002)(26005)(186003)(6486002)(86362001)(83380400001)(6506007)(4326008)(66946007)(36756003)(8936002)(38100700002)(66556008)(66476007)(8676002)(2906002)(38350700002)(52116002)(1076003)(316002)(956004)(6666004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rpir2eWC+XH1Dr98/OhsW/nsfCHViAaXhht/3hiUSwVB1m3bm0i/4sOGMZ98?=
 =?us-ascii?Q?H2yFcUbpFCogWWec4lbg+XSD9GL9SSwC5DRPa/MRM3XioLsDZwoApUqnp++B?=
 =?us-ascii?Q?ssRY1y8x2crXz2UtyLH96koNarnJfZGlxMGUtncOTY03AZssgxM5qxTOeW0s?=
 =?us-ascii?Q?i4sPrLWqwUQCNRVyzPcnB4x0Dwf7iy+7JYCPDSfb6EbzuEA0uN8+x5urYusp?=
 =?us-ascii?Q?Oni8ildZ0qqy8JkqUeCLqm+b5MDxW7KfLAqoDDD0afBBvTjpAeW14ieE+amG?=
 =?us-ascii?Q?Ms6Ze7uHE6V1jNaVN9J4a37MlQifTluWQ1dAtYc67uSydf/FfIRhOSM7E7qR?=
 =?us-ascii?Q?qNtx4ZS0nhxkf8GCXlPXgtDEAnO1+zxUo9PwojKEcdSCuUncgeSt2iJulrRP?=
 =?us-ascii?Q?Xcv+7QFJ1hByQMV+0LhgHUxEtJvRmtm+gx7ca7eHcS7iNpuHNxhKZUrXMxX/?=
 =?us-ascii?Q?cclz4ruFjyg8eCdPu4kXVMjZ7qe7j786bIhzxZGFEyvVedFR2EeQfUHqPS/W?=
 =?us-ascii?Q?7821TDGdvViQiDGWYDBIWEV2eQhw8zKAsjkGKO2WHWvL7BKitqyreTgAmB2e?=
 =?us-ascii?Q?BXF/+WVVnbQf0vHZLzcgjJxfnKZVq/+OozVnSN4bbxo4sXSyxVVNKb04bIe0?=
 =?us-ascii?Q?RzV2TKR1c6hB2AGBw5d465fOC2zI3V9ZtviDAV8dpCMf6ouwubWkJPzpM43m?=
 =?us-ascii?Q?S0+sLG3AQY6qeOuTmgRKnUWeScF9kzTG9gvzDrhVQddRLID3C+iGYZpXEuGo?=
 =?us-ascii?Q?D2uli/Ut6iZgZbLxMR8mpmIwb01gsEXuJB/syu6pb1bpwD8Vz72Z6ckLMRZC?=
 =?us-ascii?Q?yLmDTrz1FEEekUR7yIk/JeXKbehfnyQgIljqAjRYPvP2wn0Lp9Ce1cA4J0gI?=
 =?us-ascii?Q?w8OkH8BMfC50FRVBnUOt2LFfinr26Vs/9HASbluaz77tT9IArY3HgrpwBBg9?=
 =?us-ascii?Q?+DjvBUVVx8tHE8bDPOtdlNuv5qM0iQHKiAq0XufSI4Y13JxIiMqfXMiESsKi?=
 =?us-ascii?Q?WDUiSgmH2A/fyDBCz18+Pst8qA/ppyjrqYqx68WfqRCYPALMRmqG64grzTa6?=
 =?us-ascii?Q?qFqGZr+ig7aVfja5SySWWRHcEKfl+BOjB0LfrGQ6X2GfnOmen+u4elu0fGsT?=
 =?us-ascii?Q?3L+kV7Adjoob/WEF4oV6OAa8ib7sghizV9yfVIWEqo9PAkWQ5xGjSWrlYkr9?=
 =?us-ascii?Q?mZVZOw0NaRK0wg8mrBB3nvfm29u/R+v29vaO5t19m47GtV4CtPytYYkY/54V?=
 =?us-ascii?Q?R0MNkSA/CnVd+IqLrMhU8zoN6Zjg+sccxpvW9rUG3rEgASO7CvL8nbIkaTY5?=
 =?us-ascii?Q?SbAw1qoCrZ1g3s04oYUDIg7n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9d0db4-74a8-46e9-531b-08d9692e03a9
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 07:41:00.6692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IAf/C+A5MVTp73+tZS4hleyVruhtwy04s6HC+4behQ2BZuSWeDo20zqqPW0sVrEYxktLVzeZhLkn0R7Hyh6Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2555
X-Original-Sender: zhiqiang.hou@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=bchs76O0;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 zhiqiang.hou@nxp.com designates 40.107.20.63 as permitted sender)
 smtp.mailfrom=zhiqiang.hou@nxp.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=nxp.com
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

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

In function restrict_bitmask_access(), the current access_mask is
implicitly assuming that it always access the whole register, but
some registers are byte-accessible, the Guest may get/set wrong
value when it issue a byte or halfword access to these registers.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 hypervisor/arch/arm-common/irqchip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 256af114..daae5512 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -69,6 +69,9 @@ restrict_bitmask_access(struct mmio_access *mmio, unsigned int reg_index,
 		if (irqchip_irq_in_cell(cell, first_irq + irq))
 			access_mask |= irq_bits << (irq * bits_per_irq);
 
+	access_mask >>= 8 * (mmio->address & 0x3);
+	access_mask &= (1UL << (mmio->size * 8)) - 1;
+
 	if (!mmio->is_write) {
 		/* Restrict the read value */
 		mmio_perform_access(gicd_base, mmio);
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210827075116.6208-1-Zhiqiang.Hou%40nxp.com.
