Return-Path: <jailhouse-dev+bncBAABBJ7ZROBQMGQEJKTHZHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 5989334E567
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 12:25:44 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id r79sf5319302lff.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 03:25:44 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1617099944; cv=pass;
        d=google.com; s=arc-20160816;
        b=hgF57LNbJzJ1wouvb4GBgiP5gshoglBc3+vNUalwPEz7Q/hR1E2y7dhdfDLy6VGQ18
         pG+nktNkVR15vBoPA6EUzbE7dheJM487QewpX2UPlx/FddOPKIzWTBwF05WnGp7u+a10
         Arnb3c0UmGIKlcXfZpriPuSdzgJMIAI7qylcVB1Poj3UvKzQURDJpiAKEAwyBz1vl9Of
         sKMmkAKBhYa3drXepcLC8C7E51spbEVCp3ee7YDnl+NkzuSuVRsqDuFC72MvOatfWiRR
         urhFwekDdr/H5j2QJ3eX1LEYUdOQO3+e4/wc7ysPbDE3NzxHCu7YbFsdSZyKEsBo7Hqd
         2OdQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=rYYZxt3D2tLpenB4paqbx043fewaFCxba9204LaoRrM=;
        b=lN464Nclx0DzrkbkDZ0vqjZARiK+Jbsk0WdXUgfs25VUM0NJ6nFgWkpoY/b9xCBY+Y
         ixr0WCZtxKb6ZMgtdmmtlmVDzaAJnNS6TXjEHKTxr/F3LlwuHBIWaexZV5xGzJtGZqJK
         57bT/e+OsHt0rCS7OmQbhAxbwE/12fRleCZP9N6P61TZeZiINiqdY0P2y6Fju1CLTBYE
         rZ1jIzPQRTfIJVNIEnBZNlJ66YNFdQ+TwpfzCqqVKt16x5nFV1jYrCxzRsP5xbBbkcHj
         g1imaCluRx/tX7B2Krg+2MfEK+Cbn8iZjVPSUaCL9NEI8Z5f+H5pD0iPhhpKlPhMUN1s
         5/eA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=SriFgl7N;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.20.50 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rYYZxt3D2tLpenB4paqbx043fewaFCxba9204LaoRrM=;
        b=blNw8k6SSSaWGPsTn4CY58WWiy2kxeLaA0vLb6q5xeXoCxXbFSnHUVvHfPFgvXW3v3
         Znst9Lvg6SCaPFbbupLnUiltg0HKrMUsmTGpbCvqOGAGacioAGy6IP0xWbu+519/U743
         GNmPdpIw/hxdtrCvNN0fmZNY7nQjNRYXr17PA5pqDwrK8CVYJV7CxC8Kk+PPx38Sr2bj
         d6KFlDim8BQ+9Z18M2BGjpR5NuZ02ZQffWmUpFYvow8KeHmgPqZj4E3S/p+grpIpCnBo
         b8YWe9YcJGCw8I0tIN7SC/D5e/zXfZDQu7wJGY2/01wK5UTSNysW6Pg7qW5CUp2wbz+i
         QDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rYYZxt3D2tLpenB4paqbx043fewaFCxba9204LaoRrM=;
        b=QdUzk+hQ61qlBgDcBFEPGc0V49Vc/dCd/kmARJQINVbXOA9zpzgn4/h2VREM0h9uya
         sdAnUcwNk1nojrW9ILYtrqg/eRnv4DgL0tTbxhle3J6qN6qSBaL2AjXZGXCM9Iny5NIh
         k+v+zWfe6U5XDPZi5G0bjxhdNXohgdLCxUTNKnszVCrNkdi40UNgPBYGkaXva/D2Zcex
         TsykZpdA04z/yqceBH1zYMgnD4kC3tsfzpB3Gqyxm9VFyKOMAh1mhw/Xij4NuEVeK2Mv
         iwgc+yFCXZ/Mtl6kzVRXI2XCQG2IN4n2mQcUXsc/M+TuFubXxI7Q35uhbkiyd16xwN8k
         FXeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531yDJHhoQa8dFg8vEPM2eytafvuv56X0wg6hSLv5NjLlZwZmltQ
	bd+K/pMU7UjpDhgoT2G2r/s=
X-Google-Smtp-Source: ABdhPJxslVS8xl38lwT5t1Ralt1wc2SyA5HVGn0hLfHFx5vybufflhpP4LwO8L4sn9XnGa5vINfojg==
X-Received: by 2002:ac2:4f84:: with SMTP id z4mr20020239lfs.608.1617099943834;
        Tue, 30 Mar 2021 03:25:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:e86:: with SMTP id 128ls4840258lfo.0.gmail; Tue, 30 Mar
 2021 03:25:42 -0700 (PDT)
