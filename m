Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK4HVGPAMGQEL2ZF7KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D8E674E29
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Jan 2023 08:33:01 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id k3-20020a05651239c300b004cca10c5ae6sf2104674lfu.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Jan 2023 23:33:00 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1674199980; cv=pass;
        d=google.com; s=arc-20160816;
        b=MuoBFp3TxWluZ30c1QCUWmVetfSKxBXervAYcxmNQwfLqvkPxKXGdFldJHOkbhbUBR
         wqxrRCi7gHrXHJkxvCZEHqnTKCj4Ys0xH0b2ZfR2OBf+KtCMGbMOnXN1WervPTbxtP6l
         mrpWK3xJahnezma6laPTOQMmukEaCc3LE9H/bPQiU7HIu05JNDiPWTffo29vnoPDem1T
         qLycguDpcLbjuoicKkzg0vpbkLEDGwbn4DUJ1tUxsskDifF2VQgkxjtt2atutQBkIU+F
         OaDWoqzurLof8m3Q4AXwUbe8ajF2Na5+i398HEkd18s+sa/h1lalUwEgykZkFZ830483
         QbGQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:date
         :message-id:sender:dkim-signature;
        bh=h2HQ2vIe6uBu4dGuu2Zle3EWLYVjjE/zdnYs6zCenHk=;
        b=JA9aWuHhCCVzMoc/FXuR1j5wnnGo1PwECNWsE9ytEGp/ghyjYqCajAljLqLyqE9Dsy
         JWkI8n04injCVuE/HHzsairqtI0RXRKbLTx3C+pjTPcvgfY8U6pLLXqJfsGFdympS5dl
         wv9awugt7c8wxFcKXR17PoB0XHHCyIKvuCAEmRwNTcooM4DAS/ADJmPjU0i6MP9+E3s1
         LlepgbAgaYn2pLK6q3YbPWEwxHZl674zhTpBdgI66Jb4buN5NvTaMujC85XbnjR0xX2R
         A+V2JcS6R7lFTrWsRrnfXZkS+NcMy1NGRS+N2mtjX9uB7xbJojDm4Hh7HafqAaZ8QYTk
         XbXQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=KyFlLTCU;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.6.68 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h2HQ2vIe6uBu4dGuu2Zle3EWLYVjjE/zdnYs6zCenHk=;
        b=rJ9jYhNg8Qs9/Bz0A8JvqbRsvLrgqOaGXDWrc07fcVzQRuN6tSMuPTfS6XkPs77UN3
         cDwAXSIswPImU9hk+B22z8wvHgym56Ia7tyi04QBAOCKhfOf//rEknaIu90YjmT+I3QF
         evGS4hEdJ/Dau/aSMPToC1UOXWbtkZ4Buq69dex4r91upr8IESe4/kqGFQumW3BTn397
         fdxb+4704qroLqmP+It/EkzmddoNWCHmLugFIF8W8feAkgfEyGs3NaafBVC0VqW/dr/8
         J9GObsvW2BG8lBq2zndcPwwAtPuhRfjdVcgnaTPWXmRDajydKaltWVo4YX848ylqEXI3
         Jc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2HQ2vIe6uBu4dGuu2Zle3EWLYVjjE/zdnYs6zCenHk=;
        b=yxZ8yvSFADG589CGwrSCH1K6h9US8FhLerb6415HkodaX6hhtvEjfLEAo+hHAYHJ/r
         ZKWckRC1yHnU6ph8gCZgAlz9p5sFvEDwy3o9Arx2dMv1h1cMQJxc/Qt0u58K3BTUUMz8
         icNPSg2ZNbrxTPTxpnTc1INW9rT7CB4UtZBIRrLRd73aLcGcUDv5VniIaR0rhlsIFOTw
         5+rVI9oXb/12IAMEBxk4si2RnMW9Qc05U+bKInrNyZ0hNcZJ/7pGh6g/evb9HHPyl0Gy
         SZpIySLTKSSdxaEgCd53RskT2XIUqBJ1yhY91RKcUboFq0Ww3PbaY3nfBQUvcKXnsOed
         ktGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kopbJxI6DmlItyR4zN6iUqztcQVryMOg82pMWmHJq8XoMWlIJon
	WWt03Xmdqqq+7kMGymJA5wM=
