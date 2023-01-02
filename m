Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLMQZKOQMGQESDCYS6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4EB65ADBA
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:30:54 +0100 (CET)
Received: by mail-ej1-x63c.google.com with SMTP id dn11-20020a17090794cb00b007c14ea70afcsf16845392ejc.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:30:54 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672644654; cv=pass;
        d=google.com; s=arc-20160816;
        b=bRMUHbCdJfx03EIMthkR0iH5TJ35nWbV9xOyw4ZUj8VsjOqx/DlY+sBxN+H7sV69sM
         JWll8kU/Au5oQ/6E4td8iZqPe9liURXCBJ9eNlkT1StK2qw0mkTWXU0Us2NoAot8scm7
         wYMBcRJo9/vr1YsOGXGBCt1QH4ydVCXrliHcy9CKRx+E514ROPhswe55HfbkiK2x8GDl
         +mILYySJHnkeSMFWgyp6K1pdW35/zBqsbYVt5xL2GzJHF14pEznz0lQ9VLsKasS9RXhv
         QbG6pNmp3ziJnKql+yOupgDphZcNpO+gX2+P+EqsaprDrbmw6F2tvO7D1+ISLdFTGxWz
         zYIw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=SOXqi+tTFhCafUmf8qkmZIph49ARmt5deZhfhrRqjZw=;
        b=IQamVd65oRQuBDmWvJLuHqASX7gfkMGQwIJd2HjZpODJr6PMt9hmhUkmPj0QpGBvUA
         VWluCNzNyoFUUqyfNmSRFMAj2NGTyNTob4wsm3k37Wb2NS4y6nOfH5dLje0fHrfs4Ca+
         TykvzzE1tIA3uofBccftC/BNjaTK782dt91J/VtX/pDsvR/au5/LNeml/Q9mlPqLBXyK
         vDzmtDuAS87BMb3xFd6nW9476g5TRcbaZF8P/XMTneCUGKC/QajMsB5EZKZQjEmRyFUy
         MPcrayfSRKRECTqhaUZETp5rP/TXlWd1PaFJCVEM/3UnmH7ts+7JdvLTRF0pxJTgk6R0
         wnmg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=yQ1YOMXY;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.21.70 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SOXqi+tTFhCafUmf8qkmZIph49ARmt5deZhfhrRqjZw=;
        b=rEzeYgXpd1Y4Xp7dIkMlzPTb1+7+GhtNeDbsSYGxQeXemxVtudGYxDthg6a9UQ7yJs
         suiVFOfQGEO4WobaDw6QYE/FomFgAPI8GgB+poP2X2quvWRNtM/0LRvq5vCSDmpyJ0vp
         uINeVW2hzJFL5LIPmv0BSehjevkxJYGLRPdX5mJaavJKCIbxpQZNo66ONZtMiF2L/lOi
         nIfopddOeyZFsfRdHshUCy1ZwiSsRCYzAtGQSxfDfbs3v8O/YEoD5axMAsoVsoVDJU4z
         wZnOis8MkUTBMWDcDatNnF833GoxvmdI/0lQss6DDfK7OrnOVsP1xhYtE7r2d6LOtGtc
         +Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOXqi+tTFhCafUmf8qkmZIph49ARmt5deZhfhrRqjZw=;
        b=lBeV9oD8E+1Vv7R3e3QD79hM8QoQQkBH1d04XqltmC1MiPb1/7MpdSIhGg8MUj/3Mo
         35JvaPMJKjegLaV1XV6zTZoAjudXYV45IlckGrUU7wyNMwScV4+bS+UN4/ZVx2Cy1woi
         7sRFHath9zeyFgCjc4i+6kfoRb2Z/HrEAOojS47b9Mp7BXdidCA9O9cbjMp/RHGKtQtG
         M+Za73YlCPhntjKgMgYh2DTAMdNNIHoAMMKKMC2vY6ghyLHI9DO6Ymz35SbOKxYFOcYR
         EIDraGWe8RzzSHjvTOH1J+k2cqDR7Mg362DP0/VBCbIZKXVMx1FRdzH9Zi+L7cmmJygb
         gs0Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kopTlrGt6Re39RBCC0GxAaT564l7Xmo5Tf6Up3lJjWb2xK4Fus0
	3VHWS1Wu63zuPBYCZMQm0lc=
