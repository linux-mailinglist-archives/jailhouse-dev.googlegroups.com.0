Return-Path: <jailhouse-dev+bncBC44VTVY2UERBR6PY2DAMGQE3R2SI6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43a.google.com (mail-pf1-x43a.google.com [IPv6:2607:f8b0:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2CC3AFFD8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 11:05:13 +0200 (CEST)
Received: by mail-pf1-x43a.google.com with SMTP id f9-20020a056a0022c9b029030058c72fafsf5947306pfj.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 02:05:13 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1624352711; cv=pass;
        d=google.com; s=arc-20160816;
        b=xt9pkldWKjWWY2NsIaskPODolvZax4V5BfX8VlryxBwl0MAh6XJ5M8kT2twFSOHmsL
         y3pKfcpT0Gn3RIxSVZNclycK/lkZqAZsvrx6HOVHhGJ7AaYBk5UE9fo8IYHzD7yzPiTC
         syzRtbV3bK2nCRSvVDiE4+OchjGsCcqZNcW17s2Q/TSGEurEauQo+R1W1WMeSEFkvzP2
         PZkf/OlXxlQsFfpriR4FButJWEw76JchJJ2i7WCLMMPgrhKJbeupxt6Q2XTNn775HwSK
         yLLrFmRkwp69A8kv24mUDOlQizX2yobslRfQrd14mv3Csg9JiJ/2gI7njai773tjilln
         kmgA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=rQakMQ3BVgyOeuojPeWa7MjpC96obdDupxlbza1xheA=;
        b=mK/cvc4hs15mTGcVpDTikHzmD+rdwLsifFlue/HX035QQQLoVYDSIY4ANlgKnzIso/
         1msYv1GtPbezujC43RotupWW9tHQkAUFM0bAEHfz2Abw1eB4sq873Dm5SP2/w+CELHDD
         etZdJC9JpQE0zKtOoG4oElEWzsWitGUt5OX8Kkx47xEspAcLrXGX4vPxm/94dogHqzwe
         eOjiMYnwBN2YRUzUXnff5squSyT1TdwzJGowzS9OOtdvGbyLDu8mFcLWYqIuVXzXUOuI
         DnGgcRUrITsfen4mnKLgTuK6gm/nyYxwmxgvzmq8gSs4KjQ06EHJ6is47BKQE8uVujdt
         lBQQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=GwbSjOQF;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.22.50 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rQakMQ3BVgyOeuojPeWa7MjpC96obdDupxlbza1xheA=;
        b=Q009Z2cs+pTQQEMmcfchYdDMOyVhdRGoU29Yqu3w1HUAqBJGMkePGMylNpLFYYNozQ
         /Y0z/ZbSMtCLQg87uuWZbs2njILx1nCpJyisTP9u6eAf3YdXMherK7rOvjO0ih9S8c+e
         rKAAuEgkZJOUQE+HqdzqNaU4WkJFeZrYFMRy7xJR8SZine+9n99WCq5fHidDo/Umx4Cj
         qSRhzIDNOkwj5wI511yH828YukK24xRKsEuZ+jC1tdkMc9bsxoBLf42UF4n+evKJJ89r
         tLcpvsD5BjRirkdwP2mXbW/ea/jWd/AMbhL28Q6Q+o+hlcHef4l8t/JjhoPZZNfmjACm
         NVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rQakMQ3BVgyOeuojPeWa7MjpC96obdDupxlbza1xheA=;
        b=G3lsQu9uwbcNpp+LcN04jgPNB0yvlouaS2IyFVVdtTGWdUB+We+cWdiFZ/0aktqwTr
         6/s70bXmwfEtXF0Y/b20+r2rct3UNHQj7ifoTQGNA0gKqPEvo2hWHMlFEdZSPaJcs/39
         O4Y8rB2y5z/bCldAEL1ogVfBlj6xTuCu729P+K45WVtnq5O78h6GtqUW9kHM499IyXOM
         /OqKEYxv821OdaNSQflbjBgkoNx44enGmh1nVhGhi37TNndJVe5wrKZKtKGIZMXw2aKg
         HPuOah+U5Di+Jo5JqhsqnqDjqROphk/54HpE9LyTc5fZYURzAloaEwkUJ/YhgK+e/XTK
         ETWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530SLbEFcKTIDci5EbZR70QvrZ9N1FTgZKwJHJaAOR8s1QH0AC2y
	1OnIPsyRy1PtJ1GUhNqtwRg=
X-Google-Smtp-Source: ABdhPJztm5xtGMEHn8vLi4EpgN35Ev1GTqFxWkSVbszVTe4PPjU3V0ichp2kH3PviVcHdLT4CDSkAg==
X-Received: by 2002:a05:6a00:26d8:b029:300:b34b:7bed with SMTP id p24-20020a056a0026d8b0290300b34b7bedmr2755293pfw.42.1624352711556;
        Tue, 22 Jun 2021 02:05:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:7747:: with SMTP id s68ls5385441pfc.0.gmail; Tue, 22 Jun
 2021 02:05:11 -0700 (PDT)
X-Received: by 2002:a63:ec43:: with SMTP id r3mr2815253pgj.344.1624352710979;
        Tue, 22 Jun 2021 02:05:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624352710; cv=pass;
        d=google.com; s=arc-20160816;
        b=iEYmBPtdjko1PpPgZ180bmLIGTFlBd42I8/xU4KK5YNB3H/EfdVvop3m9IfCgbp85K
         c/pkIdml67+cXjSH+FwTM/b0GuPKMp7lblASFlRKcDZG1liM2+t/bRdBLZgB5ETEEqUw
         XYubdW3z9GbIzSLmpEVpAMB1q5i3NRsWKNNRL1qrdqp2Nho0U44e6lzCsouFabQ9k2sb
         0Zn1Rsu/TsSneCTYNtaqM3TeYuAMWlqlsRNHSeobR/CGkqCje5j7gQb1G30CRk+8jlDJ
         rhKGACqRQWSl8HziqE3HK4kC+pba7JhgvHjLNmPfBWd29lAUvOmNbIRvLLK2Fg9iIyWE
         hMaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R7EhvsmpwlYJsI5xbOtlkG8ThPP1shv8OcM2tgGLfk8=;
        b=Czhh8GtSeRRoxKXlAsoN79bcfocYsR5CzWtxOy2eQYhxHUiE0iBvfLIidNZDezA469
         qsuO1oyVboQ08yzIkgQ7OagJLbVCuJgGDYitUfl3MvyJrGLq0cy3+7afH5+cG3es2Zcu
         0+1iJGERd2C72Y851/hT663W8tFn/D64Nc7GzPb/8mSJs+SzcoZhB9GDCqhkTecshQyP
         4qJasTGhdRs2zdgmUD3vArJs377jTpzG75HtAN4OodF1uL74hzTlMQo+wmoT9CPXGwUN
         OQWXyrw6L7uH1ims9gwa3Zb1J5AKF01EzACrrTzwuqJPRwcXZ1ah2mm7vd/PagiOpRb1
         BauQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=GwbSjOQF;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.22.50 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com. [40.107.22.50])
        by gmr-mx.google.com with ESMTPS id ay19si135033pjb.3.2021.06.22.02.05.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 02:05:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.22.50 as permitted sender) client-ip=40.107.22.50;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYqsFsCWk/GjMX6Aillds2d52MOAauzCu7Jg21mW4SRFj7hxJEeZewzJsb3Sjpop9C6gacRazjp1r2hGkNZPIqVD/2loo7w6nLtlvzJl/I822lXRhSZD85LYFLDnzNOi5lUnqcvF1CHElOYElyjf3k+VaYBcc5GVQm9CJpAPOBFYDBR9pan0K3NX8e5Q7A2KyU7Jf9DbiAQ14leqOvsspBESrgTgtIpvwg2iMVVtcRdj6dc5X6f4B8TXG+zp0TWrACP3aun1i/r/g1hYYwydHxkArB9s5YAxyVsPJncMdVSGMpH6l6WjTKAYQYT37AGRP1E+21cecsaXYTabtXAhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7EhvsmpwlYJsI5xbOtlkG8ThPP1shv8OcM2tgGLfk8=;
 b=oLpvnnGMQZrDyo+EW/OTK0I1OI4GddN7WSJpBr7uI9B5oClEKjPVbAAXfAs3tVDvC9oHvhPRLrSAKAsA/eumAZPTpyd/jd3VF1KZ2UtVOjV1/2o1a39mnVuB2P0TDAt976Pj72ISclTV1lYkZJ/tXrECS7ozl1FPxTURpPV+aCcvoDpmiXu/X+SfdAHChj3T3evBvvwUGi1tFJoRVJ2CFTLieIvyu2nuF/g4aETGw1m5h7URoeNo14JeMSMfcd53WcqUxE7f2HG9ff+SpJ9GBbaxO1vktVeKZYR6dOqRnrmZD0fb0P7q+vsJT+aWp56wA4vwfEKMdVz39RgHA3RXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM4PR1001MB1427.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 09:05:08 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:05:08 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v4 2/4] tools: Update shebang from python to python3
