Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBD4F42BAMGQEK7Q7UIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E5A34578A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:54:24 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id n16sf602042wro.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 22:54:24 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616478864; cv=pass;
        d=google.com; s=arc-20160816;
        b=kOhXh9NNBV41tZC81iSbM7aLqAoZ/IGCNef8aXRRNSaVzpWbwF046YYpYxIzvXbXNp
         vw4TlvJzS1tiRDtpR0eWiN63iO2ZAi93dhQyiK2rSfhnk0bDMVWiax3YuR7Nnb3aeUtw
         WFmQyHyUbHv7mnx5Xo4iEL5Ytzh99Ob1Isu//K0MhNrShmXEFuHTUVwPmx9n8RLjspgS
         XMh5bSRnqkW5qs46tdc1in6XiuNdigoWpnppZVn6IS7u+Q1gt58qYV8NiQrnL+K5pEsf
         VrFohqHioLxm/OQnWEeshJu7mwJ/qCsqSUxrtZtywTew9YJS1BU5wnKx4USU8oycYXxE
         17og==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=vvQNYw46078KDoZT2FKmNY7GqeaNTWJAGzZeYN9HVCM=;
        b=Pc1WGihOWXbIwJ62XNQehyp0ih6NgoH5pBN7rqDGYBgcuLjNNpI4SRn02hNdAva8qc
         QXrDcTBk0QYi+HV0ZpfPFqN2tz28UiKTsWcRjrazZJaKGUOO53slf/ttLDFAUGwcOKBz
         xvnIYd1EUVL94GuwXueZUXOljSXTumgov1vHyFtjJP3WYetmFtFYnUheK7dd1hQ+bMKP
         OMazlNKUdBTB1EFwjtknxoA1ys3x/ueAq9Vqs6OaL+n5qUdS9hB6YsqrOLadOcR3gG6f
         zu0+DPd0P6nSTqGV/y6il8pNA2ddW3fh6+122b6dWYNssRaksODkcR/qq/he1g0Ge3yP
         6T+g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=jP77NtqR;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.76 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vvQNYw46078KDoZT2FKmNY7GqeaNTWJAGzZeYN9HVCM=;
        b=KgpLhaKfgh+8Ma2aBVP/ioYfUElzJS0VwLc/od2WeVXA4ebI5luapmOAf3LAWpGTNi
         fxxnHvgWwW61YR9mJ9idpV/8UM5nLsb54tgfm8oREPNDH/6164RzNu3UcHzXYQPjGr7r
         mnuMqi0WMKElUsTvwPGbPF7Rf0JPTTXOn60v7xhicGcOWCKnQFtOQtwaymraDcRKiegu
         fJU1xVd3c0wHC0G18w6h7Dy7jRDzXZi8Hf1OVz+2Dx4eFVB8LvZjeOBtJfYiIyMmJ+h0
         Z40wHhxf81Zh8nDZSp1N2Fsu1NEFyzcodm8NI5vM8Qtc4Az0USL0p8uNRYLqiBiMxb9w
         RVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vvQNYw46078KDoZT2FKmNY7GqeaNTWJAGzZeYN9HVCM=;
        b=lhGOps3q3XrSiT3Q/3ffBnHcOFGQ3KPMQZgcrhFz3yVMsHn3XwqtPN+OIX4I7cuoob
         2HCsMUP5nxhoUWMGuimH7WaevA7OStoK9s1Fmk2/aW9+jeaZghJHAdvHipJFoPTRnI7E
         dP6kU4DikOkjOJ9eYyqRBHp1jgNilbO4jHSfmGdbUVMmeWdzKFPuhfm8ZqUo54rttiYU
         +qJMas1NKXtqHErpMSQz79hqRs2ecvZ+MrXFS645ExpcSzHp2MUS9tjZel4Mu9UWKjr5
         2gvjpBY2LXeySNWU/z9lqWww7dJKx31DQY3DQsKzX+NgzW4X1FjzpNH2VoPzHPNALKYo
         ELhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533RmsrhVxlUcXkDg0ecs41CsAfSIQhf/6A9iGSq0VhXGKKZIvjS
	wSN2YOCnGpoz8VWNoHnJgrs=