X-Google-Smtp-Source: AMrXdXu9EILAHXlsm7ei5eSJ6uiYp8IPg2WciwmNwgbDfNCbb5OitBxaEX6wbHZWS/9HbZruJw06eg==
X-Received: by 2002:a05:6402:500f:b0:46a:e6e3:b3cf with SMTP id p15-20020a056402500f00b0046ae6e3b3cfmr3625167eda.333.1672644654227;
        Sun, 01 Jan 2023 23:30:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a105:b0:791:9801:e4e4 with SMTP id
 t5-20020a170906a10500b007919801e4e4ls2597843ejy.3.-pod-prod-gmail; Sun, 01
 Jan 2023 23:30:52 -0800 (PST)
X-Received: by 2002:a17:907:cbc7:b0:821:8a4c:a3d4 with SMTP id vk7-20020a170907cbc700b008218a4ca3d4mr38219372ejc.14.1672644652603;
        Sun, 01 Jan 2023 23:30:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672644652; cv=pass;
        d=google.com; s=arc-20160816;
        b=B/YlN4JAC6Cv2WABFj3Hi1SNbghGOVuSaOyh825tCkc5y+gt010dWKCC16a/sSGCDh
         Ylrv6eouyfij3ncwZw67suzfah0sBnZ7P9mAWMCrjl3emjGCFlOydoSgI5a1OEM++4QN
         WyTbhr6bxRlRvG2ccmxYJ3Hifu368U3pam9wVGLhdZuPPwH4mtZcWq1ETvKAatDqzb/u
         vaniLdNvJsBUtITttlVyVDOwIGd9QYbfyd0J0EZ8QTcoIiid72KkYo/3eOiJw0jHeUer
         zLj5/gGJiaQueHeM3Xbdxasguv0dpza8yncrJ8IGsIiD1Q0vFUEXz3NNdpnZo/pPa9Gj
         pHVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=yUjVYBLKX+frdDcPXleCisp06T7dZs3fzFTjZmEjRXg=;
        b=PpST5qhtChQ4Nk1WILXZn0XLN/AUTzOLikmsVXO18FrJfD/KCfbb12Ye5YFk9Hg4A2
         xbrIdqtv7SE7TgfpYo0XXwapzLEHBVCAvI4jKFthwMy9LxT99YaxuoQYsVIhLEfD2ZuQ
         1C7zvngZr/hC8rgVxGnG/AKAGe3p3W/INYojvxoVBn2RbghwEm9jFxKju4cO8NvT00eb
         viPCeIpaSY5B01iKTqkaoJarX5H/XvumjZnydiEcwSELEyEK2e71AEgw9iG11Nbww3zF
         kDnbwEonLCDqxLXGv22huV46psEx9S3nKgGDTNaa7Duk70E5jcjyqi1zGiccZReYoAoG
         qKIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=yQ1YOMXY;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.21.70 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com. [40.107.21.70])
        by gmr-mx.google.com with ESMTPS id l23-20020aa7c3d7000000b0047014e8771fsi995364edr.3.2023.01.01.23.30.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:30:52 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.21.70 as permitted sender) client-ip=40.107.21.70;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ4icAnQwOTK7SYUhc33jqvAlzxh29Xo2sle1rpi9NMVEk+U7IBpvMi4UOhZjvhwlVk0yfJmu6sDneB+aC3ItinfpEMF9NOoQLjGohLz/ZfFi4mKufvY/hiOXj6F1+7HemRZ2HpwCEcaV2YrPC01duSq67qpd7toNKKoS6Tct5r4EEPsLCg8gqUxpSD/1t8P2nc8FPa38S18WibrQst9QpFmkfEja0TSuLb3jr/91Cxn02l1s0DijdiToB5nvkDahmnTSbQBrBGRvGpDeqvi6P/j3FuJdV+yJljWgiYsMUdF+HjG0M8qrdl0kjU5I9AUuxHi8pXA2RzboqAIo81fOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUjVYBLKX+frdDcPXleCisp06T7dZs3fzFTjZmEjRXg=;
 b=BzqDZvk45gnvdfuZoMFCM1XJz6NzrtCPujZpB3HX9mQ9VmDk4nbOpd8lpTqYkfnuogwwxjycEDxPJF2gHy9/PqXNpnXsIYG14mrbUv0bMxOb+Z8CUJlzV7rzLDWPj0qrRnvvKc1An89dfl7EXo7tQEGOviUWkWHDqpB/qugLOb7YmS/h7tui0N2y/rEexbGfSztG709pgF3w46cCNsRg7T5ePGv9UjPUBxd2UN3tc3VuE80hRTfk//3jczuSvKB+JRXGMstQrih+dQmAvBeOCu4NlVtl9rRE5GtF6ddq5zOV1wq3cRxjDLKeEFH4Twkynw4SGkpZwlOE3t8K1uqvrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB9PR10MB6402.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 07:30:51 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 07:30:51 +0000