X-Google-Smtp-Source: AMrXdXvhzelUN9FW81ow/FHEbkbWXHj+po5R2XZOS8CY+3lykt3+Z9XFGa/o2hqqz0jD0qF+HMAr7w==
X-Received: by 2002:a19:5211:0:b0:4bd:5210:bd97 with SMTP id m17-20020a195211000000b004bd5210bd97mr800956lfb.25.1674199980297;
        Thu, 19 Jan 2023 23:33:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:314c:b0:4d5:7ca1:c92f with SMTP id
 s12-20020a056512314c00b004d57ca1c92fls152595lfi.2.-pod-prod-gmail; Thu, 19
 Jan 2023 23:32:57 -0800 (PST)
X-Received: by 2002:a05:6512:49b:b0:4cc:9ee7:68b6 with SMTP id v27-20020a056512049b00b004cc9ee768b6mr3337951lfq.36.1674199977872;
        Thu, 19 Jan 2023 23:32:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674199977; cv=pass;
        d=google.com; s=arc-20160816;
        b=BPFE+hNxtx5mQYA7AomQ50l7NrZmUGHaasTBrBu81Caagd/sZd3ZjgYJgo73aEDyT3
         1Mhbtyg2CgfO/QgVYLpJs2gUrENtNjs5xMwvbTWjy4F+FnmFgyipEwphyGGLidAj7Avc
         TKlaXwS7JCV3kzSXRCBPgFtmJzyPtydQNuuFHjy3HFbQ7OKqBwIBwRD9riGz1q9Wew4i
         RJ6Q4NIDpgtEamZgKEY0oPo1mV/y3UfG8cckPTb025itn7NJObT5w3fa04nBKok5cL6p
         T0YXJYJltu9Sg4fVnGBQCjKcXMKKcFQ9MEPIhu08N1CmdWdWwU3t9xn+SnEo/6U3io2d
         tYCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=4xL/yhdvObJji67jI+pNhiLonaGg0r2OjATy9Js2FCA=;
        b=ExC9DI3Q3jgkWg+479z+QwCJNJ6UsnrxNIK9dadi0/aMzjDiCp5NRJKGd+2yVqhk5p
         csuIkeRDBI7U0D1fu/2hfqgUg9n9x8dhV/8CHfyIVtRWx7t2fDaTfsovkz1WvOh/pRvM
         kjCI0mPdVRUdf/fLmCKRDhb1xGcjONqepwCjueV50F2/VUBz7UNo0WxTX/i0IEvU61y+
         9qv5CYNPYSqnyXsfUngJKUGbbMBRKJKHfteqHYotRIJzZPRlm82HYI99QY2siiUw+UpH
         DJ9nOvwvDtNgpgWXmMpautPc9PdW8qp7tNWhlrh01F0t3o1NMd0QXKht4hSbEvl7fJtG
         /BWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=KyFlLTCU;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.6.68 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2068.outbound.protection.outlook.com. [40.107.6.68])
        by gmr-mx.google.com with ESMTPS id k5-20020ac257c5000000b004d1527c0905si890537lfo.6.2023.01.19.23.32.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jan 2023 23:32:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.6.68 as permitted sender) client-ip=40.107.6.68;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOKYzMOn3WMF3MITxdUs+hwwvF1rWfLkoKkh5xY2e/RlyfzgsnUKy9yCBkPvaalTzA0Mq/NYBCzCrZPB1xvix3r3U+00VWpM7vRvaNswsXcOf2Vg4r8ZZHJqbD68Gk4v14KweQ4YyKHirVwKZyAPOLcUF4DkfuOhX/t4qXHT7vRPHw+tv0cRiwAve3ICSqzBluG7WXTEnnEmU6ZniPCqzg0mgl2z9QltDZOWN1oO3SP9LmQdNTgzVgjZf2NRrXw17qIFQrs5OnHPKC4qhqlXKfwP345zIJjbJmm8Nr5h4rHebEwxhlCWGNmmkcoeeJH3bQtyhx1B/GL4ocKWqcAbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xL/yhdvObJji67jI+pNhiLonaGg0r2OjATy9Js2FCA=;
 b=X+4F92K/y5Z+v/kFm+evbxSNZliP/O/6msQH+Vz2YNRRA+Whj5Ib8MrPEkkcmHaNQIZtHQ9NowXz+7hstKPV7ZCHEqd6VQ28uJjeNtxW2ozIfqRvr+gNUJZUgHzw3Jo7j0dSmc9scO92fcooKtYa7MN7B7v6e++FSHHpeWhT8w+hihGMmXkgLkVM+yI6C+yLVf0b8RY+tWL6J7ejbtE9Av3tZTHBdKh9IMdPzwsVEoiS45Siq7Jc5s+JkL8YkYnUNbq2vUXk2vTa/esdN4MD5dQ0a5ty9R2mqWfPduAc2umDglaaueLWfFKDIj6Tx5bNYrvMULu1LykLfMDJ1LtlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS8PR10MB7498.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 20 Jan
 2023 07:32:56 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5%7]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 07:32:56 +0000