X-Google-Smtp-Source: ABdhPJxILiJsjrQw6SkDb2r2kJr2szO9+ViHYLPhn8NtrCTMdzFiTagv34V/OB6CIY6jpbjsCGkm1A==
X-Received: by 2002:a5d:6304:: with SMTP id i4mr1975219wru.155.1616478864159;
        Mon, 22 Mar 2021 22:54:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c763:: with SMTP id x3ls635248wmk.1.canary-gmail; Mon,
 22 Mar 2021 22:54:23 -0700 (PDT)
X-Received: by 2002:a1c:1f4c:: with SMTP id f73mr1590909wmf.25.1616478863317;
        Mon, 22 Mar 2021 22:54:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616478863; cv=pass;
        d=google.com; s=arc-20160816;
        b=GtFFIVhkdtrehT6ROQpxqCAKgNEwO7TB/g9mOgbCguAuPelZlTqZnDNpDZy219dv+g
         ZbrXUJFgc4FiB3HM8oU/crL2liWuGmDwrYWw7CDENQ6yORFaAP78LwNmOeUtSG1h4Hfg
         loXPjS5YEQB4DsI0m/vFcG3LPtQSvpOkXiA7MYRgkf4tyh3bLwefWyHpe1Fv5LOKXk3A
         M+id/ws6mmuLrl6eD4JebOy0nllFgUxJLxMjO/zV03HhW4elvM+7YjKEPDBr4nPDlAIv
         +eY6QH1PgcTd1/U8CTwutsHzEUX6jETyIZ40PASjzxfK7UKjxo8uGXgoW51PH4DLDMH8
         aTAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=XI37St1TjVfjVOkxzF1iHFdQkDXqDbiMI3Q64Pfvb9w=;
        b=FUOJmx83X6Oxj2t+kDT1GqyxAFUBwis+pP64G7g2zEZiu33PtMqrF6VuBjP2kqwt1H
         gI8lrpGsuAgv4SuWEMWyDQTudbjyr1RbVndaTvDfCfChWAb/1AdNGxx0RWrzwpztHoIw
         8Dof+/3HbGxhp9HmQLpx4G3P5YxbPZNa+0btTJHdEID0DkrPT1U35SXBcH4ZvfALyyMh
         2LsT6JuJ4or2tcahNp1A98iPvWh2bUPLAW2+s207jqzRyjHG5ERX/suGjgX/lK/8wKdQ
         +kuXzZYfmQO3zMVWhvAdHhSEmav+nCacHh1nXY0ukpeu4zNZGH9kiEvhAkpevOCngPAo
         7GMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=jP77NtqR;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.76 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40076.outbound.protection.outlook.com. [40.107.4.76])
        by gmr-mx.google.com with ESMTPS id p65si104421wmp.0.2021.03.22.22.54.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 22:54:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.76 as permitted sender) client-ip=40.107.4.76;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZ8Fc1BvaiHtR/pIG36lDSd+cv7jgOq+T8F1gDm88JoRP/BQ4nV81rv4/b30Gq1XqsYQCfOTbdr5UY7XNaxFD/Q7XiuNXgZgbU5zZ9TrAC3CpEF5XIOJushrSJ2ZfHJyV3UyIP6KBD0x0NECvBJkBQ62xSKRaP0N4j6P2dLripZiOuqkDT3IHEWNe3294O6iV4Fawvdy+B3jAWxqe0o1RkazEsmBM2axcgajT5J146m6QWJyiYkf/Spf8crTOOQJABfyy8poPaEhvIukFBie4Jvhyx0FzggmKYo8bsjndsKxnHqQeI9DNXMe0Ntrggh1WfkGivjDCk4YR3fbK/Q05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI37St1TjVfjVOkxzF1iHFdQkDXqDbiMI3Q64Pfvb9w=;
 b=El/XHQVWkF1oqd9JoYpYkBYnfi7dIyOi60wK+TjBe16b1J83rLtIKTUHSia2XTqRHAOV3WDQxTBatC7TbhfIt9nysiq/lQJ2nXFyXPjYLxvJjpggUeymBjhoagHS1IYymUWdTy5GRYOkvzsKQijmTfqYcdqX/4iXrTB/lYThGmT7H56iwARk3wngcoLxqdJ2l9fCVg9pQK81EPCAdd9JDAAYXgGZ2pu8rn2tWN/+LulPuqGlBzFd/RFCmCMUwOwncs1ZdIkjbrH/9ihEzTAEZhfBDqebQAHjCC+0HtHVT6iq4DMEod0PSKcxWOaqwtyLNpk9OxcJOTkwwHywSdYOhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6619.eurprd04.prod.outlook.com (2603:10a6:10:108::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 05:54:21 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 05:54:21 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/5] arm: gic-v3: inject irq priority to inmates