Message-ID: <4d5e6745-e79a-67fe-bcc9-6e0e3a0d11ba@siemens.com>
Date: Mon, 2 Jan 2023 08:30:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Question: IVSHMEM Inter-cell communication
Content-Language: en-US
To: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <2490e851-5d1b-4608-b7b9-d960dc2cb714n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <2490e851-5d1b-4608-b7b9-d960dc2cb714n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB9PR10MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 570e595a-58a5-4571-8b13-08daec93463c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SftT4wLeG/nT8rPIxLNoxHEcDUoSZKLZE7ZoQ6F+yX7TeMIn1XUisOyFsHaQN7r4fo8loKaBVQqLd/ani86txVHeN0L9yf7k68qxxm7OrWb+mH4KBNYzb86kNvtY2+h8yP7p0WvBjuECyZiBTbTwBUcRs143OattaSnYzlOYXjp8AI5BOWBr+wuyLCKb3UF5ICkXQ40kDPRH5idBlwKWEMj9hpczUvpn82ocx+QjIn/OtuzftuZvEMEbqcIutbJ2J8d481xdewtJH7YVXMY/x7FYngOtX3sBVHpDWTR5wN+GjFqJauP+7RJhiwg3imY+yV2eHW35srXeug3WCaGs1OnWalRk21G8e47aoRajBrEzWm/mQ0urL57x6KA0bg7uK2EsDpOWQTgv2NWJBSM42ZGeerwndwTSiKlaMIlTuuwzhLpslCXRk/ROWy0myd8wGei7QHARLgAHY/MZBMSL5B+4EllP1oeJheJc3O+2mhZ+Y8pTCdDN0OTAqI+kAk68MCMDM1XpWIMhWR7WgLFKyEHaxYyw6j6CZNQkInSmSd+F7FSwWbpgZQeUyasEyJd2pTwJGBeSY20O6ckSkD6Pvw/QwPymLTSLHxi1bUdocB/U5PZ7ds7/TPB3lRCPapxq8rnxzCUYBUpa+DVpJjSP0e3FQsOZ2gOCAHlCNXRXCdvfsBM7q8f/NFr7tzusFdOtevM8gEoxyLKIegRqwwSIwBMUGxy9rqm/jQc2+LWj+f0v9asELbW9E5bh1LGzGAj4SSMgSDhfn+rEqLez7xoEWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199015)(82960400001)(38100700002)(36756003)(86362001)(31696002)(6506007)(53546011)(316002)(66946007)(66476007)(2616005)(6486002)(66556008)(478600001)(6512007)(26005)(186003)(31686004)(110136005)(6666004)(2906002)(41300700001)(8676002)(8936002)(44832011)(4744005)(83380400001)(5660300002)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTh2RjdrTlB5ajBpQU5nL1Z2U05HMHpRcWNJWHVjcEdINFdjUC9KRS9uU2Mv?=
 =?utf-8?B?Q1RpZVQvOVNEelQ5WU5rVUg4LzdNT1M5TVNPQTJkSm0ySkZCUkNnM1d0ZHMz?=
 =?utf-8?B?ZzU5L2h1ZWdCcVlocVJYdEhvOGFwR29IcWM1bVZWVzN5am4vc0ZmREVrcUhi?=
 =?utf-8?B?V1Qxb1AxZ3N3ZXQrZnhCT2d0ajRUekExNDJSeEc2bFRBWDF5clpRYnFOVWto?=
 =?utf-8?B?cC9XYXBwUkRkNDdBTHJmcjI3Q3JhZXNHcTlTemVlZVF5TEhrdlo4Z0trR0JO?=
 =?utf-8?B?eW9hL1UvS2pGV1RYRVVRTHJVWXg3bkhIWlZSRDRMUkJsampBK0JDVEg3T2dp?=
 =?utf-8?B?cXJ3TDg0TnJWd294VnRJa0hPbFhpOENyS2hGZTFIaEYzdGo0MG5lUTg3RHBi?=
 =?utf-8?B?NGhUMEFZbE9DdXdnMGlDTFdqSFJaVGhDcXRKdFRvZDBOdDBPWTRWaXZIMTdF?=
 =?utf-8?B?OHdqdHg4M1YwQ0d3aUQ2VXlYREE2UG94aGh2VjlOd3ZmMWpCTnprcUNyeEVl?=
 =?utf-8?B?MjQvVUFWQ0J5RzRXYjlkNnhkSENtMUdkdVhpTzVWYXk5bW1MTmh5RG9jTDdn?=
 =?utf-8?B?K0h6Tnl4ZkE5dUJEN3BoS2lxd0RHMXZ2YnJERGVsTXVrZUR3bm1rSE43bisx?=
 =?utf-8?B?ZkNjN1AvSHZDN0VFSEE3ZW5rTkVIdXRDelN3SXhmRG9jNHVBcE9HcCtKbzZR?=
 =?utf-8?B?MjVpUHZSRnMveVlrcE1sd2NVN2xUWUFwaXNGeEZibmtwK3J0eDN2V25JU3hZ?=
 =?utf-8?B?a29sditlRzh3YkpMSjZmOXl2QTJnMkZVV0V4ZE9BaEtTWWRVanliYWg3ZWtE?=
 =?utf-8?B?VXF4STdqZjVHYWJTckV6dHJGUWFsNFJJaUlkMHZoaTkyVm1aKzRYRCtjdlFP?=
 =?utf-8?B?bVpFRFlUYzhmbUcyeTFvS3pZZlFITTFDS0VxUGdXaVFqOXN0eUNweEg0cm9O?=
 =?utf-8?B?bTdDbXROaGtKNnZsN1NKUWlQSGt2UE9GWjdWbW45eFpLYzZ5WFd5QjJQYWV1?=
 =?utf-8?B?U2FETXBxMEsrcFZxN2NoWFM4bGFYNlo2clRPYWw2SXYyNEJLdjFBcXZEL2Vn?=
 =?utf-8?B?ejczNE9rL0J0SDFRcHlQUzNvZ01NdlhqUjlqN1BsbzRxanAvdEZGVzJsUFVD?=
 =?utf-8?B?WEVmSkhzcXlWMWhjcEpSL0ZYamdxR0JHMUVlT0YzNHM0ZENvRWdEUytjNnlk?=
 =?utf-8?B?M0NEWXorRWZROWRpdCsweWxNUlU5U3JZRWJDaWNXaFRITFJHVFZiTVJiSThH?=
 =?utf-8?B?RWJ2VlVCd05Xc0pRUElvVmxjc3VvRk8vYVBURURmVm9vZ05RWjgzTXMvaFJh?=
 =?utf-8?B?S1V3REdBSDFJVXN5MGprdUtYSzZjUm1vR3ZsaFJGUVNxVWVrQjBEYnJnV2xa?=
 =?utf-8?B?Uk9yckxFbVVGMXZXYTlHUkNjOWlkcm81R1JIeUVYU0VpN2haei9Uak8wOC9N?=
 =?utf-8?B?VVRMZytKN3R6dU5FUStxN01sSXBOSXdEUFd0MXhGWHBEK2F0QURIMmNqcnpV?=
 =?utf-8?B?aVhLaWphcStsTmJHNHFVNXVDcThmTjFLVGZaYmxreTdrOEhad2Jvd0tjbmhW?=
 =?utf-8?B?dE40cmlVeDFDWVpLeUFnWFpVWEdZLzNETCt3UG80STB4RDBJWWhkRUVIQ0hp?=
 =?utf-8?B?TkFOOHNvS1FxWFhPSTRQWDNta0d6OVExL0FuLzdwRXdDVmpscEc1VHRzOE5o?=
 =?utf-8?B?VHE5a1hFNHU0eVRTTitoVi9YcGZsOVZwR3luM3VUd2g5VnJ5ZXdKWnpYRFpq?=
 =?utf-8?B?dU9JbWlYUEk2RUdmVUl5aENvckk3V0d5SmxLNE9QTDJXdlR2aHlReWx6LzF0?=
 =?utf-8?B?TDlOT3FOSExjNWZTcWNGc1lpMWVSS1JLaWNRR3A0bngvQ0JsU1V0ak0rSTdI?=
 =?utf-8?B?YmRJbkpWL3EzU0IrM0M4TG9JeFp4WW9BM0NXdFRROHVnSUFxRDhmZFJlanJU?=
 =?utf-8?B?MVFlbjFnanhLbDJ4WStjTDVUTXJod0s0NUs3TjMrV3NlNWowR3NWSVI3NzVa?=
 =?utf-8?B?cVVyQlJRMEhhVm9jUmdJVktXSVljSzRDbThoUTBYTzlRVGppQjJ4YVhEWG91?=
 =?utf-8?B?MnR3T1BZS240cmxxUDdiRkw0bzYzbW1sUVZteDRkSEpxLzBkQlVWQ3JLdWhF?=
 =?utf-8?B?bjlUSU84TlpTQUMzSllDWWtsMkl0U3BwUFdKMkdBa2lCN1NIUk45WlN6aStL?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 570e595a-58a5-4571-8b13-08daec93463c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 07:30:51.3909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NiY1IT6g13nfA23afgDbC47yeqXD3YTrw57Rku4ilYLlQV8UL6MZ9oQ3LwauF8K0ELXYyM2Tr/Za9YxZDZN13A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6402
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=yQ1YOMXY;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.21.70 as permitted sender)
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

On 11.12.22 17:06, =E5=BC=A0=E5=AE=B6=E9=93=AD wrote:
> Hi,
>=20
> Recently, I have used inmate-demo(inmates/demos/ivshmem-demo.c) and
> ivshmem-demo(tools/ivshmem-demo.c) on rpi4 to study how to communicate
> between two cells. I have following problems:
>=20
> 1. I found this result, However, I'm not sure it is correct. The
> inmate-demo's Privileged Control=3D0 and the ivshmem-demo in root-cell,
> Privileged Control=3D1 ?
>=20
> 2. In ivshmem-demo. If I want to change the Privileged Control, What
> should I do? What means, how to open/close one-shot interrupt mode?
>=20

The Privileged Control register is only used by the UIO driver under
Linux. It saves one extra exit on interrupt arrival in the UIO kernel
driver to mask the interrupt line until unprivileged userspace had a
chance to react to the event.

In the bare-metal demo, you don't need this feature because there is no
privilege separation between a driver and an application.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4d5e6745-e79a-67fe-bcc9-6e0e3a0d11ba%40siemens.com.