Message-ID: <0a121c6c-d705-f0d0-db4e-b036128c56f6@siemens.com>
Date: Fri, 20 Jan 2023 08:32:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/3] Add support for Renesas RZ/G2M
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Chris Paterson <chris.paterson2@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230119214536.5247-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20230119214536.5247-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR3P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::9) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS8PR10MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: c59cecee-4cef-411b-aa6c-08dafab88c47
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vyXRcUfV46YXtNE+Ue5XnleqKg5WHuydJBbp0IRF2dS5V/S6F8KDcQkSWkVyPpVoH/ZkbSKhpZUTJVHI2ncx+r+D011h97QeWF/2LDTzQHZUeAntb4003opNp/xwkNaDVbAtheJA7YN+4dy1HvDHbe0M30UtShcgOB+gopbT6tJhe6IMVwsU0IxcNS8EpYwYdTIpUQHlGe2x41+kvT9lRpwmrv5BUFCx7DQOJv4hrZVxskjZTse7AMswQmmhyJIi1wH3JYKvc3x6tpxfaCNtY4/MldmMg8GmgitiuBB05wEXpZ0nSkDZED2BkgUEi5cX5wuibG+1IzMgVHakadn7cFYw1Egy9CLMZmflEW3iE5SFwPT+RGqww7PjCKPoS+Z30u3Vv8E8WevFubq9mh958VqlFYyePAicO+9VwsWLiz8/anZ6J/DXxNGRbJHAz3ZONFxiCulvGrAAOoWFTxVxhyOkA+6oRG4lH40jS/6iugTOuAyhIeTwsI1kwZ8RJIWl6SvAKiXQctjKk3oaQ5ziywBOybyFmWjxy5in2YRlFQvrY21i1vaJ+l9xryeJKVTux1HZEwlkUVlF5JSNbbzmUlih+BJYxEqv5iEg772a27nK5PFlnF1XCGo53DtP7Ar4neRpomp/QxsrJCvvm+/AfVt8Aeaddi/NYM4u6aKbwsCgEbqPBgjWA7RVuwcpdKLSUxCSXYHcJa6rJH2J1NzICAi6COLlDgQxsRgKRQEY83+Iun7ij4pR+o83Mizcqa0w0sbkM5tYrAVFkgFeeXaoIXU062Tk96Is31pCPAN9Xrk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(478600001)(966005)(6666004)(2616005)(36756003)(44832011)(6486002)(2906002)(86362001)(82960400001)(110136005)(5660300002)(38100700002)(83380400001)(8936002)(316002)(54906003)(66946007)(8676002)(41300700001)(4326008)(31696002)(66476007)(6506007)(31686004)(66556008)(6512007)(53546011)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejlqZVV4OUlHZmNvMDdsMkJCTlBkNmxDemw4WEdhM1NxMmI0bjNzaGo4UEJl?=
 =?utf-8?B?dlhOeXZNUWd5RVNVaWRFc3AvTHBZVWRoeEUxclNLM3RPYzJLQ3FyVWVyMytK?=
 =?utf-8?B?ajNzTkN5LzRzbUhlWDZUN3JMVzBsQ2FNR2VWS1dlcWpMbmxDdkg3UDBSZm1K?=
 =?utf-8?B?RUVzTnZBZHBTODhwYXFDNFh6MDVnenZkTkV0UUtPclk0RUFxZjdSRmtiM25I?=
 =?utf-8?B?MU5ieEg3a0sralBoZFVrMWNEUkpVMTNtMWxRc3FXbkhIR3NoMG9YS1FZYS9E?=
 =?utf-8?B?WjRocmVXb1Y4L2ZtQmpReFZybkZIbHk0STZ2a0l4RVhGa1BSRzQ4SnVkWitx?=
 =?utf-8?B?bUtqVkdtM085R0p3M25UR1dObldld3pvRXQyb1lRRXJIc3I5Zk1kY2dnYjh0?=
 =?utf-8?B?SnJPdDhoSUgwRDJRdG9LellaWFRaU2VvVU91U3VLNDZ2NjR6cTZxd2phODdE?=
 =?utf-8?B?N0dhZGNyWExmTU4rSlRaVEtLNUtZZFYvVlU2eWo0Tnc0SVJzb0R2blNpVzlW?=
 =?utf-8?B?S01MaG1RcEZTVmZtUDBjV1lSVmx2MWZKZktMcVorS1RBZnRoK3lVaVlPTy9F?=
 =?utf-8?B?eU1VYzhFd2FzamN6MUhwQ3o1SFFGTm14TjN0bm4vWFh1SnpndFpjc1k2L0VD?=
 =?utf-8?B?aHhBSWFxckovOU1hSGZJNnJQRnZkMVpMWlN4WU45ajUzRHJpcGU5czBxQXls?=
 =?utf-8?B?MW43eS9ja1p3UVF1TE4rS3NRKzNuWFFXVGVUcGVRck9zQXI0dTdXQk9pZ0dJ?=
 =?utf-8?B?a0pITmMyb0RwZzViSnNvc002aDRoblBSVFdTVlcwdFYxTGNsYndOSmhBSk9G?=
 =?utf-8?B?TEs0Tlp1K3BtRkl0U1ZzMDd5MEcwOEtRdzBvcHE5ZFZHZko0SnNMbFBTSlZR?=
 =?utf-8?B?cnVYeC9aK29sWXRKcnRNYUUwbGcwRlNPS1pYK0NiYmpSbG1DZ1psMWhqb0ZF?=
 =?utf-8?B?V3JVenJyLzY2M2UrU3lvWmdiY29WUU0rSDNDOXpOQ0NoQzVhZXMxSVNPdTJG?=
 =?utf-8?B?UkRIMUNkZUdUZjlIZHk3V2xEdHNMUkhMZ2tIK1hZTnVCTVl6UXcxZ2QwMTBM?=
 =?utf-8?B?N09HQnBoRjJNSWJqL0E0RE9IVkU2V1VDYkN0TXlRV1hxL0tES2tiZC93dHVy?=
 =?utf-8?B?cHFhY0prV0h1cm9ZY1duZnk4OHNHWVpKL1lLU2ordEl3ZnRiR1RvVC80WUtm?=
 =?utf-8?B?c0xSaVpyVWU4dWFoMUxwMllLT0J6d2dqQ3Ntby81cHc4QzR0YnpMMHVmOVNM?=
 =?utf-8?B?ZHYwYW1HcjRCL2NISWpHOUo5TGpJM0ovWXNrbEVxTHZ1ZGFZOFJuWWY0UjFR?=
 =?utf-8?B?VTVTWkcyVjZZZjlBeHVBQmdaTUFtM1orQ3YwQVQvNTkrb1NvdnE5UDEvZjI5?=
 =?utf-8?B?WExncjZ1cGZvbWRlRDNlTDZuRG8vMnp6VVJxV2M3ai9BVFNaWS9IQW5ianZD?=
 =?utf-8?B?dVRLYVNnaFc3ZFRCSDJhK1htbWNIS0h3dUJVV240WXFRVnVFN1FPbWpUaFVL?=
 =?utf-8?B?MWR0dzQ3OXEzcUkyT2NTTHlZZHFuOUsxQmpwZjNtNFBwMFFGbjJOR05Ga28y?=
 =?utf-8?B?c0hzSWVrV0djcmFsa0pVSVVnM0ZKSFNkS1JFa3dHZzRESlhYL1J6K0M2a1Iv?=
 =?utf-8?B?UTVjWi9sRHkrYjRIUUVhck5rQm9SeDNxS2dlUzNtLzJRRStSU0c3YUR4N0xM?=
 =?utf-8?B?emo3Rk1UbTg0RU9SbGR1bmw1Q0lNOFRJQ3N2RXN3U3AvMUNwVWNzeHllUkpY?=
 =?utf-8?B?dGRnZTRUOGFrRWFib205RkpwY3NpeFAyRHZLTmFTSjU3M0V2QTZhMVNJQ0FF?=
 =?utf-8?B?YktwV2FyQk5FdDZvb3dQUUJzWTAya0JNM3hMU3JOYnRBVEY1UlpLYnVGeEts?=
 =?utf-8?B?S2gxems3V0ZudzZpUG5ScWY2Qm5Tb1hqMXQ2UWE5azMzYXBHS1NROS9NOFV2?=
 =?utf-8?B?OWhvSkxmZHVGdzNmUmpVTERLdjJsc2lYZlpSeTBvM21wZkVUNFBzK05naDlq?=
 =?utf-8?B?Qm1za1g2S2ZuYmFraHNQY1FpZDZId2tEQ3RzU3J6Vlh6UE1aNVpTQkRleElt?=
 =?utf-8?B?NGxENTh4UmRyT3ZQKy9qYW1sRTFPMVpPc3lweXkwb09TdlF5dHpzWERpUUQ5?=
 =?utf-8?B?dXRpWWdwRW01Z1RkTC81VFJZaSttekxoeXR4WVA4MEdPRjhmV2RlNXB3REZo?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c59cecee-4cef-411b-aa6c-08dafab88c47
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:32:56.2498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuRuTSOx/FDK4h2SGbHvm9TGwhCrdOk9HksgmlPuw3AtLuXXpvlhbzk77vq2orKindeFK5C+jo4U5Es/nrKAAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7498
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=KyFlLTCU;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.6.68 as permitted sender)
 smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