Date: Tue, 23 Mar 2021 14:25:32 +0800
Message-Id: <20210323062536.3888-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR04CA0076.apcprd04.prod.outlook.com
 (2603:1096:202:15::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 05:54:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ac9ae05a-5cd3-4c2d-44f9-08d8edc01ade
X-MS-TrafficTypeDiagnostic: DB8PR04MB6619:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6619110491554728282D110088649@DB8PR04MB6619.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KqZ+tkSFyf8rgBysf0ii6qQ0mljdfAJ0OAZXn41lvFpLi3bP8n5TvF+FdE5xkePpUew6vjqEnloWclc3JCsRaaCKrB0e25EcgbXSXD7NhHqeiqrndq9WBrkL7u9nbznoYmfTYYEqbBRwXh1HINjzvyOMi4hrFv6aIUs18pOeuoWK6I/D8AIKmxA99mAw1dGJLZFn7RdAopFKeJCS9QgBCsnfpILsuE7FBzTg7pg1b0L3i9N3Cl34U/ZKigD0f3SnJui5n4Nm30gChRYiWkXwCffNpfecfTST0LZpXZqxvgNxpl2B1vwXDrEPNWSaEpg6UQGm6Vy/FR26DVYlYPq8nsTtK9XvaWARf3CcyEU/jl5FAGN4em9uisMHZw2Y0Q79A/kn8+YJcFzBfmGVPvyXmEAfJ4TNGlvGZL9ympJoIxz1MrR881xpNN1XkWQmcUSyHbD9SJUa6d2wqsF2TXEL2mW+hy7JOJhwypYsZnzzadkdzZdODUy6NwRJYQCj/YpLoZZllb04Jl9F2c2DY/BAHR52JLw83CLOHx7XUHimJkvcSRwqxflqL0hREDqbWzzZkTvUGmsQaypCeNE/k4oGzz8xA2tuS16ec6cypoUaZsz7M7+MOh8yUeBVHwZTiBB03D6Sz24St+5YwfeGk1POx8J9zg2GK/onFzVrgxs6mVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(6666004)(478600001)(6486002)(6506007)(38100700001)(9686003)(316002)(956004)(2616005)(6512007)(6916009)(5660300002)(2906002)(4326008)(8936002)(186003)(52116002)(66946007)(83380400001)(26005)(66476007)(66556008)(86362001)(8676002)(16526019)(1076003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OUjjzfk6rj5W37lp0Qpxu6lmqamOo4Pvt3QbpHgekdFASj6v7yjR7avc0YsN?=
 =?us-ascii?Q?zA8MUw/o2pZULQbpqv0TpYUGjrGYsyW/XbHyEidVGOpCa5OCDAFuEC1tVjO2?=
 =?us-ascii?Q?nna+df+0UlpU41eQbTLHCrzHHSFDTWKQnNkblF0rTI++NCLhIoZgztI9zF2d?=
 =?us-ascii?Q?vrfyCoOB6kF0IH5Rz8qmzoxMI6T1kwpyABT0VvM1MF0IzFt8pCOnX9kdtVtV?=
 =?us-ascii?Q?fBCgL429iztoWbZqKvXNZO9XDG8rf/I4L+8aYYAwJnvRjrMALW/HFbemHhe1?=
 =?us-ascii?Q?Mvm6UYI1ATam8Vlt0uqvkkaWUCk9cxX7FhRavo3oCCoyYwQ5RQF2TlCiKQJ6?=
 =?us-ascii?Q?PnI3HkbQJ/gF0ISnIpBMkysD1PjiJlbQAh5Nb5zXXcFrLu4wBhALIik2wNmD?=
 =?us-ascii?Q?PerUJhOl6/xzXBWBoYt0Bzv8V2WOc1irgMCbNYdS7LDs4CM9eJ2TCHZ5ABX5?=
 =?us-ascii?Q?Oq3xVWFFfa7j8NOZ/8vDoxgmySBjDoA5lqNXzBXLOO2TFRmARU+LLklDLjBP?=
 =?us-ascii?Q?IerIUxAG5NytF5mVl/WRkZ0DhDuc7jG1Har1d3OWHNFKitnmCV2TPDzRHzMq?=
 =?us-ascii?Q?nS+NASG5JRMm/293HBJlal5Cq/odUrVhwL3Ef3x9OzJRc/Ew5C5W1x3z2jgN?=
 =?us-ascii?Q?t+Je3Gw6VQlwv8zmtKZ7ajlkB/PnWZt7b6HWiV48UVJiyEi0Sc2je/cTEiQs?=
 =?us-ascii?Q?KkZfu+SvXm4r/dG2pmn/KuyanpSwULCU82B578UkXErOIwjiYy97PKIh5hZu?=
 =?us-ascii?Q?6ys5bDO8VnpT8FwgLx+k+vc4MAhV/PDjb2OPerZaYKdGtdWHfbmkMXT7JAs4?=
 =?us-ascii?Q?wy8/y12lCjqvYX5xZUKfKQ7+SqlL8e3m/Q8a+VsTeUscnrCexdrrJhq5w4Xu?=
 =?us-ascii?Q?78I2PHVx445YgZ2LOCkxrQfm5RxOYhDz0WNK/kZJRzxXiSHe4ITpu5lH6HmM?=
 =?us-ascii?Q?s6Y/rS2Vg799F9HK9RcLL2J8VXXoBrJDtk02Pi7CdClDcwRIutmtjQuib8Kp?=
 =?us-ascii?Q?CwW9kzbOwpd1RkBnDQNC0Bp/6FBn2AuvZkC+kiB/Ihfk+wqouSuRjPoq7QQQ?=
 =?us-ascii?Q?sS7PPVsLqwDeq6goTjApU7S5fDKyYqv/Xzx5Qil6VlhJ/fDxqpILiePI1aVo?=
 =?us-ascii?Q?6E5qQZZ2t0/uboijFrisHyt6rc37LLF/aiE9gS7kjTz1IRw8aoWE19m8HP4F?=
 =?us-ascii?Q?lbau+rzItAumnALfp2tySGfETOBBNZ6IvLvqiZmpBWtKwbPEBv/Qlb3e8mR8?=
 =?us-ascii?Q?vmYFYzJymnRw4XWTCaOLRx0r/DKwhdPldo3pPl1FOGJk4jKVkO9Fptay7yKh?=
 =?us-ascii?Q?bRx514Iw/awPmsxwae5lHYYf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9ae05a-5cd3-4c2d-44f9-08d8edc01ade
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 05:54:21.6731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7joyvENYd2cDBieIaEcvrHhMoThNrbuiXseGlbQkVBL5VuHTt30VQnoPmZGAPKSLrw8PCqCfEsENv8twIIW4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6619
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=jP77NtqR;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.4.76 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Inject physical IRQ priority to inmates.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm-common/gic-v3.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 4ebb2357..2293f844 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -533,9 +533,11 @@ static void gicv3_eoi_irq(u32 irq_id, bool deactivate)
 
 static int gicv3_inject_irq(u16 irq_id, u16 sender)
 {
+	void *gicr = this_cpu_public()->gicr.base + GICR_SGI_BASE;
 	unsigned int n;
 	int free_lr = -1;
 	u32 elsr;
+	u32 iprio;
 	u64 lr;
 
 	arm_read_sysreg(ICH_ELSR_EL2, elsr);
@@ -572,6 +574,16 @@ static int gicv3_inject_irq(u16 irq_id, u16 sender)
 	if (!is_sgi(irq_id)) {
 		lr |= ICH_LR_HW_BIT;
 		lr |= (u64)irq_id << ICH_LR_PHYS_ID_SHIFT;
+
+		if (is_spi(irq_id))
+			iprio = mmio_read32(gicd_base + GICD_IPRIORITYR +
+					    (irq_id & ~3));
+		else
+			iprio = mmio_read32(gicr + GICR_IPRIORITYR +
+					    (irq_id & ~3));
+
+		iprio = (iprio >> ((irq_id & 3) * 8)) & 0xff;
+		lr |= (u64)iprio << ICH_LR_PRIORITY_SHIFT;
 	}
 	/* GICv3 doesn't support the injection of the calling CPU ID */
 
-- 
2.30.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210323062536.3888-1-peng.fan%40nxp.com.