Date: Tue, 22 Jun 2021 11:05:00 +0200
Message-Id: <20210622090502.231179-3-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622090502.231179-1-florian.bezdeka@siemens.com>
References: <20210622090502.231179-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [178.27.125.62]
X-ClientProxiedBy: VI1PR07CA0173.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::21) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (178.27.125.62) by VI1PR07CA0173.eurprd07.prod.outlook.com (2603:10a6:802:3e::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 09:05:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 119683a0-6fff-4c5c-cf2a-08d9355cd59b
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1427:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB14274ED1F3D3E87EADB8340FF6099@AM4PR1001MB1427.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2MrvcWD6yo+4mAiXA0WT8KPIyr6fidxk3Hbv0x0W9AHJQAda83wDWREhKAXG1yn604mhZ+aPB/2UaepI5sgpUDEH2PO4FF9TWz7j4Cg51nD3yLdO9e3sGBhPETnJzMsg6xXQ7+WbwGxNMcY7UDPxBxvEW0KeBodwN/GZKpUP1P7zplkWGRjS2Q+h4AZYE398JVp3CUamlneThKCtQcC1lJwNt4lRFF1K0Ywi6B0mnv1FPGNYYthbqtjWfHpSrkQ88glXq+tH+LRTcGsa/HY+6sMQKa0ikOsfsutdHp1ryn0khVJPzM1PZsSf9bpmFCkeJpavkQncX1OqjWKpW5O4sz6JMdIcwyxtrwrclr0+1giRUqTECPBpkDnyulgCDwr7GckC7Jvw56PPaUR0xi4ILaN8ZCHSN+yrYh9OdntSieb+Hjcib6zY15LP6G8NigKgdudweT8BG+lgf7NceJefz/JOHsFVTXxPIMUnseuGPTcSE1NY71j655YGg/bXTjJ/7HbcSE6sLylhJGLvrXZ8vyxLmMPGjOjxtRp1wQKW4WYAfpi96PDllXrg5Vu4mXGBiTwP9yu3YwJvcR8GR6yQ6fmV30QFapRcEWsS34WWPUM5ZzVDEKPDi4VzLVYYSpa5QK+CLQVFZVtRCEhfOnq2SLqy83NflrZgEf9oCIkW8Cu9hIVweUifnbuAqB6OAgfBa4W/a7szo97nbqa7nV8BHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(4326008)(2906002)(6486002)(956004)(16526019)(86362001)(2616005)(54906003)(8936002)(44832011)(66476007)(107886003)(66946007)(66556008)(6496006)(186003)(26005)(8676002)(478600001)(38100700002)(6666004)(1076003)(316002)(6916009)(36756003)(83380400001)(966005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8hLaGfn08k/1ers0/SIeqBvMFbjezcngiql+ctykyQHMNjA0trGqtBux0LGE?=
 =?us-ascii?Q?G1JB3hsanK9NOztaePg3C/jkOejHSryLIutC0TJsSLFiRdLA5J72MMQ1l0O3?=
 =?us-ascii?Q?uzmY6G465LlQ4VIdrI5TFp9xyJcpyu8l10JhtbEl1sqmmCKF5g4KZA4dlDjD?=
 =?us-ascii?Q?K5ftY+Tnc3Vwz3I1dgR3STWpiLpx/U67QZr5l+R8AhbUFvU8Cn5kodqOhIqn?=
 =?us-ascii?Q?6OTKRil2ZHr7uFM7pV9F35Jzvxf4voxtjbNRHAoUBaPa6Qku+AuPW83HjYBA?=
 =?us-ascii?Q?RSxXQxLVszsiVpvGaaDjlxTuaGOOsERk95TZy9xkVQlFIrd4XTuxcwVmgV8P?=
 =?us-ascii?Q?tT8T58ttFgwKxl3owh1FXhkdEAqSsYnco0vwE574adT1HekwKRykLz91i8er?=
 =?us-ascii?Q?DJTKyotXHGCKb/Jh+jLhuqjlY51IumV/SWbg3SI/jnVTxmXX6MujDIHu3Z2G?=
 =?us-ascii?Q?aaaDZKJIPy4Joap8cuWaSIB9yFWb9b5JH3t6GeeiBtbidRKP8fuqRcjsFLEK?=
 =?us-ascii?Q?gp7qhKjt5lh89jeBzTHyDpNKvPaidK+ZzVW+SPRvX+3/6FQ/PlgDiiRyg7uZ?=
 =?us-ascii?Q?ctmYNXRKBdfHnAIL0MtJMz8dcCpBjwLeK2eME758tHS2DFPvPY4cIZ8tJV4R?=
 =?us-ascii?Q?WXgUKRZRN8ilH/teNiw90kzUFmEqDLPIUA0U6/IKU09HzEH3v9dUSPRwhsyH?=
 =?us-ascii?Q?2BcSLuEmt9TlSCMBEGSbWPF7mH+QIk0EGc7ptNkri04O9vrHvC7CcsOcZQWb?=
 =?us-ascii?Q?VgAMBaqa8c1MljXM8TDBqEwMfgP5aA6k0EanOdHrdOrlXzdtK5ZojPkNL3sc?=
 =?us-ascii?Q?kDtsd+poyXMJ2AYiDfagafAamoLsqVTsHvr/g1wwnuTV0Ej23y/8XJWH2TG7?=
 =?us-ascii?Q?EXj2QJKylf23DiYk6th6yZL91tU5opr3jKUMTQuowkrKbMYJL3gTeuV6ANed?=
 =?us-ascii?Q?NfPVUq2G4/EjOEuQVl+ScmDB4gTWbAi3ncALZTcPzsxTEctwEJGJVlN126kK?=
 =?us-ascii?Q?92ewz4h9w6R6fDuxT4wyd1zd3EDtgOAGrBwSsp6xCfrbS+MW/c2ydcVflZiV?=
 =?us-ascii?Q?+2vUfTjCJADZYmyu3KE4rsqbwEpCFzUSjimKK7lgW/2vdpCiNY0efWhPi3oj?=
 =?us-ascii?Q?paN6dUdgczPzp0iFkCejpB7oV7b/NE3XXNk4HxElFvxk5Ti+lSRaY4gYE/Ro?=
 =?us-ascii?Q?sj0y3JVmpoX9poTaTeuIG/hzsNEt2IXIIAekMLMYzMzVLswld/9SUyv5/7PW?=
 =?us-ascii?Q?Jb8qG70tXCXWSslGKB16jn+GeQXdeztS9KHEqPzjR299PAdgcfiXdGfMRRlo?=
 =?us-ascii?Q?eoN99bAFxHLeBA4Oi8fLXG3q?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119683a0-6fff-4c5c-cf2a-08d9355cd59b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:05:08.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svp90qyh98zy0rqiC73YD9t24D6ro7yjOn9UHbzZpju2OH4YFDzoRXfPVwEiGS5XVl2FYgOAFGU4R5eM4tV4kFH+FEdo10yFKdNHtx+qKYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1427
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=GwbSjOQF;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.22.50 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

On Debian 11 systems /usr/bin/python will no longer exist due to the
deprecation of Python 2. According to [1] the unversioned python
packages must not be used as build dependencies, dependencies,
recommendations or suggestions. So moving to the versioned python3 seems
the only remaining option.

[1] https://www.debian.org/doc/packaging-manuals/python-policy/#unversioned-python-commands

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 scripts/arm64-parsedump.py     | 2 +-
 tools/jailhouse-cell-linux     | 2 +-
 tools/jailhouse-cell-stats     | 2 +-
 tools/jailhouse-config-check   | 2 +-
 tools/jailhouse-config-create  | 2 +-
 tools/jailhouse-hardware-check | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/arm64-parsedump.py b/scripts/arm64-parsedump.py
index 9519eb5e..c695706f 100755
--- a/scripts/arm64-parsedump.py
+++ b/scripts/arm64-parsedump.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 4178d4e0..6d1743f3 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
index 2f7e9661..4c5289fb 100755
--- a/tools/jailhouse-cell-stats
+++ b/tools/jailhouse-cell-stats
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 5294967e..62db24c3 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 3005c2e7..2095f4e2 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index f9b2cf58..7a41b48e 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210622090502.231179-3-florian.bezdeka%40siemens.com.