On 19.01.23 22:45, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
> config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].
> 
> Changes apply on top of next branch [2] and the kernel used for testing is
> 5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.
> 
> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
> [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
> [2] https://github.com/siemens/jailhouse/tree/next (e57d1eff)
> [3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0
> 
> v1->v2
> * Added inmate demo
> * Added support for IVSHMEM
> * Rebased on current next
> 
> Note,
> * For IVSHMEM Linux demo I have tested by pinging the root and inmate cell
> * For IVSHMEM bare metal demo I ran the "ivshmem-demo -t 1" and noticed the
>   interrupt counters on root and inmate cells
> 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (3):
>   configs: arm64: Add root cell config for Renesas RZ/G2M SoC
>   configs: arm64: Add linux-inmate-demo cell config for Renesas RZ/G2M
>   configs: arm64: Add inmate-demo cell config for Renesas RZ/G2M
> 
>  configs/arm64/dts/inmate-r8a774a1-hihope.dts |  244 ++++
>  configs/arm64/renesas-r8a774a1-inmate-demo.c |  140 ++
>  configs/arm64/renesas-r8a774a1-linux-demo.c  |  184 +++
>  configs/arm64/renesas-r8a774a1.c             | 1235 ++++++++++++++++++
>  4 files changed, 1803 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
>  create mode 100644 configs/arm64/renesas-r8a774a1-inmate-demo.c
>  create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
>  create mode 100644 configs/arm64/renesas-r8a774a1.c
> 

Thanks, merged.
Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0a121c6c-d705-f0d0-db4e-b036128c56f6%40siemens.com.