X-Received: by 2002:a05:6512:3ef:: with SMTP id n15mr19887621lfq.279.1617099942729;
        Tue, 30 Mar 2021 03:25:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617099942; cv=pass;
        d=google.com; s=arc-20160816;
        b=SL8VIkc8ObNIzCn4twV8BbSErDfb2KHMdp1M/ItFHfz1E5cT7XR3EvKpQakmLrmpRL
         g6J6UhqtwYjv6gBCQteE9s2t/qDmTlXhmLBRw1MpkdlMEQcSTFpUC8/eNO3/ZpVio9IX
         AbdrfVE7HUI2irm1zHex4c9l+ZGA8A+hRCybBUtADXB+n+cRc2anPDxRpbbnC0G37t+Q
         8Ywo6NbzfVmpPD37Ww91Bgu72CWw8xrXa+EYbd3aSEWPRNK2TR3tXyyjhzj77oRro69E
         r9ug1WXH0lr2ZbkyRcroH/Q5Yd/pRPEfCjA2bG0gCHR0IqsV+xDCobjJZMztKZEJGXo/
         sfBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A4FNAvZZSib+vVygMYqpxi4BKJef+1npL/rbAiHqopE=;
        b=ENCKR9w6AXSaFvLfBIL+AohJGQWSv97PswupIMRzdhCuN+61RRU8h3ZMx932e3TM0i
         jgIQ6og3tUsP0fX0t6YIikh8q12W6ViiWet2AHS3Z6LoIuDtMIYqWciBt+kb2dol6JR0
         9bBjY6Nkgu6z321bxLXKz47RIWht9d6eeYyrSKo1M6GQ7oVotRN9N12NVWwL74XUeQpt
         rVPxLJLtsgrfgZj217mFGdiFzo8GAX4UzQlbVwOTXEzwd7FNtzjqEldiA85KMB4QJR2E
         waO9N4BMuFYWXIYb2riDvbxjgTdEQAbN2HtzgCoj+osVTtrHhhrXTa2QF8GM0Llp90vm
         Gd8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=SriFgl7N;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.20.50 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2050.outbound.protection.outlook.com. [40.107.20.50])
        by gmr-mx.google.com with ESMTPS id g15si541495lfu.3.2021.03.30.03.25.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Mar 2021 03:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.20.50 as permitted sender) client-ip=40.107.20.50;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dES58LBLcax+XaIT/xQtISEOzEMJ4QZ56Y86OA06UDWGGTGEjm+6lMb1bomYoW8ZDCDVd/4a99JjBTZrDyS+jMHvD00oz3AkpQLc1b5QVRnVb8fXy/aBf4tu5VMb1GO+FtDzQ8CSAP/MfjXQp0tY/1bx/5rImfIZRuoSM//jiX7Y3cICcGnqWoWMuXjIHV7Gzek02WIQUMCqbR7gE+7quuNufcFezh3HnZ9FnN+QlxJ+xGDDwjcuZysuwcVNGQzZJk+CoFvvMcJwN1hu1XFDWAD5Wmp7ScyETI8F7T8VD6YjiUp8R4imdU4ENSCTN2mQ/DXtaG6O8nUMJ0OaziJm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4FNAvZZSib+vVygMYqpxi4BKJef+1npL/rbAiHqopE=;
 b=L2bB9UWYJfw0ypQMeZvGAvRPhW0a/lglJtzLumK8Kxf7CxkeVO8eKlliICo9RUgABk7rf+qLhtcPrYytqt5dByGyWEO+ghzMOCuz+rtiRbwsMnFp7deh3gZxhW4JewD1kBGKyexv1DTo4PGtR+KEN1746n16/XkHVK/QrgfaipSto3cSM5R9RDmhCyFpm1JH9lGyuPmz4jMDerlEdrx3tNjvQ4gwwdw28okcdmJCZLu0QBq4dFe4xbO4YynKN2M/s4xySxFGOYYSFouEGVJ0Uvt6t0Kcq9XY8of5p4CXKJu3BEqEYvI7JGDDyTh153p0SMaUAKtMUs5iSFaVKlHG6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 10:25:41 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 10:25:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 2/4] arm: gic-v3: not overwrite interrupt settings needed by EL2
Date: Tue, 30 Mar 2021 18:56:56 +0800
Message-Id: <20210330105658.16676-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210330105658.16676-1-peng.fan@oss.nxp.com>
References: <20210330105658.16676-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR04CA0076.apcprd04.prod.outlook.com
 (2603:1096:202:15::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Tue, 30 Mar 2021 10:25:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 635c716c-979b-4fd5-a44a-08d8f3662b11
X-MS-TrafficTypeDiagnostic: DB9PR04MB8377:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8377AECE2E9B693D1A47DF6CC97D9@DB9PR04MB8377.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xCOwiR6zBq4nCYB3vNeFFYGX1AwB40lPrBYp6VXvPV9JPWeAbpDA/qcpcsdCk7/VtXvkjm3riV2NIq0NdzzKNz63aN3TvILbgK8AasQOUknlFRi+68ujNihbJQh5/w9RKLJnjbaLKjqFDT+ihBPBAqUrWbdFAe30YdmlkecbJSmVn9jzZGr+W1ncxT+OpuMxVFPyVO23v4sXGX/iOfX/bdOjSvJ07RbyJcRX4N/u79x6kLDXTYXvQmQkgvN9K4refqtaSBoJV1o8bhDDGd15TKDQxLN1lOP12XpGSMcUzXPZwNLAY7FVy/o2qXXbkRi+l2HZTr5MxI1kvMrr6+cCt7L5v+ZGGP1lKvhUFwe6qKp0zmM/GqQcLeCWs7kFoxGtHumyFEK30ENQQy3JieXtBLBnqphx0XP7c1bGk27SchjWdPbWv+vzzZNK3HBl6cqo04R9wNThAHSkwJxas1y3C3px8FYkm4qcx/nJwEzVq1tEz3rusjfTSaOA2jCixk+quShn5+6KQbWjYPXItSE2QyYqTXtIaaxBosOz1gqTg9LChww9/LXY9LTfoDjGNSmFHqHWhdh0LZ4fRPVSoJBEAgblU3NMQHY6k2YSrYFnr4J4kZkuTMlNmvs8TtdipacjpOEDAy+1LBO+2ZedIrR+cj2/Rbv/mqHvlq6ygTG4FTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(2906002)(956004)(2616005)(4326008)(26005)(186003)(8676002)(52116002)(316002)(16526019)(5660300002)(478600001)(1076003)(6916009)(66476007)(66556008)(66946007)(6486002)(6512007)(38100700001)(8936002)(83380400001)(6666004)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rQx2c2mRZlYxuSaf+b5uW8CbDrLZKpJUtLlxAf1PLOk+DV/I1tW1ZiHP2B2t?=
 =?us-ascii?Q?nidMOYv2a6UxDBzJhW2eN9cORYqyjoQlrKzCZOtMbvmL6OG14DIynhdIla7n?=
 =?us-ascii?Q?szh6uWOOBN+CXLFILP3uo3y1+kjwivuNfvDC2fueayWh401Fcy17kvocIdL9?=
 =?us-ascii?Q?DcJwWL9uhoS6TPZbeB48Vf6bqIRT8RYZEGkBeQ/sy5P4TezYzDYXvGh7/RDP?=
 =?us-ascii?Q?YDGRzv4xIV4oqOd+VS8/ozBjdaVfdNnpepQO+aamIQDY/+hT6CNEhb4t2sFY?=
 =?us-ascii?Q?fJwSkUzAgDl91RA/DAlJbiGoUNqrJaDyMLRDa5WOrtneVI6Jvf6svj6ZHUru?=
 =?us-ascii?Q?WITTXrvRIVu3k8t8qjJJHPEVUjrdjXjtL9kSUYOSAXytgTTcEX/mlu4oCr1Z?=
 =?us-ascii?Q?k55DlW4FXdkpSgq30Gzpj4E9ySSKVoHKISvCK64GXxkOshgudwDfSSmm/Mk2?=
 =?us-ascii?Q?Jj8T24w1RfDD8QfeSOCLcdA7Xp+AZho6jIOw2oCw+ki7sxw9MzU0biJlilpm?=
 =?us-ascii?Q?I1n4xmtLobK1qgqimGYDCKOxh9F1l3h/slE1Ql+Woc2O847lTrKDBEi9jUik?=
 =?us-ascii?Q?aaEkpsigv/3niJAD9WhhhzSTeGALwEOY8+QDzwujU1ojI6G4O3tEsrdZNfvs?=
 =?us-ascii?Q?zJRk6upy3/mpVJPloa9OUXP2gQQeEcdD3Jgfbu8v7x2TAAdXk0vlUCCbqSSM?=
 =?us-ascii?Q?oaLTAcw8LMV8ejj2LA5ZZ9rkic58NBzQICqT2Tkvd7Fyg2OoIMV9CH0WKXPS?=
 =?us-ascii?Q?fVkOkj8Q+m++jAAwYPJVAiOTzEmI4xsqfheLGl42ET/ktNSThyYhrMmB5Uaw?=
 =?us-ascii?Q?UMUrq6ZQDFp/nFFPaBXM/K3GeeDOzquXJZOLnCLYJgJXbXY8cgnnYJnMGs9Q?=
 =?us-ascii?Q?l8K5fezU85eMYBvPkMFywQUmpM9ZgIj38uzodJo+mSIYL8H9B/zhhx4+xusu?=
 =?us-ascii?Q?+dwFAmyRdBYsJoFylu4oDpcqlQu5aFM9YFAbQNtL5nxIHezeplpM9NxN1/Gq?=
 =?us-ascii?Q?7SDwLnn9VkQGNWrZ3gFV25iE5MW1Pso9zxDwCP2tVZQhZwiL25lhKZ5oc25+?=
 =?us-ascii?Q?PZIGN8B7XxxUGH+90K3/rltrtU7inOm95wNaLKajdzbkceyEXtRGSdsaZCGD?=
 =?us-ascii?Q?0RBYD/Ci8WnPu5NOx5+NqpYt25qpeNyFi/wRci+c37BuoWqA/+sFZwzjq8Cm?=
 =?us-ascii?Q?Td29p1uh9E6w3oGqZyavknPnidfQJ4cXWAe3M4GrDqeM7mgbHuahvRs8TupR?=
 =?us-ascii?Q?VBLsX5aI1gBYPy3Jb/yjXrNEMUFM4PAeb/6UeK8hNWiu2G6EjTKG8zVaY1ga?=
 =?us-ascii?Q?QSrnzikP1wMiR7nNFUn+8ZoBm+0ddVGQuMQVtPo0LeKGkg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635c716c-979b-4fd5-a44a-08d8f3662b11
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 10:25:41.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyJEh5SuuvaUSEkR9h4ue9mFAR888mb4C5SWHW/aCE9zpl9lUZp/LKsgd5AX5TEMbugQdZmIiOnmesPDVq3nhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=SriFgl7N;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.20.50 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

SGI_INJECT, SGI_EVENT, and maint interrupt are needed by Jailhouse and
must not be controlled by the inmate. E.g., we allowed the inmate to
disabled those interrupts, stalling Jailhouse on management operations.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm-common/gic-v3.c              | 9 ++++++---
 hypervisor/arch/arm-common/include/asm/control.h | 1 +
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 4ebb2357..03cface0 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -348,6 +348,7 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
 						   struct mmio_access *mmio)
 {
 	struct public_per_cpu *cpu_public = arg;
+	unsigned int mnt_irq = system_config->platform_info.arm.maintenance_irq;
 
 	switch (mmio->address) {
 	case GICR_TYPER:
@@ -368,15 +369,17 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
 	case GICR_SYNCR:
 		mmio->value = 0;
 		return MMIO_HANDLED;
-	case GICR_CTLR:
-	case GICR_STATUSR:
-	case GICR_WAKER:
 	case GICR_SGI_BASE + GICR_ISENABLER:
 	case GICR_SGI_BASE + GICR_ICENABLER:
 	case GICR_SGI_BASE + GICR_ISPENDR:
 	case GICR_SGI_BASE + GICR_ICPENDR:
 	case GICR_SGI_BASE + GICR_ISACTIVER:
 	case GICR_SGI_BASE + GICR_ICACTIVER:
+		mmio->value &= ~(SGI_MASK | (1 << mnt_irq));
+		/* fall through */
+	case GICR_CTLR:
+	case GICR_STATUSR:
+	case GICR_WAKER:
 	case REG_RANGE(GICR_SGI_BASE + GICR_IPRIORITYR, 8, 4):
 	case REG_RANGE(GICR_SGI_BASE + GICR_ICFGR, 2, 4):
 		if (this_cell() != cpu_public->cell) {
diff --git a/hypervisor/arch/arm-common/include/asm/control.h b/hypervisor/arch/arm-common/include/asm/control.h
index acebef32..e48269d1 100644
--- a/hypervisor/arch/arm-common/include/asm/control.h
+++ b/hypervisor/arch/arm-common/include/asm/control.h
@@ -15,6 +15,7 @@
 
 #define SGI_INJECT	0
 #define SGI_EVENT	1
+#define SGI_MASK	((1 << SGI_EVENT) | (1 << SGI_INJECT))
 
 #ifndef __ASSEMBLY__
 
-- 
2.30.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210330105658.16676-2-peng.fan%40oss.nxp.com.
